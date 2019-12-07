#!/bin/bash

echo "=== Setup RAM DISK ====================="

# disable swapping
sudo systemctl disable dphys-swapfile.service

RAM_DISK_DELIMITER='=== RAM DISK - AUTO ENTRY ==='

FSTAB_PATH=/etc/fstab
if grep -q "$RAM_DISK_DELIMITER" "$FSTAB_PATH"; ##note the space after the string you are searching for
then
    echo "FSTAB entries for RAM DISK already exist, skipping ramdisk setup"
else

    echo "Writing entries into $FSTAB_PATH ..."

    echo " " >> $FSTAB_PATH
    echo "## $RAM_DISK_DELIMITER" >> $FSTAB_PATH
    echo "tmpfs /tmp tmpfs defaults,noatime,nosuid 0 0" >> $FSTAB_PATH
    echo "tmpfs /var/log tmpfs defaults,noatime,nosuid,size=100m 0 0" >> $FSTAB_PATH
    echo "## $RAM_DISK_DELIMITER >>> END" >> $FSTAB_PATH

    sudo mount -a

fi

echo "Displaying current mounts..."
sudo df

echo "=== Setup RAM DISK >>> DONE! ==========="