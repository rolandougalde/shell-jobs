# Linux configuration
## Applies to ww-site01, ww-site02 and ww-site03.

```shell
# Post install
$ apt install htop
$ apt install sudo
$ apt install curl
$ apt install rsync
$ apt install net-tools
$ usermod -G sudo servicedesk
$ apt-get install swapspace
apt remove --purge linux-image-amd64
apt install linux-image-cloud-amd64

# Web server installation
apt install apache2

# PHP 8.2 installation

$ apt install php8.2
$ apt install php8.2-mysql
$ apt install php8.2-curl
$ apt install php8.2-dom
$ apt install php8.2-mbstring
$ apt install php8.2-imagick
$ apt install php8.2-zip

# install sury repository
curl -sSL https://packages.sury.org/php/README.txt | bash -x
apt update

# run upgrade; if already installed this will upgrade the default PHP 8.2 packages
apt upgrade

# show available PHP 7.4 packages
apt-cache search php7.4

# PHP 8.2 installation

$ apt install php7.4
$ apt install php7.4-mysql
$ apt install php7.4-curl
$ apt install php7.4-dom
$ apt install php7.4-mbstring
$ apt install php7.4-imagick
$ apt install php7.4-zip


# install PHP 7.4 fpm or apache2 mod as needed
#
# apt install php7.4-fpm
# apt install libapache2-mod-php7.4
```
