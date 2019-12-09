#!/bin/bash

echo "=== Setup DYNDNS ====================="

# install pip
sudo apt-get install python-pip -y
pip --version

# install DNS lookup utils
sudo apt-get install dnsutils -y

# install aws cli
sudo pip install awscli
aws --version

# copy dyn dns update script
DYNDNS_UPDATE_SCRIPT=/etc/aws-route53-dyn-dns/update.sh
sudo mkdir -p /etc/aws-route53-dyn-dns
sudo cp $DIRECTORY/init/dyndns/update-dyn-dns-ip.sh $DYNDNS_UPDATE_SCRIPT
sudo chmod 755 $DYNDNS_UPDATE_SCRIPT

echo "Add cron job to check and update ip every minute"
CRONTAB_FILE=/etc/cron.d/aws-route53-dyndns
CRONTAB_USER="pi"
echo "*/1 * * * * $CRONTAB_USER $DYNDNS_UPDATE_SCRIPT >/dev/null 2>&1" | sudo tee $CRONTAB_FILE


echo "=== Setup DYNDNS >>> DONE! ==========="