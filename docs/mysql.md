# Setting up MySQL

If you hadn't already install MariaDB, please install it as explained in the [LAMP Setup](./lamp.md)

## Initialise
```
sudo mysql_secure_installation
```
Follow the steps.

## Access Denied Error
If you tried to login with correct credentials but it keeps saying like this:
```
ERROR 1698 (28000): Access denied for user 'root'@'localhost'
```
You can try to disable MySQL from trying to authenticate root user using plugin:
```
$ sudo mysql -u root

[mysql] use mysql;
[mysql] update user set plugin='' where User='root';
[mysql] flush privileges;
[mysql] \q
```
