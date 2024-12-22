const sqlite3 = require('sqlite3').verbose();

// Open or create the database
const db = new sqlite3.Database('./servers.db', (err) => {
    if (err) {
        console.error('Error opening database:', err.message);
    } else {
        console.log('Connected to SQLite database.');
    }
});

// Create the table
db.serialize(() => {
    db.run(`CREATE TABLE IF NOT EXISTS servers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        server_name TEXT NOT NULL,
        ip_address TEXT NOT NULL
    )`, (err) => {
        if (err) {
            console.error('Error creating table:', err.message);
        } else {
            console.log('Table "servers" created or already exists.');
        }
    });

  // Insert sample data
    db.run(`INSERT INTO servers (server_name, ip_address) VALUES
        ('Server1', '192.168.1.1'),
        ('Server2', '192.168.1.2'),
        ('Server3', '192.168.1.3')`, (err) => {
        if (err) {
            console.error('Error inserting data:', err.message);
        } else {
            console.log('Sample data inserted.');
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
