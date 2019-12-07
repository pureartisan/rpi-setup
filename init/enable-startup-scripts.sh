#!/bin/bash

echo "=== Enabling STARTUP SCRIPTS ====================="

# copy startup scripts
sudo mkdir -p /home/pi/startup
sudo cp ./startup/scripts/* /home/pi/startup
sudo chmod -R 755 /home/pi/startup

# copy service file
sudo cp ./startup/000-custom-startup-service /etc/init.d/000-custom-startup-service
sudo chmod 755 /etc/init.d/000-custom-startup-service

# register file to run at startup
sudo update-rc.d 000-custom-startup-service defaults


echo "=== Enabling STARTUP SCRIPTS >>> DONE! ==========="