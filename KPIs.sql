--Checking if all rows have been imported.
SELECT *
  FROM pizza_sales

 --Working on the KPI'S

--Total Revenue = sum of total price of all pizza orders.
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales

--Average Order Value = Total Revenue/ Total Number Of Orders
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Average_Order_Value
FROM pizza_sales

--Total Pizza Sold = sum of quantities of pizza sold
SELECT SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales

--Total Orders = distinct count of the orderid
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales

--Average Pizza Per Order = Total Number Of Pizza Sold/Total Number Of Orders
SELECT CAST(SUM(quantity) AS DECIMAL (10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS Average_Pizza_Order
FROM pizza_sales



