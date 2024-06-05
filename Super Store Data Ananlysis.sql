-------------------------------------SALES ANALYSIS--------------------------------------------------------------------
Select *
From PortfolioProject..SuperstoreData$
--order by 3,4


--This is to show total sales for each combination of Category, SubCategory, ProductName and Region, sorted in descending order 
SELECT 
    Category,
    SubCategory,
    ProductName,
    Region,
    SUM(Sales) AS TotalSales
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    Category, SubCategory, ProductName, Region
ORDER BY TotalSales DESC;
		

--Yearly and Monthly sales trend

SELECT 
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    ROUND(SUM(Sales), 2) AS MonthlySales
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    YEAR(OrderDate), MONTH(OrderDate)
ORDER BY 
    MonthlySales DESC;

--Top Selling Product

SELECT 
    ProductName,
    SUM(Sales) AS TotalSales
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    ProductName
ORDER BY 
    TotalSales DESC;

--Sales comparison by segment, country and city

SELECT 
    Segment,
    Country,
    City,
    ROUND(SUM(Sales), 2) AS TotalSales
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    Segment, Country, City
ORDER BY 
    TotalSales DESC;

-------------------------------------------------CUSTOMER ANALYSIS-----------------------------------------

--Customer segmentation based on sales and order frequency
SELECT 
    CustomerID,
    SUM(Sales) AS TotalSales,
    COUNT(DISTINCT OrderID) AS OrderFrequency
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    CustomerID
ORDER BY 
    TotalSales DESC;

--Customer loyalty analysis
SELECT 
    CustomerID,
    COUNT(DISTINCT OrderID) AS OrderCount,
    COUNT(DISTINCT ProductName) AS ProductCount,
    SUM(Quantity) AS TotalQuantity,
    SUM(Sales) AS TotalSales
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    CustomerID
ORDER BY 
    TotalSales DESC;

--Customer geographical distribution analysis

SELECT 
    Country,
    City,
    COUNT(DISTINCT CustomerID) AS CustomerCount
FROM 
     PortfolioProject..SuperstoreData$
GROUP BY 
    Country, City
ORDER BY
    CustomerCount DESC;

----------------------------------------------PROFITABILITY ANALYSIS---------------------------------------------------

--Profit margin analysis by product, category, or region

SELECT 
    ProductName,
    Category,
    Region,
    ROUND(SUM(Profit),  2) AS TotalProfit,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS ProfitMargin
FROM 
   PortfolioProject..SuperstoreData$
GROUP BY 
    ProductName, Category, Region
ORDER BY 
    TotalProfit DESC;

-- Profitability trends over time

SELECT 
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    ROUND(SUM(Profit), 2) AS MonthlyProfit
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    YEAR(OrderDate), MONTH(OrderDate)
ORDER BY 
    MonthlyProfit DESC;

--Profitability comparison across different segments or shipping modes
SELECT 
    Segment,
    ShipMode,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    Segment, ShipMode
ORDER BY 
    TotalProfit DESC;

------------------------------------------PRODUCT ANALYSIS----------------------------------------------------------------

--Analysis of product performance based on sales, quantity sold, and profit
SELECT 
    ProductName,
    ROUND(SUM(Sales), 2) AS TotalSales,
    SUM(Quantity) AS TotalQuantitySold,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    ProductName
ORDER BY 
     TotalProfit DESC;

--Product category and sub-category comparison

SELECT 
    Category,
    SubCategory,
    ROUND(SUM(Sales), 2) AS TotalSales,
    SUM(Quantity) AS TotalQuantitySold,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    Category, SubCategory
ORDER BY 
    TotalProfit DESC;

--Identification of underperforming products or categories
SELECT 
    ProductName,
    Category,
    ROUND(SUM(Sales), 2) AS TotalSales,
    SUM(Quantity) AS TotalQuantitySold,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY
    ProductName, Category
ORDER BY 
    TotalProfit ASC;

-----------------------------------------------GEOGRAPHICAL ANALYSIS-------------------------------- 

--Regional sales and profit analysis

SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS TotalSales,
	ROUND(SUM(Profit), 2) AS TotalProfit
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    Region
ORDER BY 
    TotalProfit DESC;

--City and state-wise sales comparison

SELECT 
    Country,
    State,
    City,
    SUM(Sales) AS TotalSales
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    Country, State, City
ORDER BY 
    TotalSales DESC;

--Analysis of sales trends across United States

SELECT 
    Country,
    YEAR(OrderDate) AS Year,
    ROUND(SUM(Sales), 2) AS TotalSales
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    Country, YEAR(OrderDate)
ORDER BY 
     TotalSales DESC;

----------------------------------------DISCOUNT ANALYSIS-----------------------------------------------------------

--Impact of discounts on sales and profitability

SELECT 
    Discount,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    Discount
ORDER BY 
     TotalProfit DESC;

--Discount distribution analysis by segment or region

SELECT 
    Segment,
    Region,
    Discount,
	COUNT(*) AS DiscountCount,
	ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    Segment, Region, Discount
ORDER BY 
    TotalProfit DESC;

-----------------------------------------------SHIPPING ANALYSIS------------------------------------------------
--Shipping mode analysis based on sales or profitability
SELECT 
    ShipMode,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    ShipMode
ORDER BY 
    TotalProfit DESC;

--Shipping efficiency analysis

SELECT 
    ShipMode,
    AVG(DATEDIFF(DAY, OrderDate, ShipDate)) AS AverageShippingTime
FROM 
    PortfolioProject..SuperstoreData$
GROUP BY 
    ShipMode
	
ORDER BY
	AverageShippingTime DESC;


















