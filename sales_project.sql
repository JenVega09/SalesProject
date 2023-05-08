-- Problem 1 & 2
-- 1. Using JOINs in a single query, combine data from all three tables (employees, products, sales) to view all sales with complete employee and product information in one table.
-- SELECT *
-- FROM sales
-- JOIN products
-- ON sales.ProductID = products.ProductID
-- JOIN employees
-- ON sales.SalesPersonID = employees.EmployeeID;

-- 2a. Create a View for the query you made in Problem 1 named "all_sales"
-- NOTE: You'll want to remove any duplicate columns to clean up your view!
/*
CREATE VIEW all_sales AS SELECT 
e.EmployeeID,
e.FirstName,
e.LastName, 
p.ProductID,
p.Name,
p.Price,
s.SalesID,
s.CustomerID,
s.Quantity
FROM sales s 
JOIN products p
ON s.ProductID = p.ProductID
JOIN employees e
ON s.SalesPersonID = e.EmployeeID;
*/
-- 2b. Test your View by selecting all rows and columns from the View
-- SELECT * 
-- FROM all_sales; 

-- Problem 3
-- Find the average sale amount for each sales person
-- SELECT EmployeeID, AVG(Price) AS avg_price
-- FROM all_sales
-- GROUP BY EmployeeID
-- ORDER BY avg_price DESC;

-- Problem 4
-- Find the top three sales persons by total sales

/* SELECT 
EmployeeID, FirstName, LastName,
SUM(Price) AS sum_of_sales
FROM all_sales
GROUP BY EmployeeID, FirstName, LastName
ORDER BY sum_of_sales DESC
LIMIT 3;
*/


-- Problem 5
-- Find the product that has the highest price

-- SELECT *
-- FROM products
-- WHERE price = (SELECT MAX(price) FROM products);

-- Problem 6
-- Find the product that was sold the most times

-- SELECT Name, Price, ProductID, COUNT(*) AS most_sold_item
-- FROM all_sales
-- GROUP BY Name, Price, ProductID
-- ORDER BY most_sold_item DESC;

-- Problem 7
-- Using a subquery, find all products that have a price higher than the average price for all products

-- SELECT ProductID, Name, Price
-- FROM products
-- WHERE Price > (SELECT AVG(Price) FROM Products)
-- ORDER BY Price Desc

-- Problem 8
-- Find the customer who spent the most money in purchased products

SELECT CustomerID, EmployeeID, SUM(Price) AS total_spent
FROM all_sales
GROUP BY CustomerID, EmployeeID, ProductID
ORDER BY total_spent DESC;
-- LIMIT 1;

-- Problem 9
-- Find the total number of sales for each sales person

SELECT EmployeeID, FirstName, LastName, SUM(Price) as total_sold
FROM all_sales
GROUP BY EmployeeID, FirstName, LastName
ORDER BY total_sold DESC;

-- Problem 10
-- Find the sales person who sold the most to the customer you found in Problem 8

SELECT CustomerID, EmployeeID, FirstName, LastName, SUM(Price) as total_spent
FROM all_sales
GROUP BY CustomerID, EmployeeID, FirstName, LastName
ORDER BY total_spent DESC
LIMIT 1