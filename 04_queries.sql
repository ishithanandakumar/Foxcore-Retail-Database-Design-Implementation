-- Business Intelligence Queries

-- 1. Sales transactions with salesperson and product details
SELECT 
    s.SalesTransactionID,
    p.ProductName,
    s.FinalSellingPrice,
    s.QuantitySold,
    sp.FirstName,
    sp.LastName
FROM Sales s
JOIN Product p ON s.ProductID = p.ProductID
JOIN SalesPerson sp ON s.SalesPersonID = sp.SalesPersonID;

-- 2. Total sales amount for each event
SELECT 
    e.EventName,
    v.VenueName,
    COALESCE(SUM(s.FinalSellingPrice * s.QuantitySold), 0) AS TotalSalesAmount
FROM Event e
JOIN Venue v ON e.VenueID = v.VenueID
LEFT JOIN Booth b ON e.EventID = b.EventID
LEFT JOIN SalesPerson sp ON b.BoothID = sp.BoothID
LEFT JOIN Sales s ON sp.SalesPersonID = s.SalesPersonID
GROUP BY e.EventID, e.EventName, v.VenueName;

-- 3. Sales performance by salesperson
SELECT 
    sp.SalesPersonID,
    CONCAT(sp.FirstName, ' ', sp.LastName) AS SalesPersonName,
    COUNT(s.SalesTransactionID) AS TotalTransactions,
    SUM(s.QuantitySold) AS TotalUnitsSold,
    SUM(s.FinalSellingPrice * s.QuantitySold) AS TotalRevenue
FROM SalesPerson sp
LEFT JOIN Sales s ON sp.SalesPersonID = s.SalesPersonID
GROUP BY sp.SalesPersonID, sp.FirstName, sp.LastName
ORDER BY TotalRevenue DESC;

-- 4. Product sales analysis
SELECT 
    p.ProductID,
    p.ProductName,
    COUNT(s.SalesTransactionID) AS TimesSold,
    SUM(s.QuantitySold) AS TotalQuantitySold,
    AVG(s.FinalSellingPrice) AS AverageSellingPrice,
    p.MinimumSellingPrice,
    p.HigherPrice
FROM Product p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName, p.MinimumSellingPrice, p.HigherPrice
ORDER BY TotalQuantitySold DESC;

-- 5. Event profitability report
SELECT 
    e.EventName,
    e.EventType,
    e.StartDate,
    e.EndDate,
    COUNT(DISTINCT b.BoothID) AS NumberOfBooths,
    COUNT(DISTINCT sp.SalesPersonID) AS NumberOfSalesPeople,
    COALESCE(SUM(s.FinalSellingPrice * s.QuantitySold), 0) AS TotalRevenue
FROM Event e
LEFT JOIN Booth b ON e.EventID = b.EventID
LEFT JOIN SalesPerson sp ON
