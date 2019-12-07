#!/bin/bash

echo "=== Installing LAMP ====================="

# install apache, mariadb, php
sudo apt-get install -y \
    apache2 \
    php libapache2-mod-php \
    mariadb-server php-mysql

# install phpmyadmin
sudo apt-get install phpmyadmin -y

# restart apache server
sudo service apache2 restart


echo "=== Installing LAMP >>> DONE! ==========="