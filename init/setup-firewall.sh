#!/bin/bash

echo "=== Setup FIREWALL ====================="

FIREWALL_RULES_FILE=/etc/iptables.firewall.rules

echo "Copying firewall rules to $FIREWALL_RULES_FILE"
sudo cp $DIRECTORY/init/firewall/iptables.firewall.rules $FIREWALL_RULES_FILE

echo "Overwriting the firewall rules"
sudo iptables-restore < $FIREWALL_RULES_FILE
sudo iptables -L

FIREWALL_NETWORK_INIT_HOOK_FILE=/etc/network/if-pre-up.d/firewall
echo "#!/bin/sh"                                        | sudo tee $FIREWALL_NETWORK_INIT_HOOK_FILE > /dev/null
echo "/sbin/iptables-restore < $FIREWALL_RULES_FILE"    | sudo tee -a $FIREWALL_NETWORK_INIT_HOOK_FILE > /dev/null
sudo chmod +x $FIREWALL_NETWORK_INIT_HOOK_FILE


# install fail2ban
sudo apt-get install fail2ban -y

# create 'local' copy so updates don't override
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

#### MANUAL
# https://www.digitalocean.com/community/tutorials/how-to-protect-an-apache-server-with-fail2ban-on-ubuntu-14-04

# add IP address
# sudo nano /etc/fail2ban/jail.local


echo "=== Setup FIREWALL >>> DONE! ==========="