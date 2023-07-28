#!/bin/bash
# Ubuntu Linux Packages clean

# Check the startup time
systemd-analyze

# Check the running process
ps axf

# Disable auto updates
nano /etc/apt/apt.conf.d/20auto-upgrades

# Clean and update package list
apt-get clean
apt-get update

# Check the system logs
tail -f /var/log/syslog

# Truncate the system logs
journalctl --vacuum-time=1day

# Remove unneeded packages
apt-get remove --purge snap*
apt-get remove --purge snapd*
apt-get remove --purge multipathd*
apt-get remove --purge account*
apt-get remove --purge policy*
apt-get remove --purge cloud-init
apt-get remove --purge intel-microcode
apt-get remove --purge fwupd
apt-get remove --purge ufw 
apt-get remove --purge ntfs-3g 
apt-get remove --purge open-iscsi
apt-get remove --purge linux-firmware
apt-get remove --purge motd-news-config
apt-get remove --purge thermald
apt-get remove --purge fail2ban
apt-get install linux-virtual
apt-get dist-upgrade
