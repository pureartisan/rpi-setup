#!/bin/bash

echo "=== Custom Scripts: RUNNING ====================="

# SSH
touch /var/log/auth.log

# apache
sudo mkdir -p /var/log/apache2/
sudo touch /var/log/apache2/access.log
sudo touch /var/log/apache2/error.log
sudo touch /var/log/apache2/other_vhosts_access.log
sudo chown -R www-data:www-data /var/log/apache2/*


/home/pi/startup/custom-startup-scripts.sh

echo "=== Custom Scripts: DONE! ======================="