# Server configuration

## General settings

> - *VCenter:* 02
> - *Host:* Buddha
> - *Server name:* GATEKEEPER-01
> - *IP:* 192.168.101.253


`sudo gedit /etc/default/grub`

You will see the following contents in the text editor:

```xml
GRUB_DEFAULT=0
GRUB_HIDDEN_TIMEOUT=0
GRUB_HIDDEN_TIMEOUT_QUIET=true
GRUB_TIMEOUT=10
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX=""
```

## Network configuration

Source file ```/etc/network/interfaces```

```json
# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto ens192
iface ens192 inet static
        address 192.168.101.253/22
        gateway 192.168.100.1

```

Source file ```/etc/resolv.conf```
```json
nameserver 192.168.100.9
nameserver 192.168.100.6
```

## Software installation

### Post install configuration

```bash
apt update
apt install sudo
usermod -aG sudo servicedesk
apt install swapspace
apt install htop
apt remove --purge linux-image-amd64
apt install linux-image-cloud-amd64
reboot
systemd-analyze
```

### NGinx installation

```bash
apt install nginx
```

### NodeJS & NPM installation

```bash
apt install nodejs
apt install npm
npm install express
pm install -g pm2
```

### Redis installation

```bash
apt install redis
redis-cli ping
```

### Docker & docker-compose installation

```bash
sudo apt install docker
sudo apt install docker-compose
```

### SSL setup

- Copy the `.CRT + the bundle` to  /etc/ssl/private/2025.wildcard.txnservice.com.crt
- Copy the `.Key` to  /etc/ssl/private/2025.wildcard.txnservice.com.key

## Stack configuration

### Nginx reverse proxy configuration

```conf
server {
    # Redirect HTTP traffic to HTTPS
    listen 80;
    server_name getip.txnservice.com;
    return 301 https://$host$request_uri;
}

server {
    # HTTPS listener
    listen 443 ssl;
    server_name getip.txnservice.com;

    # SSL certificate configuration
    ssl_certificate /etc/ssl/private/2025.wildcard.txnservice.com.crt;
    ssl_certificate_key /etc/ssl/private/2025.wildcard.txnservice.com.key;

    # Security settings
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;

    # Proxy configuration for Node.js
    location / {
        proxy_pass http://192.168.101.253:8080; # Your Node.js app's address
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }

    # Optional: Static file caching (if needed)
    location /static/ {
        root /path/to/your/static/files;
        expires max;
        add_header Cache-Control "public";
    }

    # Logging (optional)
    access_log /var/log/nginx/getip_access.log;
    error_log /var/log/nginx/getip_error.log;
}
```

```bash
service nginx restart
```

---

### Node app configuration

- Define the listen port

```javascript
const express = require('express');
const app = express();
 
app.get('/', (req, res) => {
    const realIP = req.headers['x-forwarded-for'] || req.socket.remoteAddress;
    res.send(realIP);
});
 
 app.listen(7080, () => {
     console.log('Server running on port 8080');
});
```

### Dockerfile configuration

- Create a `Dockerfile` file, define port exposing.

```conf
# Use an official Node.js runtime as a parent image
FROM node:18

# Set the working directory
WORKDIR /var/www/getip-txnservice-com

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the app's source code
COPY . .

# Expose the port the app runs on
EXPOSE 7080

 # Define the command to start the app
CMD ["node", "app.js"]
```

### docker-composer file configuration

- Create a `docker-composer.yml` file, define port mapping.

```yml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "8080:7080"
    volumes:
      - .:/var/www/getip-txnservice-com
     environment:
       - NODE_ENV=production
```

### Build Docker container

- Build in the Node app directory

```bash
docker build -t getip-txnservice-com-v0.0.3 .
```

### Run Docker container

- Build in the Node app directory

```bash
sudo docker run -d --restart=always -p 8080:7080 --name getip-txnservice-com-v0.0.3 getip-txnservice-com-v0.0.3
```

### PM2 configuration

- This configuration is optional works without Docker container.
- It treats the app a manegeable service.

```bash
pm2 start app.js
```

### Test API

- API URL, `https://getip.txnservice.com`.
