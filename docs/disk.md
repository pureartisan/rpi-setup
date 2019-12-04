# Disk

## SD Card

SD Cards have a lifespan depending on the number of writes to disk. There are some things that can be done to improve the lifespan.

### Disable Swap

```
sudo systemctl disable dphys-swapfile.service
```

If you want to completely remove the service that handles the swapping, then use below:
```
sudo dphys-swapfile swapoff && \
sudo dphys-swapfile uninstall && \
sudo systemctl disable dphys-swapfile
```

### RAM disk

Use a RAM disk for directory that are used frequently, such as `/tmp` or `/var/log`

Add this to the `/etc/fstab` file so they are mounted correctly at every reboot.

```
tmpfs /tmp tmpfs defaults,noatime,nosuid 0 0
tmpfs /var/log tmpfs defaults,noatime,nosuid,size=100m 0 0
```

To force the mount, you can use:
```
sudo mount -a
```

Check if the operations suceeded, run `df`, and the results should look like below (with `tmpfs` for the RAM disks):
```
 pi@raspberrypi ~ $ df
 Filesystem     1K-blocks    Used Available Use% Mounted on
 rootfs           3807952 1814024   1820896  50% /
 /dev/root        3807952 1814024   1820896  50% /
 devtmpfs          183596       0    183596   0% /dev
 tmpfs              38372     268     38104   1% /run
 tmpfs               5120       0      5120   0% /run/lock
 tmpfs              76740       0     76740   0% /run/shm
 /dev/mmcblk0p1     57288   18544     38744  33% /boot
 tmpfs               1024       4      1020   1% /var/log
```

## SSD Drive + USB 3 (RPi4B)

Use an SSD Drive using USB 3 in Raspiberry Pi 4. However, the USB controller chip will heat up with lots of USB I/O and will require an active cooling system (fan, aluminium casing, etc).