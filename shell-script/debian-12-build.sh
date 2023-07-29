#!/bin/bash

# Debian Linux 12 build script
# 1.Create only one partition.
# 2.Choose the default software source: deb.debian.com

# Post install packages installation
apt-get install sudo
apt-get install htop
apt-get install linux-image-cloud-amd64
apt-get autoremove linux-image-amd64*
apt-get autoremove linux-firmware
apt-get autoremove intel-microcode

# Application installation
apt-get install apache2

# PHP legacy version installation
# Install software-properties-common, which adds management for additional software sources:
sudo apt -y install software-properties-common

# Install the repository ppa:ondrej/php, which will give you all your versions of PHP:
sudo add-apt-repository ppa:ondrej/php

sudo apt-get update

# Install the desired version of PHP
sudo apt -y install php7.4

# Install the desired version of PHP-FPM
sudo apt -y install php7.4-fpm

exit 0
