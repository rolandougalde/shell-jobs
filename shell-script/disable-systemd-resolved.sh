#!/bin/sh

# How to disable systemd-resolved in Ubuntu

# Stages

# Disable and stop the systemd-resolved service:
sudo systemctl disable systemd-resolved.service
sudo systemctl stop systemd-resolved

# Then put the following line in the `[main]` section of your `/etc/NetworkManager/NetworkManager.conf`:
dns=default

#Delete the symlink `/etc/resolv.conf`
rm /etc/resolv.conf

# Restart network-manager
sudo service network-manager restart
# or
sudo systemctl restart NetworkManager.service

# Sources
# https://askubuntu.com/questions/907246/how-to-disable-systemd-resolved-in-ubuntu
 exit 0
