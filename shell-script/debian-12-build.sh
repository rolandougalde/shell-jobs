#!/bin/bash

# Debian Linux 12 build script
# 1.Create only one partition.
# 2.Choose the default software source: deb.debian.com

# Post install packages installation
apt-get install sudo
apt-get install linux-image-cloud-amd64
apt-get autoremove linux-image-amd64*
apt-get autoremove linux-firmware
apt-get autoremove intel-microcode

# Application installation
apt-get install apache2

# PHP legacy version installation

exit 0
