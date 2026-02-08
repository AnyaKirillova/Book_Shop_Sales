-- Sales by price segment
SELECT
CASE
WHEN p.price < 10 THEN 'Cheap (<$10)'
WHEN p.price BETWEEN 10 AND 20 THEN 'Mid ($10-20)'
ELSE 'Expensive (>$20)'
END AS price_segment,
COUNT(DISTINCT b.book_id) AS number_of_books,
SUM(s.quantity) AS total_quantity
FROM books b
INNER JOIN prices p USING(book_id)
INNER JOIN sales s USING(book_id)
GROUP BY price_segment
ORDER BY total_quantity DESC;

-- Average books sales by each segment
SELECT 
price_segment,
number_of_books,
total_quantity,
ROUND(total_quantity * 1.0 / number_of_books, 2) AS avg_quantity_p_b
FROM (
    SELECT
    CASE
    WHEN p.price < 10 THEN 'Cheap (<$10)'
    WHEN p.price BETWEEN 10 AND 20 THEN 'Mid ($10-20)'
    ELSE 'Expensive (>$20)'
    END AS price_segment,
    COUNT(DISTINCT b.book_id) AS number_of_books,
    SUM(s.quantity) AS total_quantity
    FROM books b
    INNER JOIN prices p USING(book_id)
    INNER JOIN sales s USING(book_id)
    GROUP BY price_segment
    ORDER BY total_quantity DESC) t 
ORDER BY avg_quantity_p_b DESC;


-- Revenue by segment
SELECT  
price_segment,
COUNT(DISTINCT book_id) AS number_of_books,
ROUND(SUM(total_revenue) * 1.0 / COUNT(DISTINCT book_id), 2) AS avg_revenue_p_b
FROM (
    SELECT
    b.book_id,
    SUM(s.quantity * p.price) AS total_revenue,
    CASE
      WHEN p.price < 10 THEN 'Cheap (<$10)'
      WHEN p.price BETWEEN 10 AND 20 THEN 'Mid ($10-20)'
      ELSE 'Expensive (>$20)'
    END AS price_segment
  FROM books b
  JOIN sales s USING(book_id)
  JOIN prices p USING(book_id)
  GROUP BY b.book_id, p.price
) t 
GROUP BY price_segment
ORDER BY avg_revenue_p_b DESC;
