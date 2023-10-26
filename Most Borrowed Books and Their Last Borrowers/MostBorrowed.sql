WITH loan AS
(
  SELECT DISTINCT ON(book_id)
    book_id, 
    borrower_name, 
    COUNT(loan_id) OVER (PARTITION BY book_id) AS loan_count
  FROM loans
  ORDER BY book_id, return_date DESC
)
SELECT
  book_id, 
  title, 
  borrower_name AS last_borrower, 
  loan_count
FROM books JOIN loan USING (book_id)
WHERE loan_count >= ALL(SELECT loan_count FROM loan)