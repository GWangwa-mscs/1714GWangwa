--Godwin Wangwa
--Exercise 2C 1,2-table queries
--PropertyManagement 2 db

--2C.1)Building table. Sort by City. Make a building count
SELECT        State, City, COUNT(BuildingId) AS [Building Count]
FROM            Building
GROUP BY State, City
ORDER BY City

--2C.2)Building, Apartment tables. Filter by State(MN). Sort by City. Make a building count
SELECT        City, COUNT(BuildingId) AS [Building Count]
FROM            Building
GROUP BY City, State
HAVING        (State = N'MN')
ORDER BY City

--2C.3)Building, Apartment tables. Get the Average Rent
SELECT        Building.BuildingId, Building.BuildingName, AVG(Apartment.Rent) AS [Avg Rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.BuildingId, Building.BuildingName
ORDER BY Building.BuildingId

--2C.4)Building, Apartment tables. Get the total rent. Filter by State(MN)
SELECT        Building.City, Building.BuildingName, SUM(Apartment.Rent) AS [Total Rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City, Building.BuildingName, Building.State
HAVING        (Building.State = N'MN')
ORDER BY Building.BuildingName

--2C.5)Building, Apartment tables. Sort by City. Show the Cheapest Rent
SELECT        Building.City, MIN(Apartment.Rent) AS [Min Rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City

--2C.6)Building, Apartment tables. Sort by Smallest size, Average size, Largest size. 
--     Filter by the available Apartments In Winona
SELECT        Building.BuildingName, MIN(Apartment.SquareFeet) AS Smallest, AVG(Apartment.SquareFeet) AS Average, MAX(Apartment.SquareFeet) AS Largest
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.BuildingName, Building.City, Apartment.TenantId
HAVING        (Building.City = N'Winona') AND (Apartment.TenantId IS NULL)
ORDER BY Building.BuildingName

--2C.7)Invoice, LineItem tables. Show the Cheapest Apartment. Filter by Garage, The month of Sept 2018
SELECT        MIN(LineItem.Amount) AS Cheapest
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY LineItem.Description
HAVING        (LineItem.Description = N'Garage')

--2C.8)Invoice, LineItems tables. Sort by Total amount billed. Filter by the month of Sept.
SELECT        Invoice.InvoiceId, SUM(LineItem.Amount) AS [Total Amt. Billed]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE        (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-09-30 00:00:00', 102))
GROUP BY Invoice.InvoiceId
ORDER BY Invoice.InvoiceId