# MariaDB Query to Create a WordPress Database and User

```sql
-- Step 1: Create the database for WordPress
CREATE DATABASE wordpress CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Step 2: Create a new database user (replace 'wp_user' and 'strong_password' with your desired username and password)
CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'strong_password';

-- Step 3: Grant appropriate privileges to the new user
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'localhost';

-- Step 4: Flush the privileges to apply the changes
FLUSH PRIVILEGES;
```

## Explanation

1.**CREATE DATABASE**:

Creates a database named `wordpress` with the `utf8mb4` character set and collation, ensuring proper handling of special characters and emojis.

2.**CREATE USER**:
- Creates a new user (`wp_user`) with a specified password (`strong_password`).
- Replace `wp_user` and `strong_password` with your preferred username and a strong password.

3.`GRANT ALL PRIVILEGES`:
- Gives the new user (`wp_user`) full privileges on the `wordpress` database.

4.`FLUSH PRIVILEGES`:
- Ensures that the privilege table is reloaded so the changes take effect immediately.
