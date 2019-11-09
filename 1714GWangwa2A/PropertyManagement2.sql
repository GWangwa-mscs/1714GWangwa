--Godwin Wangwa
--Exercise 2A: 2-table queries
--PropertyManagement 2 db

--2A.1)Building, Apartment tables. Sort by BuildingId, ApartmentNum
SELECT        Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
ORDER BY Building.BuildingId, Apartment.ApartmentNum

--2A.2)Building, Apartment tables. Filter by City, Winona. Sort by BuildingId, Rent
SELECT        Building.BuildingId, Building.City, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'winona')
ORDER BY Building.BuildingId, Apartment.Rent

--2A.3)Apartment, Invoice tables. Filter by BuildingId 1. Sort by ApartmentNum, InvoiceDate
SELECT        Apartment.ApartmentId, Apartment.ApartmentNum, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
WHERE        (Apartment.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Invoice.InvoiceDate DESC

--2A.4)Apartment, Invoice table. Sort by BuildingId, ApartmentNum
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceDate

--2A.5)Apartment, Person tables. Sort by buildingId, ApartmentNum
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Apartment.Rent, Person.LastName AS Admin
FROM            Apartment INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum

--2A.6)Apartment, Person tables. Sort by BuildingId, TenantLastName, TnantFirstName
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName AS TenantLastName, Person.FirstName AS TenantFistName
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId
ORDER BY Apartment.BuildingId, TenantLastName, TenantFistName

--2A.7)Invoice, LineItem tables. sort by ApartmentId, InvoiceDate
SELECT        Invoice.ApartmentId, Invoice.InvoiceId, Invoice.InvoiceDate, LineItems.Description, LineItems.Amount
FROM            Invoice INNER JOIN
                         LineItems ON Invoice.InvoiceId = LineItems.InvoiceId
ORDER BY Invoice.ApartmentId, Invoice.InvoiceDate DESC

--2A.8)Invoice, LineItem tables. Filter by Rent(any month), Garage. Sort by ApartmentId, InvoiceDate
SELECT        Invoice.ApartmentId, Invoice.InvoiceId, Invoice.InvoiceDate, LineItems.Description, LineItems.Amount
FROM            Invoice INNER JOIN
                         LineItems ON Invoice.InvoiceId = LineItems.InvoiceId
WHERE        (LineItems.Description LIKE N'Rent%') OR
                         (LineItems.Description = N'Garage')
ORDER BY Invoice.ApartmentId, Invoice.InvoiceDate DESC

--2A.9)Invoice, Reciept tables. Sort by ApartmentId, InvoiceID
SELECT        Invoice.ApartmentId, Invoice.InvoiceId, Invoice.DueDate, Receipt.RecieptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
ORDER BY Invoice.ApartmentId, Invoice.InvoiceId

