-- Remove duplicate books based on book_id
DELETE FROM books
WHERE book_id IN (
    SELECT book_id
    FROM (
        SELECT book_id,
               ROW_NUMBER() OVER (
                   PARTITION BY book_id
                   ORDER BY book_id
               ) AS r_n
        FROM books
    ) t
    WHERE r_n > 1
);

-- Remove duplicate sales records
DELETE FROM sales
WHERE sale_id IN (
    SELECT sale_id
    FROM (
        SELECT sale_id,
               ROW_NUMBER() OVER (
                   PARTITION BY book_id, sale_date, quantity
                   ORDER BY sale_id
               ) AS s_n
        FROM sales
    ) t
    WHERE s_n > 1
);

