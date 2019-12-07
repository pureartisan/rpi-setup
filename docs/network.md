# Network Setup

## Setup wifi

Basic setup, with plain text password.
```
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
```

Add the line to the end of the file and save.
```
network={
    ssid="testing"
    psk="testingPassword"
}
```

However, we may want to encrypt the password using `wpa_passphrase`. Don't forget to delete the plain text file with the password. For more info, read [here](https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md)
```
wpa_passphrase "actual-ssid" < file_where_password_is_stored
```

Apply the changes:
```
wpa_cli -i wlan0 reconfigure
```

***For unsecure networks***
```
network={
    ssid="testing"
    key_mgmt=NONE
}
```

***For hidden networks***
```
network={
    ssid="yourHiddenSSID"
    scan_ssid=1
    psk="Your_wifi_password"
}
```

***Adding multiple networks***
```
network={
    ssid="HomeOneSSID"
    psk="passwordOne"
    priority=1
    id_str="homeOne"
}

network={
    ssid="HomeTwoSSID"
    psk="passwordTwo"
    priority=2
    id_str="homeTwo"
}
```

## Static IP address

Edit the following file
```
sudo nano /etc/dhcpcd.conf
```

Add the following to the end of the file.
```
interface eth0

static ip_address=192.168.0.100/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1

interface wlan0

static ip_address=192.168.0.100/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1
```

NOTE: You can also set google DNS servers like `8.8.8.8`

Use the following to check the assigned ip address.
```
ip a
```

## Firewalls

More info in the [firewall](./firewall.md) section.