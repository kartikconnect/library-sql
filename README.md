# Library Management System (SQLite)

A simple SQL project with authors, books, members, and loans. Includes schema, seed data, and analytical queries.

## Run (SQLite CLI)
sqlite3 app.db < sql/01_schema.sql
sqlite3 app.db < sql/02_seed.sql

## Explore
sqlite3 app.db
-- then paste queries from sql/03_queries.sql

## Notes
- Dates stored as TEXT in ISO format for SQLite simplicity.
- Safe to re-run 01_schema.sql to reset tables.
