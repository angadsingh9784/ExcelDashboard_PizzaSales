--ALL ROWS
SELECT * FROM PIZZA_TB;
-- TOTAL REVENUE CALCULATION
select sum(total_price) from pizza_tb;

-- TO DETERMNINE AVERAGE ORDER VALUE
SELECT SUM(TOTAL_PRICE)/COUNT(DISTINCT ORDER_ID) 
AS AVG_ORDER_VALUE FROM PIZZA_TB;

-- TOTAL PIZZAS SOLD
SELECT SUM(QUANTITY) AS TOTAL_PIZZA_SOLD 
FROM PIZZA_TB;

--TOTAL ORDERS
SELECT COUNT(DISTINCT ORDER_ID) FROM PIZZA_TB;
                                                             
--AVERAGE PIZZAS PER ORDER
SELECT CAST(CAST(SUM(QUANTITY) AS DECIMAL(10,2)
) / COUNT(DISTINCT ORDER_ID) AS DECIMAL(10,2))
AS AVERAGE_PIZZAS_PER_ORDER
FROM PIZZA_TB;

--PROBLEM STATEMEMT
-- CHARTS REQUIREMENTS
-- DAILY TRENDS

--DATANAME IS WORKING MY SQL
-- DAILY TREND FOR TOTAL ORDERS
SELECT TO_CHAR(ORDER_DATE,'Day'),
count(distinct order_id)
FROM PIZZA_TB
GROUP BY 1 ;



--HOURLY TRENDS
-- HOURLY TRENDS
SELECT 
    EXTRACT(HOUR FROM order_time) AS order_hour,
    COUNT(DISTINCT order_id) AS order_count
FROM 
    PIZZA_TB
GROUP BY 
    EXTRACT(HOUR FROM order_time)
ORDER BY 
    order_hour;



--PERCENTAGE OF THE SALES BY PIZZA CATEGORY


SELECT PIZZA_CATEGORY,
SUM(Total_price)*100/
(SELECT SUM(TOTAL_PRICE)
FROM PIZZA_TB)
AS PERCENTAGE_PIZZA
FROM PIZZA_TB
WHERE
TO_CHAR(ORDER_DATE,'MM')='01'
GROUP BY PIZZA_CATEGORY;


-- PERCENTAGE OF SALES BY PIZZA CATEGORY


SELECT PIZZA_SIZE,
SUM(Total_price)*100/
(SELECT SUM(TOTAL_PRICE)
FROM PIZZA_TB)
AS PERCENTAGE_PIZZA
FROM PIZZA_TB
WHERE
TO_CHAR(ORDER_DATE,'MM')='01'
GROUP BY PIZZA_SIZE
ORDER BY 2 DESC;

-- TOTAL PIZZA SOLD BY PIZZA CATEGORY
SELECT PIZZA_CATEGORY, SUM(QUANTITY)
FROM PIZZA_TB
GROUP BY 1;


--TOP 5 BEST SELLERS
SELECT PIZZA_NAME,SUM(QUANTITY) as TOTAL_PIZZA_SOLD
FROM PIZZA_TB
GROUP BY PIZZA_NAME
ORDER BY 2 DESC
LIMIT 5;

--TOP 5 WROST PIZZA
SELECT PIZZA_NAME,SUM(QUANTITY) as TOTAL_PIZZA_SOLD
FROM PIZZA_TB
GROUP BY PIZZA_NAME
ORDER BY 2 ASC
LIMIT 5;




