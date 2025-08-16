-- Overdue loans
SELECT m.full_name, b.title, l.due_date
FROM loans l
JOIN members m ON m.id = l.member_id
JOIN books b ON b.id = l.book_id
WHERE l.return_date IS NULL
  AND date(l.due_date) < date('now')
ORDER BY date(l.due_date);

-- Most borrowed authors (top 5)
SELECT a.name AS author, COUNT(*) AS borrows
FROM loans l
JOIN books b ON b.id = l.book_id
JOIN authors a ON a.id = b.author_id
GROUP BY a.name
ORDER BY borrows DESC, a.name
LIMIT 5;

-- Member activity summary
SELECT m.full_name,
       COUNT(*) AS total_loans,
       SUM(CASE WHEN l.return_date IS NULL THEN 1 ELSE 0 END) AS active_loans
FROM members m
LEFT JOIN loans l ON l.member_id = m.id
GROUP BY m.full_name
ORDER BY total_loans DESC, m.full_name;

-- Books never loaned
SELECT b.title
FROM books b
LEFT JOIN loans l ON l.book_id = b.id
WHERE l.id IS NULL
ORDER BY b.title;
