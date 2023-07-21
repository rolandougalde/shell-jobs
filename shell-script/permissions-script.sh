# Reset web folder (to open) permisions at 3 a.m.
* 3 * * * /usr/bin/find /var/www/ -type d -exec chmod 775 {} + && sudo find /var/www/ -type f -exec chmod 664 {} +

# Reset web folder (to closer) permisions at 3 a.m.
* 3 * * * /usr/bin/find /var/www/ -type d -exec chmod 755 {} + && sudo find /var/www/ -type f -exec chmod 644 {} +
