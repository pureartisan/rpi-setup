#!/bin/bash

# Called from: /home/pi/startup/custom-startup-scripts.sh

echo "=== Custom Scripts: RUNNING ====================="

# SSH
touch /var/log/auth.log

# apache
#sudo mkdir -p /var/log/apache2/
#sudo touch /var/log/apache2/access.log
#sudo touch /var/log/apache2/error.log
#sudo touch /var/log/apache2/other_vhosts_access.log
#sudo chown -R www-data:www-data /var/log/apache2/*

# openhab
#sudo mkdir -p /var/log/openhab2
#sudo touch /var/log/openhab2/events.log
#sudo touch /var/log/openhab2/openhab.log
#sudo chown -R openhab:openhab /var/log/openhab2/*

echo "=== Custom Scripts: DONE! ======================="
