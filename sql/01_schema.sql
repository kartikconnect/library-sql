-- Drop existing tables for repeatable runs (SQLite syntax)
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS members;

-- Core entities
CREATE TABLE authors (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  country TEXT
);

CREATE TABLE books (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  author_id INTEGER NOT NULL REFERENCES authors(id),
  published_year INTEGER,
  genre TEXT
);

CREATE TABLE members (
  id INTEGER PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  joined_at TEXT NOT NULL -- store ISO datetime as TEXT in SQLite
);

CREATE TABLE loans (
  id INTEGER PRIMARY KEY,
  book_id INTEGER NOT NULL REFERENCES books(id),
  member_id INTEGER NOT NULL REFERENCES members(id),
  loan_date TEXT NOT NULL,  -- YYYY-MM-DD
  due_date TEXT NOT NULL,   -- YYYY-MM-DD
  return_date TEXT          -- NULL if not returned
);
