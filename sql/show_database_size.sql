-- display a mysql database size

SELECT table_schema AS "Database",
       ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS "Size (MB)"
FROM information_schema.tables
WHERE table_schema = 'db_hs_fe_us'
GROUP BY table_schema;


-- display all mysql databases size

SELECT table_schema AS "Database",
       ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS "Size (MB)"
FROM information_schema.tables
GROUP BY table_schema
ORDER BY `Size (MB)` DESC;

-- display a PostgeSQL database size

SELECT pg_size_pretty(pg_database_size('mattermost')) AS size;

-- display all PostgeSQL databases size

SELECT datname AS "Database",
       pg_size_pretty(pg_database_size(datname)) AS "Size"
FROM pg_database
ORDER BY pg_database_size(datname) DESC;

-- display PostgeSQL tables size

SELECT schemaname || '.' || relname AS "Table",
       pg_size_pretty(pg_total_relation_size(relid)) AS "Size"
FROM pg_catalog.pg_statio_user_tables
ORDER BY pg_total_relation_size(relid) DESC;

-- display MS SQL databse size

USE northwind
EXEC sp_spaceused;

-- display all MS SQL databses size

SELECT 
    name AS [Database],
    CAST(SUM(size) * 8 / 1024 AS DECIMAL(10,2)) AS [Size (MB)]
FROM 
    sys.master_files
WHERE 
    type = 0  -- Data files only (exclude logs)
GROUP BY 
    name;

--  Size of all tables in current MS SQL database:

SELECT 
    t.NAME AS TableName,
    s.Name AS SchemaName,
    p.rows AS RowCounts,
    CAST((SUM(a.total_pages) * 8) / 1024.0 AS DECIMAL(10,2)) AS TotalSpaceMB,
    CAST((SUM(a.used_pages) * 8) / 1024.0 AS DECIMAL(10,2)) AS UsedSpaceMB,
    CAST((SUM(a.data_pages) * 8) / 1024.0 AS DECIMAL(10,2)) AS DataSpaceMB
FROM 
    sys.tables t
INNER JOIN      
    sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN 
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN 
    sys.allocation_units a ON p.partition_id = a.container_id
LEFT OUTER JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
WHERE 
    t.is_ms_shipped = 0
GROUP BY 
    t.Name, s.Name, p.Rows
ORDER BY 
    TotalSpaceMB DESC;
