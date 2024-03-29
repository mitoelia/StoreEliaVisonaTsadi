USE [master]
GO
/****** Object:  Database [VisonaEliaStore]    Script Date: 26/03/2014 17.26.49 ******/
CREATE DATABASE [VisonaEliaStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VisonaEliaStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.ELIA_SQL\MSSQL\DATA\VisonaEliaStore.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VisonaEliaStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.ELIA_SQL\MSSQL\DATA\VisonaEliaStore_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VisonaEliaStore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VisonaEliaStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VisonaEliaStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [VisonaEliaStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VisonaEliaStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VisonaEliaStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VisonaEliaStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VisonaEliaStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET RECOVERY FULL 
GO
ALTER DATABASE [VisonaEliaStore] SET  MULTI_USER 
GO
ALTER DATABASE [VisonaEliaStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VisonaEliaStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VisonaEliaStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VisonaEliaStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VisonaEliaStore', N'ON'
GO
USE [VisonaEliaStore]
GO
/****** Object:  User [ecommercestore]    Script Date: 26/03/2014 17.26.49 ******/
CREATE USER [ecommercestore] FOR LOGIN [ecommercestore] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ecommercestore]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ecommercestore]
GO
/****** Object:  Table [dbo].[Basket]    Script Date: 26/03/2014 17.26.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basket](
	[BasketId] [int] IDENTITY(1,1) NOT NULL,
	[OrdineId] [int] NULL,
	[UtenteId] [int] NULL,
	[ProdottoId] [int] NULL,
	[Quantità] [int] NULL,
 CONSTRAINT [PK_Basket] PRIMARY KEY CLUSTERED 
(
	[BasketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prodotti]    Script Date: 26/03/2014 17.26.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prodotti](
	[ProdottoId] [int] IDENTITY(1,1) NOT NULL,
	[Descrizione] [nvarchar](32) NULL,
	[Prezzo] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Prodotti] PRIMARY KEY CLUSTERED 
(
	[ProdottoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Basket] ON 

INSERT [dbo].[Basket] ([BasketId], [OrdineId], [UtenteId], [ProdottoId], [Quantità]) VALUES (9, 1, 1, 3, 25)
INSERT [dbo].[Basket] ([BasketId], [OrdineId], [UtenteId], [ProdottoId], [Quantità]) VALUES (10, 1, 1, 2, 15)
INSERT [dbo].[Basket] ([BasketId], [OrdineId], [UtenteId], [ProdottoId], [Quantità]) VALUES (11, 1, 1, 6, 5)
INSERT [dbo].[Basket] ([BasketId], [OrdineId], [UtenteId], [ProdottoId], [Quantità]) VALUES (13, 1, 1, 4, 2)
INSERT [dbo].[Basket] ([BasketId], [OrdineId], [UtenteId], [ProdottoId], [Quantità]) VALUES (14, 1, 1, 5, 3)
INSERT [dbo].[Basket] ([BasketId], [OrdineId], [UtenteId], [ProdottoId], [Quantità]) VALUES (16, 1, 1, 4, 2)
INSERT [dbo].[Basket] ([BasketId], [OrdineId], [UtenteId], [ProdottoId], [Quantità]) VALUES (17, 1, 1, 4, 69)
SET IDENTITY_INSERT [dbo].[Basket] OFF
SET IDENTITY_INSERT [dbo].[Prodotti] ON 

INSERT [dbo].[Prodotti] ([ProdottoId], [Descrizione], [Prezzo]) VALUES (1, N'Prodotto1', CAST(125.00 AS Decimal(18, 2)))
INSERT [dbo].[Prodotti] ([ProdottoId], [Descrizione], [Prezzo]) VALUES (2, N'Prodotto2', CAST(153.50 AS Decimal(18, 2)))
INSERT [dbo].[Prodotti] ([ProdottoId], [Descrizione], [Prezzo]) VALUES (3, N'Prodotto3', CAST(5.40 AS Decimal(18, 2)))
INSERT [dbo].[Prodotti] ([ProdottoId], [Descrizione], [Prezzo]) VALUES (4, N'Prodotto4', CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Prodotti] ([ProdottoId], [Descrizione], [Prezzo]) VALUES (5, N'Prodotto5', CAST(78.00 AS Decimal(18, 2)))
INSERT [dbo].[Prodotti] ([ProdottoId], [Descrizione], [Prezzo]) VALUES (6, N'Prodotto6', CAST(62.50 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Prodotti] OFF
USE [master]
GO
ALTER DATABASE [VisonaEliaStore] SET  READ_WRITE 
GO
