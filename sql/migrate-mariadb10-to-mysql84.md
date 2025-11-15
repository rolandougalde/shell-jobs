# Database migration tasks

- Migrating a complete production Database from Maria DB 10.x.x to MySQL 8.4 LTS

## Backup database objects

```bash
# Backup Database
mysqldump -u root -p -R -E --triggers --single-transaction [prod-db] > /home/servicedesk/backups/[prod-db]-$(date +\%Y-\%m-\%d-\%H-\%M).sql

# Remove all occurrences of NO_AUTO_CREATE_USER (with or without trailing comma)
sed -E 's/NO_AUTO_CREATE_USER,?//g; s/,,/,/g; s/,$//' input-file.sql > output-cured-file.sql

# Remove DEFAULT clauses for JSON/TEXT/BLOB/GEOMETRY
sed -E 's/(TEXT|BLOB|JSON|GEOMETRY)[^,)]*DEFAULT[^,)]*//g' input-cured-file.sql > output-working-file.sql
```

## Restore database
```bash
 mysql -u root -p [prod-db] --database [prod-db] < /home/servicedesk/backups/[prod-db]-$(date +\%Y-\%m-\%d-\%H-\%M).sql
```
