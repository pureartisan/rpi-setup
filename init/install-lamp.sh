#!/bin/bash

echo "=== Installing LAMP ====================="

# install apache, mariadb, php
sudo apt-get install -y \
    apache2 \
    php libapache2-mod-php \
    mariadb-server php-mysql

# install phpmyadmin
sudo apt-get install phpmyadmin -y

echo "Configuring phpmyadmin on apache"
sudo cp $DIRECTORY/lamp/phpmyadmin.virtualhost /etc/apache2/sites-available/phpmyadmin.conf
sudo a2ensite phpmyadmin

# install let's encrypt
echo "Installing certbot for let's encrypt"
sudo apt-get install python-certbot-apache python3-certbot-dns-route53

# enable mods
sudo a2enmod headers
sudo a2enmod rewrite
sudo a2enmod alias
sudo a2enmod session
sudo a2enmod vhost_alias
sudo a2enmod ssl

# restart apache server
sudo service apache2 restart

echo "Setting up SSL certs"
sudo certbot --apache


echo "=== Installing LAMP >>> DONE! ==========="