# Install LAMP

## Make sure `apt-get` is updated
```
sudo apt update --allow-releaseinfo-change
sudo apt-get update
sudo apt-get upgrade -y
```

## Install Apache2, PHP (latest), MariaDB (latest)

```
sudo apt-get install -y \
    apache2 \
    php libapache2-mod-php \
    mariadb-server php-mysql
```
*NOTE*: `mysql-server` is no longer available by default


## Install PhpMyAdmin
```
sudo apt-get install phpmyadmin -y
```

## Restart apache server
```
sudo service apache2 restart

# OR you can use `systemctl`
sudo systemctl restart apache2
```

### Mod `rewrite`
```
sudo a2enmod rewrite
```

## Config VirtualHosts
```
sudo nano /etc/apache2/sites-available/000-default.conf
```

add the following:
```
<VirtualHost *:80>
    <Directory "/var/www/html">
        AllowOverride All
    </Directory>
    ...

```

*NOTE*: Don't forget to restart apache for changes to take place