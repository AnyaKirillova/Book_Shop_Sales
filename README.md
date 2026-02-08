Book Store Sales Analysis (SQL)
-
Project Overview
-

This project focuses on analyzing sales performance of a book shop using SQL.
The main goal was to prepare and connect data from multiple tables, clean it, and perform analytical queries to understand:

- which books sell the most and the least
- which genres and price segments perform better
- how quantity and revenue differ across price ranges

The project demonstrates practical SQL skills: joins, aggregation, data cleaning, segmentation, and business-oriented analysis.

---

Objectives
-
- Prepare data by joining three related tables
- Clean data by identifying and removing duplicates
- Analyze sales performance by:quantity sold, total revenue, genre, price segments
- Identify top-selling and low-selling books
- Compare cheap, mid, and expensive books

---

Dataset Description
-
The database contains three tables:
### `books`
- **book_id** — unique book identifier (PK) 
- **title** — book title  
- **author** — author name  
- **genre** — book genre

### `sales`
- **sale_id** — unique sale identifier  
- **book_id** — reference to books (FK)  
- **sale_date** — date of sale  
- **quantity** — quantity sold  

### `prices`
- **price_id** — unique price record  
- **book_id** — reference to books (FK)
- **price** — book price  
- **start_date** — price start date 
---
Data Cleaning & Preparation
-
Duplicate checks
-
Duplicates were identified using GROUP BY and COUNT(*):

- books → duplicates found by book_id
- sales → duplicates found by (book_id, sale_date, quantity)
- prices → no duplicates found

Removing duplicates
-
Duplicates were removed using ROW_NUMBER() window functions and DELETE queries.

Text standardization
-
Checked for consistency in text fields: authors, genres, book titles.

---
Sales Analysis
-

- Top 10 books by quantity sold

Identified books with the highest total sales volume.

- Top 10 books by total revenue

Calculated total revenue.

- Lowest-selling books

Verified whether books with zero sales exist

Result: no books with absolute zero sales

Identified bottom 10 books by quantity sold.

- Best-performing genres

Analyzed sales and revenue aggregated by genre.

---
Price Segment Analysis
-
Books were grouped into three price segments:

- Cheap (< $10)
- Mid ($10–20)
- Expensive (> $20)

Metrics analyzed:
- Number of books per segment
- Total quantity sold
- Average quantity sold per book
- Average revenue per book

Key results:

- Expensive books generate the highest average revenue per book
- Cheap and expensive books sell similar quantities on average
- Mid-priced books perform slightly lower in quantity and revenue

---
## Key Insights

- The top 10 books by quantity sold differ from the top 10 books by total revenue, highlighting the impact of pricing on overall performance.
- High-priced books generate significantly higher average revenue per book compared to mid and low-priced segments.
- Despite similar average quantities sold across price segments, expensive books bring higher revenue per title.
- No books were identified with zero sales, indicating consistent demand across the catalog.
- The most profitable genre also showed strong sales volume, suggesting a combination of high demand and favorable pricing.
