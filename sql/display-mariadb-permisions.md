# Working with MariaDB's users

```sql
SELECT * FROM INFORMATION_SCHEMA.SCHEMA_PRIVILEGES WHERE GRANTEE = "'username'@'hostname'";
```
