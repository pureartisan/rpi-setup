#!/bin/bash

# update apt-get
sudo apt update --allow-releaseinfo-change

# install packages
sudo apt-get install -y \
    xserver-xorg xinit  \
    

# install Qt
sudo apt-get install xserver-xorg xinit -y
