#!/bin/bash

echo "=== Setup FIREWALL ====================="

# install fail2ban
sudo apt-get install fail2ban -y

# create 'local' copy so updates don't override
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

#### MANUAL
# https://www.digitalocean.com/community/tutorials/how-to-protect-an-apache-server-with-fail2ban-on-ubuntu-14-04

# add IP address
# sudo nano /etc/fail2ban/jail.local


echo "=== Setup FIREWALL >>> DONE! ==========="