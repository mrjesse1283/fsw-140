-- USE salesOrders

-- 1.	Show all the information on our customers.
-- a)	Query:
-- SELECT * FROM customers;

-- b)	Columns: 
-- CustomerId, CustFirstName, CustLastName, CustStreetAddress, CustCity, CustState, CustAreaCode, CustPhoneNumber

-- c)	Expected Row Count: 
-- 28 rows

-- 2.	Show a list of states, in reverse alphabetical order, where our vendors are located, and include the names of the vendor.
-- a)	Query:
-- SELECT VendState, VendName FROM vendors ORDER BY VendName DESC;

-- b)	Columns: 
--  VendState, VendName; 

-- c)	Expected Row Count: 
-- 11 rows

-- 3.	What if we adjusted the retail price of each product by increasing it 7 percent?
-- a)	Query:
-- UPDATE products SET RetailPrice = RetailPrice * 1.07;
-- SELECT RetailPrice, ProductName FROM products;
-- b)	Columns: 
-- RetailPrice, ProductName

-- c)	Expected Row Count: 
-- 40rows

-- 4.	Show a list of orders made by each customer in ascending date order.
-- a)	Query:
-- SELECT OrderNumber, OrderDate, CustomerID FROM orders ORDER BY OrderDate ASC;

-- b)	Columns: 
-- OrderNumber, OrderDate, CustomerID

-- c)	Expected Row Count: 
-- 944 Rows

-- 5.	Give the names of all vendors based in Albany, Anchorage, and Dallas.
-- a)	Query:
-- SELECT VendName, VendCity FROM vendors WHERE VendCity IN('Albany', 'Anchorage', 'Dallas');

-- b)	Columns: 
-- VendName, VendCity;

-- c)	Expected Row Count: 
-- 3 Rows

-- 6.	Show an alphabetized list of products with a quantity on hand greater than or equal to 30.
-- a)	Query:
-- SELECT QuantityOnHand, ProductName FROM products WHERE QuantityOnHand >= 30 ORDER BY ProductName;

-- b)	Columns: 
-- QuantityOnHand, ProductName;

-- c)	Expected Row Count: 
-- 9 Rows

-- 7.	What vendors do we work with that don’t have an email address?
-- a)	Query:
-- SELECT VendEmailAddress, VendName FROM vendors WHERE ISNULL(VendEmailAddress) ORDER BY VendName; 

-- b)	Columns: 
-- VendEmailAddress, VendName; 

-- c)	Expected Row Count: 
-- 5 Rows

-- 8.	List employees and the dates their orders shipped sorted by order date.
-- a)	Query:
-- SELECT EmpFirstName, EmpLastName, ShipDate, OrderDate FROM orders JOIN employees ON orders.EmployeeID = employees.EmployeeID ORDER BY OrderDate;

-- b)	Columns: 
-- EmpFirstName, EmpLastName, ShipDate, OrderDate;

-- c)	Expected Row Count: 
-- 944 Rows


-- 9.	Show the vendors and products they supply to us for products over $75 for vendors in Texas. 
-- a)	Query:
-- SELECT VendName, VendState, ProductName, RetailPrice
-- FROM vendors, products
-- WHERE RetailPrice > 75 AND VendState = 'TX' ;

-- b)	Columns: 
-- VendName, VendState, ProductName, RetailPrice;

-- c)	Expected Row Count:
--  36 Rows;

-- 10.	Show employees who live in the same city and state as our vendors.
	-- a)	Query:
-- SELECT EmpFirstName, EmpCity, EmpState FROM employees WHERE EmpCity = ANY ( SELECT VendCity FROM vendors) ;

	-- b)	Columns: 
    -- EmpFirstName, EmpCity, EmpState

	-- c)	Expected Row Count: 
    -- 2 Rows

-- 11.	Display customers who have no sales rep (employees) in the same state.
	-- a)	Query:
   --  SELECT CustomerID, CustFirstName, CustState, EmployeeID, EmpState FROM customers, employees 
--     WHERE CustState NOT IN (EmpState);

	-- b)	Columns: 
    -- CustomerID, CustFirstName, CustState, EmployeeID, EmpState

	-- c)	Expected Row Count: 
    -- 163 Rows

-- 12.	What is the average quoted price of a helmet?
	-- a)	Query:
	-- select * FROM order_details
	--  SELECT ProductName, (SELECT AVG(QuotedPrice) FROM order_details) FROM products
	-- 	WHERE ProductName LIKE '%helmet%';	

	-- b)	Columns: 
	-- AVG(RetailPrice)
	-- c)	Expected Row Count: 
	-- 1 Row

-- 13.	What was the date of the earliest ship date?
	-- a)	Query:
	-- select MIN(ShipDate) from orders as EarliestShipDate

	-- b)	Columns: 
	-- MIN(ShipDate)

	-- c)	Expected Row Count: 
	-- 1 Row

-- 14.	What is the total amount (in dollars) of orders from the state of Oregon?
	-- a)	Query:
	-- SELECT SUM(OrderTotal) as TOTAL  FROM orders WHERE CustomerId IN (SELECT customerid FROM customers WHERE custstate='OR')
	-- SELECT CustState, (SELECT SUM(OrderTotal) FROM orders) AS Total FROM customers WHERE CustState LIKE 'OR'; 
	-- b)	Columns: 
	-- CustState, Total

	-- c)	Expected Row Count: 
	-- 4 Rows

-- 15.	Show each employee, the employee’s total sales (in dollars), the employee’s total sales item quantity, and the average item sales price
-- ordered by the employee’s average item sales price highest to lowest.
	-- a)	Query:
	-- SELECT DISTINCT EmpFirstName, EmpLastName,(SELECT SUM(orderTotal) FROM orders WHERE employees.EmployeeID = orders.EmployeeID) as orderTotal,(select sum(QuantityOrdered) from order_details ) as quantityfrom orders
	-- JOIN employees ON employees.EmployeeID = orders.EmployeeID JOIN order_details on orders.OrderNumber = order_details.OrderNumber;

	-- SELECT EmpFirstName, EmpLastName, QuantityOnHand  (SELECT SUM(QuotedPrice)),(SELECT AVG(RetailPrice) )FROM employees, products, order_details
	-- SELECT  EmpFirstName, EmpLastName, (SELECT SUM(OrderTotal) FROM orders) AS Total, (SELECT AVG(RetailPrice) FROM products) AS Average FROM employees;
	-- b)	Columns: 
    -- EmpFirstName, EmpLastName, Total, Average

	-- c)	Expected Row Count
	--  9 Rows
