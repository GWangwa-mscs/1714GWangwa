USE [master]
GO
/****** Object:  Database [GreenLineAutoGarage]    Script Date: 11/5/2019 2:24:27 PM ******/
CREATE DATABASE [GreenLineAutoGarage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GreenLineAutoGarage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GreenLineAutoGarage.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GreenLineAutoGarage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GreenLineAutoGarage_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GreenLineAutoGarage] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GreenLineAutoGarage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GreenLineAutoGarage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET ARITHABORT OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GreenLineAutoGarage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GreenLineAutoGarage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GreenLineAutoGarage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GreenLineAutoGarage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET RECOVERY FULL 
GO
ALTER DATABASE [GreenLineAutoGarage] SET  MULTI_USER 
GO
ALTER DATABASE [GreenLineAutoGarage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GreenLineAutoGarage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GreenLineAutoGarage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GreenLineAutoGarage] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GreenLineAutoGarage] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GreenLineAutoGarage', N'ON'
GO
ALTER DATABASE [GreenLineAutoGarage] SET QUERY_STORE = OFF
GO
USE [GreenLineAutoGarage]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 11/5/2019 2:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [int] IDENTITY(10001,1) NOT NULL,
	[VehicleId] [nchar](10) NOT NULL,
	[InvoiceDate] [smalldatetime] NOT NULL,
	[DueDate] [smalldatetime] NOT NULL,
	[Amount] [smallmoney] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineItem]    Script Date: 11/5/2019 2:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineItem](
	[LineItemId] [int] IDENTITY(101,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Amount] [smallmoney] NOT NULL,
 CONSTRAINT [PK_LineItem] PRIMARY KEY CLUSTERED 
(
	[LineItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 11/5/2019 2:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[personId] [int] IDENTITY(1001,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nchar](12) NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[personId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reciept]    Script Date: 11/5/2019 2:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reciept](
	[RecieptId] [int] IDENTITY(100001,1) NOT NULL,
	[VehicleId] [nchar](10) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[RecieptDate] [nchar](10) NOT NULL,
	[Amount] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Reciept] PRIMARY KEY CLUSTERED 
(
	[RecieptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 11/5/2019 2:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceId] [int] IDENTITY(2001,1) NOT NULL,
	[Mechanic] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Amount] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 11/5/2019 2:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[VehicleID] [int] IDENTITY(30001,1) NOT NULL,
	[VhiclePlateNo] [nchar](10) NOT NULL,
	[VehicleColor] [nvarchar](50) NOT NULL,
	[Make] [nchar](10) NOT NULL,
	[Model] [nchar](10) NOT NULL,
	[Year] [int] NOT NULL,
	[Mileage] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceID], [VehicleId], [InvoiceDate], [DueDate], [Amount]) VALUES (10001, N'30001     ', CAST(N'2019-09-12T00:00:00' AS SmallDateTime), CAST(N'2019-09-30T00:00:00' AS SmallDateTime), 650.0000)
INSERT [dbo].[Invoice] ([InvoiceID], [VehicleId], [InvoiceDate], [DueDate], [Amount]) VALUES (10002, N'30002     ', CAST(N'2019-09-15T00:00:00' AS SmallDateTime), CAST(N'2019-09-30T00:00:00' AS SmallDateTime), 320.0000)
INSERT [dbo].[Invoice] ([InvoiceID], [VehicleId], [InvoiceDate], [DueDate], [Amount]) VALUES (10003, N'30003     ', CAST(N'2019-10-01T00:00:00' AS SmallDateTime), CAST(N'2019-10-30T00:00:00' AS SmallDateTime), 100.0000)
INSERT [dbo].[Invoice] ([InvoiceID], [VehicleId], [InvoiceDate], [DueDate], [Amount]) VALUES (10004, N'30004     ', CAST(N'2019-10-14T00:00:00' AS SmallDateTime), CAST(N'2019-10-30T00:00:00' AS SmallDateTime), 280.0000)
INSERT [dbo].[Invoice] ([InvoiceID], [VehicleId], [InvoiceDate], [DueDate], [Amount]) VALUES (10005, N'30005     ', CAST(N'2019-10-20T00:00:00' AS SmallDateTime), CAST(N'2019-10-30T00:00:00' AS SmallDateTime), 310.0000)
INSERT [dbo].[Invoice] ([InvoiceID], [VehicleId], [InvoiceDate], [DueDate], [Amount]) VALUES (10006, N'30002     ', CAST(N'2019-10-26T00:00:00' AS SmallDateTime), CAST(N'2019-10-30T00:00:00' AS SmallDateTime), 30.0000)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
SET IDENTITY_INSERT [dbo].[LineItem] ON 

INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [ServiceId], [Quantity], [Amount]) VALUES (102, 10001, 2001, 4, 220.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [ServiceId], [Quantity], [Amount]) VALUES (103, 10001, 2006, 4, 400.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [ServiceId], [Quantity], [Amount]) VALUES (104, 10001, 2008, 1, 30.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [ServiceId], [Quantity], [Amount]) VALUES (105, 10002, 2009, 4, 320.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [ServiceId], [Quantity], [Amount]) VALUES (106, 10003, 2005, 1, 70.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [ServiceId], [Quantity], [Amount]) VALUES (107, 10003, 2008, 1, 30.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [ServiceId], [Quantity], [Amount]) VALUES (108, 10004, 2001, 4, 220.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [ServiceId], [Quantity], [Amount]) VALUES (109, 10004, 2008, 2, 60.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [ServiceId], [Quantity], [Amount]) VALUES (111, 10005, 2001, 4, 220.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [ServiceId], [Quantity], [Amount]) VALUES (113, 10005, 2008, 3, 90.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [ServiceId], [Quantity], [Amount]) VALUES (114, 10006, 2008, 1, 30.0000)
SET IDENTITY_INSERT [dbo].[LineItem] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([personId], [FirstName], [LastName], [PhoneNumber], [EmailAddress]) VALUES (1001, N'Ashlea', N'Dhein', N'111-111-1001', N'ashleadhein@gmail.com')
INSERT [dbo].[Person] ([personId], [FirstName], [LastName], [PhoneNumber], [EmailAddress]) VALUES (1002, N'Godwin', N'Wangwa', N'111-111-1002', N'godwinjissy@gmail.com')
INSERT [dbo].[Person] ([personId], [FirstName], [LastName], [PhoneNumber], [EmailAddress]) VALUES (1003, N'Billy ', N'Dhein', N'111-111-1003', N'billydhein@gmail.com')
INSERT [dbo].[Person] ([personId], [FirstName], [LastName], [PhoneNumber], [EmailAddress]) VALUES (1004, N'Peter', N'Chirra', N'111-111-1004', N'peterchirra@gmail.com')
INSERT [dbo].[Person] ([personId], [FirstName], [LastName], [PhoneNumber], [EmailAddress]) VALUES (1005, N'Rahab', N'Wanjiku', N'111-111-1005', N'rahabwanja@gmail.com')
INSERT [dbo].[Person] ([personId], [FirstName], [LastName], [PhoneNumber], [EmailAddress]) VALUES (1006, N'Phylis', N'Wangwari', N'111-111-1006', N'phyliswangari@gmail.com')
INSERT [dbo].[Person] ([personId], [FirstName], [LastName], [PhoneNumber], [EmailAddress]) VALUES (1007, N'Duwayne', N'Like', N'111-111-1007', N'duwaynelike@gmail.com')
INSERT [dbo].[Person] ([personId], [FirstName], [LastName], [PhoneNumber], [EmailAddress]) VALUES (1008, N'Megan', N'Amanda', N'111-111-1008', N'meganamanda@gmail.com')
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Reciept] ON 

INSERT [dbo].[Reciept] ([RecieptId], [VehicleId], [InvoiceID], [RecieptDate], [Amount]) VALUES (100001, N'30001     ', 10001, N'9-16-2019 ', 650.0000)
INSERT [dbo].[Reciept] ([RecieptId], [VehicleId], [InvoiceID], [RecieptDate], [Amount]) VALUES (100002, N'30005     ', 10005, N'22-10-2019', 310.0000)
INSERT [dbo].[Reciept] ([RecieptId], [VehicleId], [InvoiceID], [RecieptDate], [Amount]) VALUES (100003, N'30004     ', 10004, N'18-10-2019', 200.0000)
INSERT [dbo].[Reciept] ([RecieptId], [VehicleId], [InvoiceID], [RecieptDate], [Amount]) VALUES (100004, N'30004     ', 10004, N'21-102019 ', 80.0000)
INSERT [dbo].[Reciept] ([RecieptId], [VehicleId], [InvoiceID], [RecieptDate], [Amount]) VALUES (100005, N'30002     ', 10002, N'9-21-2019 ', 320.0000)
INSERT [dbo].[Reciept] ([RecieptId], [VehicleId], [InvoiceID], [RecieptDate], [Amount]) VALUES (100006, N'30002     ', 10006, N'25-10-2019', 30.0000)
SET IDENTITY_INSERT [dbo].[Reciept] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ServiceId], [Mechanic], [Description], [Amount]) VALUES (2001, N'Godwin', N'Brakes', 55.0000)
INSERT [dbo].[Service] ([ServiceId], [Mechanic], [Description], [Amount]) VALUES (2002, N'Billy', N'Drivetrain', 600.0000)
INSERT [dbo].[Service] ([ServiceId], [Mechanic], [Description], [Amount]) VALUES (2003, N'Billy', N'Body Work', 800.0000)
INSERT [dbo].[Service] ([ServiceId], [Mechanic], [Description], [Amount]) VALUES (2004, N'Peter', N'Check Engene Light', 20.0000)
INSERT [dbo].[Service] ([ServiceId], [Mechanic], [Description], [Amount]) VALUES (2005, N'Godwin', N'Battery', 70.0000)
INSERT [dbo].[Service] ([ServiceId], [Mechanic], [Description], [Amount]) VALUES (2006, N'Peter', N'Rotors', 100.0000)
INSERT [dbo].[Service] ([ServiceId], [Mechanic], [Description], [Amount]) VALUES (2008, N'Godwin', N'Oil Change', 30.0000)
INSERT [dbo].[Service] ([ServiceId], [Mechanic], [Description], [Amount]) VALUES (2009, N'Godwin', N'Tires.', 80.0000)
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[Vehicle] ON 

INSERT [dbo].[Vehicle] ([VehicleID], [VhiclePlateNo], [VehicleColor], [Make], [Model], [Year], [Mileage]) VALUES (30001, N'BCD 432   ', N'Blue', N'Toyota    ', N'Corolla   ', 2019, N'3004      ')
INSERT [dbo].[Vehicle] ([VehicleID], [VhiclePlateNo], [VehicleColor], [Make], [Model], [Year], [Mileage]) VALUES (30002, N'KHT 445   ', N'Beige', N'Acura     ', N'SE        ', 2007, N'100988    ')
INSERT [dbo].[Vehicle] ([VehicleID], [VhiclePlateNo], [VehicleColor], [Make], [Model], [Year], [Mileage]) VALUES (30003, N'ABC 123   ', N'Red', N'Toyota    ', N'Camry     ', 2012, N'40887     ')
INSERT [dbo].[Vehicle] ([VehicleID], [VhiclePlateNo], [VehicleColor], [Make], [Model], [Year], [Mileage]) VALUES (30004, N'GFD 777   ', N'Black', N'Ford      ', N'Mustang   ', 2018, N'21334     ')
INSERT [dbo].[Vehicle] ([VehicleID], [VhiclePlateNo], [VehicleColor], [Make], [Model], [Year], [Mileage]) VALUES (30005, N'ABD 666   ', N'Blue', N'Ford      ', N'F-150     ', 2010, N'123001    ')
INSERT [dbo].[Vehicle] ([VehicleID], [VhiclePlateNo], [VehicleColor], [Make], [Model], [Year], [Mileage]) VALUES (30006, N'ODM 001   ', N'Orange', N'Jeep      ', N'Wrangler  ', 2016, N'78993     ')
SET IDENTITY_INSERT [dbo].[Vehicle] OFF
USE [master]
GO
ALTER DATABASE [GreenLineAutoGarage] SET  READ_WRITE 
GO
