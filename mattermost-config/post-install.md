History line # 1252

## Database configuration

```bash
# Check postgres configuration
vim /etc/postgresql/16/main/conf.d/local.conf
vim /etc/postgresql/16/main/postgresql.conf

# DNS Configuration
vim /etc/resolv.conf
```

## Diagnose commands

```bash
free -m
systemd-analyze
systemd-analyze blame
ls -lart /tmp/
df -h
cat /etc/fstab
vim /etc/fstab
cat /proc/swaps
fdisk -l
dmesg
tail -f /var/log/apache2/*log | grep admin_console --color
tail -f /var/log/apache2/*log | ccze
tail -f /var/log/apache2/*log | ccze

# Time configuration
tzconf
dpkg-reconfigure tzdata
date
ps axf | grep time
systemctl status systemd-timesyncd
vim /etc/systemd/timesyncd.conf

# Postgres commands
systemctl status postgresql
systemctl restart postgresql
systemctl stop postgresql
systemctl start postgresql
pg_lsclusters

# Network commands
sudo lsof -i -n -P | grep LISTEN
```

## Package installation

```bash
# Unnatended updates
dpkg-reconfigure unattended-upgrades

# DNS Configuration
resolvectl status
sudo apt-get remove --purge systemd-resolved
sudo apt install zstd
apt install  open-vm-tools
apt install ccze

# Swap condiguration
swapoff -a
rm /swap.img
sudo apt install swapspace
```

## LVM Disk resize

```bash
# FS tyoe
pvs
vgs
lvs
lvresize --resizefs -v -n -l 100%VG /dev/mapper/ubuntu--vg-ubuntu--lv
df -h
lvresize --resizefs -v -n -L +10G /dev/mapper/ubuntu--vg-ubuntu--lv
df -h
vgs
lvresize --resizefs -v -n -l 100%VG /dev/mapper/ubuntu--vg-ubuntu--lv

tune2fs -m1 /dev/mapper/ubuntu--vg-ubuntu--lv   57G  4.0G   51G   8% /
tune2fs -m1 /dev/mapper/ubuntu--vg-ubuntu--lv

# Rescan disk
ls /sys/class/scsi_host/ | while read host ; do echo "- - -" > /sys/class/scsi_host/$host/scan ; done

```

## Proxy reverse 

```bash
# Enable mods
a2enmod setenvif
```

## Database backup

```bash
# GZip backup
sudo -u postgres pg_dump -d mattermost | gzip > mattermost-2025-02-20-16:48.sql.gz

# ZSTD backup

sudo -u postgres pg_dump -d mattermost | zstd > mattermost-2025-02-20-16:48.sql.zst
```