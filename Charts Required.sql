 SELECT *
FROM pizza_sales

--Daily Trends For Total Orders
SELECT DATENAME(DW, order_date) AS order_day, 
COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

--Monthly Trends For Total Orders
SELECT DATENAME(MONTH, order_date) AS month, 
COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)

--% Of Sales By Pizza Category
SELECT pizza_category, SUM(total_price) AS total_revenue, 
SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS PCT
FROM pizza_sales
GROUP BY pizza_category

--To convert the % of sales by Pizza Category to two decimal places
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

-- Filtering monthly the % of sales by Pizza Category 1=Jan, 2=Feb, 3=March......
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH (order_date) = 1) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
WHERE MONTH (order_date) = 1
GROUP BY pizza_category

--% Of Sales By Pizza Size to two decimal places. Ordered using % in descending order
SELECT pizza_size,CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC

 --Filtering Quartely the % of sales by Pizza Size 1=Q1, 2=Q2, 3=Q3......
SELECT pizza_size,CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER, order_date) = 2) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) = 2
GROUP BY pizza_size
ORDER BY PCT DESC

--Total Pizza Sold By Category
SELECT pizza_category, SUM(quantity) AS Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Quantity_Sold DESC

--Top 5 Pizzas By Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--Bottom 5 Pizzas By Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

--Top 5 Pizzas By Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Quantity_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Quantity_Sold DESC

--Bottom 5 Pizzas By Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Quantity_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Quantity_Sold ASC

--Top 5 Pizzas By Order
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--Bottom 5 Pizzas By Order
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC

--Filtering using pizza_size or pizza_category to get top 5 Large pizzas
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
WHERE pizza_size = 'L'
GROUP BY pizza_name
ORDER BY Total_Orders DESC

