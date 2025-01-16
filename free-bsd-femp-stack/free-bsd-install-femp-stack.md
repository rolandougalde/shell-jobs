# How to Install Nginx, MySQL, PHP (FEMP Stack) on FreeBSD 14.0

## Introduction

FreeBSD, Nginx, MySQL, and PHP (FEMP stack) is a collection of open-source applications that enable the development, 
hosting, and delivery of dynamic web applications on a server. FreeBSD works as the deployment operating system, Nginx 
as the web server, MySQL or MariaDB as the database backend, and PHP as the server-side scripting processor.

This article explains how to install Nginx, MySQL, and PHP (FEMP stack) on FreeBSD 14.0, and configure the packages to 
enable the delivery of dynamic web applications on your server.

### Prerequisites

Before you begin:

- Deploy a FreeBSD 14.0 instance on Vultr.
- Create a new domain A record pointing to the instance IP address. For example, app.example.com.
- Access the server using SSH as a non-root user with sudo privileges.

## Install Nginx

Nginx is available in the default package repositories on FreeBSD 14.0 with the latest version information. Follow the 
steps below to install Nginx and manage the application service to run on your server.

1.Update the pkg repository catalog.
```bash
pkg update
```

2.Install Nginx.
```bash
pkg install nginx
```

3.Enable Nginx to automatically start at boot time.
```bash
sysrc nginx_enable=yes
```

4.Start the Nginx service.
```bash
sudo service nginx start
```

5.View the Nginx service status and verify that it's running.
```bash
sudo service nginx status
```

Output:
```bash
nginx is running as pid 2273.
```

## Install MySQL

MySQL is available in the default package repositories on FreeBSD 14.0 with multiple package versions. Follow the 
steps below to install the latest MySQL database server package on your server using the default pkg package manager.

1.Search all MySQL packages available in the default pkg repositories.

```bash
pkg search MySQL
```

Output:
```bash
...
mariadb10-6-client-8.0.35          Multithreaded SQL database (client)
mariadb10-6-server-8.0.35_1        Multithreaded SQL database (server)
mariadb10-6-client-8.1.0           Multithreaded SQL database (client)
mariadb10-6-server-8.1.0           Multithreaded SQL database (server)
...
```

Based on the above output, MySQL 8.1 is the latest version you can install on your server. Use the FreeBSD ports collection to compile and install any other versions that are unavailable in the default repositories on your server.

2.Install the latest MySQL database server package.
```bash
pkg install mariadb-server
```

3.Enable the MySQL service to automatically start at boot.
```bash
sysrc mysql_enable=yes
```

4.Start the MySQL service.
```bash
service mysql-server start
```

5.View the MySQL service status and verify that it's running.
```bash
service mysql-server status
```

Output:
```
mysql is running as pid 4044.
```

6.Start the MySQL secure installation script.
```bash
mysql_secure_installation
```

