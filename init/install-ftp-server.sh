#!/bin/bash

echo "=== Setup FTP SERVER ====================="

# install fail2ban
sudo apt install pure-ftpd -y

# USER GROUP
FTP_USER_GROUP="ftpusers"
FTP_USER="ftpuser"
FTP_USER_HOME_DIR=/home/pi/ftp

# if apache is installed
# make the ftp users part of the `www-data` group
APACHE_INSTALLED=false
APACHE_USER_GROUP="www-data"
APACHE_HOME_DIR=/var/www

if [ $(getent group "$APACHE_USER_GROUP") ]; then
    APACHE_INSTALLED=true

    echo "Apache user group '$APACHE_USER_GROUP' exists, so adding FTP user to this group"
    FTP_USER_GROUP="$APACHE_USER_GROUP"

    echo "Using apache www directory as default FTP directory"
    FTP_USER_HOME_DIR=$APACHE_HOME_DIR

else

    echo "Adding new user group: $FTP_USER_GROUP"
    sudo groupadd "$FTP_USER_GROUP"

fi

# setup ftp server
# if [ "$APACHE_INSTALLED" = true ] ; then

# fi

echo "Creating user: $FTP_USER"
sudo useradd "$FTP_USER" -g "$FTP_USER_GROUP" -s /sbin/nologin -d /dev/null

echo "Creating FTP home dir: $FTP_USER_HOME_DIR"
sudo mkdir -p $FTP_USER_HOME_DIR

if [ "$APACHE_INSTALLED" = true ] ; then
    # only change group
    sudo chgrp -R "$FTP_USER_GROUP" $FTP_USER_HOME_DIR
else
    # set user and group
    sudo chown -R "$FTP_USER:$FTP_USER_GROUP" $FTP_USER_HOME_DIR
fi

PURE_FTP_CONF=/etc/pure-ftpd/conf

# Creating virtual user for PureFTP
echo "Linking user for PureFTP"
sudo pure-pw useradd upload -u "FTP_USER" -g "$FTP_USER_GROUP" -d $FTP_USER_HOME_DIR -m
# creating virtual user database
sudo pure-pw mkdb
# use this created DB as the authentication method
sudo ln -s $PURE_FTP_CONF/PureDB /etc/pure-ftpd/auth/000puredb

# config
echo "yes"      | sudo tee $PURE_FTP_CONF/ChrootEveryone
echo "yes"      | sudo tee $PURE_FTP_CONF/NoAnonymous
echo "yes"      | sudo tee $PURE_FTP_CONF/AnonymousCantUpload
echo "no"       | sudo tee $PURE_FTP_CONF/AnonymousCanCreateDirs
echo "yes"      | sudo tee $PURE_FTP_CONF/DisplayDotFiles
echo "yes"      | sudo tee $PURE_FTP_CONF/DontResolve
echo "no"       | sudo tee $PURE_FTP_CONF/ProhibitDotFilesRead
echo "no"       | sudo tee $PURE_FTP_CONF/ProhibitDotFilesWrite
echo "UTF-8"    | sudo tee $PURE_FTP_CONF/FSCharset

# restart server to take config into effect
sudo service pure-ftpd restart


echo "=== Setup FTP SERVER >>> DONE! ==========="