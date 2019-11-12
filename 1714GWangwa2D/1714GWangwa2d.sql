--Godwin Wangwa
--Exercise 2D Multi-table queries
--PropertyManagement 2 db

--2D.1) Building, Apartment , Administrator tables. Sort by city, BuildingName, ApartmentNum,Last and First name
SELECT        Building.BuildingId, Building.BuildingName, Building.City, Apartment.ApartmentNum, Person.FirstName, Person.LastName
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId
ORDER BY Building.City, Building.BuildingName, Apartment.ApartmentNum, Person.LastName, Person.FirstName

--2D.2) Tenants, Building, Apartments tables. sort by LastName, FirstName, BuildingId ApartmentNum
SELECT        Person.PersonId, Person.LastName, Person.FirstName, Building.City, Building.BuildingId, 
				Building.BuildingName, Apartment.ApartmentNum
FROM            Person INNER JOIN
                         Apartment ON Person.PersonId = Apartment.TenantId INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
ORDER BY Person.LastName, Person.FirstName, Building.BuildingId, Apartment.ApartmentNum

--2D.3) Apartment, tenant, invoice, lineItems tables. Filter using BuildingId 1. 
--		Sort by apartmentNum, LastName, FirtsName and Invoice.
SELECT        Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoice.InvoiceId, 
			Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE        (Apartment.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoice.InvoiceDate

--2D. 4) Apartment, Tenant, Invoice tables. Find the sum of the invoice amount.
SELECT        Building.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, 
				Invoice.InvoiceId, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Totals]
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate
ORDER BY Invoice.InvoiceId, Invoice.InvoiceDate, Building.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName

--2D.5) Invoice, Tenant, Receipt tables. Sort by InvoiceDate, ReceiptDate.
SELECT        Invoice.InvoiceId, Invoice.InvoiceDate, Building.BuildingId, Apartment.ApartmentNum, Person.LastName, 
				Person.FirstName, Receipt.RecieptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
ORDER BY Invoice.InvoiceDate, Receipt.RecieptDate

--2D.6) Invoice, Tenant, Apartment, Invoice tables. Find the total Bill of a tenant.
SELECT        Invoice.InvoiceId, Invoice.InvoiceDate, Person.LastName AS Tenant, Building.BuildingId, Apartment.ApartmentNum, 
				SUM(LineItem.Amount) AS [Total Billed], Receipt.Amount
FROM            Invoice INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Invoice.InvoiceId, Invoice.InvoiceDate, Person.LastName, Building.BuildingId, Apartment.ApartmentNum, Receipt.Amount
ORDER BY Tenant, Invoice.InvoiceId, Invoice.InvoiceDate, Building.BuildingId, Apartment.ApartmentNum

--2D.7) Apartment, Admin, Invoice, Line, Receipt Show the total invoices sent and amount recieved by the various Admins
SELECT        Person.PersonId, Person.LastName AS Admin, Invoice.InvoiceId, Invoice.InvoiceDate,	
				SUM(LineItem.Amount) AS Billed, Receipt.Amount AS Received
FROM            Apartment INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Person.PersonId, Apartment.AdminId, Person.LastName, Invoice.InvoiceId, Invoice.InvoiceDate, Receipt.Amount
ORDER BY Person.PersonId, Received