# Create websites backup starting at at 1:00 a.m.
0 1 * * * /bin/tar -zcf /home/[user-directory]/backups/[backup-name]-sites-$(date +\%Y_\%m_\%d_\%H_\%M).tar.gz /var/www
