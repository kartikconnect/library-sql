-- Authors
INSERT INTO authors (name, country) VALUES
  ('J. Doe','US'),
  ('A. Khan','IN'),
  ('M. Silva','BR');

-- Books
INSERT INTO books (title, author_id, published_year, genre) VALUES
  ('Data 101', 1, 2015, 'Education'),
  ('SQL Mastery', 2, 2020, 'Technology'),
  ('Clean Data', 1, 2018, 'Technology'),
  ('World Tales', 3, 2012, 'Fiction'),
  ('Analytics Lab', 2, 2023, 'Technology');

-- Members
INSERT INTO members (full_name, email, joined_at) VALUES
  ('Riya Sharma', 'riya@example.com', '2024-02-10T09:30:00'),
  ('Aman Verma', 'aman@example.com', '2024-05-22T14:10:00'),
  ('Neha Singh', 'neha@example.com', '2024-06-05T18:45:00'),
  ('Vikram Rao', 'vikram@example.com', '2024-07-15T12:00:00');

-- Loans (2 returned, 2 pending/overdue examples)
INSERT INTO loans (book_id, member_id, loan_date, due_date, return_date) VALUES
  (1, 1, '2025-07-01', '2025-07-15', '2025-07-12'),
  (2, 2, '2025-07-10', '2025-07-24', NULL),
  (3, 3, '2025-07-20', '2025-08-03', '2025-07-30'),
  (4, 4, '2025-08-01', '2025-08-15', NULL);
