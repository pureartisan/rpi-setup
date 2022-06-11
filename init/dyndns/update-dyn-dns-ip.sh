#!/bin/bash

# (optional) You might need to set your PATH variable at the top here
# depending on how you run this script
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# AWS Profile name where credentials are saved
AWS_PROFILE="${AWS_PROFILE:=default}"

# Hosted Zone ID e.g. BJBK35SKMM9OE
ZONEID="ZONEID"

# The CNAME you want to update e.g. hello.example.com
RECORDSET="RECORDSET"

# More advanced options below
# The Time-To-Live of this recordset
TTL=300
# Change this if you want
COMMENT="Auto updating @ `date`"
# Change to AAAA if using an IPv6 address
TYPE="A"

# Get the external IP address from OpenDNS (more reliable than other providers)
IP=`dig +short myip.opendns.com @resolver1.opendns.com -4`

function valid_ip()
{
    local  ip=$1
    local  stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
            && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi
    return $stat
}

LOGFILE=/var/log/aws-route53-dyndns-update.log
IPFILE=/var/session-data/aws-route53-dyndns-update.ip

sudo touch $LOGFILE
sudo touch $IPFILE
sudo chmod 777 $LOGFILE
sudo chmod 777 $IPFILE

if ! valid_ip $IP; then
    echo "Invalid IP address: $IP" >> $LOGFILE
    exit 1
fi

# Check if the IP has changed
if [ ! -f "$IPFILE" ]
    then
    touch $IPFILE
fi

if grep -Fxq "$IP" "$IPFILE"; then
    # code if found
    echo "IP is still $IP. Exiting" >> $LOGFILE
    exit 0
else
    echo "IP has changed to $IP" >> $LOGFILE
    # Fill a temp file with valid JSON
    TMPFILE=$(mktemp /tmp/temporary-file.XXXXXXXX)
    cat > ${TMPFILE} << EOF
    {
      "Comment":"$COMMENT",
      "Changes":[
        {
          "Action":"UPSERT",
          "ResourceRecordSet":{
            "ResourceRecords":[
              {
                "Value":"$IP"
              }
            ],
            "Name":"$RECORDSET",
            "Type":"$TYPE",
            "TTL":$TTL
          }
        }
      ]
    }
EOF

    # Update the Hosted Zone record
    echo "`date` Changing IP in Route53" >> $LOGFILE
    aws route53 change-resource-record-sets \
        --profile "$AWS_PROFILE" \
        --hosted-zone-id "$ZONEID" \
        --change-batch file://$TMPFILE >> $LOGFILE 2>&1
    echo "`date` IP Changed in Route53" >> $LOGFILE

    # Clean up
    rm $TMPFILE
fi

# All Done - cache the IP address for next time
echo "$IP" > $IPFILE
