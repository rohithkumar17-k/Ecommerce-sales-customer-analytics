

-- ============================================================
-- E-Commerce Sales & Customer Analytics
-- SQL Business Analysis
-- ============================================================


-- 1. Overall Business KPIs
SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    COUNT(DISTINCT "Order ID") AS Total_Orders,
    COUNT(DISTINCT "Customer ID") AS Total_Customers,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM sales;


-- 2. Category Performance
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 3. Sub-Category Performance
SELECT
    Category,
    "Sub-Category",
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM sales
GROUP BY Category, "Sub-Category"
ORDER BY Total_Profit DESC;


-- 4. Monthly Sales and Profit
SELECT
    "Year_Month",
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT "Order ID") AS Orders
FROM sales
GROUP BY "Year_Month"
ORDER BY "Year_Month";


-- 5. Top 10 Customers by Sales
SELECT
    "Customer ID",
    "Customer Name",
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM sales
GROUP BY
    "Customer ID",
    "Customer Name",
    Segment
ORDER BY Total_Sales DESC
LIMIT 10;


-- 6. Top 10 Customers by Profit
SELECT
    "Customer ID",
    "Customer Name",
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM sales
GROUP BY
    "Customer ID",
    "Customer Name",
    Segment
ORDER BY Total_Profit DESC
LIMIT 10;


-- 7. Top 10 Products by Sales
SELECT
    "Product ID",
    "Product Name",
    Category,
    "Sub-Category",
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY
    "Product ID",
    "Product Name",
    Category,
    "Sub-Category"
ORDER BY Total_Sales DESC
LIMIT 10;


-- 8. Loss-Making Products
SELECT
    "Product ID",
    "Product Name",
    Category,
    "Sub-Category",
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM sales
GROUP BY
    "Product ID",
    "Product Name",
    Category,
    "Sub-Category"
HAVING Total_Profit < 0
ORDER BY Total_Profit ASC
LIMIT 10;


-- 9. Regional Performance
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / SUM(Sales) AS Profit_Margin,
    COUNT(DISTINCT "Order ID") AS Orders,
    COUNT(DISTINCT "Customer ID") AS Customers
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 10. State Performance
SELECT
    State,
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM sales
GROUP BY State, Region
ORDER BY Total_Profit ASC;


-- 11. Discount Impact
SELECT
    Discount,
    COUNT(*) AS Transactions,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Profit) AS Avg_Profit,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM sales
GROUP BY Discount
ORDER BY Discount;


-- 12. Shipping Performance
SELECT
    "Ship Mode",
    COUNT(DISTINCT "Order ID") AS Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Shipping_Days) AS Avg_Shipping_Days
FROM sales
GROUP BY "Ship Mode"
ORDER BY Avg_Shipping_Days;


-- 13. Region + Shipping Performance
SELECT
    Region,
    COUNT(DISTINCT "Order ID") AS Orders,
    AVG(Shipping_Days) AS Avg_Shipping_Days,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Region
ORDER BY Avg_Shipping_Days DESC;

