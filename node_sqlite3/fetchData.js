const sqlite3 = require('sqlite3').verbose();

// Open the database
const db = new sqlite3.Database('./servers.db', (err) => {
    if (err) {
        console.error('Error opening database:', err.message);
    } else {
        console.log('Connected to SQLite database.');
    }
});

// Fetch and display data
db.serialize(() => {
    db.all(`SELECT id, server_name, ip_address FROM servers`, (err, rows) => {
        if (err) {
            console.error('Error fetching data:', err.message);
        } else {
            console.log('Server Data:');
            rows.forEach((row) => {
                console.log(`ID: ${row.id}, Name: ${row.server_name}, IP: ${row.ip_address}`);
            });
        }
    });
});

// Close the database connection
db.close((err) => {
    if (err) {
        console.error('Error closing database:', err.message);
    } else {
        console.log('Database connection closed.');
    }
});
