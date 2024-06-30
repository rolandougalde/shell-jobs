# Linux



```shell

#!/bin/bash
# Ubuntu Linux Packages clean (Applies to Debian 12.5)

# Check the startup time
systemd-analyze

# Check the running process
ps axf

# Disable auto updates
nano /etc/apt/apt.conf.d/20auto-upgrades

# Disable resolv service

systemctl stop resolvconf.service
systemctl disable resolvconf.service

# Clean and update package list
apt-get update
apt-get clean

# Check the system logs
tail -f /var/log/syslog

# Truncate the system logs
journalctl --vacuum-time=1day

# Remove unneeded packages
apt-get remove --purge lxd*
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
	apt remove --purge linux-image-amd64 && 
	apt install linux-image-cloud-amd64  &&
	apt install swapspace
	apt install sysstat
	#debian 12
apt-get dist-upgrade

# Add user to  sudoers group
- Log in as root

`usermod -aG sudo username`

## Change grub delay

`nano /etc/default/grub`
`GRUB_TIMEOUT=0`

## List installed packages

`dpkg --get-selections | grep php*`

# List directory by size sumary
du -sBM * | sort -nr


## Resolver issue

sudo rm -f /etc/resolv.conf
sudo ln -s /run/resolvconf/resolv.conf /etc/resolv.conf

```
