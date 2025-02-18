------------- Business Problem ---------------

-- Retrieve all books in the "Fiction" genre:

SELECT * FROM Books 
WHERE Genre='Fiction';

-- Find books published after the year 1950:

SELECT * FROM Books 
WHERE Published_year>1950;

-- List all customers from the Canada:

SELECT * FROM Customers 
WHERE country='Canada';

-- Show orders placed in November 2023:

SELECT * FROM Orders 
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- Retrieve the total stock of books available:

SELECT SUM(stock) AS Total_Stock
From Books;

-- Find the details of the most expensive book:

SELECT * FROM Books 
ORDER BY Price DESC 
LIMIT 1;

-- Show all customers who ordered more than 1 quantity of a book:

SELECT * FROM Orders 
WHERE quantity>1;

-- Retrieve all orders where the total amount exceeds $20:

SELECT * FROM Orders 
WHERE total_amount>20;

-- List all genres available in the Books table:

SELECT DISTINCT genre FROM Books;

-- Find the book with the lowest stock:

SELECT * FROM Books 
ORDER BY stock 
LIMIT 1;

-- Calculate the total revenue generated from all orders:

SELECT SUM(total_amount) As Revenue 
FROM Orders;

-- Retrieve the total number of books sold for each genre:

SELECT * FROM ORDERS;

SELECT b.Genre, SUM(o.Quantity) AS Total_Books_sold
FROM Orders AS o
JOIN Books AS b ON o.book_id = b.book_id
GROUP BY b.Genre;


-- Find the average price of books in the "Fantasy" genre:

SELECT round(AVG(price)) AS Average_Price
FROM Books
WHERE Genre = 'Fantasy';


-- List customers who have placed at least 2 orders:

SELECT o.customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
FROM orders AS o
JOIN customers AS c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(Order_id) >=2;

-- Find the most frequently ordered book:

SELECT o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders AS o
JOIN books AS b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC 
LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

SELECT * FROM books
WHERE genre ='Fantasy'
ORDER BY price DESC LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:

SELECT b.author, SUM(o.quantity) AS Total_Books_Sold
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.Author;