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

Reply to the following MySQL prompts with your desired selection to set up authentication and disable insecure 
defaults on your server.

- **VALIDATE PASSWORD component**: Enter `Y` and press `Enter` to enable password verification on the server.
- **Password Validation Policy**: Enter `2` to require strong passwords for all database users.
- **New password**: Enter a new strong password to assign the`root` database user.
- **Re-enter new password**: Repeat the new `root` database user password.
- **Do you wish to continue with the password provided?**: Enter `Y` to save the new database user password.
- **Remove anonymous users?**: Enter `Y` to remove anonymous users on the server.
- **Disallow root login remotely?**: Enter `Y` to disable remote access to the `root` database user account.
- **Remove test database and access to it?**: Enter `Y` to delete all test databases.
-- **Reload privilege tables now?**: Enter `Y` to refresh the MySQL privileges table.

7.Restart the MySQL database server to apply your configuration changes.
```bash
service mysql-server restart
```

## Install PHP and Configure PHP-FPM

PHP is available in the default repositories on your FreeBSD server and includes the PHP-FPM package that manages 
connections to the PHP service. Follow the steps below to install the latest PHP version and configure PHP-FPM on your 
server.

1.Search all available PHP packages in the FreeBSD `pkg` catalog.
```bash
sudo pkg search ^php[0-9]
```

2.Install the latest PHP version and PHP-FPM. For example, PHP version `8.3`.
```bash
pkg install -y php83
```

3.View the installed PHP version on your server.
```bash
$ php -v
```

Output:
```pre
PHP 8.3.8 (cli) (built: Jul  6 2024 01:55:02) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.3.8, Copyright (c) Zend Technologies
```

4.Enable PHP-FPM to automatically start at boot time.
```yaml
sysrc php_fpm_enable=yes
```

5.Start the PHP-FPM service.
```yaml
service php-fpm start
```

6.View the PHP-FPM and verify that it's running.
```yaml
$ sudo service php-fpm status
```

Output:
```pre
php_fpm is running as pid 8688.
```

7.Install common PHP modules required by most web applications.
```yaml
pkg install php83-mysqli php83-curl php83-gd php83-intl php83-mbstring php83-xml php83-zip
```

8.Open the default PHP-FPM pool configuration `www.conf` using a text editor such as `vi`.
```yaml
vi /usr/local/etc/php-fpm.d # nano www.conf
```

Find the following user and group directives.
```yaml
user = www
group = www
```

Find the following listen directive and verify that it's set to the localhost address `127.0.0.1`.
```ini
listen = 127.0.0.1:9000
```

Modify your PHP-FPM memory configurations to match your FreeBSD server memory needs.

Save and close the file.

9.Restart the PHP-FPM service to apply your configuration changes.
```yaml
service php-fpm restart
```

## Configure Nginx with PHP-FPM

Nginx delivers dynamic web applications using the PHP-FPM service that processes PHP requests on your server using the 
default pool configuration. Follow the steps below to create a new Nginx virtual host and enable the PHP-FPM service to 
process dynamic web application requests on your server.

1.Create a new virtual hosts directory on your server. For example, `/usr/local/etc/nginx/vhosts/`
```yaml
mkdir -p /usr/local/etc/nginx/vhosts/
```

2.Open the main Nginx configuration file
```yaml
nano /usr/local/etc/nginx/nginx.conf
```

3.Add the following directive at the end of the file before the closing `http` context tag `}`.
```yaml
include /usr/local/etc/nginx/vhosts/*.conf;
```

Save and close the file.

Create a new Nginx virtual host configuration file in the `/usr/local/etc/nginx/vhosts/` directory. For example, 
`app.example.com.conf`.
```yaml
nano /usr/local/etc/nginx/vhosts/app.example.com.conf
```

5.Add the following contents to the file.
```nginx
server {
    listen 80;
    server_name app.example.com;
    root /usr/local/www/app.example.com;

    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    error_page 404 /404.html;
    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/local/www/app.example.com;
    }
```

Save and close the file.

The Nginx configuration above listens for incoming HTTP connections using your domain `app.example.com` and serves 
files from the `/usr/local/www/app.example.com` web root directory. The `location ~ \.php$` block matches all PHP file 
requests on the domain and forwards them to the PHP-FPM port `127.0.0.1:9000` for processing.

6.Create the virtual host web root directory to deliver your web application files.
```bash
mkdir -p /usr/local/www/app.example.com
```

7.Test the Nginx configuration for errors.
```bash
$ sudo nginx -t
```

Output:
```pre
nginx: the configuration file /usr/local/etc/nginx/nginx.conf syntax is ok
nginx: configuration file /usr/local/etc/nginx/nginx.conf test is successful
```

8.Restart Nginx to apply the configuration changes.
```bash
service nginx restart
```

## Test the Installation

Nginx works with PHP-FPM to deliver dynamic web applications on your virtual host domain `app.example.com` while MySQL 
works as the database backend that stores the application data. Follow the steps below to test the FEMP stack 
installation and create a sample PHP application that connects to the MySQL database server and displays a 
`Greetings from Vultr` message.

1.Log in to the MySQL database server as root.
```bash
mysql -u root -p
```

Enter the `root` database user password you set earlier when prompted to access the database console.

Create a new MySQL sample database to use with your application. For example, example_db.
```sql
mysql> CREATE DATABASE example_db;
```

3.View all available databases and verify that the new database is available.
```sql
mysql> SHOW DATABASES;
```

Output:
```pre
+--------------------+
| Database           |
+--------------------+
| example_db      |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)
```

5.Switch to the database.
```sql
mysql> use example_db;
```

5.Create a new sample database user `test_user` with a strong password. Replace `Strong)P@ssword123` with your desired 
password.
```sql
mysql> CREATE USER 'test_user'@'localhost' IDENTIFIED BY 'Strong)P@ssword123';
```

6.Create a new sample table `greeting` with two columns, `id` and `message`.
```sql
mysql> CREATE TABLE greetings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255)
);
```

8.Exit the MySQL console.
```sql
mysql> \q
```

9.Create a new `index.php` file in your web root directory `/usr/local/www/app.example.com`.
```bash
$ sudo nano /usr/local/www/app.example.com/index.php
```

10.Add the following contents to the file.
```php
<?php
$servername = "localhost";
$username = "test_user";
$password = "Strong)P@ssword123";
$dbname = "test_db";

// Create database connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check database connection
if ($conn->connect_error) {
    die("Database Connection Failed." . $conn->connect_error);
}

echo "<h4 align='center'> Below is the message retrieved from the test_db Mysql database on your server</h4>";

// Retrieve the record from greetings Table
$sql = "SELECT message FROM greetings";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo "<h1 align='center'>" . $row["message"]. "</h1>";

} else {
    echo "<h1 align='center'>No message found.</h1>";
}

$conn->close();
?>
```

Save and close the file.

The above PHP application connects to the MySQL database server using your database user details and retrieves the 
message `Greetings from Vultr` when successful. A `No message found` error displays in the web browser when the database 
table does not return any records.

11.Restart the Nginx web server to apply changes.
```bash
$ sudo service nginx restart
```

12. Access your domain using a web browser such as Chrome and verify that a `Greetings from Vultr` message displays in your browser.
```pre
http://app.example.com
```


























