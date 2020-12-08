# Config before booting for the first time

## Enable SSH

Add an empty file called `ssh` (no extensions) to the `boot` direcotry of the SD card.

## Wireless Network Settings

Add a `wpa_supplicant.conf` to the `boot` directory of the SD card.

```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=<Insert 2 letter ISO 3166-1 country code here>

network={
  ssid="<Name of your wireless LAN>"
  psk="<Password for your wireless LAN>"
}
```