history | grep purge

nano /etc/apt/apt.conf.d/20auto-upgrades

apt-get clean
apt-get update
tail -f /var/log/syslog
journalctl --vacuum-time=1day

ps axf

apt-get remove --purge snap*
apt-get remove --purge snapd*
apt-get remove --purge multipathd*
apt-get remove --purge account*
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
apt-get remove --purge policy*
apt-get install linux-virtual
apt-get dist-upgrade

systemd-analyze

## Resolver issue

sudo rm -f /etc/resolv.conf
sudo ln -s /run/resolvconf/resolv.conf /etc/resolv.conf
