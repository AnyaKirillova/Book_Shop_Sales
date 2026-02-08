-- Join books, sales and prices to prepare analytical dataset
SELECT
    b.book_id,
    b.title,
    b.author,
    b.genre,
    s.sale_date,
    s.quantity,
    p.price
FROM books b
JOIN sales s ON b.book_id = s.book_id
JOIN prices p ON b.book_id = p.book_id;

