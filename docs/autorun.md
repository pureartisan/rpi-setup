## X11 / Xinit
use the `.xinitrc` file to run things when `xinit` starts up
```
nano ~/.xinitrc
```

## Hide Splash Screen
```
sudo nano /boot/config.txt
```
add the line at the end of the file:
```
disable_splash=1
```
then reboot:
```
sudo reboot
```

## Hide RPi logo
```
sudo nano /boot/cmdline.txt
```
add below line at the end of the file:
```
logo.nologo
```
then reboot:
```
sudo reboot
```

## Hide the messages
```
sudo nano /boot/cmdline.txt
```
enable splash
```
splash
```
set to quite mode
```
quiet
```
hide cursor:
```
vt.global_cursor_default=0
```
change `console` to `tty3`
```
# change this line
console=tty1
# to
console=tty3
```
set for plymouth (if you have it):
```
plymouth.ignore-serial-consoles
```
then reboot:
```
sudo reboot
```

## Hide cursor


## Change Splash Screen

You need to install `Plymouth` manually for Raspbian Lite:
https://github.com/HerbFargus/Raspberry-Pi-Scripts/wiki/Plymouth
