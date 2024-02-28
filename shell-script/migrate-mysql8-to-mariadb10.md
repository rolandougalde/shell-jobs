# Migrating MySql 8 to MariaDB 10

**Collation issues**

- Replace

```
"utf8mb4" with "utf8".
"utf8_unicode_ci" with "utf8_general_ci".
"utf8_0900_ai_ci" with "utf8_general_ci".
```
