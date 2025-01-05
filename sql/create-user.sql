-- Create SQL user and grant aceess

-- # mysql -u root -p

-- Create user
CREATE USER 'sa'@'%' IDENTIFIED BY 'YourSecurePassword';

-- Grant access
GRANT ALL PRIVILEGES ON *.* TO 'sa'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;


-- Verify user
SELECT user, host FROM mysql.user;
SHOW GRANTS FOR 'sa'@'%';

exit