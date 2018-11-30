#!/bin/bash

cd ~
wget -O nodejs.tar.xz https://nodejs.org/dist/latest-v10.x/node-v10.14.1-linux-armv6l.tar.xz
tar -xvf nodejs.tar.xz
cd nodejs
sudo cp -R * /usr/local/
cd ..
rm -rf nodejs
