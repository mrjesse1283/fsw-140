--Week 5 bobross assignment

- CREATE DATABASE BobRoss;
-- USE BobRoss;
-- select * from happy_trees;

-- 1) SET:
	-- UPDATE happy_trees
	-- SET TITLE = 'A Walk In The Hood'
	-- WHERE EPISODE = 'S01E01'

-- 2) SUBQUERIES:
  -- CREATE TABLE other_trees AS(SELECT * FROM happy_trees);
-- 	SELECT * FROM other_trees; 

-- 3) ORDER OF OPERATIONS:
--   SELECT EPISODE, TITLE, CABIN
--     FROM happy_trees
--    WHERE CABIN = 1
-- ORDER BY EPISODE;

-- 4) CREATING, ALTERING, AND DROPPING TABLES:
	-- CREATE TABLE mad_trees like happy_trees;
-- 	 SELECT * FROM mad_trees;
   --   ALTER TABLE mad_trees ADD AIRPLANES varchar(50) AFTER TITLE;
-- 	 SELECT * FROM mad_trees;
    -- DROP TABLE mad_trees;
    
	-- ALTER TABLE mad_trees MODIFY COLUMN AIRBRUSH VARCHAR(50) AFTER TITLE;
    

-- 5)  ASSOCIATIONS:
-- 	SELECT EPISODE FROM happy_trees 
-- 	UNION
-- 	SELECT TITLE FROM other_trees;

-- 6) JOIN and MULTIPLE TABLE JOINS:



--  CREATE TABLE misc_TABLE ( name varchar (50));
--  
--  INSERT INTO misc_table (name)
--  VALUES ( 'Bob Jr' ), ( 'Bobbette' );
-- ALTER TABLE misc_table
-- ADD BUSHES VARCHAR (50);
--  SELECT * FROM misc_table;
-- SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
-- FROM Orders
-- INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

-- SELECT EPISODE, TITLE, name FROM happy_trees, misc_table;