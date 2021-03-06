USE [master]
GO
/****** Object:  Database [WebTask]    Script Date: 12/15/2020 12:41:33 AM ******/
CREATE DATABASE [WebTask]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebTask', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WebTask.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebTask_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WebTask_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebTask] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebTask].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebTask] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebTask] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebTask] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebTask] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebTask] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebTask] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebTask] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebTask] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebTask] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebTask] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebTask] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebTask] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebTask] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebTask] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebTask] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebTask] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebTask] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebTask] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebTask] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebTask] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebTask] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebTask] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebTask] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebTask] SET  MULTI_USER 
GO
ALTER DATABASE [WebTask] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebTask] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebTask] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebTask] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebTask] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebTask] SET QUERY_STORE = OFF
GO
USE [WebTask]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/15/2020 12:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](100) NULL,
	[ContactNo] [nvarchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 12/15/2020 12:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NULL,
	[ItemCode] [varchar](10) NULL,
	[Description] [varchar](200) NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemsByOrder]    Script Date: 12/15/2020 12:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemsByOrder](
	[ItemsByOrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[Description] [varchar](100) NULL,
	[Note] [varchar](100) NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[Tax] [decimal](18, 2) NULL,
	[ExclAmount] [decimal](18, 2) NULL,
	[TaxAmount] [decimal](18, 2) NULL,
	[InclAmount] [decimal](18, 2) NULL,
	[ItemCode] [varchar](10) NULL,
 CONSTRAINT [PK_ItemsByOrder] PRIMARY KEY CLUSTERED 
(
	[ItemsByOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemsByOrder2]    Script Date: 12/15/2020 12:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemsByOrder2](
	[OrderId] [int] NULL,
	[ItemCode] [varchar](10) NULL,
	[Description] [varchar](100) NULL,
	[Note] [varchar](100) NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[Tax] [decimal](18, 0) NULL,
	[ExclAmount] [decimal](18, 2) NULL,
	[TaxAmount] [decimal](18, 2) NULL,
	[InclAmount] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/15/2020 12:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Note] [varchar](50) NULL,
	[InvoiceNo] [varchar](50) NULL,
	[InvoiceDate] [datetime] NULL,
	[ReferenceNo] [varchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetAllItemCode]    Script Date: 12/15/2020 12:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sampath Ruwan
-- Create date: 2020-12-15
-- =============================================
CREATE PROCEDURE [dbo].[GetAllItemCode]

AS
BEGIN
	SELECT [ItemName],[ItemCode] FROM [dbo].[Items]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrders]    Script Date: 12/15/2020 12:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sampath Ruwan
-- Create date: 2020-12-15
-- =============================================
CREATE PROCEDURE [dbo].[GetAllOrders]

AS
BEGIN
	SELECT[InvoiceNo],[ReferenceNo],[OrderId]FROM [dbo].[Orders]
END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomersDetailsByID]    Script Date: 12/15/2020 12:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sampath Ruwan
-- Create date: 2020-12-15
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomersDetailsByID]
	
	@Id int
AS
BEGIN
	SELECT [CustomerName],[CustomerId],[ContactNo],[Email],[Address] FROM [dbo].[Customer]
	WHERE [CustomerId] =@Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomersNameList]    Script Date: 12/15/2020 12:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sampath Ruwan
-- Create date: 2020-12-15
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomersNameList]
	
	--@RefferenceCode int
AS
BEGIN
	SELECT [CustomerName],[CustomerId] FROM [dbo].[Customer]
END
GO
/****** Object:  StoredProcedure [dbo].[GetItemsDetailsByID]    Script Date: 12/15/2020 12:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sampath Ruwan
-- Create date: 2020-12-15
-- =============================================
CREATE PROCEDURE [dbo].[GetItemsDetailsByID]
 @Id int
AS
BEGIN
	SELECT [ItemName],[ItemCode],[Description],[Price] FROM [dbo].[Items]
	WHERE [ItemId] =@Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrdersById]    Script Date: 12/15/2020 12:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sampath Ruwan
-- Create date: 2020-12-15
-- =============================================
CREATE PROCEDURE [dbo].[GetOrdersById]
@Id int
AS
BEGIN
	SELECT IBO.[Description],IBO.[Note],IBO.[Quantity],IBO.[Price],IBO.[Tax],IBO.[ExclAmount],IBO.[TaxAmount],IBO.[InclAmount]
	,O.InvoiceNo,O.ReferenceNo,IBO.ItemCode
	FROM [dbo].[ItemsByOrder] IBO
	INNER JOIN [dbo].[Orders] O ON
	O.OrderId =IBO.OrderId
	WHERE IBO.OrderId = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[SaveItemsByOrder]    Script Date: 12/15/2020 12:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sampath Ruwan
-- Create date: 2020-12-15
-- =============================================
CREATE PROCEDURE [dbo].[SaveItemsByOrder]


 @OrderId int,
 @ItemCode varchar(10),
 @Description varchar(10),
 @Note varchar(100),
 @Quantity int,
 @Price int,
 @ExclAmount decimal(18,2),
 @TaxAmount decimal(18,2),
 @InclAmount decimal(18,2),
 @Status int OUTPUT

AS
BEGIN
	INSERT INTO [dbo].[ItemsByOrder] ([OrderId],[ItemCode],[Description],[Note],[Quantity],[Price],[ExclAmount],[TaxAmount],[InclAmount]) 
	VALUES(@OrderId,@ItemCode,@Description,@Note,@Quantity,@Price,@ExclAmount,@TaxAmount,@InclAmount)
	IF(@@ROWCOUNT > 0)
		BEGIN
		SET @Status =scope_identity()
		END
	ELSE
		BEGIN
		SET @Status =-100
		END

END
GO
/****** Object:  StoredProcedure [dbo].[SaveOrder]    Script Date: 12/15/2020 12:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sampath Ruwan
-- Create date: 2020-12-15
-- =============================================
CREATE PROCEDURE [dbo].[SaveOrder]


 @Note varchar(50),
 @InvoiceNo varchar(50),
 @InvoiceDate datetime,
 @ReferenceNo varchar(50),
 @Status int OUTPUT

AS
BEGIN
	INSERT INTO [dbo].[Orders] ([Note],[InvoiceNo],[InvoiceDate],[ReferenceNo]) 
	VALUES(@Note,@InvoiceNo,@InvoiceDate,@ReferenceNo)
	IF(@@ROWCOUNT > 0)
		BEGIN
		SET @Status =scope_identity()
		END
	ELSE
		BEGIN
		SET @Status =-150
		END

END
GO
USE [master]
GO
ALTER DATABASE [WebTask] SET  READ_WRITE 
GO
