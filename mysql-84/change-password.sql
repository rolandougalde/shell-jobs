-- Updates user password

ALTER USER 'username'@'host' IDENTIFIED BY 'new_password';
FLUSH PRIVILEGES;
