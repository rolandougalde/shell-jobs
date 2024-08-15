# Debian & Ubuntu Linux post install config

Ubuntu Linux Packages post install taks (Applies to Debian & Ubuntu LTS)

## Check the startup time

```bash
sudo systemd-analyze
```

## Check the running process
```bash
sudo ps axf
```

## Disable auto updates
```bash
sudo nano /etc/apt/apt.conf.d/20auto-upgrades

# set both to 0
APT::Periodic::Update-Package-Lists "0";
APT::Periodic::Unattended-Upgrade "0";
```

## Disable resolv service
```bash
sudo systemctl stop resolvconf.service
sudo systemctl disable resolvconf.service
```

## Clean and update package list
```bash
sudo apt-get update
sudo apt-get clean
```
## Check the system logs
```bash
sudo tail -f /var/log/syslog
```

## Truncate the system logs
```bash
sudo journalctl --vacuum-time=1day
```

## Remove unneeded packages
```bash
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
apt remove --purge linux-image-amd64 && 
apt install swapspace
	apt install sysstat	
	# for [Ubuntu] or
	apt-get install linux-virtual		
	# [Debian]
	apt install linux-image-cloud-amd64
apt-get dist-upgrade
```

## Add user to  sudoers group
- Log in as root

`sudo usermod -aG sudo username`

## Change grub delay
```bash
sudo nano /etc/default/grub

# set to 0
GRUB_TIMEOUT=0
```

## List installed packages

`dpkg --get-selections | grep php*`

## List directory by size sumary
`du -sBM * | sort -nr`


## Resolver issue

```bash
sudo rm -f /etc/resolv.conf
sudo ln -s /run/resolvconf/resolv.conf /etc/resolv.conf
```
