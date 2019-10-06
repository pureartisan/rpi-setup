# Raspbian Lite + GUI

GUI needs x-server, so let's install the basics we need

```
sudo apt-get install xserver-xorg xinit
```

## Update x11-commons
```
sudo nano /etc/X11/Xwrapper.config
```

change `allowed_users` to `anybody`

## Xinit autoloading
We can specific what needs to be done when xserver starts by setting `~/.xinitrc

```
xset s off # disable screen saver
xset -dmps # disable DPMS (Energy Star) features.
xset s noblank # don't blank the video device

# anything else

```

## Exit X-server
Use `raspi-config` and option `4 Localisation Options` to update the keyboard layout.
Make sure the `Control + Alt + Backspace` is set as the key combo to terminate X Server.


## Option 1: Qt
```
sudo apt-get install xcb qt5-default
```

### Option 2: Chromium (Kiosk)
```
sudo apt-get install chromium-browser
```

Running chromium (recommended to use `~/.xinitrc`):
```
chromium-browser --window-size=1920,1080 --kiosk --incognito https://google.com
```

### Full screen issues
Could be due to overscan
Edit `/boot/config.txt`
Add `disable_overscan=1`
Save and restart the pi.

## Option 3: Midori Browser

Install the matchbox software which is is a free and open source window manager for the X Window System. Matchbox is mainly intended for embedded systems and it is very lightweight.
```
sudo apt-get install matchbox
```

Install midori browser
```
sudo apt-get install midori
```

Running midori in full screen (using matchbox)
```
matchbox-window-manager &
midori -e Fullscreen -a https://google.com
```

## Hiding mouse pointer
When there's no activity
```
sudo apt-get install unclutter
```

## Starting X11 at boot

1. Enable auto login
Use the `raspi-config` and selection option `3 Boot Options`
Select `B2 Console Autologin`
2. Enable `xinit` as first thing to load using `~/.bashrc`
```
if [ -z "$SSH_CLIENT" ] || [ -z "$SSH_TTY" ]; then
    xinit -- -nocursor
fi
```
