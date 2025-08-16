-- Reset tables for repeatable runs
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS members;

-- Authors
CREATE TABLE authors (
id INTEGER PRIMARY KEY,
name TEXT NOT NULL,
country TEXT
);

-- Books
CREATE TABLE books (
id INTEGER PRIMARY KEY,
title TEXT NOT NULL,
author_id INTEGER NOT NULL REFERENCES authors(id),
published_year INTEGER,
genre TEXT,
CHECK (
published_year IS NULL
OR (published_year BETWEEN 1400 AND CAST(strftime('%Y','now') AS INTEGER))
)
);

-- Members
CREATE TABLE members (
id INTEGER PRIMARY KEY,
full_name TEXT NOT NULL,
email TEXT UNIQUE NOT NULL,
joined_at TEXT NOT NULL
);

-- Loans
CREATE TABLE loans (
id INTEGER PRIMARY KEY,
book_id INTEGER NOT NULL REFERENCES books(id),
member_id INTEGER NOT NULL REFERENCES members(id),
loan_date TEXT NOT NULL, -- YYYY-MM-DD
due_date TEXT NOT NULL, -- YYYY-MM-DD
return_date TEXT, -- NULL if not returned
CHECK (date(due_date) >= date(loan_date)),
CHECK (return_date IS NULL OR date(return_date) >= date(loan_date))
);

-- Helpful indexes
CREATE INDEX IF NOT EXISTS idx_books_author ON books(author_id);
CREATE INDEX IF NOT EXISTS idx_loans_member ON loans(member_id);
CREATE INDEX IF NOT EXISTS idx_loans_book ON loans(book_id);

-- Optional uniqueness (uncomment if desired)
-- CREATE UNIQUE INDEX IF NOT EXISTS uq_books_title_author ON books(title, author_id);