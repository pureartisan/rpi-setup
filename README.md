# Raspberry Pi Setup

## Setup Wifi

Read the section [here](https://github.com/prageeth/rpi-setup/blob/master/network)

## Getting Started

### Install git

Note: `-y` to answer "yes" to installing

```
sudo apt-get -y install git
```

### Clone Project

Note: We only want a shallow clone (bare minimal)

```
cd ~
git clone --depth 1 https://github.com/prageeth/rpi-setup.git
cd rpi-setup
```

### Initialise the environment

The following script installs all the necessary frameworks:
- Node (v10.14.1) and NPM 
-- To install a different version, change in `./init/install-node.sh`. Use the official [nodejs distribution list](https://nodejs.org/dist/)

```
./init/run.sh
```

## Useful commands

### Shutdown

```
sudo shutdown -h now
```

### Reboot

```
sudo reboot
```

### Raspbian Configurations

```
sudo raspi-config
```

## Configurations

### Keyboard layout

You can the default keyboard layout. You could either use the `raspi-config` (not my preference if you want to simply change layout from `gb` to `us`), I'd rather prefer:

```
sudo nano /etc/default/keyboard
```
Then change the default layout by editing the line:
```
XKBLAYOUT="us"
```

### Default Login

```
username: pi
password: raspberry
```

***NOTE***: Using the `raspi-config`, make sure you change the default password.

### Enable SSH

Use the `raspi-config` and follow:
```
5 Interfacing Options > P2 SSH > YES
```

### Boot options (auto login, with password prompt)

Use the `raspi-config` and follow:
```
3 Boot Options > Desktop / CLI
```

# Static IP
Edit the DHCP settings
```
sudo nano /etc/dhcpcd.conf
```
Enable static IP, the sample lines should be commented out by default, so let's uncomment them:
```
interface eth0
static ip_address=192.168.1.XX/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.1
```
* `eth0` should be `wlan0` for wireless connection (or appropriate name)
* `192.168.1.XX` should be related to the router
* using multiple DNS `domain_name_servers=8.8.8.8 192.168.1.1`

# Minimal GUI

More info in [docs](docs/gui.md)
