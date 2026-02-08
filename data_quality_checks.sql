-- Check duplicates in books table
SELECT book_id, COUNT(*) 
FROM books
GROUP BY book_id 
HAVING COUNT(*) > 1;

-- Check duplicates in prices table
SELECT price_id, book_id, start_date, COUNT(*)
FROM prices
GROUP BY price_id, book_id, start_date
HAVING COUNT(*) > 1;

-- Check duplicates in sales table
SELECT book_id, sale_date, quantity, COUNT(*)
FROM sales
GROUP BY book_id, sale_date, quantity
HAVING COUNT(*) > 1;

-- Check spelling / standardization
SELECT DISTINCT author 
FROM books 
ORDER BY author;

SELECT DISTINCT genre 
FROM books 
ORDER BY genre;

