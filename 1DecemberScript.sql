USE [master]
GO
/****** Object:  Database [Dbonlineshopping]    Script Date: 01-12-2020 17:45:59 ******/
CREATE DATABASE [Dbonlineshopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dbonlineshopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.KENILMODI\MSSQL\DATA\Dbonlineshopping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Dbonlineshopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.KENILMODI\MSSQL\DATA\Dbonlineshopping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Dbonlineshopping] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dbonlineshopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dbonlineshopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dbonlineshopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dbonlineshopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Dbonlineshopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dbonlineshopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET RECOVERY FULL 
GO
ALTER DATABASE [Dbonlineshopping] SET  MULTI_USER 
GO
ALTER DATABASE [Dbonlineshopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dbonlineshopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dbonlineshopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dbonlineshopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Dbonlineshopping] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Dbonlineshopping', N'ON'
GO
ALTER DATABASE [Dbonlineshopping] SET QUERY_STORE = OFF
GO
USE [Dbonlineshopping]
GO
/****** Object:  Table [dbo].[AddressTable]    Script Date: 01-12-2020 17:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressTable](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [varchar](100) NULL,
	[AddressLine2] [varchar](100) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](20) NULL,
	[Country] [varchar](20) NULL,
	[ZipCode] [int] NULL,
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 01-12-2020 17:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 01-12-2020 17:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 01-12-2020 17:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ProductImage] [nvarchar](100) NULL,
	[IsDefault] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MyOrder]    Script Date: 01-12-2020 17:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyOrder](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderTotal] [float] NOT NULL,
	[UserID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationTable]    Script Date: 01-12-2020 17:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AdminID] [int] NULL,
	[Status] [varchar](10) NOT NULL,
	[RetailerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 01-12-2020 17:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductID] [int] NULL,
	[OrderID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTP]    Script Date: 01-12-2020 17:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OTP] [int] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01-12-2020 17:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [nvarchar](20) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductDescription] [varchar](400) NULL,
	[Brand] [varchar](20) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductPrice] [real] NOT NULL,
	[InStock] [bit] NOT NULL,
	[CategoryID] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[RetailerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ProductCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnnapprovedProducts]    Script Date: 01-12-2020 17:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnnapprovedProducts](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [nvarchar](20) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductDescription] [varchar](400) NULL,
	[Brand] [varchar](20) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductPrice] [real] NOT NULL,
	[InStock] [bit] NOT NULL,
	[RetailerID] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedBy] [date] NULL,
	[ModifiedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ProductCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 01-12-2020 17:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NULL,
	[Email] [varchar](50) NOT NULL,
	[MobileNumber] [nvarchar](15) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[Role] [varchar](10) NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[Gender] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MobileNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList]    Script Date: 01-12-2020 17:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[WishListID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[WishListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AddressTable]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[MyOrder]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[NotificationTable]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[MyOrder] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OTP]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([RetailerID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[UnnapprovedProducts]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[UnnapprovedProducts]  WITH CHECK ADD FOREIGN KEY([RetailerID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 01-12-2020 17:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegisterUser]
@FirstName VARCHAR(20),
@LastName VARCHAR(20),
@Email VARCHAR(50),
@MobileNumber NVARCHAR(15),
@Password VARCHAR(20),
@Role VARCHAR(10),
@Status VARCHAR(10),
@Gender VARCHAR(1),
@CreatedOn Datetime
AS
INSERT INTO UserTable(FirstName, LastName, Email, MobileNumber, Password, Role, Status, Gender, CreatedOn) 
VALUES (@FirstName, @LastName, @Email, @MobileNumber, @Password, @Role, @Status, @Gender, @CreatedOn)
GO
USE [master]
GO
ALTER DATABASE [Dbonlineshopping] SET  READ_WRITE 
GO
