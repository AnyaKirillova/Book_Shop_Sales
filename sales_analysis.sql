-- Top 10 books by quantity sold
SELECT  
b.title, 
b.author,  
SUM(s.quantity) AS total_quantity 
FROM books b
JOIN sales s ON b.book_id = s.book_id
GROUP BY b.title, b.author 
ORDER BY total_quantity DESC
LIMIT 10;

-- Top 10 books by total revenue
SELECT  
b.title, 
b.author, 
b.genre, 
SUM(s.quantity) AS total_quantity, 
ROUND(SUM(p.price * s.quantity), 2) AS total_revenue
FROM books b
JOIN sales s ON b.book_id = s.book_id
JOIN prices p ON b.book_id = p.book_id
GROUP BY b.title, b.author, b.genre
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 10 lowest sales
SELECT 
b.title,
b.author,
SUM(s.quantity) AS total_quantity
FROM books b
INNER JOIN sales s ON b.book_id = s.book_id
GROUP BY b.title, b.author
ORDER BY total_quantity
LIMIT 10;


-- The most popular genre
SELECT 
b.genre,
SUM(s.quantity) AS total_quantity,
ROUND(SUM(s.quantity * p.price), 2) AS revenue
FROM books b
INNER JOIN sales s ON b.book_id = s.book_id
INNER JOIN prices p ON b.book_id = p.book_id
GROUP BY b.genre
ORDER BY revenue DESC;

