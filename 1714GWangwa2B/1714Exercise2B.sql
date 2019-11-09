--Godwin Wangwa
--Exercise 2B: Count, Sum, Avg, Min, Max queries
--PropertyManagement 2 db

--2B.1)Building table. Count all buildings
SELECT        COUNT(*) AS [Count of all buildings]
FROM            Building

--2B.2)Building table. Filter by Buildings in Winona
SELECT        COUNT(*) AS [Count Buildings in Winona]
FROM            Building
GROUP BY City
HAVING        (City = N'Winona')

--2B.3)Apartment table. Average rent for all apartments
SELECT        AVG(Rent) AS [Average rent]
FROM            Apartment

--2B.4)Apartment table. Total rent for apartments in building 1
SELECT        SUM(Rent) AS [Total Rent Bld 1]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)

--2B.5)Apartment table. Min rent in building 2
SELECT        MIN(Rent) AS [Cheapest Rent Bld. 2]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 2)

--2B.6)Apartment table. Show the smallest size, average size and largest size Apartments in Building 1
SELECT        MIN(SquareFeet) AS Smallest, AVG(DISTINCT SquareFeet) AS Average, MAX(SquareFeet) AS Largest
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)

--2B.7)LineItem table.SHow the cheapest Garage
SELECT        MIN(Amount) AS [Cheapest Garage]
FROM            LineItems
GROUP BY Description
HAVING        (Description = N'Garage')

--2B.8)LineItem table. Show the total amount billed for gas
SELECT        SUM(Amount) AS [Total Amount for Gas]
FROM            LineItems
GROUP BY Description
HAVING        (Description = N'Gas')

--2B.9)LineItem table.Totalrent for october
SELECT        SUM(Amount) AS [Total Rent October]
FROM            LineItems
GROUP BY Description
HAVING        (Description = N'Rent, October 2018')