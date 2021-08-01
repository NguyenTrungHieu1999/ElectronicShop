USE [master]
GO
/****** Object:  Database [ElectronicShopDb]    Script Date: 01/08/2021 23:47:28 ******/
CREATE DATABASE [ElectronicShopDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ElectronicShopDb', FILENAME = N'C:\Users\TrongHieu\ElectronicShopDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ElectronicShopDb_log', FILENAME = N'C:\Users\TrongHieu\ElectronicShopDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ElectronicShopDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ElectronicShopDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ElectronicShopDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ElectronicShopDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ElectronicShopDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ElectronicShopDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ElectronicShopDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ElectronicShopDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ElectronicShopDb] SET  MULTI_USER 
GO
ALTER DATABASE [ElectronicShopDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ElectronicShopDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ElectronicShopDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ElectronicShopDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ElectronicShopDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ElectronicShopDb] SET QUERY_STORE = OFF
GO
USE [ElectronicShopDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ElectronicShopDb]
GO
/****** Object:  UserDefinedFunction [dbo].[udfSoundex]    Script Date: 01/08/2021 23:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udfSoundex]
                        (
                            @Soundex nvarchar(100)
                        )
                        RETURNS nvarchar(100)
                        AS
                        BEGIN
                            RETURN Soundex(@Soundex)
                        END
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 01/08/2021 23:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 01/08/2021 23:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 01/08/2021 23:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Alias] [nvarchar](100) NOT NULL,
	[RootId] [int] NULL,
	[ProductTypeId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NOT NULL,
	[ModifiedBy] [nvarchar](100) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 01/08/2021 23:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ParentId] [int] NULL,
	[Text] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteProduct]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_FavoriteProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginHistory]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AccessTime] [datetime] NOT NULL,
 CONSTRAINT [PK_LoginHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[Paid] [bit] NOT NULL,
	[Receiver] [nvarchar](200) NOT NULL,
	[ReceiversAddress] [nvarchar](500) NOT NULL,
	[PhoneNumber] [nvarchar](11) NOT NULL,
	[TotalMoney] [decimal](18, 0) NOT NULL,
	[StatusId] [int] NOT NULL,
	[UserId] [int] NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Received] [bit] NOT NULL,
	[PaymentMethod] [nvarchar](max) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatusDetail]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatusDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[EmpId] [int] NULL,
 CONSTRAINT [PK_OrderStatusDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Specifications] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[GoodsReceipt] [int] NOT NULL,
	[Inventory] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Alias] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NOT NULL,
	[ModifiedBy] [nvarchar](100) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductInventory]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInventory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[GoodsReceipt] [int] NOT NULL,
	[CostPrice] [decimal](18, 0) NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductInventory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Url] [nvarchar](max) NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReview]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReview](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[RateStar] [float] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ProductReview] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Icon] [nvarchar](max) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[NormalizedName] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleClaim]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](11) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[FirstMiddleName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Address] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
	[Gender] [int] NOT NULL,
	[Birthday] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[ModifiedBy] [nvarchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaim]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserToken]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserToken](
	[UserId] [int] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserToken] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatchedProduct]    Script Date: 01/08/2021 23:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchedProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_WatchedProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210119083751_initial', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210423114644_addCartTable', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210507023437_updatedCartTable', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210528141534_updateFavoriteProduct', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210620013440_fn-soundex', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210623060946_add-email-in-order', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210629122754_addTableLoginHistory', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210702120227_upgradetheOrderandOrderStatusDetailtables', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210702145618_upgrade-order-table', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210704073708_update-order-table', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210708062635_add-received-column-to-order-table', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210714045912_update-user-and-order-table', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210714094020_add-status-for-comment-table', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210717144825_update-product-table-and-product-category-table', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210726085447_add_deleted_field_for_cmt_table', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210727132813_add_productinventory_table', N'3.1.10')
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (1, 4, 1, 1, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (2, 1, 16, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (3, 1, 1, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (4, 1, 3, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (5, 1, 20, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (6, 1, 21, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (7, 4, 1, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (8, 4, 2, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (9, 4, 3, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (10, 4, 4, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (11, 4, 5, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (12, 4, 3, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (13, 1, 11, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (14, 6, 40, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (15, 4, 53, 1, 1)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (16, 1, 3, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (17, 1, 1, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (18, 11, 32, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (19, 11, 43, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (20, 11, 61, 1, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (21, 11, 32, 1, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (22, 11, 52, 1, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (23, 13, 27, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (24, 13, 57, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (25, 13, 6, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (26, 13, 61, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (27, 6, 55, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (28, 6, 4, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (29, 6, 56, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (30, 6, 57, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (31, 3, 7, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (32, 3, 13, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (33, 3, 18, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (34, 3, 27, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (35, 3, 55, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (36, 1, 1, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (37, 1, 1, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (38, 1, 57, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (39, 3, 54, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (40, 3, 16, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (41, 1, 5, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (42, 1, 54, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (43, 1, 9, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (44, 1, 7, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (45, 3, 29, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (46, 15, 31, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (47, 15, 24, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (48, 15, 69, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (49, 15, 30, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (50, 15, 6, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (51, 15, 22, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (52, 15, 50, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (53, 15, 37, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (54, 1, 55, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (55, 1, 30, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (56, 1, 69, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (57, 1, 56, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (58, 3, 30, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (59, 3, 10, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (60, 3, 53, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (61, 3, 9, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (62, 3, 26, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (63, 3, 21, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (64, 3, 47, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (65, 3, 50, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (66, 3, 45, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (67, 3, 59, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (68, 3, 13, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (69, 3, 55, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (70, 3, 60, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (71, 3, 58, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (72, 3, 61, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (73, 1, 59, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (74, 1, 52, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (75, 1, 14, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (76, 1, 12, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (77, 6, 21, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (78, 6, 22, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (79, 6, 20, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (80, 6, 19, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (81, 6, 58, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (82, 6, 56, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (83, 6, 3, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (84, 6, 30, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (85, 6, 4, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (86, 6, 20, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (87, 6, 2, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (88, 6, 5, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (89, 6, 21, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (90, 6, 28, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (91, 6, 29, 2, 1)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (92, 6, 24, 2, 1)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (93, 1, 15, 1, 1)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (94, 1, 61, 1, 1)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (95, 3, 26, 1, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (96, 3, 24, 1, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (97, 3, 64, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (98, 3, 30, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (99, 3, 22, 0, 0)
GO
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (100, 3, 8, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (101, 3, 65, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (102, 4, 73, 1, 1)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (103, 4, 35, 1, 1)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (104, 4, 38, 1, 1)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (105, 1, 57, 1, 1)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (106, 11, 69, 1, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (107, 11, 33, 1, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (108, 11, 63, 3, 1)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (109, 11, 62, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (110, 3, 79, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (111, 17, 79, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (112, 2, 77, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (113, 2, 78, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (114, 2, 80, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (115, 2, 81, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (116, 2, 81, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (117, 2, 65, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (118, 2, 77, 0, 0)
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Quantity], [Status]) VALUES (119, 2, 80, 0, 0)
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, N'Laptop', N'laptop', NULL, 1, CAST(N'2021-07-07T20:40:18.633' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (2, N'Laptop Dell', N'laptop-dell', 1, 1, CAST(N'2021-07-07T20:41:00.380' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (3, N'Laptop Macbook', N'laptop-macbook', 1, 1, CAST(N'2021-07-07T20:41:40.877' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (4, N'Laptop Asus', N'laptop-asus', 1, 1, CAST(N'2021-07-07T20:42:24.687' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, N'Laptop HP', N'laptop-hp', 1, 1, CAST(N'2021-07-07T20:42:41.837' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (6, N'Laptop Lenovo', N'laptop-lenovo', 1, 1, CAST(N'2021-07-07T20:43:13.723' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (7, N'Điện thoại', N'dien-thoai', NULL, 2, CAST(N'2021-07-07T20:43:59.000' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (8, N'Điện thoại SamSung', N'dien-thoai-samsung', 7, 2, CAST(N'2021-07-07T20:44:27.917' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, N'Điện thoại Iphone', N'dien-thoai-iphone', 7, 2, CAST(N'2021-07-07T20:44:57.727' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, N'Máy ảnh', N'may-anh', NULL, 3, CAST(N'2021-07-07T20:46:22.030' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, N'Máy ảnh Sony', N'may-anh-sony', 10, 3, CAST(N'2021-07-07T20:46:32.687' AS DateTime), CAST(N'2021-07-07T20:47:51.053' AS DateTime), N'hieunguyen', N'hieunguyen')
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, N'Máy ảnh Cannon', N'may-anh-cannon', 10, 3, CAST(N'2021-07-07T20:48:47.850' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, N'Điện lạnh', N'dien-lanh', NULL, 4, CAST(N'2021-07-07T20:51:31.897' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, N'Tủ lạnh Panasonic', N'tu-lanh-panasonic', 13, 4, CAST(N'2021-07-07T20:52:43.020' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, N'Tủ lạnh Samsung', N'tu-lanh-samsung', 13, 4, CAST(N'2021-07-07T20:53:39.317' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (16, N'Máy quay phim', N'may-quay-phim', NULL, 3, CAST(N'2021-07-07T20:54:10.713' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (17, N'Máy quay phim Sony', N'may-quay-phim-sony', 16, 3, CAST(N'2021-07-07T20:54:28.093' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (18, N'Máy quay phim Cannon', N'may-quay-phim-cannon', 16, 3, CAST(N'2021-07-07T20:54:53.353' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (19, N'Máy lạnh Panasonic', N'may-lanh-panasonic', 13, 4, CAST(N'2021-07-07T20:56:05.390' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (20, N'Máy lạnh Daikin', N'may-lanh-daikin', 13, 4, CAST(N'2021-07-07T20:56:30.687' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (21, N'Thiết bị IT', N'thiet-bi-it', NULL, 1, CAST(N'2021-07-18T16:00:19.417' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (22, N'Ổ cứng laptop', N'o-cung-laptop', 21, 1, CAST(N'2021-07-18T16:02:46.877' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (23, N'USB', N'usb', 21, 1, CAST(N'2021-07-18T16:19:35.050' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (24, N'Thẻ nhớ', N'the-nho', 21, 1, CAST(N'2021-07-18T16:33:18.130' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (25, N'Máy tính bảng', N'may-tinh-bang', NULL, 2, CAST(N'2021-07-18T16:58:28.387' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (26, N'Máy tính bảng iPad (Apple)', N'may-tinh-bang-ipad-apple', 25, 2, CAST(N'2021-07-18T16:59:39.710' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (27, N'Máy tính bảng Samsung', N'may-tinh-bang-samsung', 25, 2, CAST(N'2021-07-18T17:27:49.447' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (28, N'Điện tử', N'dien-tu', NULL, 4, CAST(N'2021-07-18T17:45:48.677' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (29, N'Tivi Android', N'tivi-android', 28, 4, CAST(N'2021-07-18T17:46:18.953' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (30, N'Loa', N'loa', 28, 4, CAST(N'2021-07-18T18:07:39.073' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (31, N'Quạt điều hoà cao cấp', N'quat-dieu-hoa-cao-cap', 28, 4, CAST(N'2021-07-23T14:19:16.613' AS DateTime), CAST(N'2021-07-23T14:20:16.683' AS DateTime), N'hieunguyen', N'hieunguyen')
INSERT [dbo].[Category] ([Id], [Name], [Alias], [RootId], [ProductTypeId], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (32, N' Điện thoại OPPO', N'dien-thoai-oppo', 7, 2, CAST(N'2021-07-29T23:21:31.870' AS DateTime), NULL, N'hieunguyen', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (1, 1, 2, NULL, N'Sản phẩm này dùng cho việc lập trình có tốt không ạ?', CAST(N'2021-07-09T01:28:21.377' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (2, 1, 1, NULL, N'Các bạn nên mua nha 😅😅😅', CAST(N'2021-07-10T13:00:08.910' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (3, 1, 4, NULL, N'Sản phẩm dùng rất ổn', CAST(N'2021-07-10T18:21:11.340' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (4, 4, 14, NULL, N'Sản phẩm này dùng có tốt không ạ', CAST(N'2021-07-10T19:09:21.777' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (5, 4, 14, NULL, N'Có thể mua trả góp không ạ?', CAST(N'2021-07-10T19:11:47.270' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (6, 4, 14, NULL, N'Không biết có nên mua không?', CAST(N'2021-07-10T19:16:26.453' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (7, 4, 17, NULL, N'Sản phẩm dùng có ổn không ạ', CAST(N'2021-07-10T20:53:51.140' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (8, 5, 17, NULL, N'Trước đây mình đã từng mua, thấy dùng rất ok nha', CAST(N'2021-07-10T20:57:11.463' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (9, 5, 8, NULL, N'Sản phẩm rất ổn định', CAST(N'2021-07-10T21:27:55.193' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (10, 4, 8, 9, N'Ổn lắm bạn', CAST(N'2021-07-10T21:50:50.193' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (11, 1, 8, 12, N'Ổn nha bạn', CAST(N'2021-07-10T23:09:45.053' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (12, 6, 8, NULL, N'ok lắm bạn', CAST(N'2021-07-10T23:23:41.117' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (13, 2, 8, NULL, N'Không biết máy có hay bị lỗi không', CAST(N'2021-07-10T23:44:46.923' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (14, 4, 29, NULL, N'Nhìn cấu hình thấy mê thật 😅😅😅', CAST(N'2021-07-10T23:59:35.683' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (15, 2, 29, 14, N'ờ, ước gì có đủ tiền để mua', CAST(N'2021-07-11T00:00:15.627' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (16, 4, 60, NULL, N'Nhìn sang ghê 😂😎😍', CAST(N'2021-07-11T02:36:42.347' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (17, 1, 42, NULL, N'Mê thật sự 😍😍😍', CAST(N'2021-07-11T10:15:28.087' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (18, 6, 40, NULL, N'Cho mình xin thông tin sản phẩm này ạ 😀😀😀', CAST(N'2021-07-12T16:54:21.050' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (19, 6, 8, 13, N'Không bạn, trước mình có dùng rồi, thấy ổn lắm', CAST(N'2021-07-12T17:01:30.770' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (20, 3, 39, NULL, N'Nhìn sang ghê 😂😎😍', CAST(N'2021-07-12T21:23:17.750' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (21, 3, 35, NULL, N'Nhìn sang ghê 😂😎😍', CAST(N'2021-07-12T21:25:18.073' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (22, 3, 35, 21, N'Ổn nha bạn', CAST(N'2021-07-12T21:25:32.253' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (23, 3, 20, NULL, N'Không biết máy có hay bị lỗi không', CAST(N'2021-07-12T21:28:13.753' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (24, 3, 20, NULL, N'Nhìn cấu hình thấy mê thật 😅😅😅', CAST(N'2021-07-12T21:28:34.533' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (25, 3, 41, NULL, N'Không biết máy có hay bị lỗi không, mình muôn xin thông tin chi tiết của sản phẩm này', CAST(N'2021-07-12T22:13:36.787' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (26, 1, 1, 2, N'Ổn lắm luôn', CAST(N'2021-07-13T08:28:36.033' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (27, 11, 43, NULL, N'Không biết máy có hay bị lỗi không', CAST(N'2021-07-14T17:51:11.023' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (28, 11, 56, NULL, N'ok lắm bạn', CAST(N'2021-07-14T17:53:54.883' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (29, 11, 56, NULL, N'Nhìn cấu hình thấy mê thật 😅😅😅', CAST(N'2021-07-14T18:09:23.507' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (30, 13, 27, NULL, N'Nhìn sang ghê 😂😎😍', CAST(N'2021-07-16T10:36:52.073' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (31, 6, 55, NULL, N'Nhìn cấu hình thấy mê thật 😅😅😅', CAST(N'2021-07-20T19:51:38.327' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (32, 3, 57, NULL, N'Sản phẩm rất tốt trong tầm giá ạ', CAST(N'2021-07-20T20:37:09.490' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (33, 3, 3, NULL, N'Sản phẩm này giá khá tốt', CAST(N'2021-07-21T08:42:04.183' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (34, 3, 55, 31, N'Mình cũng vậy á', CAST(N'2021-07-21T08:49:43.387' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (35, 3, 30, NULL, N'Ôi tuyệt vời thật sự 😍😍😍', CAST(N'2021-07-22T11:11:24.050' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (36, 3, 10, NULL, N'Máy nhìn gồ ghề quá', CAST(N'2021-07-22T11:25:06.853' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (37, 3, 24, NULL, N'Giá quá rẻ', CAST(N'2021-07-22T13:27:55.400' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (38, 3, 59, NULL, N'Cấu hình khủng quá', CAST(N'2021-07-22T20:46:34.410' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (39, 6, 57, 32, N'đúng rồi bạn, rất tốt luôn', CAST(N'2021-07-22T23:53:40.350' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (40, 6, 4, NULL, N'Máy dùng cho việc lập trình rất ok nha', CAST(N'2021-07-22T23:55:36.473' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (41, 6, 56, NULL, N'Ôi tuyệt vời thật sự 😍😍😍', CAST(N'2021-07-22T23:56:53.347' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (42, 6, 56, 29, N'đúng rồi á', CAST(N'2021-07-23T10:49:28.757' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (43, 6, 4, 3, N'rất tốt', CAST(N'2021-07-23T14:14:15.643' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (44, 6, 64, NULL, N'Ôi tuyệt vời thật sự 😍😍😍', CAST(N'2021-07-24T01:54:25.480' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (45, 6, 8, NULL, N'đúng rồi đó bạn', CAST(N'2021-07-24T02:53:16.263' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (46, 6, 10, 36, N'ừa đúng thật', CAST(N'2021-07-24T13:39:06.430' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (47, 4, 8, NULL, N'Tốt', CAST(N'2021-07-24T14:47:43.717' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (48, 6, 8, 47, N'Ổn', CAST(N'2021-07-24T14:57:59.390' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (49, 6, 5, NULL, N'Mình thấy máy chạy khá yếu nha', CAST(N'2021-07-24T20:25:09.467' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (50, 6, 8, 10, N'đúng rồi', CAST(N'2021-07-24T23:51:09.223' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (51, 6, 8, 11, N'ừa', CAST(N'2021-07-24T23:51:40.730' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (52, 6, 8, 47, N'yes', CAST(N'2021-07-24T23:52:36.543' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (53, 6, 8, 9, N'rất ổn', CAST(N'2021-07-24T23:53:37.263' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (54, 6, 8, 10, N'yes', CAST(N'2021-07-24T23:53:50.470' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (55, 3, 57, 39, N'ừa', CAST(N'2021-07-25T00:21:10.087' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (56, 3, 8, 48, N'Ừa rất tốt', CAST(N'2021-07-25T15:59:21.823' AS DateTime), CAST(N'2021-07-26T17:40:12.033' AS DateTime), 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (57, 3, 8, 56, N'ok, tốt', CAST(N'2021-07-25T15:59:28.693' AS DateTime), CAST(N'2021-07-25T22:40:22.757' AS DateTime), 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (58, 3, 28, NULL, N'Máy có giao hàng toàn quốc không ạ', CAST(N'2021-07-25T16:09:29.757' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (59, 3, 55, NULL, N'Cho mình xin thông tin sản phẩm này ạ 😀😀😀', CAST(N'2021-07-25T16:11:27.523' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (60, 3, 22, NULL, N'Không biết máy có hay bị lỗi không', CAST(N'2021-07-25T16:13:31.207' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (61, 3, 8, NULL, N'Không biết máy có hay bị lỗi không, mình muôn xin thông tin chi tiết của sản phẩm này', CAST(N'2021-07-25T20:05:24.093' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (62, 4, 53, NULL, N'Cho mình xin thông tin sản phẩm này với 😀😀😀', CAST(N'2021-07-25T22:43:56.087' AS DateTime), CAST(N'2021-07-25T22:44:17.687' AS DateTime), 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (63, 1, 57, 55, N'yes', CAST(N'2021-07-25T22:54:53.273' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (64, 1, 8, 61, N'Máy chạy rất ổn bạn ạ, nếu muốn biết thêm thông tin bạn cung cấp giúp mình thông tin như SĐT/Email để bên mình liên hệ bạn ạ', CAST(N'2021-07-26T15:49:35.220' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (65, 3, 79, NULL, N'Cho mình hỏi sản phẩm này còn hàng ở TPHCM không ạ?', CAST(N'2021-07-29T23:46:02.083' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (66, 17, 79, NULL, N'Điện thoại này chụp hình có đẹp không?', CAST(N'2021-07-30T00:17:05.980' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (67, 2, 77, NULL, N'Điện thoại này có hỗ trợ 5G không?', CAST(N'2021-07-30T08:52:38.140' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (68, 2, 78, NULL, N'Điện thoại này pin sử dụng được bao nhiêu giờ?', CAST(N'2021-07-30T08:53:28.697' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (69, 2, 80, NULL, N'Điện thoại này chụp hình có đẹp không?', CAST(N'2021-07-30T08:53:46.940' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (70, 2, 81, NULL, N'Điện thoại này chụp hình có đẹp không?', CAST(N'2021-07-30T09:19:48.040' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (71, 2, 77, NULL, N'Điện thoại này pin sử dụng được bao nhiêu giờ?', CAST(N'2021-07-30T09:57:11.260' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Comment] ([Id], [UserId], [ProductId], [ParentId], [Text], [CreatedDate], [ModifiedDate], [Status], [Deleted]) VALUES (72, 2, 80, NULL, N'Điện thoại này pin sử dụng được bao nhiêu giờ?', CAST(N'2021-07-30T14:44:38.823' AS DateTime), NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[FavoriteProduct] ON 

INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (1, 6, 40, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (2, 3, 27, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (3, 3, 55, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (4, 1, 1, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (5, 3, 61, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (6, 1, 55, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (7, 1, 5, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (8, 1, 9, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (9, 1, 65, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (10, 3, 14, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (11, 3, 8, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (12, 3, 3, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (13, 3, 29, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (14, 3, 50, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (15, 15, 31, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (16, 15, 30, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (17, 15, 6, 1)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (18, 15, 22, 1)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (19, 15, 37, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (20, 3, 10, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (21, 3, 59, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (22, 6, 58, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (23, 6, 56, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (24, 6, 3, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (25, 6, 4, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (26, 4, 38, 1)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (27, 4, 35, 0)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (28, 4, 73, 1)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (29, 4, 72, 1)
INSERT [dbo].[FavoriteProduct] ([Id], [UserId], [ProductId], [Status]) VALUES (30, 1, 57, 1)
SET IDENTITY_INSERT [dbo].[FavoriteProduct] OFF
SET IDENTITY_INSERT [dbo].[LoginHistory] ON 

INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (1, 1, CAST(N'2021-07-07T20:39:23.217' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (2, 1, CAST(N'2021-07-08T18:13:51.847' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (3, 4, CAST(N'2021-07-08T18:19:27.750' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (4, 1, CAST(N'2021-07-08T18:25:03.310' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (5, 1, CAST(N'2021-07-08T20:09:09.073' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (6, 1, CAST(N'2021-07-09T01:25:07.570' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (7, 1, CAST(N'2021-07-09T01:26:44.257' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (8, 1, CAST(N'2021-07-09T10:25:43.683' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (9, 1, CAST(N'2021-07-09T15:50:55.353' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (10, 4, CAST(N'2021-07-09T15:51:58.653' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (11, 1, CAST(N'2021-07-09T16:06:31.510' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (12, 1, CAST(N'2021-07-09T16:40:42.023' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (13, 1, CAST(N'2021-07-09T21:31:10.083' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (14, 4, CAST(N'2021-07-09T21:36:49.873' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (15, 4, CAST(N'2021-07-09T22:13:48.017' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (16, 4, CAST(N'2021-07-09T22:14:53.980' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (17, 4, CAST(N'2021-07-09T22:16:22.807' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (18, 1, CAST(N'2021-07-10T10:55:30.177' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (19, 4, CAST(N'2021-07-10T19:08:45.143' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (20, 5, CAST(N'2021-07-10T20:56:34.273' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (21, 1, CAST(N'2021-07-10T23:08:14.487' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (22, 4, CAST(N'2021-07-10T23:58:59.593' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (23, 1, CAST(N'2021-07-11T01:08:56.377' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (24, 1, CAST(N'2021-07-11T01:58:47.240' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (25, 1, CAST(N'2021-07-11T10:13:39.000' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (26, 1, CAST(N'2021-07-11T23:35:41.890' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (27, 6, CAST(N'2021-07-12T15:49:00.993' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (28, 3, CAST(N'2021-07-12T21:23:04.660' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (29, 1, CAST(N'2021-07-13T06:00:48.407' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (30, 1, CAST(N'2021-07-13T06:16:44.297' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (31, 1, CAST(N'2021-07-13T08:34:59.807' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (32, 4, CAST(N'2021-07-13T09:24:23.183' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (33, 1, CAST(N'2021-07-13T09:26:12.717' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (34, 4, CAST(N'2021-07-13T10:10:39.573' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (35, 1, CAST(N'2021-07-13T10:14:38.320' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (36, 1, CAST(N'2021-07-13T15:31:41.947' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (37, 1, CAST(N'2021-07-13T15:34:03.910' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (38, 1, CAST(N'2021-07-13T15:39:19.040' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (39, 1, CAST(N'2021-07-13T15:57:46.317' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (40, 1, CAST(N'2021-07-14T10:17:38.000' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (41, 1, CAST(N'2021-07-14T17:09:38.880' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (42, 11, CAST(N'2021-07-14T17:45:37.157' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (43, 3, CAST(N'2021-07-14T23:41:09.393' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (44, 1, CAST(N'2021-07-15T00:02:23.203' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (45, 3, CAST(N'2021-07-16T05:34:43.403' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (46, 1, CAST(N'2021-07-16T05:45:39.353' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (47, 1, CAST(N'2021-07-16T05:47:47.110' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (48, 11, CAST(N'2021-07-16T10:24:58.153' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (49, 11, CAST(N'2021-07-16T10:27:14.053' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (50, 11, CAST(N'2021-07-16T10:28:33.053' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (51, 11, CAST(N'2021-07-16T10:29:10.790' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (52, 11, CAST(N'2021-07-16T10:29:26.987' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (53, 1, CAST(N'2021-07-16T10:30:10.670' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (54, 1, CAST(N'2021-07-16T10:30:21.060' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (55, 1, CAST(N'2021-07-16T10:30:37.213' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (56, 1, CAST(N'2021-07-16T10:31:22.233' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (57, 1, CAST(N'2021-07-16T10:31:29.233' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (58, 12, CAST(N'2021-07-16T10:34:16.377' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (59, 12, CAST(N'2021-07-16T10:35:13.407' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (60, 13, CAST(N'2021-07-16T10:36:29.433' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (61, 1, CAST(N'2021-07-16T15:22:51.317' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (62, 1, CAST(N'2021-07-17T20:17:44.260' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (63, 1, CAST(N'2021-07-17T20:22:49.553' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (64, 1, CAST(N'2021-07-18T15:57:00.480' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (65, 2, CAST(N'2021-07-18T16:51:35.407' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (66, 1, CAST(N'2021-07-19T21:06:52.017' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (67, 1, CAST(N'2021-07-20T19:30:05.273' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (68, 1, CAST(N'2021-07-20T19:32:59.600' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (69, 6, CAST(N'2021-07-20T19:41:26.990' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (70, 1, CAST(N'2021-07-20T19:58:42.783' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (71, 3, CAST(N'2021-07-20T20:06:24.557' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (72, 3, CAST(N'2021-07-20T20:36:39.363' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (73, 3, CAST(N'2021-07-20T20:50:02.597' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (74, 1, CAST(N'2021-07-20T22:11:12.153' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (75, 1, CAST(N'2021-07-20T22:11:23.140' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (76, 1, CAST(N'2021-07-20T23:33:05.603' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (77, 3, CAST(N'2021-07-20T23:37:11.590' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (78, 1, CAST(N'2021-07-21T09:36:25.207' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (79, 1, CAST(N'2021-07-21T14:54:08.277' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (80, 3, CAST(N'2021-07-21T14:54:21.517' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (81, 1, CAST(N'2021-07-21T19:34:22.917' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (82, 1, CAST(N'2021-07-21T23:00:06.680' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (83, 3, CAST(N'2021-07-21T23:37:08.967' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (84, 3, CAST(N'2021-07-21T23:47:28.527' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (85, 15, CAST(N'2021-07-21T23:53:57.080' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (86, 1, CAST(N'2021-07-22T01:16:51.493' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (87, 1, CAST(N'2021-07-22T08:13:04.983' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (88, 15, CAST(N'2021-07-22T08:32:47.500' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (89, 1, CAST(N'2021-07-22T09:14:18.197' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (90, 1, CAST(N'2021-07-22T10:47:01.760' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (91, 1, CAST(N'2021-07-22T11:09:27.277' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (92, 3, CAST(N'2021-07-22T11:09:37.733' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (93, 3, CAST(N'2021-07-22T11:23:44.693' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (94, 1, CAST(N'2021-07-22T11:25:54.487' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (95, 1, CAST(N'2021-07-22T13:16:18.853' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (96, 1, CAST(N'2021-07-22T20:24:19.560' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (97, 1, CAST(N'2021-07-22T20:29:55.197' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (98, 1, CAST(N'2021-07-22T20:31:14.403' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (99, 3, CAST(N'2021-07-22T20:32:23.560' AS DateTime))
GO
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (100, 13, CAST(N'2021-07-22T20:53:41.957' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (101, 1, CAST(N'2021-07-22T23:34:03.463' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (102, 1, CAST(N'2021-07-22T23:45:27.683' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (103, 6, CAST(N'2021-07-22T23:49:03.103' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (104, 6, CAST(N'2021-07-23T08:31:43.740' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (105, 6, CAST(N'2021-07-23T08:34:15.353' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (106, 6, CAST(N'2021-07-23T10:30:11.713' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (107, 6, CAST(N'2021-07-23T10:35:14.410' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (108, 1, CAST(N'2021-07-23T13:28:23.680' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (109, 6, CAST(N'2021-07-23T14:13:11.667' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (110, 1, CAST(N'2021-07-23T14:17:46.987' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (111, 6, CAST(N'2021-07-24T01:53:45.083' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (112, 1, CAST(N'2021-07-24T13:47:24.300' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (113, 4, CAST(N'2021-07-24T14:47:26.570' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (114, 1, CAST(N'2021-07-24T17:42:11.663' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (115, 6, CAST(N'2021-07-24T17:57:03.060' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (116, 6, CAST(N'2021-07-24T18:46:57.857' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (117, 6, CAST(N'2021-07-24T18:48:38.057' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (118, 1, CAST(N'2021-07-24T20:22:28.373' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (119, 3, CAST(N'2021-07-25T00:20:43.343' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (120, 13, CAST(N'2021-07-25T11:50:50.657' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (121, 13, CAST(N'2021-07-25T11:54:51.803' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (122, 13, CAST(N'2021-07-25T11:55:14.537' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (123, 13, CAST(N'2021-07-25T11:55:28.210' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (124, 13, CAST(N'2021-07-25T11:58:36.773' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (125, 1, CAST(N'2021-07-25T11:58:54.547' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (126, 1, CAST(N'2021-07-25T11:59:32.973' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (127, 1, CAST(N'2021-07-25T12:00:44.420' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (128, 1, CAST(N'2021-07-25T12:02:30.787' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (129, 1, CAST(N'2021-07-25T12:04:19.310' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (130, 1, CAST(N'2021-07-25T12:04:45.223' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (131, 1, CAST(N'2021-07-25T12:05:20.773' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (132, 3, CAST(N'2021-07-25T12:06:24.187' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (133, 3, CAST(N'2021-07-25T12:08:59.500' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (134, 3, CAST(N'2021-07-25T12:09:19.523' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (135, 3, CAST(N'2021-07-25T12:09:55.580' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (136, 1, CAST(N'2021-07-25T15:17:26.147' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (137, 1, CAST(N'2021-07-25T15:21:55.917' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (138, 1, CAST(N'2021-07-25T15:33:02.813' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (139, 3, CAST(N'2021-07-25T15:58:37.267' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (140, 1, CAST(N'2021-07-25T16:00:58.133' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (141, 4, CAST(N'2021-07-25T22:43:06.747' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (142, 3, CAST(N'2021-07-25T22:45:09.253' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (143, 1, CAST(N'2021-07-25T22:50:08.173' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (144, 1, CAST(N'2021-07-26T15:40:20.517' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (145, 3, CAST(N'2021-07-26T17:29:40.910' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (146, 11, CAST(N'2021-07-26T21:47:47.043' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (147, 1, CAST(N'2021-07-27T21:08:18.793' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (148, 11, CAST(N'2021-07-28T14:45:09.597' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (149, 11, CAST(N'2021-07-28T14:46:08.447' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (150, 1, CAST(N'2021-07-28T14:47:09.213' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (151, 11, CAST(N'2021-07-28T14:49:05.223' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (152, 1, CAST(N'2021-07-29T23:05:27.933' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (153, 1, CAST(N'2021-07-29T23:12:50.300' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (154, 1, CAST(N'2021-07-29T23:20:12.967' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (155, 3, CAST(N'2021-07-29T23:42:03.823' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (156, 17, CAST(N'2021-07-29T23:50:28.267' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (157, 1, CAST(N'2021-07-30T08:50:52.473' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (158, 2, CAST(N'2021-07-30T08:51:52.027' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (159, 1, CAST(N'2021-07-30T09:12:12.053' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (160, 2, CAST(N'2021-07-30T09:14:12.437' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (161, 1, CAST(N'2021-07-30T09:49:53.110' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (162, 2, CAST(N'2021-07-30T09:51:30.857' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (163, 1, CAST(N'2021-07-30T13:59:54.807' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (164, 1, CAST(N'2021-07-30T14:01:17.103' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (165, 1, CAST(N'2021-07-30T14:04:56.027' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (166, 2, CAST(N'2021-07-30T14:05:17.810' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (167, 1, CAST(N'2021-07-30T14:36:32.497' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (168, 2, CAST(N'2021-07-30T14:38:23.483' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (169, 1, CAST(N'2021-08-01T22:28:39.583' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (170, 1, CAST(N'2021-08-01T23:28:01.013' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (171, 1, CAST(N'2021-08-01T23:31:37.520' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (172, 1, CAST(N'2021-08-01T23:39:32.360' AS DateTime))
INSERT [dbo].[LoginHistory] ([Id], [UserId], [AccessTime]) VALUES (173, 1, CAST(N'2021-08-01T23:45:32.163' AS DateTime))
SET IDENTITY_INSERT [dbo].[LoginHistory] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (1, CAST(N'2020-01-09T10:15:41.183' AS DateTime), CAST(N'2020-01-16T10:15:41.183' AS DateTime), 0, N'Nguyễn Trung Hiếu', N'74 Phố Mẫn Định Trân, Phường Đình Hồng, Quận Bạch Miên Hà Tĩnh', N'0965924083', CAST(29680000 AS Decimal(18, 0)), 8, 1, N'hieutanmy321@gmail.com', N'Kiểm tra kỹ sản phẩm', 0, N'Khi nhận hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (2, CAST(N'2020-02-09T10:28:52.650' AS DateTime), CAST(N'2020-02-16T10:28:52.650' AS DateTime), 1, N'Mạch Sơn Chương', N'74 Phố Mẫn Định Trân, Phường Đình Hồng, Quận Bạch Miên Hà Tĩnh', N'0965924083', CAST(40370000 AS Decimal(18, 0)), 7, 1, N'hieutanmy321@gmail.com', N'Kiểm tra kỹ sản phẩm', 1, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (3, CAST(N'2020-03-08T10:38:22.240' AS DateTime), CAST(N'2020-03-15T10:38:22.240' AS DateTime), 1, N'Nhâm Lâm Hoán', N'74 Phố Mẫn Định Trân, Phường Đình Hồng, Quận Bạch Miên Hà Tĩnh', N'0965924083', CAST(20090000 AS Decimal(18, 0)), 8, 1, N'17110298@student.hcmute.edu.vn', N'Kiểm tra kỹ sản phẩm', 0, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (4, CAST(N'2020-03-12T16:55:30.453' AS DateTime), CAST(N'2020-03-19T16:55:30.453' AS DateTime), 1, N'Bàng Huy Luận', N'7 Phố Hoàng Hành Linh, Xã 1, Quận Triệu Bình Triệu Hà Nội', N'0965924083', CAST(14890000 AS Decimal(18, 0)), 7, 6, N'hieutanmy321@gmail.com', N'Kiểm tra kỹ sản phẩm', 1, N'Khi nhận hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (5, CAST(N'2020-04-01T10:10:01.030' AS DateTime), CAST(N'2020-04-17T10:10:01.030' AS DateTime), 1, N'Mạch Sơn Chương', N'74 Phố Mẫn Định Trân, Phường Đình Hồng, Quận Bạch Miên Hà Tĩnh', N'0965924083', CAST(11490000 AS Decimal(18, 0)), 7, NULL, N'hieutanmy321@gmail.com', N'', 0, N'Khi nhận hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (6, CAST(N'2020-05-13T10:11:40.977' AS DateTime), CAST(N'2020-05-20T10:11:40.977' AS DateTime), 1, N'Mạch Sơn Chương', N'74 Phố Mẫn Định Trân, Phường Đình Hồng, Quận Bạch Miên Hà Tĩnh', N'0965924083', CAST(10690000 AS Decimal(18, 0)), 7, 4, N'hieutanmy321@gmail.com', N'Kiểm tra kỹ sản phẩm', 0, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (7, CAST(N'2020-06-13T15:35:15.473' AS DateTime), CAST(N'2020-06-20T15:35:15.473' AS DateTime), 1, N'Nguyễn Trung Hiếu', N'Ấp 1, Tân Mỹ - Thanh Bình - Đồng Tháp', N'0965924083', CAST(10890000 AS Decimal(18, 0)), 7, 1, N'hieutanmy321@gmail.com', N'', 0, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (8, CAST(N'2020-07-13T15:53:49.157' AS DateTime), CAST(N'2020-07-20T15:53:49.157' AS DateTime), 1, N'Nguyễn Trung Hiếu', N'Ấp 1, Tân Mỹ - Thanh Bình - Đồng Tháp', N'0965924083', CAST(10890000 AS Decimal(18, 0)), 7, 1, N'hieutanmy321@gmail.com', N'', 0, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (9, CAST(N'2020-08-14T17:42:54.570' AS DateTime), CAST(N'2020-08-21T17:42:54.570' AS DateTime), 1, N'Mạch Sơn Chương', N'74 Phố Mẫn Định Trân, Phường Đình Hồng, Quận Bạch Miên Hà Tĩnh', N'0965924083', CAST(29680000 AS Decimal(18, 0)), 7, 1, N'17110298@student.hcmute.edu.vn', N'', 0, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (10, CAST(N'2020-09-14T17:46:42.590' AS DateTime), CAST(N'2020-09-21T17:46:42.590' AS DateTime), 1, N'Nhâm Lâm Hoán', N'42, Ấp Thu Cầm, Thôn Mang Hòa, Quận Lập Lâm Hà Giang', N'0965924083', CAST(25690000 AS Decimal(18, 0)), 7, 11, N'hieutanmy321@gmail.com', N'', 0, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (11, CAST(N'2020-10-14T17:49:11.290' AS DateTime), CAST(N'2020-10-21T17:49:11.290' AS DateTime), 1, N'Bàng Huy Luận', N'7 Phố Hoàng Hành Linh, Xã 1, Quận Triệu Bình Triệu Hà Nội', N'1445778887', CAST(3990000 AS Decimal(18, 0)), 7, 11, N'hieutanmy321@gmail.com', N'', 0, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (12, CAST(N'2021-07-16T10:37:55.730' AS DateTime), CAST(N'2021-07-23T10:37:55.730' AS DateTime), 1, N'Bàng Huy Luận', N'42, Ấp Thu Cầm, Thôn Mang Hòa, Quận Lập Lâm Hà Giang', N'0965924084', CAST(19090000 AS Decimal(18, 0)), 7, 13, N'hieutanmy321@gmail.com', N'', 0, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (13, CAST(N'2020-12-18T00:31:09.163' AS DateTime), CAST(N'2020-12-25T00:31:09.163' AS DateTime), 1, N'Nhâm Lâm Hoán', N'74 Phố Mẫn Định Trân, Phường Đình Hồng, Quận Bạch Miên Hà Tĩnh', N'0965924083', CAST(78240000 AS Decimal(18, 0)), 7, 13, N'17110298@student.hcmute.edu.vn', N'Kiểm tra kỹ sản phẩm', 0, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (14, CAST(N'2021-01-20T19:42:28.447' AS DateTime), CAST(N'2021-01-27T19:42:28.447' AS DateTime), 1, N'Nguyễn Trung Hiếu', N'42, Ấp Thu Cầm, Thôn Mang Hòa, Quận Lập Lâm Hà Giang', N'0965924083', CAST(34990000 AS Decimal(18, 0)), 7, 6, N'hieutanmy321@gmail.com', N'', 1, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (15, CAST(N'2021-02-20T20:19:20.470' AS DateTime), CAST(N'2021-02-27T20:19:20.470' AS DateTime), 1, N'Lê Tấn Đạt', N'74 Phố Mẫn Định Trân, Phường Đình Hồng, Quận Bạch Miên Hà Tĩnh', N'0965924083', CAST(45570000 AS Decimal(18, 0)), 7, 3, N'dat@gmail.com', N'', 1, N'Khi nhận hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (16, CAST(N'2021-03-20T20:43:46.900' AS DateTime), CAST(N'2021-03-27T20:43:46.900' AS DateTime), 1, N'Lê Tấn Đạt', N'Quãng Nam', N'0124578965', CAST(19090000 AS Decimal(18, 0)), 7, 3, N'machsong@gmail.com', N'', 1, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (17, CAST(N'2021-04-21T08:51:30.147' AS DateTime), CAST(N'2021-04-28T08:51:30.147' AS DateTime), 1, N'Lê Tấn Đạt', N'42, Ấp Thu Cầm, Thôn Mang Hòa, Quận Lập Lâm Hà Giang', N'0124578965', CAST(139960000 AS Decimal(18, 0)), 7, 3, N'hieutanmy321@gmail.com', N'', 1, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (18, CAST(N'2021-05-21T09:40:28.090' AS DateTime), CAST(N'2021-05-21T09:37:51.000' AS DateTime), 1, N'Nguyễn Văn Bình', N'Số 1, Võ Văn Ngân, P.Linh Chiểu, Q.Thủ Đức, TP HCM', N'0987654321', CAST(58280000 AS Decimal(18, 0)), 7, NULL, N'email@example.com', N'', 1, N'Tại cửa hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (19, CAST(N'2021-06-21T09:44:31.530' AS DateTime), CAST(N'2021-06-21T09:37:51.000' AS DateTime), 1, N'Nguyễn Văn Nam', N'Số 1, Võ Văn Ngân, P.Linh Chiểu, Q.Thủ Đức, TP HCM', N'0987654321', CAST(66680000 AS Decimal(18, 0)), 7, NULL, N'email@example.com', N'', 1, N'Tại cửa hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (20, CAST(N'2021-07-21T09:45:58.470' AS DateTime), CAST(N'2021-07-21T09:45:28.000' AS DateTime), 1, N'Lê Tấn Đạt', N'Số 1, Võ Văn Ngân, P.Linh Chiểu, Q.Thủ Đức, TP HCM', N'0987654321', CAST(47180000 AS Decimal(18, 0)), 7, NULL, N'email@example.com', NULL, 1, N'Tại cửa hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (21, CAST(N'2021-07-21T09:59:52.923' AS DateTime), CAST(N'2021-07-21T09:59:18.000' AS DateTime), 1, N'Nhâm Lâm Hoán', N'Số 1, Võ Văn Ngân, P.Linh Chiểu, Q.Thủ Đức, TP HCM', N'0987654321', CAST(20880000 AS Decimal(18, 0)), 7, NULL, N'email@example.com', NULL, 1, N'Tại cửa hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (22, CAST(N'2021-07-22T11:10:48.390' AS DateTime), CAST(N'2021-07-29T11:10:48.390' AS DateTime), 1, N'Lê Tấn Đạt', N'Tân Mỹ', N'0965924083', CAST(78980000 AS Decimal(18, 0)), 7, 3, N'machsong@gmail.com', N'Kiểm tra kỹ sản phẩm', 1, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (23, CAST(N'2021-07-22T13:19:33.110' AS DateTime), CAST(N'2021-07-29T13:19:33.110' AS DateTime), 0, N'Nhâm Lâm Hoán', N'7 Phố Hoàng Hành Linh, Xã 1, Quận Triệu Bình Triệu Hà Nội', N'0965924083', CAST(56080000 AS Decimal(18, 0)), 3, 3, N'0378046750@gmail.com', N'Kiểm tra kỹ sản phẩm', 0, N'Khi nhận hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (24, CAST(N'2021-07-22T20:47:50.950' AS DateTime), CAST(N'2021-07-29T20:47:50.950' AS DateTime), 0, N'Nhâm Lâm Hoán', N'74 Phố Mẫn Định Trân, Phường Đình Hồng, Quận Bạch Miên Hà Tĩnh', N'0965924083', CAST(46490000 AS Decimal(18, 0)), 8, NULL, N'dat@gmail.com', N'Kiểm tra kỹ sản phẩm', 0, N'Khi nhận hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (25, CAST(N'2021-07-22T23:29:21.050' AS DateTime), CAST(N'2021-07-29T23:29:21.050' AS DateTime), 0, N'Mạch Sơn Chương', N'7 Phố Hoàng Hành Linh, Xã 1, Quận Triệu Bình Triệu Hà Nội', N'0965924083', CAST(45560000 AS Decimal(18, 0)), 8, 3, N'hieutanmy321@gmail.com', N'', 0, N'Khi nhận hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (26, CAST(N'2021-07-22T23:49:49.007' AS DateTime), CAST(N'2021-07-29T23:49:49.007' AS DateTime), 1, N'Nguyễn Trung Hiếu', N'42, Ấp Thu Cầm, Thôn Mang Hòa, Quận Lập Lâm Hà Giang', N'0965924083', CAST(285880000 AS Decimal(18, 0)), 7, 6, N'hieutanmy321@gmail.com', N'', 1, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (27, CAST(N'2021-07-22T23:59:45.453' AS DateTime), CAST(N'2021-07-29T23:59:45.453' AS DateTime), 0, N'Lê Tấn Đạt', N'Tân Mỹ', N'0965924083', CAST(61680000 AS Decimal(18, 0)), 1, 6, N'17110298@student.hcmute.edu.vn', N'', 0, N'Khi nhận hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (28, CAST(N'2021-07-23T14:11:58.753' AS DateTime), CAST(N'2021-07-30T14:11:58.753' AS DateTime), 0, N'Mạch Sơn Chương', N'42, Ấp Thu Cầm, Thôn Mang Hòa, Quận Lập Lâm Hà Giang', N'0965924083', CAST(94140000 AS Decimal(18, 0)), 1, NULL, N'hieutanmy321@gmail.com', N'', 0, N'Khi nhận hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (29, CAST(N'2021-07-23T14:16:32.250' AS DateTime), CAST(N'2021-07-30T14:16:32.250' AS DateTime), 1, N'Mạch Sơn Chương', N'42, Ấp Thu Cầm, Thôn Mang Hòa, Quận Lập Lâm Hà Giang', N'0322749635', CAST(16990000 AS Decimal(18, 0)), 8, 6, N'hieutanmy321@gmail.com', N'', 0, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (30, CAST(N'2021-07-23T14:26:56.597' AS DateTime), CAST(N'2021-07-23T14:26:31.000' AS DateTime), 1, N'Lê Tấn Đạt', N'Số 1, Võ Văn Ngân, P.Linh Chiểu, Q.Thủ Đức, TP HCM', N'0987654321', CAST(69980000 AS Decimal(18, 0)), 7, NULL, N'email@example.com', NULL, 1, N'Tại cửa hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (31, CAST(N'2021-07-24T18:40:00.830' AS DateTime), CAST(N'2021-07-31T18:40:00.830' AS DateTime), 1, N'Nhâm Lâm Hoán', N'74 Phố Mẫn Định Trân, Phường Đình Hồng, Quận Bạch Miên Hà Tĩnh', N'0322749635', CAST(9270000 AS Decimal(18, 0)), 1, 6, N'machsong@gmail.com', N'Kiểm tra kỹ sản phẩm', 0, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (32, CAST(N'2021-07-24T20:21:18.350' AS DateTime), CAST(N'2021-07-31T20:21:18.350' AS DateTime), 1, N'Hiếu', N'7 Phố Hoàng Hành Linh, Xã 1, Quận Triệu Bình Triệu Hà Nội', N'0322749635', CAST(104980000 AS Decimal(18, 0)), 7, 6, N'hieunt76124@gmail.com', N'', 0, N'Khi nhận hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (33, CAST(N'2021-07-25T16:00:44.077' AS DateTime), CAST(N'2021-08-01T16:00:44.077' AS DateTime), 1, N'Lê Tấn Đạt', N'7 Phố Hoàng Hành Linh, Xã 1, Quận Triệu Bình Triệu Hà Nội', N'0766770598', CAST(34990000 AS Decimal(18, 0)), 7, 3, N'hieutanmy123@gmail.com', N'Kiểm tra kỹ sản phẩm', 0, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (34, CAST(N'2021-07-29T23:43:31.190' AS DateTime), CAST(N'2021-08-05T23:43:31.190' AS DateTime), 1, N'Lê Tấn Đạt', N'Số 1, đường Võ Văn Ngân, phường Linh chiểu, TP Thủ Đức, TPHCM', N'0987654321', CAST(26990000 AS Decimal(18, 0)), 7, 3, N'dat@gmail.com', N'Gọi điện trước khi giao hàng', 0, N'Khi nhận hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (35, CAST(N'2021-07-29T23:55:36.503' AS DateTime), CAST(N'2021-08-05T23:55:36.503' AS DateTime), 1, N'Võ Trọng Hiếu', N'Số 1, đường Võ Văn Ngân, phường Linh chiểu, TP Thủ Đức, TPHCM', N'0987654321', CAST(26990000 AS Decimal(18, 0)), 7, 17, N'hieutrong0123@gmail.com', N'Gọi điện trước khi giao hàng', 1, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (36, CAST(N'2021-07-30T08:55:59.250' AS DateTime), CAST(N'2021-08-06T08:55:59.250' AS DateTime), 1, N'Võ Trọng Hiếu', N'Số 1, đường Võ Văn Ngân, phường Linh chiểu, TP Thủ Đức, TPHCM', N'0987654321', CAST(25190000 AS Decimal(18, 0)), 7, 2, N'17110299@student.hcmute.edu.vn', N'Gọi điện trước khi giao hàng', 0, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (37, CAST(N'2021-07-30T09:16:13.520' AS DateTime), CAST(N'2021-08-06T09:16:13.520' AS DateTime), 1, N'Võ Trọng Hiếu', N'Số 1, đường Võ Văn Ngân, phường Linh chiểu, TP Thủ Đức, TPHCM', N'0987654321', CAST(9000000 AS Decimal(18, 0)), 7, 2, N'17110299@student.hcmute.edu.vn', N'Gọi điện trước khi giao hàng', 1, N'Khi nhận hàng')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (38, CAST(N'2021-07-30T09:30:22.447' AS DateTime), CAST(N'2021-08-06T09:30:22.447' AS DateTime), 1, N'Võ Trọng Hiếu', N'Số 1, đường Võ Văn Ngân, phường Linh chiểu, TP Thủ Đức, TPHCM', N'0987654321', CAST(9000000 AS Decimal(18, 0)), 1, 2, N'17110299@student.hcmute.edu.vn', N'Gọi điện trước khi giao hàng', 0, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (39, CAST(N'2021-07-30T09:38:44.307' AS DateTime), CAST(N'2021-08-06T09:38:44.307' AS DateTime), 1, N'Võ Trọng Hiếu', N'Số 1, đường Võ Văn Ngân, phường Linh chiểu, TP Thủ Đức, TPHCM', N'0987654321', CAST(690000 AS Decimal(18, 0)), 1, 2, N'17110299@student.hcmute.edu.vn', N'', 0, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (40, CAST(N'2021-07-30T09:53:33.670' AS DateTime), CAST(N'2021-08-06T09:53:33.670' AS DateTime), 1, N'Võ Trọng Hiếu', N'Số 1, đường Võ Văn Ngân, phường Linh chiểu, TP Thủ Đức, TPHCM', N'0987654321', CAST(9000000 AS Decimal(18, 0)), 7, 2, N'17110299@student.hcmute.edu.vn', N'Gọi điện trước khi giao hàng', 1, N'Paypal')
INSERT [dbo].[Order] ([Id], [CreatedDate], [DeliveryDate], [Paid], [Receiver], [ReceiversAddress], [PhoneNumber], [TotalMoney], [StatusId], [UserId], [Email], [Note], [Received], [PaymentMethod]) VALUES (41, CAST(N'2021-07-30T14:40:11.327' AS DateTime), CAST(N'2021-08-06T14:40:11.327' AS DateTime), 1, N'Võ Trọng Hiếu', N'Số 1, đường Võ Văn Ngân, phường Linh chiểu, TP Thủ Đức, TPHCM', N'0987654321', CAST(9500000 AS Decimal(18, 0)), 7, 2, N'17110299@student.hcmute.edu.vn', N'Gọi điện trước khi giao hàng', 1, N'Paypal')
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (1, 1, 1, 1, CAST(18990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (2, 1, 3, 1, CAST(10690000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (3, 2, 1, 1, CAST(18990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (4, 2, 3, 2, CAST(10690000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (5, 3, 20, 1, CAST(3090000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (6, 3, 21, 1, CAST(17000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (7, 4, 40, 1, CAST(14890000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (8, 5, 7, 1, CAST(11490000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (9, 6, 3, 1, CAST(10690000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (10, 7, 11, 1, CAST(10890000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (11, 8, 11, 1, CAST(10890000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (12, 9, 3, 1, CAST(10690000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (13, 9, 1, 1, CAST(18990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (14, 10, 32, 1, CAST(25690000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (15, 11, 43, 1, CAST(3990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (16, 12, 27, 1, CAST(19090000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (17, 13, 57, 1, CAST(21490000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (18, 13, 6, 1, CAST(11190000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (19, 13, 61, 1, CAST(45560000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (20, 14, 55, 1, CAST(34990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (21, 15, 7, 1, CAST(11490000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (22, 15, 13, 1, CAST(12790000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (23, 15, 18, 1, CAST(21290000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (24, 16, 27, 1, CAST(19090000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (25, 17, 55, 4, CAST(34990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (26, 18, 10, 1, CAST(18290000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (27, 18, 30, 1, CAST(39990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (28, 19, 15, 1, CAST(17790000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (29, 19, 60, 1, CAST(48890000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (30, 20, 30, 1, CAST(39990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (31, 20, 71, 1, CAST(7190000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (32, 21, 15, 1, CAST(17790000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (33, 21, 20, 1, CAST(3090000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (34, 22, 29, 1, CAST(38990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (35, 22, 30, 1, CAST(39990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (36, 23, 9, 1, CAST(18690000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (37, 23, 26, 1, CAST(20390000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (38, 23, 21, 1, CAST(17000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (39, 24, 58, 1, CAST(46490000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (40, 25, 61, 1, CAST(45560000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (41, 26, 4, 4, CAST(16990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (42, 26, 56, 4, CAST(32990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (43, 26, 57, 4, CAST(21490000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (44, 27, 21, 2, CAST(17000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (45, 27, 22, 1, CAST(20000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (46, 27, 20, 1, CAST(3090000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (47, 27, 19, 1, CAST(4590000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (48, 28, 11, 3, CAST(10890000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (49, 28, 12, 3, CAST(20490000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (50, 29, 4, 1, CAST(16990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (51, 30, 2, 2, CAST(34990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (52, 31, 20, 3, CAST(3090000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (53, 32, 2, 1, CAST(34990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (54, 32, 5, 1, CAST(11000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (55, 32, 21, 1, CAST(17000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (56, 32, 28, 1, CAST(41990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (57, 33, 22, 1, CAST(20000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (58, 33, 8, 1, CAST(14990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (59, 34, 79, 1, CAST(26990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (60, 35, 79, 1, CAST(26990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (61, 36, 77, 1, CAST(9000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (62, 36, 78, 1, CAST(6690000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (63, 36, 80, 1, CAST(9500000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (64, 37, 81, 1, CAST(9000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (65, 38, 81, 1, CAST(9000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (66, 39, 65, 1, CAST(690000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (67, 40, 77, 1, CAST(9000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (68, 41, 80, 1, CAST(9500000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (1, N'Đặt hàng thành công')
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (2, N'Được tiếp nhận')
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (3, N'Đang lấy hàng')
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (4, N'Đóng gói xong')
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (5, N'Bàn giao vận chuyển')
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (6, N'Đang vận chuyển')
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (7, N'Giao hàng thành công')
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (8, N'Đã hủy')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
SET IDENTITY_INSERT [dbo].[OrderStatusDetail] ON 

INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (1, 1, 1, CAST(N'2021-07-09T10:15:41.183' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (2, 2, 1, CAST(N'2021-07-09T10:27:11.553' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (3, 8, 1, CAST(N'2021-07-09T10:27:56.460' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (4, 1, 2, CAST(N'2021-07-09T10:28:52.650' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (5, 2, 2, CAST(N'2021-07-09T10:29:47.793' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (6, 3, 2, CAST(N'2021-07-09T10:30:03.187' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (7, 4, 2, CAST(N'2021-07-09T10:31:24.790' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (8, 5, 2, CAST(N'2021-07-09T10:31:30.943' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (9, 6, 2, CAST(N'2021-07-09T10:32:10.433' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (10, 7, 2, CAST(N'2021-07-09T10:33:04.370' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (11, 1, 3, CAST(N'2021-07-09T10:38:22.240' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (12, 8, 3, CAST(N'2021-07-09T10:51:21.123' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (13, 1, 4, CAST(N'2021-07-12T16:55:30.453' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (14, 1, 5, CAST(N'2021-07-13T10:10:01.033' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (15, 1, 6, CAST(N'2021-07-13T10:11:40.977' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (16, 1, 7, CAST(N'2021-07-13T15:35:15.473' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (17, 1, 8, CAST(N'2021-07-13T15:53:49.157' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (18, 1, 9, CAST(N'2021-07-14T17:42:54.570' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (19, 1, 10, CAST(N'2021-07-14T17:46:42.590' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (20, 1, 11, CAST(N'2021-07-14T17:49:11.290' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (21, 1, 12, CAST(N'2021-07-16T10:37:55.730' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (22, 2, 12, CAST(N'2021-07-16T15:23:19.837' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (23, 3, 12, CAST(N'2021-07-16T15:23:27.210' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (24, 4, 12, CAST(N'2021-07-16T15:23:31.457' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (25, 5, 12, CAST(N'2021-07-16T15:23:33.713' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (26, 6, 12, CAST(N'2021-07-16T15:23:35.517' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (27, 7, 12, CAST(N'2021-07-16T15:23:37.093' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (28, 1, 13, CAST(N'2021-07-18T00:31:09.163' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (29, 2, 5, CAST(N'2021-07-20T19:33:27.310' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (30, 1, 14, CAST(N'2021-07-20T19:42:28.447' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (31, 2, 14, CAST(N'2021-07-20T19:43:29.993' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (32, 3, 14, CAST(N'2021-07-20T19:43:46.110' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (33, 4, 14, CAST(N'2021-07-20T19:44:59.797' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (34, 5, 14, CAST(N'2021-07-20T19:45:07.427' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (35, 6, 14, CAST(N'2021-07-20T19:45:13.183' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (36, 7, 14, CAST(N'2021-07-20T19:45:18.283' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (37, 1, 15, CAST(N'2021-07-20T20:19:20.470' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (38, 1, 16, CAST(N'2021-07-20T20:43:46.900' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (39, 1, 17, CAST(N'2021-07-21T08:51:30.147' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (40, 7, 18, CAST(N'2021-07-21T09:40:28.090' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (41, 7, 19, CAST(N'2021-07-21T09:44:31.530' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (42, 7, 20, CAST(N'2021-07-21T09:45:58.470' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (43, 2, 4, CAST(N'2021-07-21T09:51:39.530' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (44, 2, 6, CAST(N'2021-07-21T09:51:41.643' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (45, 2, 9, CAST(N'2021-07-21T09:51:53.827' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (46, 2, 10, CAST(N'2021-07-21T09:51:55.913' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (47, 3, 6, CAST(N'2021-07-21T09:52:04.073' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (48, 2, 7, CAST(N'2021-07-21T09:52:15.290' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (49, 2, 11, CAST(N'2021-07-21T09:52:23.630' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (50, 3, 4, CAST(N'2021-07-21T09:52:30.270' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (51, 4, 4, CAST(N'2021-07-21T09:52:34.413' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (52, 3, 5, CAST(N'2021-07-21T09:52:38.380' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (53, 5, 4, CAST(N'2021-07-21T09:52:42.300' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (54, 4, 5, CAST(N'2021-07-21T09:52:45.583' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (55, 6, 4, CAST(N'2021-07-21T09:52:51.137' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (56, 7, 4, CAST(N'2021-07-21T09:52:55.207' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (57, 5, 5, CAST(N'2021-07-21T09:52:57.013' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (58, 2, 8, CAST(N'2021-07-21T09:53:04.803' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (59, 2, 13, CAST(N'2021-07-21T09:53:07.180' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (60, 2, 15, CAST(N'2021-07-21T09:53:18.807' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (61, 2, 16, CAST(N'2021-07-21T09:53:20.780' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (62, 6, 5, CAST(N'2021-07-21T09:53:26.433' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (63, 7, 5, CAST(N'2021-07-21T09:53:32.697' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (64, 4, 6, CAST(N'2021-07-21T09:53:47.577' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (65, 3, 8, CAST(N'2021-07-21T09:53:47.587' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (66, 3, 7, CAST(N'2021-07-21T09:53:47.583' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (67, 3, 13, CAST(N'2021-07-21T09:54:05.190' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (68, 5, 6, CAST(N'2021-07-21T09:54:13.653' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (69, 6, 6, CAST(N'2021-07-21T09:54:23.327' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (70, 4, 7, CAST(N'2021-07-21T09:54:31.310' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (71, 3, 10, CAST(N'2021-07-21T09:54:37.980' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (72, 2, 17, CAST(N'2021-07-21T09:54:45.997' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (73, 3, 16, CAST(N'2021-07-21T09:54:48.020' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (74, 3, 9, CAST(N'2021-07-21T09:55:06.160' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (75, 3, 11, CAST(N'2021-07-21T09:55:12.930' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (76, 3, 15, CAST(N'2021-07-21T09:55:18.680' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (77, 3, 17, CAST(N'2021-07-21T09:55:24.317' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (78, 4, 8, CAST(N'2021-07-21T09:55:28.460' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (79, 4, 9, CAST(N'2021-07-21T09:55:35.923' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (80, 4, 10, CAST(N'2021-07-21T09:55:41.397' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (81, 4, 11, CAST(N'2021-07-21T09:55:47.540' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (82, 4, 13, CAST(N'2021-07-21T09:55:53.473' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (83, 4, 15, CAST(N'2021-07-21T09:55:58.960' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (84, 4, 16, CAST(N'2021-07-21T09:56:03.783' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (85, 4, 17, CAST(N'2021-07-21T09:56:08.533' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (86, 5, 7, CAST(N'2021-07-21T09:56:13.163' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (87, 5, 8, CAST(N'2021-07-21T09:56:20.503' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (88, 5, 9, CAST(N'2021-07-21T09:56:27.237' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (89, 5, 10, CAST(N'2021-07-21T09:56:31.403' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (90, 5, 11, CAST(N'2021-07-21T09:56:37.490' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (91, 5, 13, CAST(N'2021-07-21T09:56:41.917' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (92, 5, 15, CAST(N'2021-07-21T09:56:46.477' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (93, 5, 16, CAST(N'2021-07-21T09:56:50.873' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (94, 5, 17, CAST(N'2021-07-21T09:56:54.840' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (95, 6, 7, CAST(N'2021-07-21T09:56:59.417' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (96, 6, 8, CAST(N'2021-07-21T09:57:03.923' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (97, 6, 9, CAST(N'2021-07-21T09:57:09.153' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (98, 6, 10, CAST(N'2021-07-21T09:57:15.330' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (99, 6, 11, CAST(N'2021-07-21T09:57:19.993' AS DateTime), 1)
GO
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (100, 6, 13, CAST(N'2021-07-21T09:57:24.703' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (101, 6, 15, CAST(N'2021-07-21T09:57:29.090' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (102, 6, 16, CAST(N'2021-07-21T09:57:34.070' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (103, 6, 17, CAST(N'2021-07-21T09:57:39.180' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (104, 7, 6, CAST(N'2021-07-21T09:57:43.940' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (105, 7, 6, CAST(N'2021-07-21T09:57:45.477' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (106, 7, 7, CAST(N'2021-07-21T09:57:47.240' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (107, 7, 8, CAST(N'2021-07-21T09:57:55.667' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (108, 7, 9, CAST(N'2021-07-21T09:57:57.347' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (109, 7, 10, CAST(N'2021-07-21T09:58:05.570' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (110, 7, 11, CAST(N'2021-07-21T09:58:16.400' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (111, 7, 13, CAST(N'2021-07-21T09:58:23.370' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (112, 7, 16, CAST(N'2021-07-21T09:58:30.867' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (113, 7, 15, CAST(N'2021-07-21T09:58:39.183' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (114, 7, 17, CAST(N'2021-07-21T09:58:48.337' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (115, 7, 21, CAST(N'2021-07-21T09:59:52.923' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (116, 1, 22, CAST(N'2021-07-22T11:10:48.390' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (117, 2, 22, CAST(N'2021-07-22T11:11:55.643' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (118, 3, 22, CAST(N'2021-07-22T11:12:33.473' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (119, 4, 22, CAST(N'2021-07-22T11:12:50.590' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (120, 5, 22, CAST(N'2021-07-22T11:13:15.843' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (121, 6, 22, CAST(N'2021-07-22T11:13:36.567' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (122, 7, 22, CAST(N'2021-07-22T11:13:52.473' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (123, 1, 23, CAST(N'2021-07-22T13:19:33.110' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (124, 1, 24, CAST(N'2021-07-22T20:47:50.950' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (125, 2, 23, CAST(N'2021-07-22T20:54:47.037' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (126, 1, 25, CAST(N'2021-07-22T23:29:21.050' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (127, 3, 23, CAST(N'2021-07-22T23:34:21.080' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (128, 1, 26, CAST(N'2021-07-22T23:49:49.007' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (129, 2, 26, CAST(N'2021-07-22T23:50:36.167' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (130, 3, 26, CAST(N'2021-07-22T23:50:54.000' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (131, 4, 26, CAST(N'2021-07-22T23:51:11.843' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (132, 5, 26, CAST(N'2021-07-22T23:51:28.120' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (133, 6, 26, CAST(N'2021-07-22T23:51:39.927' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (134, 7, 26, CAST(N'2021-07-22T23:51:51.930' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (135, 1, 27, CAST(N'2021-07-22T23:59:45.453' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (136, 1, 28, CAST(N'2021-07-23T14:11:58.753' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (137, 1, 29, CAST(N'2021-07-23T14:16:32.250' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (138, 2, 24, CAST(N'2021-07-23T14:25:08.917' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (139, 8, 24, CAST(N'2021-07-23T14:25:41.243' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (140, 7, 30, CAST(N'2021-07-23T14:26:56.597' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (141, 8, 29, CAST(N'2021-07-24T18:38:53.023' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (142, 1, 31, CAST(N'2021-07-24T18:40:00.830' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (143, 1, 32, CAST(N'2021-07-24T20:21:18.350' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (144, 2, 32, CAST(N'2021-07-24T20:22:43.933' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (145, 3, 32, CAST(N'2021-07-24T20:23:02.163' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (146, 4, 32, CAST(N'2021-07-24T20:23:17.167' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (147, 5, 32, CAST(N'2021-07-24T20:23:31.900' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (148, 6, 32, CAST(N'2021-07-24T20:23:46.360' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (149, 7, 32, CAST(N'2021-07-24T20:23:59.033' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (150, 1, 33, CAST(N'2021-07-25T16:00:44.077' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (151, 2, 33, CAST(N'2021-07-25T16:01:09.967' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (152, 3, 33, CAST(N'2021-07-25T16:01:22.540' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (153, 4, 33, CAST(N'2021-07-25T16:01:30.550' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (154, 5, 33, CAST(N'2021-07-25T16:01:49.397' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (155, 6, 33, CAST(N'2021-07-25T16:02:03.593' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (156, 7, 33, CAST(N'2021-07-25T16:02:14.030' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (157, 8, 25, CAST(N'2021-07-25T22:47:55.917' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (158, 1, 34, CAST(N'2021-07-29T23:43:31.190' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (159, 2, 34, CAST(N'2021-07-29T23:46:18.313' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (160, 3, 34, CAST(N'2021-07-29T23:46:28.337' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (161, 4, 34, CAST(N'2021-07-29T23:46:34.797' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (162, 5, 34, CAST(N'2021-07-29T23:46:39.870' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (163, 6, 34, CAST(N'2021-07-29T23:46:44.977' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (164, 7, 34, CAST(N'2021-07-29T23:46:51.813' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (165, 1, 35, CAST(N'2021-07-29T23:55:36.503' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (166, 2, 35, CAST(N'2021-07-29T23:57:47.373' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (167, 3, 35, CAST(N'2021-07-29T23:58:16.720' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (168, 4, 35, CAST(N'2021-07-29T23:58:26.830' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (169, 5, 35, CAST(N'2021-07-29T23:59:53.420' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (170, 6, 35, CAST(N'2021-07-30T00:00:01.337' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (171, 7, 35, CAST(N'2021-07-30T00:00:18.320' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (172, 1, 36, CAST(N'2021-07-30T08:55:59.250' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (173, 2, 36, CAST(N'2021-07-30T08:56:22.367' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (174, 3, 36, CAST(N'2021-07-30T08:56:31.040' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (175, 4, 36, CAST(N'2021-07-30T08:56:36.453' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (176, 5, 36, CAST(N'2021-07-30T08:56:41.320' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (177, 6, 36, CAST(N'2021-07-30T08:56:45.210' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (178, 7, 36, CAST(N'2021-07-30T08:56:49.497' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (179, 1, 37, CAST(N'2021-07-30T09:16:13.520' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (180, 2, 37, CAST(N'2021-07-30T09:16:46.683' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (181, 3, 37, CAST(N'2021-07-30T09:16:57.433' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (182, 4, 37, CAST(N'2021-07-30T09:17:04.490' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (183, 5, 37, CAST(N'2021-07-30T09:17:27.187' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (184, 6, 37, CAST(N'2021-07-30T09:17:33.177' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (185, 7, 37, CAST(N'2021-07-30T09:17:39.557' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (186, 1, 38, CAST(N'2021-07-30T09:30:22.447' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (187, 1, 39, CAST(N'2021-07-30T09:38:44.307' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (188, 1, 40, CAST(N'2021-07-30T09:53:33.670' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (189, 2, 40, CAST(N'2021-07-30T09:54:16.117' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (190, 3, 40, CAST(N'2021-07-30T09:54:26.037' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (191, 4, 40, CAST(N'2021-07-30T09:54:32.330' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (192, 5, 40, CAST(N'2021-07-30T09:54:53.897' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (193, 6, 40, CAST(N'2021-07-30T09:54:58.777' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (194, 7, 40, CAST(N'2021-07-30T09:55:04.070' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (195, 1, 41, CAST(N'2021-07-30T14:40:11.327' AS DateTime), NULL)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (196, 2, 41, CAST(N'2021-07-30T14:41:11.727' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (197, 3, 41, CAST(N'2021-07-30T14:41:23.017' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (198, 4, 41, CAST(N'2021-07-30T14:41:45.113' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (199, 5, 41, CAST(N'2021-07-30T14:41:58.237' AS DateTime), 1)
GO
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (200, 6, 41, CAST(N'2021-07-30T14:42:11.907' AS DateTime), 1)
INSERT [dbo].[OrderStatusDetail] ([Id], [StatusId], [OrderId], [CreatedDate], [EmpId]) VALUES (201, 7, 41, CAST(N'2021-07-30T14:42:20.423' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[OrderStatusDetail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, N'Laptop Apple MacBook Air 2017 i5 1.8GHz 8GB 128GB (MQD32SA A)', CAST(18990000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i5 Broadwell, 1.80 GHz</p>
<p><strong>RAM: </strong>8 GB, DDR3L(On board), 1600 MHz</p>
<p><strong>Ổ cứng: </strong>SSD: 128 GB</p>
<p><strong>Màn hình: </strong>13.3 inch, WXGA+(1440 x 900)</p>
<p><strong>Card màn hình: </strong>Card đồ họa tích hợp, Intel HD Graphics 6000</p>
<p><strong>Cổng kết nối </strong>MagSafe 2, 2 x USB 3.0, Thunderbolt 3</p>
<p><strong>Hệ điều hành: </strong>Mac OS</p>
<p><strong>Thiết kế: </strong>Vỏ kim loại nguyên khối, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 17 mm, 1.35 Kg</p>
<p><strong>Thời điểm ra mắt: </strong>2017</p>', N'MacBook Air 2017 i5 128GB là mẫu laptop văn phòng, có thiết kế siêu mỏng và nhẹ, vỏ nhôm nguyên khối sang trọng. Máy có hiệu năng ổn định, thời lượng pin cực lâu 12 giờ, phù hợp cho hầu hết các nhu cầu làm việc và giải trí.', 60, 58, 0, 3, N'laptop-apple-macbook-air-2017-i5-18ghz-8gb-128gb-mqd32sa-a', CAST(N'2021-07-07T21:01:50.823' AS DateTime), CAST(N'2021-07-19T21:38:15.457' AS DateTime), N'hieunguyen', N'hieunguyen')
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (2, N'Laptop Apple MacBook Pro M1 2020 8GB 256GB (MYD82SA A)', CAST(34990000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Apple M1</p>
<p><strong>RAM: </strong>8 GB</p>
<p><strong>Ổ cứng: </strong>SSD: 256 GB</p>
<p><strong>Màn hình: </strong>13.3 inch, Retina (2560 x 1600)</p>
<p><strong>Card màn hình: </strong>Card đồ họa tích hợp, 8 nhân GPU</p>
<p><strong>Cổng kết nối </strong>2 x Thunderbolt 3 (USB-C)</p>
<p><strong>Hệ điều hành: </strong>Mac OS</p>
<p><strong>Thiết kế: </strong>Vỏ kim loại nguyên khối, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 15.6 mm, 1.4 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2020</p>', N'Apple Macbook Pro M1 2020 (MYD82SA/A) sở hữu thiết kế sang trọng từ kim loại nguyên khối được kế thừa từ các thế hệ trước nhưng bên trong là một cấu hình cực kỳ đáng gờm. Với chip M1 lần đầu tiên xuất hiện trên MacBook Pro, hiệu năng CPU của máy tăng đến 2.8 lần, hiệu năng GPU tăng 5 lần.', 50, 47, 0, 3, N'laptop-apple-macbook-pro-m1-2020-8gb-256gb-myd82sa-a', CAST(N'2021-07-07T21:41:19.223' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (3, N'Laptop Asus VivoBook X509JA i3 1005G1 4GB 256GB Win10 (EJ480T)', CAST(10690000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i3 Ice Lake, 1005G1, 1.20 GHz</p>
<p><strong>RAM: </strong>4 GB, DDR4 (On board +1 khe), 2666 MHz</p>
<p><strong>Ổ cứng: </strong>SSD 256GB NVMe PCIe, Hỗ trợ khe cắm HDD SATA</p>
<p><strong>Màn hình: </strong>15.6 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa tích hợp, Intel UHD Graphics</p>
<p><strong>Cổng kết nối </strong>2 x USB 2.0, USB 3.1, HDMI, USB Type-C</p>
<p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ nhựa, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 22.9 mm, 1.73 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2020</p>', N'Asus VivoBook X509JA i3 (EJ480T) là mẫu laptop học tập - văn phòng được trang bị hiệu năng ổn định kết hợp cùng màn hình có viền siêu mỏng mang lại trải nghiệm tốt cho công việc, học tập hay giải trí của các bạn sinh viên, nhân viên văn phòng năng động hiện nay.', 50, 46, 0, 4, N'laptop-asus-vivobook-x509ja-i3-1005g1-4gb-256gb-win10-ej480t', CAST(N'2021-07-07T21:50:52.867' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (4, N'Laptop Asus VivoBook A415EA i5 1135G7 8GB 512GB Win10 (EB354T)', CAST(16990000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i5 Tiger Lake, 1135G7, 2.40 GHz</p>
<p><strong>RAM: </strong>8 GB, DDR4 (On board), 3200 MHz</p>
<p><strong>Ổ cứng: </strong>SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm SSD M.2 PCIe</p>
<p><strong>Màn hình: </strong>14 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa tích hợp, Intel® Iris® Xe Graphics</p>
<p><strong>Cổng kết nối </strong>2 x USB 2.0, USB 3.1, HDMI, USB Type-C</p>
<p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ nhựa - nắp lưng bằng kim loại, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 17.9 mm, 1.4 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2020</p>', N'Asus VivoBook A415EA i5 (EB354T) là chiếc laptop 14 inch nhỏ gọn nhưng vô cùng mạnh mẽ. Nhờ đó, bạn sẽ được tận hưởng hiệu suất cao cho công việc trên chiếc máy tính xách tay siêu mỏng nhẹ này.', 50, 46, 0, 4, N'laptop-asus-vivobook-a415ea-i5-1135g7-8gb-512gb-win10-eb354t', CAST(N'2021-07-07T21:52:19.130' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, N'Laptop HP 15s fq1111TU i3 1005G1 4GB 256GB Win10 (193R0PA)', CAST(11000000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i5 Tiger Lake, 1135G7, 2.40 GHz</p>
<p><strong>RAM: </strong>8 GB, DDR4 (2 khe), 3200 MHz</p>
<p><strong>Ổ cứng: </strong>SSD 512 GB M.2 PCIe</p>
<p><strong>Màn hình: </strong>15.6 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa tích hợp, Intel® Iris® Xe Graphics</p>
<p><strong>Cổng kết nối </strong>2 x USB 3.1, HDMI, USB Type-C</p>
<p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ nhựa, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 18 mm, 1.592 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2020</p>', N'Laptop HP 15s fq1111TU i3 (193R0PA) sở hữu độ hoàn thiện cao, thân máy mỏng nhẹ cùng cấu hình đủ dùng cho học tập, làm việc văn phòng và lướt web giải trí.', 50, 49, 0, 5, N'laptop-hp-15s-fq1111tu-i3-1005g1-4gb-256gb-win10-193r0pa', CAST(N'2021-07-07T21:53:24.663' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (6, N'Laptop HP 16s fq1111TU i3 1005G1 4GB 256GB Win10 (193R0PA)', CAST(11190000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i3 Ice Lake, 1005G1, 1.20 GHz</p>
<p><strong>RAM: </strong>4 GB, DDR4 (2 khe), 2666 MHz</p>
<p><strong>Ổ cứng: </strong>SSD 256GB NVMe PCIe, Hỗ trợ khe cắm HDD SATA</p>
<p><strong>Màn hình: </strong>15.6 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa tích hợp, Intel UHD Graphics</p>
<p><strong>Cổng kết nối </strong>2 x USB 3.0, HDMI, USB Type-C</p>
<p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ nhựa, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 18 mm, 1.69 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2020</p>', N'Laptop HP 16s fq1111TU i3 (193R0PA) sở hữu độ hoàn thiện cao, thân máy mỏng nhẹ cùng cấu hình đủ dùng cho học tập, làm việc văn phòng và lướt web giải trí.', 50, 49, 0, 5, N'laptop-hp-16s-fq1111tu-i3-1005g1-4gb-256gb-win10-193r0pa', CAST(N'2021-07-07T21:54:57.870' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (7, N'Laptop Lenovo IdeaPad S145 15IIL i3 1005G1 4GB 256GB Win10 (81W8001XVN)', CAST(11490000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i3 Ice Lake, 1005G1, 1.20 GHz</p>
<p><strong>RAM: </strong>4 GB, DDR4 (On board +1 khe), 2666 MHz</p>
<p><strong>Ổ cứng: </strong>SSD 256GB NVMe PCIe, Hỗ trợ khe cắm HDD SATA</p>
<p><strong>Màn hình: </strong>15.6 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa tích hợp, Intel UHD Graphics</p>
<p><strong>Cổng kết nối </strong>2 x USB 3.0, HDMI, USB 2.0</p>
<p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ nhựa, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 17.9 mm, 1.79kg</p>
<p><strong>Thời điểm ra mắt: </strong>2019</p>', N'Laptop Lenovo IdeaPad S145 15IIL i3 (81W8001XVN) thuộc phân khúc laptop học tập văn phòng cơ bản với mức giá tốt. Máy có cấu hình ổn, đủ chạy các ứng dụng văn phòng phổ biến, điểm nổi bật của Lenovo IdeaPad S145 là ổ cứng SSD siêu nhanh, thiết kế mỏng gọn, tinh tế.', 50, 48, 0, 6, N'laptop-lenovo-ideapad-s145-15iil-i3-1005g1-4gb-256gb-win10-81w8001xvn', CAST(N'2021-07-07T22:02:31.307' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (8, N'Laptop Lenovo IdeaPad S145 15IIL i5 1035G1 8GB 512GB Win10 (81W80021VN)', CAST(14990000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i5 Ice Lake, 1035G1, 1.00 GHz</p>
<p><strong>RAM: </strong>8 GB, DDR4 (On board 4GB +1 khe 4GB), 2666 MHz</p>
<p><strong>Ổ cứng: </strong>SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA</p>
<p><strong>Màn hình: </strong>15.6 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa tích hợp, Intel UHD Graphics</p>
<p><strong>Cổng kết nối </strong>2 x USB 3.0, HDMI, USB 2.0</p>
<p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ nhựa, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 17.9 mm, 1.79kg</p>
<p><strong>Thời điểm ra mắt: </strong>2019</p>', N'Lenovo IdeaPad S145 15IIL i5 (81W80021VN) là mẫu laptop có cấu hình đáp ứng tốt công việc văn phòng, học tập. Thiết bị sở hữu ổ cứng SSD cho tốc độ xử lí nhanh chóng, màn hình Full HD sắc nét.', 50, 49, 0, 6, N'laptop-lenovo-ideapad-s145-15iil-i5-1035g1-8gb-512gb-win10-81w80021vn', CAST(N'2021-07-07T22:03:59.237' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, N'Laptop Dell Vostro 5502 i5 1135G7 8GB 256GB Win10 (70231340)', CAST(18690000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i5 Tiger Lake, 1135G7, 2.40 GHz</p>
<p><strong>RAM: </strong>8 GB, DDR4 (2 khe), 3200 MHz</p>
<p><strong>Ổ cứng: </strong>SSD 256GB NVMe PCIe, Hỗ trợ khe cắm SSD M.2 PCIe</p>
<p><strong>Màn hình: </strong>15.6 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa tích hợp, Intel® Iris® Xe Graphics</p>
<p><strong>Cổng kết nối </strong>USB Type-C (Power Delivery and DisplayPort), 2 x USB 3.2, HDMI, LAN (RJ45)</p>
<p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ nhựa - nắp lưng bằng kim loại, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 17.9 mm, 1.7 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2020</p>', N'Laptop Dell Vostro 5502 i5 (70231340) nổi bật với thiết kế mỏng nhẹ, hiệu năng mạnh mẽ với chip xử lí thế hệ mới cùng bảo mật vân tay hiện đại mang đến cho học sinh sinh viên và dân văn phòng một sự lựa chọn tốt trong phân khúc.', 50, 49, 0, 2, N'laptop-dell-vostro-5502-i5-1135g7-8gb-256gb-win10-70231340', CAST(N'2021-07-07T22:05:20.597' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, N'Laptop Dell Vostro 5402 i5 1135G7 8GB 256GB Win10 (V4I5003W)', CAST(18290000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i5 Tiger Lake, 1135G7, 2.40 GHz</p>
<p><strong>RAM: </strong>8 GB, DDR4 (2 khe), 3200 MHz</p>
<p><strong>Ổ cứng: </strong>SSD 256GB NVMe PCIe</p>
<p><strong>Màn hình: </strong>15.6 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa tích hợp, Intel® Iris® Xe Graphics</p>
<p><strong>Cổng kết nối </strong>2 x USB 3.2, HDMI, LAN (RJ45), USB Type-C</p>
<p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ kim loại, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 17.9 mm, 1.41 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2020</p>', N'Laptop Dell Vostro 5402 i5 (V4I5003W) có cấu hình máy mạnh mẽ nhờ chip Intel thế hệ thứ 11 và thiết kế đặc trưng hướng đến người dùng văn phòng, sinh viên với khả năng tiết kiệm năng lượng là những điểm đáng chú ý ở dòng laptop này.', 50, 49, 0, 2, N'laptop-dell-vostro-5402-i5-1135g7-8gb-256gb-win10-v4i5003w', CAST(N'2021-07-07T22:06:21.067' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, N'Laptop Dell Vostro 3491 i3 1005G1 4GB 256GB Win10 (70223127)', CAST(10890000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i3 Ice Lake, 1005G1, 1.20 GHz</p>
<p><strong>RAM: </strong>4 GB, DDR4 (2 khe), 2666 MHz</p>
<p><strong>Ổ cứng: </strong>SSD 256GB NVMe PCIe</p>
<p><strong>Màn hình: </strong>14 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa tích hợp, Intel UHD Graphics</p>
<p><strong>Cổng kết nối </strong>2 x USB 3.1, HDMI, LAN (RJ45), USB 2.0</p>
<p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ kim loại, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 21 mm, 1.66 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2020</p>', N'Laptop Dell Vostro 3491 i3 (70223127) là chiếc máy tính xách tay văn phòng được thiết kế nhỏ gọn, dễ dịch chuyển, cấu hình máy không mạnh nhưng đủ đáp ứng nhu cầu học tập, văn phòng cơ bản, trình duyệt web và làm việc đa nhiệm. ', 50, 45, 0, 2, N'laptop-dell-vostro-3491-i3-1005g1-4gb-256gb-win10-70223127', CAST(N'2021-07-07T22:09:08.330' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, N'Laptop Dell Vostro 3590 i7 10510U 8GB 256GB 2GB 610R5 Win10 (GRMGK2)', CAST(20490000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i7 Comet Lake, 10510U, 1.80 GHz</p>
<p><strong>RAM: </strong>8 GB, DDR4 (On board +1 khe), 2666 MHz</p>
<p><strong>Ổ cứng: </strong>SSD 256GB NVMe PCIe, Hỗ trợ khe cắm HDD SATA</p>
<p><strong>Màn hình: </strong>15.6 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa rời, AMD Radeon 610R5, 2GB</p>
<p><strong>Cổng kết nối </strong>2 x USB 3.1, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)</p>
<p><strong>Hệ điều hành: </strong>	Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ nhựa, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 19.8 mm, 1.99 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2019</p>', N'Laptop Dell Vostro 3590 i7 (GRMGK2) là phiên bản laptop đồ họa kĩ thuật có thiết kế hiện đại, cấu hình khỏe với vi xử lí gen 10 và card đồ họa rời. Đây chính là chiếc laptop đáng cân nhắc đối với dân đồ họa hay sinh viên khối ngành kĩ thuật.', 50, 47, 0, 2, N'laptop-dell-vostro-3590-i7-10510u-8gb-256gb-2gb-610r5-win10-grmgk2', CAST(N'2021-07-07T22:10:17.223' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, N'Laptop Dell Vostro 3401 i3 1005G1 4GB 256GB+1TB Win10 (70227392)', CAST(12790000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i3 Ice Lake, 1005G1, 1.20 GHz</p>
<p><strong>RAM: </strong>4 GB, DDR4 (2 khe), 2666 MHz</p>
<p><strong>Ổ cứng: </strong>SSD 256GB NVMe PCIe, HDD: 1 TB</p>
<p><strong>Màn hình: </strong>14 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa tích hợp, Intel UHD Graphics</p>
<p><strong>Cổng kết nối </strong>2 x USB 3.2, HDMI, LAN (RJ45), USB 2.0</p>
<p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ nhựa, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 19.9 mm, 1.64 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2020</p>', N'Laptop Dell Vostro 3401 (70227392) mang tới trải nghiệm tuyệt vời cho giới văn phòng và học sinh - sinh viên nhờ sở hữu cấu hình đáp ứng tốt các nhu cầu thường ngày với một mức giá rất ư là phải chăng', 50, 49, 0, 2, N'laptop-dell-vostro-3401-i3-1005g1-4gb-256gb1tb-win10-70227392', CAST(N'2021-07-07T22:25:32.917' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, N'Laptop Dell Inspiron 5502 i5 1135G7 8GB 512GB Win10 (1XGR11)', CAST(20490000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i5 Tiger Lake, 1135G7, 2.40 GHz</p>
<p><strong>RAM: </strong>8 GB, DDR4 (2 khe)</p>
<p><strong>Ổ cứng: </strong>SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm SSD M.2 PCIe</p>
<p><strong>Màn hình: </strong>14 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa tích hợp, Intel® Iris® Xe Graphics</p>
<p><strong>Cổng kết nối </strong>2 x USB 3.1, HDMI, USB Type-C</p>
<p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ nhựa - nắp lưng bằng kim loại, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 17.9 mm, 1.7 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2020</p>', N'Laptop Dell Inspiron 5502 i5 (1XGR11) được trang bị cấu hình mạnh mẽ ổn định nhờ chip Intel Core i5 thế hệ thứ 11 hiện đại cùng thiết kế đẹp mắt, sang trọng phù hợp với nhu cầu sử dụng của sinh viên, nhân viên văn phòng.', 50, 50, 0, 2, N'laptop-dell-inspiron-5502-i5-1135g7-8gb-512gb-win10-1xgr11', CAST(N'2021-07-07T22:26:42.767' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, N'Laptop Dell Inspiron 5593 i5 1035G1 8GB 512GB Win10 (7WGNV1)', CAST(17790000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i5 Ice Lake, 1035G1, 1.00 GHz</p>
<p><strong>RAM: </strong>8 GB, DDR4 (On board +1 khe), 2666 MHz</p>
<p><strong>Ổ cứng: </strong>SSD 512 GB M.2 PCIe</p>
<p><strong>Màn hình: </strong>15.6 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa tích hợp, Intel UHD Graphics</p>
<p><strong>Cổng kết nối </strong>2 x USB 3.1, HDMI, LAN (RJ45), USB 2.0</p>
<p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ nhựa, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 19.9 mm, 1.83 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2019</p>', N'Laptop Dell Inspiron 5593 i5 (7WGNV1) là mẫu laptop học tập - văn phòng tầm trung hướng đến khách hàng là giới văn phòng hay học sinh sinh viên. Với thiết kế đơn giản, vi xử lí thế hệ mới mạnh mẽ, Inspiron 5593 được đánh giá là chiếc laptop đáng sở hữu trong phân khúc giá.', 50, 48, 0, 2, N'laptop-dell-inspiron-5593-i5-1035g1-8gb-512gb-win10-7wgnv1', CAST(N'2021-07-07T22:28:32.740' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (16, N'Laptop Dell Inspiron 5406 i5 1135G7 8GB 512GB Touch Win10 (70232602)', CAST(21490000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i5 Tiger Lake, 1135G7, 2.40 GHz</p>
<p><strong>RAM: </strong>8 GB, DDR4 (2 khe), 3200 MHz</p>
<p><strong>Ổ cứng: </strong>SSD 512 GB M.2 PCIe</p>
<p><strong>Màn hình: </strong>14 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa tích hợp, Intel® Iris® Xe Graphics</p>
<p><strong>Cổng kết nối </strong>2 x USB 3.2, HDMI, USB Type-C</p>
<p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ nhựa - nắp lưng bằng kim loại, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 18.94 mm, 1.72 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2020</p>', N'Không chỉ sở hữu cấu hình mạnh mẽ, Dell Inspiron 5406 i5 (70232602) còn là một chiếc máy tính có khả năng xoay 360 độ và màn hình cảm ứng, giúp bạn có thể làm việc năng động, sáng tạo, linh hoạt hơn.', 50, 50, 0, 2, N'laptop-dell-inspiron-5406-i5-1135g7-8gb-512gb-touch-win10-70232602', CAST(N'2021-07-07T22:30:01.340' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (17, N'Laptop Dell Inspiron 5502 i5 1135G7 8GB 512GB 2GB MX330 Win10 (N5I5310W)', CAST(21190000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i5 Tiger Lake, 1135G7, 2.40 GHz</p>
<p><strong>RAM: </strong>8 GB, DDR4 (2 khe), 3200 MHz</p>
<p><strong>Ổ cứng: </strong>SSD 512 GB M.2 PCIe</p>
<p><strong>Màn hình: </strong>15.6 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa rời, NVIDIA GeForce MX330, 2GB</p>
<p><strong>Cổng kết nối </strong>USB Type-C (Power Delivery and DisplayPort), 2 x USB 3.2, HDMI</p>
<p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>PIN liền</p>
<p><strong>Kích thước:</strong>Dày 17.9 mm, 1.65 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2020</p>', N'Laptop Dell Inspiron 5502 i5 (N5I5310W) có thiết kế mỏng nhẹ thuận tiện cho việc di chuyển, bên cạnh thiết kế đẹp mắt thì hiệu năng của máy cũng là một điều không thể phớt lờ với chip Intel Core i5 Tiger Lake gen 11 đầy mạnh mẽ.', 50, 50, 0, 2, N'laptop-dell-inspiron-5502-i5-1135g7-8gb-512gb-2gb-mx330-win10-n5i5310w', CAST(N'2021-07-07T22:31:05.220' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (18, N'Laptop Dell Inspiron 15 5584 i5 8265U 8GB 2TB 2GB MX130 Win10 (N5I5353W)', CAST(21290000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i5 Coffee Lake, 8265U, 1.60 GHz</p>
<p><strong>RAM: </strong>8 GB, DDR4 (2 khe), 2666 MHz</p>
<p><strong>Ổ cứng: </strong>HDD: 2 TB, Hỗ trợ khe cắm SSD M.2 PCIe</p>
<p><strong>Màn hình: </strong>15.6 inch, Full HD (1920 x 1080)</p>
<p><strong>Card màn hình: </strong>Card đồ họa rời, NVIDIA Geforce MX130, 2GB</p>
<p><strong>Cổng kết nối </strong>	HDMI 1.4, 2 x USB 3.1, LAN (RJ45), USB 2.0</p>
<p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ nhựa, PIN liền</p>
<p><strong>Kích thước:</strong>Dày 22.45 mm, 1.95 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2019</p>', N'Laptop Dell Inspiron 5584 (N5I5353W) là mẫu laptop cho sinh viên với kiểu dáng đơn giản, cứng cáp quen thuộc của dòng Dell Inspiron. Chiếc máy tính xách tay gây ấn tượng bởi cấu hình mạnh mẽ, dung lượng lưu trữ cực lớn cùng các tính năng hiện đại.', 50, 49, 0, 2, N'laptop-dell-inspiron-15-5584-i5-8265u-8gb-2tb-2gb-mx130-win10-n5i5353w', CAST(N'2021-07-07T22:32:06.957' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (19, N'Điện thoại Samsung Galaxy A12 (6GB-128GB)', CAST(4590000 AS Decimal(18, 0)), N'<p>
  <strong>Màn hình: </strong>
    PLS TFT LCD, 6.5", HD+
</p>
<p>
  <strong>Hệ điều hành: </strong>
  Android 10
</p>
<p>
  <strong>Camera sau: </strong>
  Chính 48 MP & Phụ 5 MP, 2 MP, 2 MP
</p>
<p>
  <strong>Camera trước: </strong>
  8 MP
</p>
<p>
  <strong>CPU: </strong>
  MediaTek Helio G35 8 nhân
</p>
<p>
  <strong>RAM: </strong>6 GB
</p>
<p> 
  <strong>Bộ nhớ trong: </strong>
  128 GB
</p>
<p>
  <strong>Thẻ nhớ: </strong>
  MicroSD, hỗ trợ tối đa 1 TB
</p>
<p>
  <strong>Thẻ SIM: </strong>
  2 Nano SIM, Hỗ trợ 4G
</p>
<p>
  <strong>Dung lượng pin: </strong>
  5000 mAh, có sạc nhanh
</p>', N'Gây ấn tượng với bộ tứ camera thời thượng, hiệu năng ổn định mang đến sự mượt mà trong mọi tác vụ, cùng thời lượng pin ấn tượng, Samsung Galaxy A12 (6GB/128GB) sẽ là mẫu smartphone đáng mua nhất trong phân khúc tầm trung giá rẻ của Samsung.', 50, 49, 0, 8, N'dien-thoai-samsung-galaxy-a12-6gb-128gb', CAST(N'2021-07-07T22:33:31.423' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (20, N'Điện thoại Samsung Galaxy A02s (3GB-32GB)', CAST(3090000 AS Decimal(18, 0)), N'<p>
  <strong>Màn hình: </strong>
  PLS TFT LCD, 6.5", HD+
</p>
<p>
  <strong>Hệ điều hành: </strong>
  Android 10
</p>
<p>
  <strong>Camera sau: </strong>
  Chính 13 MP & Phụ 2 MP, 2 MP
</p>
<p>
  <strong>Camera trước: </strong>
  5 MP
</p>
<p>
  <strong>CPU: </strong>
  Snapdragon 450 8 nhân
</p>
<p>
  <strong>RAM: </strong>
  3 GB
</p>
<p>
  <strong>Bộ nhớ trong: </strong>
  32 GB
</p>
<p>
  <strong>Thẻ nhớ: </strong>
  MicroSD, hỗ trợ tối đa 1 TB
</p>
<p>
  <strong>Thẻ SIM: </strong>
  2 Nano SIM, Hỗ trợ 4G
</p>
<p>
  <strong>Dung lượng pin: </strong>
  5000 mAh, có sạc nhanh
</p>', N'Samsung Galaxy A02s vừa được Samsung cho ra mắt, là chiếc smartphone phổ thông mỏng nhẹ với hiệu năng vượt trội và gây ấn tượng mạnh với người dùng nhờ thời lượng pin khủng so với mức giá của sản phẩm.', 50, 45, 0, 8, N'dien-thoai-samsung-galaxy-a02s-3gb-32gb', CAST(N'2021-07-07T22:35:49.113' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (21, N'Điện thoại Samsung Galaxy S20', CAST(17000000 AS Decimal(18, 0)), N'<p>
  <strong>Màn hình: </strong>
  Dynamic AMOLED 2X, 6.2", Quad HD+ (2K+)
</p>
<p>
  <strong>Hệ điều hành: </strong>
  Android 10
</p>
<p>
  <strong>Camera sau: </strong>
  Chính 12 MP & Phụ 64 MP, 12 MP
</p>
<p>
  <strong>Camera trước: </strong>
  10 MP
</p>
<p>
  <strong>CPU: </strong>
  Exynos 990 8 nhân
</p>
<p>
  <strong>RAM: </strong>
  8 GB
</p>
<p>
  <strong>Bộ nhớ trong: </strong>
  128 GB
</p>
<p>
  <strong>Thẻ SIM: </strong>
  2 Nano SIM hoặc 1 Nano SIM + 1 eSIM, Hỗ trợ 4G
</p>
<p>
  <strong>Dung lượng pin: </strong>
  4000 mAh, có sạc nhanh
</p>', N'Samsung Galaxy S20 là chiếc điện thoại với thiết kế màn hình tràn viền không khuyết điểm, camera sau ấn tượng, hiệu năng khủng cùng nhiều những đột phá công nghệ nổi bật, dẫn đầu thế giới.', 50, 46, 0, 8, N'dien-thoai-samsung-galaxy-s20', CAST(N'2021-07-07T22:37:15.063' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (22, N'Điện thoại Samsung Galaxy S20+', CAST(20000000 AS Decimal(18, 0)), N'<p>
  <strong>Màn hình: </strong>
  Super AMOLED, 6.7", Full HD+
</p>
<p>
  <strong>Hệ điều hành: </strong>
  Android 10
</p>
<p>
  <strong>Camera sau: </strong>
  Chính 48 MP & Phụ 12 MP, 5 MP
</p>
<p>
  <strong>Camera trước: </strong>
  32 MP
</p>
<p>
  <strong>CPU: </strong>
  Snapdragon 855 8 nhân
</p>
<p>
  <strong>RAM: </strong>
  8 GB
</p>
<p>
  <strong>Bộ nhớ trong: </strong>
  128 GB
</p>
<p>
  <strong>Thẻ SIM: </strong>
  2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G
</p>
<p>
  <strong>Dung lượng pin: </strong>
  4500 mAh, có sạc nhanh
</p>', N'Chiếc điện thoại Samsung Galaxy S20 Plus - Siêu phẩm với thiết kế màn hình tràn viền, hiệu năng đỉnh cao kết hợp cùng nhiều đột phá về công nghệ dẫn đầu thế giới smartphone.', 50, 48, 0, 8, N'dien-thoai-samsung-galaxy-s20', CAST(N'2021-07-07T22:38:19.390' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (23, N'Điện thoại iPhone SE 128GB (2020) (Hộp mới)', CAST(11790000 AS Decimal(18, 0)), N'<p>
  <strong>Màn hình: </strong>
  IPS LCD, 4.7", Retina HD
</p>
<p>
  <strong>Hệ điều hành: </strong>
  iOS 14
</p>
<p>
  <strong>Camera sau: </strong>
  12 MP
</p>
<p>
  <strong>Camera trước: </strong>
  7 MP
</p>
<p>
  <strong>CPU: </strong>
  Apple A13 Bionic 6 nhân
</p>
<p>
  <strong>RAM: </strong>
  3 GB
</p>
<p>
  <strong>Bộ nhớ trong: </strong>
  128 GB
</p>
<p>
  <strong>Thẻ SIM: </strong>
  1 Nano SIM & 1 eSIM, Hỗ trợ 4G
</p>
<p>
  <strong>Dung lượng pin: </strong>
  1821 mAh, có sạc nhanh
</p>', N'Sau bao ngày chờ đợi, iPhone SE 2020 cuối cùng đã được ra mắt làm thỏa mãn triệu tín đồ Táo khuyết. Sở hữu thiết kế siêu nhỏ gọn như iPhone 8, chip A13 Bionic cho hiệu năng khủng như iPhone 11, nhưng iPhone SE 2020 lại có một mức giá tốt đến bất ngờ.', 50, 50, 0, 9, N'dien-thoai-iphone-se-128gb-2020-hop-moi', CAST(N'2021-07-07T22:39:29.880' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (24, N'Điện thoại iPhone SE 64GB (2020) (Hộp mới)', CAST(10490000 AS Decimal(18, 0)), N'<p>
  <strong>Màn hình: </strong>
  IPS LCD, 4.7", Retina HD
</p>
<p>
  <strong>Hệ điều hành: </strong>
  iOS 14
</p>
<p>
  <strong>Camera sau: </strong>
  12 MP
</p>
<p>
  <strong>Camera trước: </strong>
  7 MP
</p>
<p>
  <strong>CPU: </strong>
  Apple A13 Bionic 6 nhân
</p>
<p>
  <strong>RAM: </strong>
  3 GB
</p>
<p>
  <strong>Bộ nhớ trong: </strong>
  64 GB
</p>
<p>
  <strong>Thẻ SIM: </strong>
  1 Nano SIM & 1 eSIM, Hỗ trợ 4G
</p>
<p>
  <strong>Dung lượng pin: </strong>
  1821 mAh, có sạc nhanh
</p>', N'iPhone SE 2020 đã bất ngờ ra mắt với thiết kế 4.7 inch nhỏ gọn, chip A13 Bionic mạnh mẽ như trên iPhone 11 và đặc biệt sở hữu mức giá tốt chưa từng có.', 50, 50, 0, 9, N'dien-thoai-iphone-se-64gb-2020-hop-moi', CAST(N'2021-07-07T22:40:35.410' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (25, N'Điện thoại iPhone 12 mini 256GB', CAST(22490000 AS Decimal(18, 0)), N'<p>
  <strong>Màn hình: </strong>
  OLED, 5.4", Super Retina XDR
</p>
<p>
  <strong>Hệ điều hành: </strong>
  iOS 14
</p>
<p>
  <strong>Camera sau: </strong>
  2 camera 12 MP
</p>
<p>
  <strong>Camera trước: </strong>
  12 MP
</p>
<p>
  <strong>CPU: </strong>
  Apple A14 Bionic 6 nhân
</p>
<p>
  <strong>RAM: </strong>
  4 GB
</p>
<p>
  <strong>Bộ nhớ trong: </strong>
  256 GB
</p>
<p>
  <strong>Thẻ SIM: </strong>
  1 Nano SIM & 1 eSIM, Hỗ trợ 5G
</p>
<p>
  <strong>Dung lượng pin: </strong>
  2227 mAh, có sạc nhanh
</p>', N'Apple vừa giới thiệu đến người dùng 4 phiên bản iPhone mới trong sự kiện Hi, Speed! ngày 14/10, trong đó có iPhone 12 Mini 256 GB, đây là sản phẩm hỗ trợ 5G có thiết nhỏ nhất, nhẹ nhất, mỏng nhất trên thế giới cho đến thời điểm hiện tại (10/2020).', 50, 50, 0, 9, N'dien-thoai-iphone-12-mini-256gb', CAST(N'2021-07-07T22:42:29.847' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (26, N'Điện thoại iPhone 12 mini 128GB', CAST(20390000 AS Decimal(18, 0)), N'<p>
  <strong>Màn hình: </strong>
  OLED, 5.4", Super Retina XDR
</p>
<p>
  <strong>Hệ điều hành: </strong>
  iOS 14
</p>
<p>
  <strong>Camera sau: </strong>
  2 camera 12 MP
</p>
<p>
  <strong>Camera trước: </strong>
  12 MP
</p>
<p>
  <strong>CPU: </strong>
  Apple A14 Bionic 6 nhân
</p>
<p>
  <strong>RAM: </strong>
  4 GB
</p>
<p>
  <strong>Bộ nhớ trong: </strong>
  128 GB
</p>
<p>
  <strong>Thẻ SIM: </strong>
  1 Nano SIM & 1 eSIM, Hỗ trợ 5G
</p>
<p>
  <strong>Dung lượng pin: </strong>
  2227 mAh, có sạc nhanh
</p>', N'Apple tiếp tục khẳng định vị thế của mình trên thị trường smartphone khi mới đây cho ra mắt mẫu iPhone 12 với nhiều điểm được tối ưu hơn, nâng cấp mạnh hơn. Trong đó, iPhone 12 mini 128 GB được ví như là phiên bản thu nhỏ hơn là bản rút gọn với cấu hình không khác gì mấy anh lớn có mức giá hấp dẫn hơn.', 50, 49, 1, 9, N'dien-thoai-iphone-12-mini-128gb', CAST(N'2021-07-07T22:43:55.713' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (27, N'Điện thoại iPhone 12 mini 64GB', CAST(19090000 AS Decimal(18, 0)), N'
<p>
  <strong>Màn hình: </strong>
  OLED, 6.7", Super Retina XDR
</p>
<p>
  <strong>Hệ điều hành: </strong>
  iOS 14
</p>
<p>
  <strong>Camera sau: </strong>
  2 camera 12 MP
</p>
<p>
  <strong>Camera trước: </strong>
  12 MP
</p>
<p>
  <strong>CPU: </strong>
  Apple A14 Bionic 6 nhân
</p>
<p>
  <strong>RAM: </strong>
  4 GB
</p>
<p>
  <strong>Bộ nhớ trong: </strong>
  64 GB
</p>
<p>
  <strong>Thẻ SIM: </strong>
  1 Nano SIM & 1 eSIM, Hỗ trợ 5G
</p>
<p>
  <strong>Dung lượng pin: </strong>
  2227 mAh, có sạc nhanh
</p>', N'iPhone 12 Mini 64 GB tuy là phiên bản thấp nhất trong bộ 4 iPhone 12 vừa mới được ra mắt cách đây không lâu, nhưng vẫn sở hữu những ưu điểm vượt trội về kích thước nhỏ gọn, tiện lợi, hiệu năng đỉnh cao, tính năng sạc nhanh cùng bộ camera chất lượng cao', 50, 48, 1, 9, N'dien-thoai-iphone-12-mini-64gb', CAST(N'2021-07-07T22:44:50.510' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (28, N'Điện thoại iPhone 12 Pro Max 512GB', CAST(41990000 AS Decimal(18, 0)), N'<p>
  <strong>Màn hình: </strong>
  OLED, 6.7", Super Retina XDR
</p>
<p>
  <strong>Hệ điều hành: </strong>
  iOS 14
</p>
<p>
  <strong>Camera sau: </strong>
  3 camera 12 MP
</p>
<p>
  <strong>Camera trước: </strong>
  12 MP
</p>
<p>
  <strong>CPU: </strong>
  Apple A14 Bionic 6 nhân
</p>
<p>
  <strong>RAM: </strong>
  6 GB
</p>
<p>
  <strong>Bộ nhớ trong: </strong>
  256 GB
</p>
<p>
  <strong>Thẻ SIM: </strong>
  1 Nano SIM & 1 eSIM, Hỗ trợ 5G
</p>
<p>
  <strong>Dung lượng pin: </strong>
  3687 mAh, có sạc nhanh
</p>', N'iPhone 12 Pro Max 512GB - đẳng cấp từ tên gọi đến từng chi tiết. Ngay từ khi chỉ là tin đồn thì chiếc smartphone này đã làm đứng ngồi không yên bao “fan cứng” nhà Apple, với những nâng cấp vô cùng nổi bật hứa hẹn sẽ mang đến những trải nghiệm tốt nhất về mọi mặt mà chưa một chiếc iPhone tiền nhiệm nào có được.', 50, 49, 1, 9, N'dien-thoai-iphone-12-pro-max-512gb', CAST(N'2021-07-07T22:46:07.307' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (29, N'Điện thoại iPhone 12 Pro 512GB', CAST(38990000 AS Decimal(18, 0)), N'<p>
  <strong>Màn hình: </strong>
  OLED, 6.1", Super Retina XDR
</p>
<p>
  <strong>Hệ điều hành: </strong>
  iOS 14
</p>
<p>
  <strong>Camera sau: </strong>
  3 camera 12 MP
</p>
<p>
  <strong>Camera trước: </strong>
  12 MP
</p>
<p>
  <strong>CPU: </strong>
  Apple A14 Bionic 6 nhân
</p>
<p>
  <strong>RAM: </strong>
  6 GB
</p>
<p>
  <strong>Bộ nhớ trong: </strong>
  512 GB
</p>
<p>
  <strong>Thẻ SIM: </strong>
  1 Nano SIM & 1 eSIM, Hỗ trợ 5G
</p>
<p>
  <strong>Dung lượng pin: </strong>
  2815 mAh, có sạc nhanh
</p>', N'Lại một siêu phẩm nữa của series iPhone 12 được Apple cho ra mắt trong sự kiện “Hi Speed” vừa qua, mang trên mình các yếu tố của một siêu phẩm với nhiều tính năng đặc biệt, hấp dẫn và không ai khác đó chính là iPhone 12 Pro 512 GB.', 50, 49, 1, 9, N'dien-thoai-iphone-12-pro-512gb', CAST(N'2021-07-07T22:47:11.367' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (30, N'Điện thoại iPhone 12 Pro 256GB', CAST(39990000 AS Decimal(18, 0)), N'<p>
  <strong>Màn hình: </strong>
  OLED, 6.1", Super Retina XDR
</p>
<p>
  <strong>Hệ điều hành: </strong>
  iOS 14
</p>
<p>
  <strong>Camera sau: </strong>
  3 camera 12 MP
</p>
<p>
  <strong>Camera trước: </strong>
  12 MP
</p>
<p>
  <strong>CPU: </strong>
  Apple A14 Bionic 6 nhân
</p>
<p>
  <strong>RAM: </strong>
  6 GB
</p>
<p>
  <strong>Bộ nhớ trong: </strong>
  512 GB
</p>
<p>
  <strong>Thẻ SIM: </strong>
  1 Nano SIM & 1 eSIM, Hỗ trợ 5G
</p>
<p>
  <strong>Dung lượng pin: </strong>
  2815 mAh, có sạc nhanh
</p>', N'iPhone 12 Pro 256 GB đã chính thức được ra mắt với sự thay đổi lớn về thiết kế bên ngoài chứa đựng một hiệu năng cực khủng bên trong, kèm theo đó là một loạt các công nghệ ấn tượng về camera, kết nối 5G lần đầu được xuất hiện.', 50, 47, 1, 9, N'dien-thoai-iphone-12-pro-256gb', CAST(N'2021-07-07T22:48:08.840' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (31, N'Điện thoại iPhone 12 64GB', CAST(23990000 AS Decimal(18, 0)), N'<p>
  <strong>Màn hình: </strong>
  OLED, 6.1", Super Retina XDR
</p>
<p>
  <strong>Hệ điều hành: </strong>
  iOS 14
</p>
<p>
  <strong>Camera sau: </strong>
  3 camera 12 MP
</p>
<p>
  <strong>Camera trước: </strong>
  12 MP
</p>
<p>
  <strong>CPU: </strong>
  Apple A14 Bionic 6 nhân
</p>
<p>
  <strong>RAM: </strong>
  4 GB
</p>
<p>
  <strong>Bộ nhớ trong: </strong>
  64 GB
</p>
<p>
  <strong>Thẻ SIM: </strong>
  1 Nano SIM & 1 eSIM, Hỗ trợ 5G
</p>
<p>
  <strong>Dung lượng pin: </strong>
  2815 mAh, có sạc nhanh
</p>', N'Trong những tháng cuối năm 2020 Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới với hàng loạt tính năng bức phá, thiết kế được lột xác hoàn toàn, hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12 64GB.', 50, 50, 0, 9, N'dien-thoai-iphone-12-64gb', CAST(N'2021-07-07T22:49:13.490' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (32, N'Điện thoại iPhone 12 128GB', CAST(25690000 AS Decimal(18, 0)), N'<p>
  <strong>Màn hình: </strong>
  OLED, 6.1", Super Retina XDR
</p>
<p>
  <strong>Hệ điều hành: </strong>
  iOS 14
</p>
<p>
  <strong>Camera sau: </strong>
  2 camera 12 MP
</p>
<p>
  <strong>Camera trước: </strong>
  12 MP
</p>
<p>
  <strong>CPU: </strong>
  Apple A14 Bionic 6 nhân
</p>
<p>
  <strong>RAM: </strong>
  4 GB
</p>
<p>
  <strong>Bộ nhớ trong: </strong>
  64 GB
</p>
<p>
  <strong>Thẻ SIM: </strong>
  1 Nano SIM & 1 eSIM, Hỗ trợ 5G
</p>
<p>
  <strong>Dung lượng pin: </strong>
  2815 mAh, có sạc nhanh
</p>', N'Mới đây, Apple đã trình diện đến người dùng mẫu điện thoại iPhone 12 128 GB với sự tuyên bố về một kỷ nguyên mới của iPhone: iPhone 5G siêu nhanh, nâng cấp về màn hình và hiệu năng hứa hẹn đây sẽ là smartphone cao cấp đáng chú ý nhất trong năm nay. ', 50, 49, 1, 9, N'dien-thoai-iphone-12-128gb', CAST(N'2021-07-07T22:50:10.087' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (33, N'Tủ lạnh Panasonic Inverter 170 lít NR-BA190PPVN', CAST(4890000 AS Decimal(18, 0)), N'<p><strong>Kiểu tủ: </strong>Ngăn đá trên</p>
<p><strong>Dung tích: </strong>170 lít</p>
<p><strong>Công suất tiêu thụ công bố theo TCVN: </strong>~0.92 kW/ngày</p>
<p><strong>Tiện ích: </strong>Inverter tiết kiệm điện</p>
<p><strong>Công nghệ làm lạnh: </strong>Làm lạnh vòng cung Panorama</p>
<p><strong>Công nghệ kháng khuẩn khử mùi: </strong>Công nghệ kháng khuẩn Ag Clean với tinh thể bạc Ag+</p>
<p><strong>Nơi sản xuất: </strong>Việt Nam</p>
<p><strong>Năm ra mắt: </strong>2020</p>', N'Vận hành êm ái, tiết kiệm điện tối ưu nhờ sự kết hợp giữa công nghệ Inverter và Econavi
Tủ lạnh Panasonic Inverter 170 lít NR-BA190PPVN sử dụng công nghệ biến tần Inverter có khả năng duy trì làm lạnh ổn định, máy nén hoạt động êm ái, ít gây tiếng ồn hơn và tiết kiệm được điện năng tiêu thụ.', 50, 50, 1, 14, N'tu-lanh-panasonic-inverter-170-lit-nr-ba190ppvn', CAST(N'2021-07-07T22:51:45.290' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (34, N'Tủ lạnh Panasonic Inverter 368 lít NR-BX410WKVN', CAST(18090000 AS Decimal(18, 0)), N'<p><strong>Kiểu tủ: </strong>Ngăn đá dưới</p>
<p><strong>Dung tích: </strong>368 lít</p>
<p><strong>Công suất tiêu thụ công bố theo TCVN: </strong>~0.95 kW/ngày</p>
<p><strong>Tiện ích: </strong>Ngăn đông mềm trữ thịt cá không cần rã đông, Inverter tiết kiệm điện, Lấy nước ngoài kháng khuẩn, Lấy nước bên ngoài</p>
<p><strong>Công nghệ làm lạnh: </strong>Làm lạnh vòng cung Panorama</p>
<p><strong>Công nghệ kháng khuẩn khử mùi: </strong>Công nghệ kháng khuẩn Ag Clean với tinh thể bạc Ag+</p>
<p><strong>Nơi sản xuất: </strong>Thái Lan</p>
<p><strong>Năm ra mắt: </strong>2020</p>', N'Bảo quản thực phẩm tươi mới lên đến 7 ngày, chế biến không cần rã đông với ngăn cấp đông mềm chuẩn -3 độ C thế hệ mới Prime Fresh+
Tủ lạnh Panasonic Inverter 368 lít NR-BX410WKVN được trang bị ngăn đông mềm thế hệ mới Prime Fresh+ với mức nhiệt độ ở -3 độ C giúp đạt trạng thái đông mềm nhanh hơn gấp 4 lần và giảm 20% quá trình oxi hoá thực phẩm.

Bên cạnh đó, do chỉ làm đông nhẹ trên bề mặt nên thực phẩm sẽ không bị đông cứng, dễ dàng chế biến ngay không cần rã đông mà vẫn giữ nguyên được dinh dưỡng, hương vị và tươi mới lên đến 7 ngày.', 50, 50, 1, 14, N'tu-lanh-panasonic-inverter-368-lit-nr-bx410wkvn', CAST(N'2021-07-07T22:52:46.767' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (35, N'Tủ lạnh Panasonic Inverter 255 lít NR-BV280QSVN', CAST(11490000 AS Decimal(18, 0)), N'<p><strong>Kiểu tủ: </strong>Ngăn đá dưới</p>
<p><strong>Dung tích: </strong>255 lít</p>
<p><strong>Công suất tiêu thụ công bố theo TCVN: </strong>~0.9 kW/ngày</p>
<p><strong>Tiện ích: </strong>Ngăn đông mềm trữ thịt cá không cần rã đông, Inverter tiết kiệm điện</p>
<p><strong>Công nghệ làm lạnh: </strong>Làm lạnh vòng cung Panorama</p>
<p><strong>Công nghệ kháng khuẩn khử mùi: </strong>Công nghệ kháng khuẩn Ag Clean với tinh thể bạc Ag+</p>
<p><strong>Nơi sản xuất: </strong>Việt Nam</p>
<p><strong>Năm ra mắt: </strong>2019</p>', N'Ngăn cấp đông mềm thế hệ mới Prime Fresh+ bảo quản thực phẩm không cần rã đông
Tủ lạnh Panasonic Inverter 255 lít NR-BV280QSVN trang bị ngăn đông mềm thế hệ mới Prime Fresh+ với mức nhiệt độ ở -3 độ C giúp thực phẩm tươi sống được làm đông nhanh hơn và tươi mới lên đến 7 ngày mà không bị đông đá. Nhờ vậy, thực phẩm giữ được các chất dinh dưỡng, độ thơm ngon, đồng thời bạn không phải tốn thêm nhiều thời gian để rã đông trước khi chế biến.', 50, 50, 1, 14, N'tu-lanh-panasonic-inverter-255-lit-nr-bv280qsvn', CAST(N'2021-07-07T22:53:47.483' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (36, N'Tủ lạnh Panasonic Inverter 322 lít NR-BC360QKVN', CAST(16090000 AS Decimal(18, 0)), N'<p><strong>Kiểu tủ: </strong>Ngăn đá dưới</p>
<p><strong>Dung tích: </strong>322 lít</p>
<p><strong>Công suất tiêu thụ công bố theo TCVN: </strong>~1.01 kW/ngày</p>
<p><strong>Tiện ích: </strong>Ngăn đông mềm trữ thịt cá không cần rã đông, Inverter tiết kiệm điện</p>
<p><strong>Công nghệ làm lạnh: </strong>Làm lạnh vòng cung Panorama</p>
<p><strong>Công nghệ kháng khuẩn khử mùi: </strong>Công nghệ kháng khuẩn Ag Clean với tinh thể bạc Ag+</p>
<p><strong>Nơi sản xuất: </strong>Việt Nam</p>
<p><strong>Năm ra mắt: </strong>2019</p>', N'Tủ lạnh Panasonic ngăn cấp đông mềm thế hệ mới Prime Fresh+ bảo quản thực phẩm không cần rã đông
Tủ lạnh Panasonic Inverter 322 lít NR-BC360QKVN trang bị ngăn đông mềm thế hệ mới Prime Fresh+ với mức nhiệt độ ở -3 độ C giúp thực phẩm tươi sống được làm đông nhanh mà không bị đông đá và tươi mới lên đến 7 ngày. Do đó, thực phẩm giữ được các chất dinh dưỡng, độ thơm ngon và bạn không phải tốn thêm nhiều thời gian để rã đông trước khi chế biến.

Đặc biệt, ngăn cấp đông mềm thế hệ mới này có sức chứa lớn hơn 78% so với thế hệ trước và được trang bị thêm ngăn kéo, khay nhôm truyền lạnh nhanh giúp bạn có thể phân chia thực phẩm tiện lợi.', 50, 50, 1, 14, N'tu-lanh-panasonic-inverter-322-lit-nr-bc360qkvn', CAST(N'2021-07-07T22:54:56.793' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (37, N'Tủ lạnh Samsung Inverter 647 lít RS62R5001M9 SV', CAST(18700000 AS Decimal(18, 0)), N'<p><strong>Kiểu tủ: </strong>Tủ lớn - Side by side</p>
<p><strong>Dung tích: </strong>647 lít</p>
<p><strong>Công suất tiêu thụ công bố theo TCVN: </strong>~1.71 kW/ngày</p>
<p><strong>Tiện ích: </strong>Inverter tiết kiệm điện, Ngăn đá lớn, Chuông báo khi quên đóng cửa</p>
<p><strong>Công nghệ làm lạnh: </strong>Làm lạnh vòm</p>
<p><strong>Công nghệ kháng khuẩn khử mùi: </strong>Bộ lọc khử mùi than hoạt tính</p>
<p><strong>Công nghệ bảo quản thực phẩm: </strong>Công Nghệ SpaceMax tăng thêm không gian lưu trữ thực phẩm</p>
<p><strong>Nơi sản xuất: </strong>Trung Quốc</p>
<p><strong>Năm ra mắt: </strong>2019</p>
', N'Tủ lạnh Side by Side sang trọng, đẳng cấp
Tủ lạnh Samsung Inverter 647 lít RS62R5001M9/SV có thiết kế kiểu tủ lạnh side by side đẳng cấp, đi cùng gam màu bạc sang trọng, thời thượng, tủ lạnh sẽ là điểm nhấn nổi bật, mang lại cho không gian nội thất của gia đình một vẻ đẹp hiện đại.', 50, 50, 0, 14, N'tu-lanh-samsung-inverter-647-lit-rs62r5001m9-sv', CAST(N'2021-07-07T22:55:55.700' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (38, N'Tủ lạnh Samsung Inverter 208 lít RT19M300BGS SV', CAST(5490000 AS Decimal(18, 0)), N'<p><strong>Kiểu tủ: </strong>Ngăn đá trên</p>
<p><strong>Dung tích: </strong>208 lít</p>
<p><strong>Công suất tiêu thụ công bố theo TCVN: </strong>~0.9 kW/ngày</p>
<p><strong>Tiện ích: </strong>Ngăn rau quả rộng, Inverter tiết kiệm điện</p>
<p><strong>Công nghệ làm lạnh: </strong>Làm lạnh đa chiều</p>
<p><strong>Công nghệ kháng khuẩn khử mùi: </strong>Bộ lọc than hoạt tính Deodorizer</p>
<p><strong>Công nghệ bảo quản thực phẩm: </strong> Ngăn rau củ lớn giữ ẩm Big Box</p>
<p><strong>Nơi sản xuất: </strong>Việt Nam</p>
<p><strong>Năm ra mắt: </strong>2017</p>', N'Thiết kế sang trọng, hiện đại
Bao quát bởi tông màu xám bạc cực kỳ sang trọng, tủ lạnh Samsung RT19M300BGS/SV sẽ góp phần mang đến vẻ đẹp hiện đại cho bất kỳ không gian nội thất nào.', 50, 50, 0, 14, N'tu-lanh-samsung-inverter-208-lit-rt19m300bgs-sv', CAST(N'2021-07-07T22:57:06.467' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (39, N'Máy lạnh Panasonic Inverter 1.5 HP CU CS-PU12WKH-8M', CAST(12890000 AS Decimal(18, 0)), N'<p><strong>Công suất lạnh: </strong>1.5 HP - 11.900 BTU</p>
<p><strong>Loại máy: </strong>Máy lạnh 1 chiều (chỉ làm lạnh)</p>
<p><strong>Phạm vi làm lạnh hiệu quả: </strong>Từ 15 - 20 m2 (từ 40 đến 60 m3)</p>
<p><strong>Công nghệ inverter: </strong>Máy lạnh Inverter</p>
<p><strong>Công suất tiêu thụ điện trung bình: </strong>1.07 kW/h</p>
<p><strong>Nhãn năng lượng tiết kiệm điện: </strong>5 sao (Hiệu suất năng lượng 4.96)</p>
<p><strong>Tiện ích: </strong>Phát ion lọc không khí, Chức năng hút ẩm, Hẹn giờ bật tắt máy, Làm lạnh nhanh tức thì, Tự khởi động lại khi có điện, Chế độ vận hành khi ngủ</p>
<p><strong>Chế độ tiết kiệm điện: </strong>ECO tích hợp A.I</p>
<p><strong>Công nghệ kháng khuẩn khử mùi: </strong>Nanoe-G</p>
<p><strong>Nơi lắp ráp:  </strong>Malaysia</p>', N'Bầu không khí trong lành, sạch bụi bẩn, bụi mịn PM2.5 cùng công nghệ Nanoe-G
Nanoe-G giải phóng các ion âm xung quanh máy lạnh. Các ion này sẽ gắn kết với các hạt bụi theo dòng không khí vào trong ống nạp khí của máy lạnh. Sau đó, các hạt bụi tích điện âm này bị màng lọc tích điện dương giữ lại và vô hiệu hóa tại màng lọc, giúp không khí sạch bụi bẩn, bụi mịn PM2.5, đảm bảo an toàn sức khoẻ cho gia đình bạn.
Bạn cũng có thể sử dụng chức năng này độc lập với hệ thống làm lạnh, cho phép sử dụng chiếc máy lạnh Panasonic Inverter này như một chiếc máy lọc khí thực thụ.', 50, 50, 1, 19, N'may-lanh-panasonic-inverter-15-hp-cu-cs-pu12wkh-8m', CAST(N'2021-07-07T22:58:18.513' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (40, N'Máy lạnh Panasonic Inverter 1.5 HP CU CS-XU12UKH-8', CAST(14890000 AS Decimal(18, 0)), N'<p><strong>Công suất lạnh: </strong>1.5 HP - 11.900 BTU</p>
<p><strong>Loại máy: </strong>Máy lạnh 1 chiều (chỉ làm lạnh)</p>
<p><strong>Phạm vi làm lạnh hiệu quả: </strong>Từ 15 - 20 m2 (từ 40 đến 60 m3)</p>
<p><strong>Công nghệ inverter: </strong>Máy lạnh Inverter</p>
<p><strong>Công suất tiêu thụ điện trung bình: </strong>0.92 kW/h</p>
<p><strong>Nhãn năng lượng tiết kiệm điện: </strong>5 sao (Hiệu suất năng lượng 6.06)</p>
<p><strong>Tiện ích: </strong>Phát ion lọc không khí, Chức năng hút ẩm, Hẹn giờ bật tắt máy, Làm lạnh nhanh tức thì, Tự khởi động lại khi có điện, Chế độ vận hành khi ngủ</p>
<p><strong>Chế độ tiết kiệm điện: </strong>Chỉ có Inverter</p>
<p><strong>Công nghệ kháng khuẩn khử mùi: </strong>NanoeX, Nanoe-G</p>
<p><strong>Nơi lắp ráp:  </strong>Malaysia</p>', N'Thiết kế thanh lịch, đơn giản
Máy lạnh Panasonic Inverter 1.5 HP CU/CS-XU12UKH-8 vừa được ra mắt trong năm 2018. Máy lạnh có thiết kế thanh lịch, đơn giản dễ dàng phù hợp với mọi kiểu không gian nội thất.

Với công suất hoạt động là 1.5 HP, máy lạnh là sự lựa chọn lý tưởng cho phòng có diện tích 15 m2 – 20 m2.', 50, 49, 1, 19, N'may-lanh-panasonic-inverter-15-hp-cu-cs-xu12ukh-8', CAST(N'2021-07-07T22:59:23.883' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (41, N'Máy lạnh Daikin Inverter 1 HP ATKQ25TAVMV', CAST(10340000 AS Decimal(18, 0)), N'<p><strong>Công suất lạnh: </strong>1 HP - 9.000 BTU</p>
<p><strong>Loại máy: </strong>Máy lạnh 1 chiều (chỉ làm lạnh)</p>
<p><strong>Phạm vi làm lạnh hiệu quả: </strong>Dưới 15 m2 (từ 30 đến 45 m3)</p>
<p><strong>Công nghệ inverter: </strong>Máy lạnh Inverter</p>
<p><strong>Công suất tiêu thụ điện trung bình: </strong>0.81 kW/h</p>
<p><strong>Nhãn năng lượng tiết kiệm điện: </strong>5 sao (Hiệu suất năng lượng 4.5)</p>
<p><strong>Tiện ích: </strong>Chế độ chỉ sử dụng quạt - không làm lạnh, Chức năng hút ẩm, Thổi gió dễ chịu (cho trẻ em, người già), Hẹn giờ bật tắt máy, Làm lạnh nhanh tức thì, Tự khởi động lại khi có điện</p>
<p><strong>Chế độ tiết kiệm điện: </strong>Econo</p>
<p><strong>CLàm lạnh nhanh: </strong>Powerful</p>
<p><strong>Nơi lắp ráp: </strong>Việt Nam</p>', N'Kiểu dáng đơn giản, thanh lịch
Máy lạnh Daikin Inverter 1 HP ATKQ25TAVMV mang kiểu dáng đơn giản kết hợp với gam màu trắng trung tính sẽ mang lại vẻ đẹp thanh lịch nhưng không kém phần sang trọng cho không gian nội thất của gia đình.

Bên cạnh đó, với công suất làm lạnh 1 HP, máy lạnh là sự lựa chọn lý tưởng cho phòng dưới 15 m2 như: Phòng làm việc cá nhân, phòng ngủ nhỏ,...', 50, 50, 0, 20, N'may-lanh-daikin-inverter-1-hp-atkq25tavmv', CAST(N'2021-07-07T23:00:39.917' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (42, N'Máy lạnh Daikin Inverter 1 HP ATKA25UAVMV', CAST(10590000 AS Decimal(18, 0)), N'<p><strong>Công suất lạnh: </strong>1.5 HP - 8.500 BTU</p>
<p><strong>Loại máy: </strong>Máy lạnh 1 chiều (chỉ làm lạnh)</p>
<p><strong>Phạm vi làm lạnh hiệu quả: </strong>Từ 15 - 20 m2 (từ 40 đến 60 m3)</p>
<p><strong>Công nghệ inverter: </strong>Máy lạnh Inverter</p>
<p><strong>Công suất tiêu thụ điện trung bình: </strong>0.92 kW/h</p>
<p><strong>Nhãn năng lượng tiết kiệm điện: </strong>5 sao (Hiệu suất năng lượng 4.66)</p>
<p><strong>Tiện ích: </strong>Phát ion lọc không khí, Chức năng hút ẩm, Hẹn giờ bật tắt máy, Làm lạnh nhanh tức thì, Tự khởi động lại khi có điện, Chế độ vận hành khi ngủ</p>
<p><strong>Chế độ tiết kiệm điện: </strong>Chỉ có Inverter</p>
<p><strong>Công nghệ kháng khuẩn khử mùi: </strong>Chỉ có lưới lọc bụi thô</p>
<p><strong>CLàm lạnh nhanh: </strong>Powerful</p>
<p><strong>Nơi lắp ráp: </strong>Việt Nam</p>', N'Luồng gió thoải mái, không bị gió thổi trực tiếp gây khó chịu với hiệu ứng gió Coanda
Mặt nạ được thiết kế thông minh tạo ra luồng gió dựa trên hiệu ứng Coanda giúp tránh gió lùa trực tiếp vào cơ thể và mang lại không khí thoải mái. Góc thổi gió rộng mang luồng gió bao phủ cả phòng bất kể vị trí đặt máy lạnh Daikin Inverter 1 HP ATKA25UAVMV.', 50, 50, 1, 20, N'may-lanh-daikin-inverter-1-hp-atka25uavmv', CAST(N'2021-07-07T23:01:41.070' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (43, N'Máy ảnh Sony DSC-H300 E32', CAST(3990000 AS Decimal(18, 0)), N'<p><strong>Loại cảm biến: </strong>1/2.3" loại (7,76mm) siêu HAD CCD</p>
<p><strong>Điểm ảnh (image): </strong>20.1MP</p>
<p><strong>Loại ống kính: </strong>Ống kính Sony</p>
<p><strong>Thấu kính: </strong>f=4,5-157,5 mm</p>
<p><strong>Zoom quang học: </strong>35x</p>
<p><strong>Độ phân giải (video) </strong>1280x720 (Nét) (1280×720/30 hình/giây)/1280x720 (Tiêu chuẩn) (1280×720/30 hình/giây)/VGA(640×480/30 hình/giây)</p>
<p><strong>Định dạng (image): </strong>Ảnh tĩnh: theo dạng JPEG (DCF, Exif, MPF Baseline), tương thích với DPOF</p>
<p><strong>Thẻ nhớ hỗ trợ: </strong>Micro SD, SDHC</p>', N'Zoom quang học 35x
Với zoom quang học 35x tích hợp – một trong những ống kính zoom mạnh nhất hiện nay dành cho Cybershot, sẽ không có cảnh chụp nào ngoài tầm ngắm. Bạn có thể dễ dàng tiếp cận hành động ở cự ly gần, chụp ảnh rõ nét đến từng chi tiết với đầy đủ tiêu cự.

Siêu cảm biến hình ảnh CCD HAD 20,1 MP lớn
Xem chi tiết sống động như thật trong mỗi bức ảnh từ Máy ảnh Sony DSC-H300 E32 nhờ Siêu cảm biến CCD HAD 20.1MP. Bạn có thể chụp được hình ảnh đầy màu sắc phong phú và rõ nét đến từng chi tiết mà vẫn duy trì được chất lượng cao ngay cả khi bạn tái tạo ảnh dưới dạng bản in A4 trở lên.', 50, 49, 0, 11, N'may-anh-sony-dsc-h300-e32', CAST(N'2021-07-07T23:05:10.000' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (44, N'Máy ảnh Sony DSC-HX350 E32', CAST(8990000 AS Decimal(18, 0)), N'<p><strong>Loại cảm biến: </strong>Cảm ứng Exmor R® CMOS loại 1/2.3 (7,82mm)</p>
<p><strong>Điểm ảnh (image): </strong>Xấp xỉ 21.1 Megapixel</p>
<p><strong>Loại ống kính: </strong>Ống kính ZEISS Vario Sonnar T*, 15 thấu kính trong 10 nhóm (bao gồm 1 thấu kính Super ED, 2 thấu kính ED (tán sắc cực thấp) và 3 thấu kính phi cầu)</p>
<p><strong>Thấu kính: </strong>f=4,3-215mm</p>
<p><strong>Zoom quang học: </strong>50x (Zoom quang học trong khi quay phim)</p>
<p><strong>Định dạng (video) </strong>AVCHD:Dolby Digital (AC-3) 2ch (Dolby Digital Stereo Creator), MP4: MPEG-4 AAC-LC 2 kênh</p>
<p><strong>Định dạng (image) </strong>Theo dạng JPEG (DCF, Exif, MPF Baseline), tương thích với DPOF</p>
<p><strong>Thẻ nhớ hỗ trợ: </strong>Micro SD, SDHC, SDXC</p>
', N'Zoom xa vượt trội
Zoom cận cảnh những đối tượng ở xa tùy thích với ống kính zoom quang học 50x (Zoom hình ảnh rõ nét 100x) nhỏ gọn nhưng có sức mạnh xử lý và thao tác như một máy ảnh DSLR. Dù cho chủ thể của bạn ở gần hay xa, sức mạnh, tốc độ và độ chính xác của bộ cảm biến Exmor R® CMOS 20.4MP và công nghệ xử lý hình ảnh BIONZ X™ sẽ kết hợp cùng nhau để mang đến những hình ảnh rõ nét vượt trội.', 50, 50, 1, 11, N'may-anh-sony-dsc-hx350-e32', CAST(N'2021-07-07T23:06:10.570' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (45, N'Máy ảnh Canon Ixus 18 (Đen)', CAST(2250000 AS Decimal(18, 0)), N'<p><strong>Tiêu cự: </strong>8x</p>
<p><strong>Loại cảm biến: </strong>Cảm biến CCD 20 megapixel</p>
<p><strong>Điểm ảnh (image): </strong>Approx. 20.0 megapixels (aspect ratio: 4:3)</p>
<p><strong>Zoom quang học: </strong>13.3 inch, WXGA+(1440 x 900)</p>
<p><strong>Card màn hình: </strong>8x (28 - 224mm) với ZoomPlus 16x</p>
<p><strong>Định dạng (video): </strong>1280 x 720 / 640 x 480</p>
<p><strong>Định dạng (image): </strong>4:3 Ảnh cỡ lớn: 5152 x 3864 Ảnh cỡ trung 1: 3648 x 2736 Ảnh cỡ trung 2: 2048 x 1536 Ảnh cỡ trung: 2560 x 1920 Ảnh cỡ nhỏ: 640 x 480</p>
<p><strong>Thẻ nhớ hỗ trợ: </strong>Micro SD, SDHC, SDXC</p>', N'Khả năng zoom quang học 8x với ống kính 20 megapixel và một bộ xử lý hình ảnh DIGIC 4+ giúp việc chụp những hình ảnh sắc nét và có độ phân giải cao trở nên dễ dàng hơn. Thêm vào đó, với Khả năng Ổn định Hình ảnh Kỹ thuật số, việc chụp ảnh gần như không còn chịu rung lắc khi zoom ở khoảng cách xa để có được hình ảnh sắc nét và sống động.', 50, 50, 0, 12, N'may-anh-canon-ixus-18-den', CAST(N'2021-07-07T23:07:18.380' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (46, N'Máy ảnh Canon in liền iNSPC [C] CV-123A (Xanh)', CAST(3990000 AS Decimal(18, 0)), N'<p><strong>Loại cảm biến: </strong>ZINK™ Photo Paper</p>
<p><strong>Điểm ảnh (image): </strong>50 cm ~</p>
<p><strong>Định dạng (image): </strong>5MP</p>
<p><strong>Độ phân giải (image): </strong>314 x 500dpi</p>
<p><strong>Định dạng (video): </strong>1280 x 720 / 640 x 480</p>
<p><strong>Thẻ nhớ hỗ trợ: </strong>Micro SD,</p>', N'Đánh giá chi tiết về Máy ảnh Canon in liền iNSPiC [C] CV-123A (Xanh) - giữ lại mọi khoảng khắc đáng nhớ với công nghệ hình ảnh của Canon.
Máy ảnh Canon in liền iNSPiC [C] CV-123A (Xanh) được thiết kế và sản xuất bởi hãng CANON - là một trong những tập đoàn lớn chuyên về thiết kế, phát triển và sản xuất các thiết bị đa phương tiện, thiết bị văn phòng như máy ảnh, máy quay video, máy in, máy photocopy,..... Tập đoàn được thành lập vào năm 1937 và có trụ sở chính được đặt ở Tokyo, Nhật Bản.', 50, 50, 0, 12, N'may-anh-canon-in-lien-inspc-c-cv-123a-xanh', CAST(N'2021-07-07T23:08:35.677' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (47, N'Máy quay phim Sony 4K AX100E (FDR-AX100E)', CAST(35900000 AS Decimal(18, 0)), N'<p><strong>Loại cảm biến: </strong>Cảm biến CMOS Exmor R® chiếu sáng sau loại 1,0 (13,2 x 8,8 mm)</p>
<p><strong>Điểm ảnh (video): </strong>Xấp xỉ 14,2 triệu điểm ảnh (16:9)</p>
<p><strong>Điểm ảnh (image): </strong>Xấp xỉ 14,2 triệu điểm ảnh (16:9) / Xấp xỉ 10,6 triệu điểm ảnh (4:3)</p>
<p><strong>Thấu kính: </strong>F2.8-F4.5</p>
<p><strong>Zoom quang học: </strong>12x</p>
<p><strong>Tiêu cự (video): </strong>f = 29,0 - 348,0 mm (16:9)</p>
<p><strong>Tiêu cự (image): </strong>f = 29,0 - 348,0 mm (16:9), f = 35,5 - 426,0 mm (4:3)</p>
<p><strong>Thẻ nhớ hỗ trợ: </strong>Micro SD, SDHC, SDXC</p>', N'4K mang đến kỷ nguyên giải trí mới cho đôi mắt của bạn
Máy quay phim Sony 4K AX100E (FDR-AX100E) hỗ trợ 4K (3840 x 2160), định dạng siêu sắc nét mang đến độ phân giải gấp gần bốn lần Full HD. Thiết bị cho phép bạn ghi lại hình ảnh chi tiết đến kinh ngạc và sống động như thật.', 50, 50, 1, 17, N'may-quay-phim-sony-4k-ax100e-fdr-ax100e', CAST(N'2021-07-07T23:09:43.730' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (48, N'Máy quay phim Sony 4K HDR FDR-AX700', CAST(4989999 AS Decimal(18, 0)), N'<p><strong>Loại cảm biến: </strong>Cảm biến CMOS Exmor RS xếp chồng loại 1.0 (13,2 x 8,8 mm)</p>
<p><strong>Điểm ảnh (video): </strong>Xấp xỉ 14,2 triệu điểm ảnh (16:9)</p>
<p><strong>Loại ống kính: </strong>ZEISS Vario-Sonnar T*</p>
<p><strong>Thấu kính: </strong>F2.8-F4.5</p>
<p><strong>Zoom quang học: </strong>12x</p>
<p><strong>Định dạng (video) </strong>XAVC S Proxy: MPEG-4 AVC/H.264</p>
<p><strong>Định dạng (image) </strong>JPEG (DCF Phiên bản 2.0, Exif Phiên bản 2.3)</p>
<p><strong>Thẻ nhớ hỗ trợ: </strong>Micro SD, SDHC, SDXC</p>', N'Chất lượng phim 4K HDR (HLG)
Công nghệ Dải tần nhạy sáng cao (HDR) tạo nên một cuộc cách mạng thị giác cho màn hình bằng cách hiển thị phạm vi rộng hơn của màu sắc và độ sáng, hoàn toàn tôn lên được chất lượng vượt trội của hình ảnh có độ phân giải cao 4K. Ngoài ra, với khả năng quay video Hybrid Log-Gamma (HLG), Máy quay phim Sony 4K HDR FDR-AX700 giúp bạn dễ dàng ngắm nhìn ngay lập tức các hình ảnh HDR mà không cần xử lý thêm, chỉ cần kết nối máy ảnh với một chiếc TV Sony tương thích HLG qua cáp USB.', 50, 50, 0, 17, N'may-quay-phim-sony-4k-hdr-fdr-ax700', CAST(N'2021-07-07T23:10:54.037' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (49, N'Máy quay phim Canon EOS C200', CAST(190800000 AS Decimal(18, 0)), N'<p><strong>Loại cảm biến: </strong>CMOS 8.85 MP (4206 x 2340) Super 35mm</p>
<p><strong>Màn hình cảm ứng: </strong>Có</p>
<p><strong>Định dạng (video): </strong>MPEG-4 AVC/H.264</p>
<p><strong>Độ phân giải (video): </strong>3840x2160 / 1920x1080 / 2048x1080</p>
<p><strong>Định dạng (audio): </strong>Linear PCM (16-bit / 48kHz / 4 channels)</p>
<p><strong>Thẻ nhớ hỗ trợ: </strong>SDHC, SDXC, SD</p>', N'Giới thiệu Máy quay phim Canon EOS C200
Bộ cảm biến CMOS khổ lớn định dạng Super 35mm 4K của EOS C200 với 8.85 megapixel hữu dụng cho hình ảnh độ phân giải siêu cao và giàu chi tiết được hỗ trợ bởi công nghệ nền xử lý ảnh Dual DIGIC DV 6 mới phát triển. Máy ảnh hỗ trợ một định dạng RAW mới có tên gọi là Cinema RAW Light, cho phép ghi hình DCI 4K 60P/50P RAW vào một thẻ CFast 2.0 (VPG130) mà không cần bộ ghi gắn ngoài.', 50, 50, 1, 18, N'may-quay-phim-canon-eos-c200', CAST(N'2021-07-07T23:12:07.180' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (50, N'Máy quay phim Canon EOS C30 Mark II', CAST(258958000 AS Decimal(18, 0)), N'<p><strong>Loại cảm biến: </strong>Loại bộ cảm biến CMOS Super 35mm</p>
<p><strong>Điểm ảnh (video): </strong>Xấp xỉ 8,85 megapixels</p>
<p><strong>Định dạng (video): </strong>MPEG-4 AVC / H.264</p>
<p><strong>Độ phân giải (video): </strong>2048 x 1080 / 1920 x 1080</p>
<p><strong>Định dạng (image): </strong>Ảnh (JPEG)</p>
<p><strong>Độ phân giải (image): </strong>2048 x 1080 / 1920 x 1080</p>
<p><strong>Thẻ nhớ hỗ trợ: </strong>Micro SD, SDHC, SDXC</p>', N'Máy quay EOS C300 Mark II mang lại chất lượng hình ảnh cao và dải động rộng trong thân máy nhỏ gọn và được thiết kế công thái học, đã cải thiện khả năng hoạt động, độ chắc chắn và các tùy chọn để mở rộng. Các chức năng lấy nét trước được xây dựng sẵn của nó hỗ trợ các chuyên gia lấy nét thủ công bắt nguồn từ bước tiến hóa tiếp theo trong kỹ thuật DAF', 50, 50, 1, 18, N'may-quay-phim-canon-eos-c30-mark-ii', CAST(N'2021-07-07T23:13:10.453' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (51, N'Điện thoại iPhone 11 64GB', CAST(17690000 AS Decimal(18, 0)), N'<p>
  <strong>Màn hình: </strong>
  IPS LCD, 6.1", Liquid Retina
</p>
<p>
  <strong>Hệ điều hành: </strong>
  iOS 14
</p>
<p>
  <strong>Camera sau: </strong>
  2 camera 12 MP
</p>
<p>
  <strong>Camera trước: </strong>
  12 MP
</p>
<p>
  <strong>CPU: </strong>
  Apple A13 Bionic 6 nhân
</p>
<p>
  <strong>RAM: </strong>
  4 GB
</p>
<p>
  <strong>Bộ nhớ trong: </strong>
  64 GB
</p>
<p>
  <strong>Thẻ SIM: </strong>
  1 Nano SIM & 1 eSIM, Hỗ trợ 4G
</p>
<p>
  <strong>Dung lượng pin: </strong>
  3110 mAh, có sạc nhanh
</p>', N'Sau bao nhiêu chờ đợi cũng như đồn đoán thì cuối cùng Apple đã chính thức giới thiệu bộ 3 siêu phẩm iPhone 11 mạnh mẽ nhất của mình vào tháng 9/2019. Có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như chiếc iPhone Xr năm ngoái, đó chính là phiên bản iPhone 11 64GB.', 50, 50, 1, 9, N'dien-thoai-iphone-11-64gb', CAST(N'2021-07-07T23:14:08.943' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (52, N'Laptop Apple MacBook Pro M1 2020 16GB 512GB Space Grey (Z11C)', CAST(41840000 AS Decimal(18, 0)), N'<p><strong>CPU:</strong> Apple M1</p><p><strong>RAM:</strong> 16 GB</p><p><strong>Ổ cứng:</strong> SSD 512 GB</p><p><strong>Màn hình:</strong> 13.3"Retina (2560 x 1600)</p><p><strong>Card màn hình:</strong> Card tích hợp8 nhân GPU</p><p><strong>Cổng kết nối:</strong> 2 x Thunderbolt 3 (USB-C)</p><p><strong>Đặc biệt:</strong> Có đèn bàn phím</p><p><strong>Hệ điều hành: </strong>Mac OS</p><p><strong>Thiết kế:</strong> Vỏ kim loại nguyên khối</p><p><strong>Kích thước:</strong> Dài 304.1 mm - Rộng 212.4 mm - Dày 15.6 mm - Nặng 1.4 kg</p><p><strong>Thời điểm ra mắt:</strong> 2020</p>', N'Chip Apple M1 là một bộ vi xử lý mạnh mẽ, được ra mắt lần đầu tiên trên MAC. Đây là con chip với bộ xử lý 5 nm, tích hợp CPU 8 lõi với 4 lõi CPU tốc độ và và 4 lõi tiết kiệm năng lượng. Nhờ vậy, thời lượng pin của laptop được kéo dài đến tận 10 tiếng đồng hồ, giúp cho bạn thoải mái làm việc với một hiệu suất cực kỳ cao', 50, 50, 1, 3, N'laptop-apple-macbook-pro-m1-2020-16gb512gbspace-grey-z11c', CAST(N'2021-07-11T01:12:07.123' AS DateTime), CAST(N'2021-07-11T01:28:35.287' AS DateTime), N'hieunguyen', N'hieunguyen')
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (53, N'Laptop Apple MacBook Air M1 2020 8GB 512GB Gold (MGNE3SA-A)', CAST(32540000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Apple M1</p><p><strong>RAM: </strong>8 GB</p><p><strong>Ổ cứng:</strong> SSD 512 GB</p><p><strong>Màn hình: </strong>13.3"Retina (2560 x 1600)</p><p><strong>Card màn hình:</strong> Card tích hợp 8 nhân GPU</p><p><strong>Cổng kết nối</strong>: 2 x Thunderbolt 3 (USB-C)</p><p><strong>Đặc biệt:</strong> Có đèn bàn phím</p><p><strong>Hệ điều hành: </strong>Mac OS</p><p><strong>Thiết kế: </strong>Vỏ kim loại nguyên khối</p><p><strong>Kích thước:</strong> Dài 304.1 mm - Rộng 212.4 mm - Dày 4.1 mm đến 16.1 mm - Nặng 1.29 kg</p><p><strong>Thời điểm ra mắt: </strong>2020</p>', N'Apple MacBook Air M1 2020 (MGNE3SA/A) là chiếc laptop đang gây được rất nhiều sự chú ý, đặc biệt là đối với những fan nhà “Táo”. Với MacBook Air 2020, lần đầu tiên bạn sẽ được trải nghiệm con chip M1 được thiết kế dành riêng cho Mac cung cấp hiệu năng đồ họa mạnh mẽ.', 50, 50, 1, 3, N'laptop-apple-macbook-air-m1-2020-8gb512gbgold-mgne3saa', CAST(N'2021-07-11T01:16:08.690' AS DateTime), CAST(N'2021-07-11T01:59:30.297' AS DateTime), N'hieunguyen', N'hieunguyen')
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (54, N'Laptop Apple MacBook Pro M1 2020 8GB 512GB Space Grey (MYD92SA A)', CAST(39990000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Apple M1</p><p><strong>RAM: </strong>8 GB</p><p><strong>Ổ cứng: </strong>SSD 512 GB</p><p><strong>Màn hình: </strong>13.3"Retina (2560 x 1600)</p><p><strong>Card màn hình: </strong>Card tích hợp8 nhân GPU</p><p><strong>Cổng kết nối: </strong>2 x Thunderbolt 3 (USB-C)</p><p><strong>Đặc biệt: </strong>Có đèn bàn phím</p><p><strong>Hệ điều hành: </strong>Mac OS</p><p><strong>Thiết kế: </strong>Vỏ kim loại nguyên khối</p><p><strong>Kích thước: </strong>Dài 304.1 mm - Rộng 212.4 mm - Dày 15.6 mm - Nặng 1.4 kg</p><p><strong>Thời điểm ra mắt: </strong>2020</p>', N'Apple Macbook Pro M1 2020 (MYD92SA/A) với hiệu năng cực kỳ mạnh mẽ tích hợp chip Apple M1 lần đầu xuất hiện trên MAC đã xuất hiện trên thị trường laptop, con laptop này hứa hẹn sẽ mang đến cho bạn một sản phẩm “Pro” chưa từng thấy.', 50, 50, 1, 3, N'laptop-apple-macbook-pro-m1-2020-8gb-512gb-space-grey-myd92sa-a', CAST(N'2021-07-11T02:11:27.357' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (55, N'Laptop Asus ZenBook Duo UX482EG i5 1135G7 8GB 512GB 2GB MX450 Touch Pen Túi Stand Win10 (KA166T)', CAST(34990000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i5 Tiger Lake1135G72.40 GHz</p><p><strong>RAM: </strong>8 GBLPDDR4X (On board)4267 MHz</p><p><strong>Ổ cứng: </strong>SSD 512 GB NVMe PCIe</p><p><strong>Màn hình: </strong>14"Full HD (1920 x 1080)</p><p><strong>Card màn hình: </strong>Card rờiNVIDIA GeForce MX450, 2 GB</p><p><strong>Cổng kết nối: </strong>2 x Thunderbolt 4 USB-C1 x USB 3.2HDMI</p><p><strong>Đặc biệt: </strong>Có màn hình cảm ứngCó đèn bàn phím</p><p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p><p><strong>Thiết kế: </strong>Vỏ kim loại</p><p><strong>Kích thước: </strong>Dài 324 mm - Rộng 222 mm - Dày 17.3 mm - Nặng 1.62 kg</p><p><strong>Thời điểm ra mắt: </strong>2021</p>', N'Laptop Asus ZenBook Duo UX482EG i5 (KA166T) mang đến thiết kế đột phá với màn hình đôi độc đáo cùng cấu hình mạnh mẽ, hiệu suất đồ họa cao cực phù hợp với giới doanh nhân và người làm công việc sáng tạo.', 50, 45, 1, 4, N'laptop-asus-zenbook-duo-ux482eg-i5-1135g7-8gb-512gb-2gb-mx450-touch-pen-tui-stand-win10-ka166t', CAST(N'2021-07-11T02:16:07.793' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (56, N'Laptop Asus TUF Gaming FX516PM i7 11370H 16GB 512GB 6GB RTX3060 144Hz Win10 (HN023)', CAST(32990000 AS Decimal(18, 0)), N'<p><strong>CPU: </strong>Intel Core i7 Tiger Lake11370H3.30 GHz</p><p><strong>RAM: </strong>16 GBDDR4 2 khe (8GB onboard+ 1 khe 8GB)3200 MHz</p><p><strong>Ổ cứng: </strong>SSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng</p><p><strong>Màn hình: </strong>15.6"Full HD (1920 x 1080), 144Hz</p><p><strong>Card màn hình: </strong>Card rờiNVIDIA&nbsp;GeForce&nbsp;RTX&nbsp;3060, 6 GB</p><p><strong>Cổng kết nối: </strong>3 x USB 3.2HDMI 2.0Thunderbolt 4 USB-CLAN (RJ45)</p><p><strong>Đặc biệt: </strong>Có đèn bàn phím</p><p><strong>Hệ điều hành: </strong>Windows 10 Home SL</p><p><strong>Thiết kế: </strong>Vỏ nhựa - nắp lưng bằng kim loại</p><p><strong>Kích thước: </strong>Dài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg</p><p><strong>Thời điểm ra mắt: </strong>2021</p>', N'Laptop Asus TUF Gaming FX516PM i7 (HN023T) sở hữu dòng chip CPU Intel Core i7 thế hệ 11 mạnh mẽ mang đến hiệu năng ấn tượng cho nhu cầu thiết kế đồ họa, làm việc văn phòng và cả chiến game cực chất.', 50, 46, 1, 4, N'laptop-asus-tuf-gaming-fx516pm-i7-11370h-16gb-512gb-6gb-rtx3060-144hz-win10-hn023', CAST(N'2021-07-11T02:20:02.410' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (57, N'Laptop Asus TUF Gaming FX506LH i5 10300H 8GB 512GB 144Hz 4GB GTX1650 Win10 (HN002T)', CAST(21490000 AS Decimal(18, 0)), N'<p>CPU: Intel Core i5 Comet Lake10300H2.50 GHz</p><p>RAM: 8 GBDDR4 (2 khe)2933 MHz</p><p>Ổ cứng: SSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng</p><p>Màn hình: 15.6"Full HD (1920 x 1080), 144Hz</p><p>Card màn hình: Card rờiNVIDIA GeForce GTX 1650 4 GB</p><p>Cổng kết nối: 2 x USB 3.2HDMILAN (RJ45)USB 2.0USB Type-C</p><p>Đặc biệt: Có đèn bàn phím</p><p>Hệ điều hành: Windows 10 Home SL</p><p>Thiết kế: Vỏ nhựa - nắp lưng bằng kim loại</p><p>Kích thước: Dài 359 mm - Rộng 256 mm - Dày 24.9 mm - Nặng 2.3 kg</p><p>Thời điểm ra mắt: 2020</p>', N'Với sự mạnh mẽ, bền bỉ từ thiết kế vẻ ngoài lẫn bên trong cấu hình, Asus TUF Gaming FX506LH (HN002T) sẽ là một trợ thủ đắc lực của bạn trong trò chơi yêu thích và cả những tác vụ nặng khác.', 50, 45, 0, 4, N'laptop-asus-tuf-gaming-fx506lh-i5-10300h-8gb-512gb-144hz-4gb-gtx1650-win10-hn002t', CAST(N'2021-07-11T02:23:19.270' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (58, N'Laptop Lenovo Yoga 9 14ITL5 i7 1185G7 16GB 1TB SSD Touch Pen Win10 (82BG006EVN)', CAST(46490000 AS Decimal(18, 0)), N'<p>CPU: Intel Core i7 Tiger Lake1185G73.00 GHz</p><p>RAM: 16 GBLPDDR4 (On board)4266 MHz</p><p>Ổ cứng: 1 TB SSD M.2 PCIe</p><p>Màn hình: 14"4K/UHD (3840 x 2160)</p><p>Card màn hình: Card tích hợpIntel Iris Xe Graphics</p><p>Cổng kết nối: 2 x Thunderbolt 4 USB-C1 x USB 3.2</p><p>Đặc biệt: Có màn hình cảm ứngCó đèn bàn phím</p><p>Hệ điều hành: Windows 10 Home SL</p><p>Thiết kế: Vỏ kim loại</p><p>Kích thước: Dài 319.4 mm - Rộng 216.4 mm - Dày 15.7 mm - Nặng 1.37 kg</p><p>Thời điểm ra mắt: 2021</p>', N'Sang trọng, đẳng cấp, mạnh mẽ là những mỹ từ tóm gọn giá trị mà laptop Lenovo Yoga 9 14ITL5 (82BG006EVN) mang lại cho bạn. Nếu đang tìm 1 chiếc laptop mỏng nhẹ, linh hoạt, cấu hình ấn tượng hỗ trợ các tác vụ nặng, trải nghiệm ngay phiên bản cao cấp này từ Lenovo.', 50, 50, 1, 6, N'laptop-lenovo-yoga-9-14itl5-i7-1185g7-16gb-1tb-ssd-touch-pen-win10-82bg006evn', CAST(N'2021-07-11T02:28:15.253' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (59, N'Laptop Lenovo Legion 5 15IMH05 i7 10750H 8GB 256GB+1TB 120Hz 4GB GTX1650 Win10 (82AU0051VN)', CAST(26960000 AS Decimal(18, 0)), N'<p>CPU: Intel Core i7 Comet Lake10750H2.60 GHz</p><p>RAM: 8 GBDDR4 (2 khe)2933 MHz</p><p>Ổ cứng: SSD 256 GB NVMe PCIeHDD 1 TB SATA 3</p><p>Màn hình: 15.6"Full HD (1920 x 1080), 120Hz</p><p>Card màn hình: Card rời NVIDIA GeForce GTX 1650 4 GB</p><p>Cổng kết nối: 4 x USB 3.1HDMILAN (RJ45)USB Type-C</p><p>Đặc biệt: Có đèn bàn phím</p><p>Hệ điều hành: Windows 10 Home SL</p><p>Thiết kế: Vỏ nhựa</p><p>Kích thước: Dài 362 mm - Rộng 251.4 mm - Dày 23.57 mm - Nặng 2.3 kg</p><p>Thời điểm ra mắt: 2020</p>', N'Laptop Lenovo Legion 5 15IMH05 i7 (82AU0051VN) là thế hệ laptop gaming được thiết kế theo xu hướng hiện đại. Với vi xử lí đa nhân gen 10, card đồ họa rời mạnh mẽ, Lenovo Legion 5 cho trải nghiệm chiến các tựa game bom tấn cực đã.', 50, 50, 0, 6, N'laptop-lenovo-legion-5-15imh05-i7-10750h-8gb-256gb1tb-120hz-4gb-gtx1650-win10-82au0051vn', CAST(N'2021-07-11T02:31:46.883' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (60, N'Laptop HP EliteBook X360 1040 G8 i7 1165G7 16GB 512GB Touch Pen Win10 Pro (3G1H4PA)', CAST(48890000 AS Decimal(18, 0)), N'<p>CPU: Intel Core i7 Tiger Lake1165G72.80 GHz</p><p>RAM: 16 GBLPDDR4X (On board)4267 MHz</p><p>Ổ cứng: SSD 512 GB NVMe PCIe</p><p>Màn hình: 14"Full HD (1920 x 1080)</p><p>Card màn hình: Card tích hợpIntel Iris Xe Graphics</p><p>Cổng kết nối: 2 x Thunderbolt 4 USB-CHDMI2 x USB 3.1</p><p>Đặc biệt: Có màn hình cảm ứngCó đèn bàn phím</p><p>Hệ điều hành: Windows 10 Pro</p><p>Thiết kế: Vỏ kim loại nguyên khối</p><p>Kích thước: Dài 303.7 mm - Rộng 193.9 mm - Dày 16.1 mm - Nặng 1.25 kg</p><p>Thời điểm ra mắt: 2021</p>', N'Đẳng cấp và ấn tượng hơn bao giờ hết cùng laptop HP EliteBook X360 1040 G8 i7 (3G1H4PA) với thiết kế sang trọng, bản lề gập xoay 360 độ cùng khả năng vận hành và xử lý mọi tác vụ mạnh mẽ mang đến những trải nghiệm trọn vẹn, khó quên cho người dùng.', 50, 49, 1, 5, N'laptop-hp-elitebook-x360-1040-g8-i7-1165g7-16gb-512gb-touch-pen-win10-pro-3g1h4pa', CAST(N'2021-07-11T02:35:26.463' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (61, N'Laptop HP EliteBook X360 1040 G7 i7 10710U 16GB 512GB+32GB Pen Touch Win10 Pro (230P8PA)', CAST(45560000 AS Decimal(18, 0)), N'<p>CPU: Intel Core i7 Comet Lake10710U1.10 GHz</p><p>RAM: 16 GBLPDDR4 (On board)2933 MHz</p><p>Ổ cứng: Intel Optane 32GB (H10)SSD 512 GB NVMe PCIe</p><p>Màn hình: 14"Full HD (1920 x 1080)</p><p>Card màn hình: Card tích hợp Intel UHD Graphics</p><p>Cổng kết nối: HDMI2 x USB 3.12 x USB 3.1 Type-C with Thunderbolt</p><p>Đặc biệt: Có màn hình cảm ứngCó đèn bàn phím</p><p>Hệ điều hành: Windows 10 Pro</p><p>Thiết kế: Vỏ kim loại nguyên khối</p><p>Kích thước: Dài 303.7 mm - Rộng 193.9 mm - Dày 16.1 mm - Nặng 1.392 kg</p><p>Thời điểm ra mắt: 2020</p>', N'Laptop HP EliteBook X360 1040 (230P8PA) là một phiên bản laptop với thiết kế mỏng nhẹ cùng với chip Core i7 hiệu năng mạnh mẽ. Đây thực sự là con laptop đáng mong đợi dành cho doanh nhân hay các bạn có nhu cầu di chuyển cao.', 50, 49, 0, 5, N'laptop-hp-elitebook-x360-1040-g7-i7-10710u-16gb-512gb32gb-pen-touch-win10-pro-230p8pa', CAST(N'2021-07-11T02:43:24.067' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (62, N'Ổ cứng SSD 1TB WD My Passport BAGF0010', CAST(5990000 AS Decimal(18, 0)), N'<p><strong>Chuẩn kết nối:</strong> USB Type C 3.2</p><p><strong>Dung lượng:</strong> 1TB</p><p><strong>Loại ổ cứng:</strong> SSD</p><p><strong>Tốc độ đọc:</strong> 1050 MB/s</p><p><strong>Tốc độ ghi:</strong> 1000 MB/s</p><p><strong>Thương hiệu của:</strong> Mỹ</p><p><strong>Sản xuất tại:</strong> Trung Quốc/Malaysia</p>', N'Thiết kế nhỏ gọn, tiện lợi và chắc chắn.
Dung lượng 1 TB cùng hiệu suất SSD nhanh gấp 2 lần ổ cứng thông thường.
Hỗ trợ các tính năng thông minh WD Drive Utilities kiểm tra sức khỏe ổ cứng, WD Backup sao lưu dữ liệu, WD Security bảo mật dữ liệu.
Tốc độ kết nối nhanh với chuẩn giao tiếp USB Type C 3.2.', 50, 50, 1, 22, N'o-cung-ssd-1tb-wd-my-passport-bagf0010', CAST(N'2021-07-18T16:08:54.080' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (63, N'Ổ cứng HDD 1TB Seagate Backup Plus Slim STHN1000400 Đen', CAST(1650000 AS Decimal(18, 0)), N'<p><strong>Dung lượng:</strong> 1TB</p><p><strong>Loại ổ cứng:</strong> HDD</p><p><strong>Kích thước:</strong> 2.5 inch</p><p><strong>Thương hiệu của:</strong> Mỹ</p><p><strong>Sản xuất tại:</strong> Thái Lan</p>', N'Thiết kế gọn đẹp, vỏ làm bằng chất liệu nhựa bên trong và được phủ lớp kim loại bên ngoài.
Định dạng exFAT cho phép kết nối cả Windows và Mac OS mà không cần format lại ổ cứng.
Chuẩn kết nối USB 3.0 tốc độ truyền nhanh.
Tương thích hệ điều hành Windows 7 trở lên, Mac OS X 10.7 trở lên.
Hỗ trợ phần mềm Seagate Toolkit Solfware.', 50, 50, 1, 22, N'o-cung-hdd-1tb-seagate-backup-plus-slim-sthn1000400-den', CAST(N'2021-07-18T16:16:08.413' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (64, N'USB 3.1 32 GB Transcend JetFlash 760 Đen Tím', CAST(250000 AS Decimal(18, 0)), N'<p><strong>Dung lượng:</strong> 32GB</p><p><strong>Tốc độ đọc:</strong> 70 MB/s</p><p><strong>Kích thước:</strong> Dài 6.96mm - ngang 2.09 cm - dày 0.89 cm</p><p><strong>Trọng lượng:</strong> 12g</p><p><strong>Sản xuất tại:</strong> Đài Loan</p><p><strong>Thương hiệu của:</strong> Đài Loan</p><p><strong>Hãng:</strong> Transcend</p>', N'USB 3.1 32 GB Transcend JetFlash 760 Đen Tím kiểu dáng nhỏ gọn, chứa nhiều dữ liệu tiện dụng', 100, 100, 1, 23, N'usb-31-32-gb-transcend-jetflash-760-den-tim', CAST(N'2021-07-18T16:28:31.897' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (65, N'USB OTG 3.1 128GB Type C Sandisk SDDDC3 Đen', CAST(690000 AS Decimal(18, 0)), N'<p><strong>Dung lượng:</strong> 128 GB</p><p><strong>Tốc độ đọc:</strong> 150 MB/s</p><p><strong>Thương hiệu của:</strong> Mỹ</p><p><strong>Sản xuất tại:</strong> Trung Quốc</p><p><strong>Hãng:</strong> Sandisk</p>', N'Thiết kế tinh xảo, nhỏ nhắn, tiện dụng.
Nâng cao bộ nhớ cho điện thoại thông minh đến 128 GB.
Ổ đĩa USB 3.1 Gen 1 cho hiệu năng ấn tượng với tốc độ đọc 150 MB/s.
Truyền dữ liệu linh hoạt nhờ 2 đầu Type C và USB.
Nắp bảo vệ xoay dễ dàng.', 100, 99, 1, 23, N'usb-otg-31-128gb-type-c-sandisk-sdddc3-den', CAST(N'2021-07-18T16:31:41.857' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (66, N'Thẻ nhớ MicroSD 200 GB SanDisk Class 10', CAST(1390000 AS Decimal(18, 0)), N'<p><strong>Loại thẻ:</strong> Thẻ Micro SD (Dành cho điện thoại, máy tính bảng)</p><p><strong>Dung lượng:</strong> 200 GB</p><p><strong>Tốc độ đọc dữ liệu:</strong> 100 MB/s</p><p><strong>Tốc độ ghi dữ liệu:</strong> 30MB/s</p>', N'Thương hiệu SanDisk đến từ Mỹ, nổi tiếng toàn cầu trong lĩnh vực sản xuất thẻ nhớ.
Tốc độ đọc 100 MB/s.
Tốc độ ghi 30 MB/s.
Tương thích tốt với điện thoại, máy tính bảng.
Tương thích với thiết bị có thể nhận thẻ nhớ tối đa 200 GB.
Chép một video dung lượng 10 GB vào thẻ chưa tới 2 phút.', 100, 100, 1, 24, N'the-nho-microsd-200-gb-sandisk-class-10', CAST(N'2021-07-18T16:38:25.707' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (67, N'Thẻ nhớ Micro SD Transcend 32GB Class 10', CAST(162000 AS Decimal(18, 0)), N'<p><strong>Loại thẻ:</strong> Thẻ Micro SD (Dành cho điện thoại, máy tính bảng)</p><p><strong>Dung lượng:</strong> 32 GB</p><p><strong>Tốc độ đọc dữ liệu:</strong> 45MB/s</p><p><strong>Tốc độ ghi dữ liệu:</strong> 95 MB/s</p>', N'Thẻ Nhớ Micro SD Transcend 32GB Class 10 cung cấp thêm 32GB dữ liệu cho điện thoại, máy tính bảng có hỗ trợ khe thẻ cắm micro SD. Bạn có thể thưởng thức thoải mái các bộ phim, bài hát mà bạn yêu thích.', 100, 100, 1, 24, N'the-nho-micro-sd-transcend-32gb-class-10', CAST(N'2021-07-18T16:51:09.477' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (68, N'Máy tính bảng iPad Air 4 Wifi 64GB (2020)', CAST(16990000 AS Decimal(18, 0)), N'<p><strong>Công nghệ màn hình: </strong>Liquid Retina</p><p><strong>Độ phân giải: </strong>1640 x 2360 Pixels</p><p><strong>Màn hình rộng: </strong>10.9" - Tần số quét Hãng không công bố</p><p><strong>Hệ điều hành: </strong>iPadOS 14</p><p><strong>Camera sau: </strong>12 MP</p><p><strong>Camera trước: </strong>7 MP</p><p><strong>CPU:</strong> Apple A14 Bionic 6 nhân</p><p><strong>RAM:</strong> 4 GB</p><p><strong>Bộ nhớ trong: </strong>64 GB</p><p><strong>Bộ nhớ trong còn lại khoảng: </strong>49 GB</p><p><strong>Thực hiện cuộc gọi: </strong>FaceTime</p><p><strong>Wifi: </strong>Wi-Fi 802.11 a/b/g/n/ac/ax</p><p><strong>Dung lượng pin: </strong>28.65 Wh (~ 7600 mAh)</p><p><strong>Loại pin: </strong>Li-Po</p><p><strong>Công nghệ pin: </strong>Sạc pin nhanh</p><p><strong>Hỗ trợ sạc tối đa: </strong>20 W</p><p><strong>Sạc kèm theo máy: </strong>20 W</p><p><strong>Chất liệu: </strong>Nhôm nguyên khối</p><p><strong>Kích thước, khối lượng: </strong>Dài 247.6 mm - Ngang 178.5 mm - Dày 6.1 mm - Nặng 460 g</p><p><strong>Thời điểm ra mắt: </strong>09/2020</p>', N'Apple đã trình làng máy tính bảng iPad Air 4 Wifi 64 GB (2020). Đây là thiết bị đầu tiên của hãng được trang bị chip A14 Bionic - chip di động mạnh nhất của Apple (năm 2020). Và có màn lột xác nhờ thiết kế được thừa hưởng từ iPad Pro với viền màn hình mỏng bo cong quanh máy.', 100, 100, 1, 26, N'may-tinh-bang-ipad-air-4-wifi-64gb-2020', CAST(N'2021-07-18T17:20:40.190' AS DateTime), CAST(N'2021-07-18T17:26:39.677' AS DateTime), N'hieunguyen', N'hieunguyen')
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (69, N'Máy tính bảng iPad Pro M1 12.9 inch WiFi Cellular 256GB (2021)', CAST(38490000 AS Decimal(18, 0)), N'<p><strong>Công nghệ màn hình: </strong>Liquid Retina XDR mini-LED LCD</p><p><strong>Độ phân giải: </strong>2048 x 2732 Pixels</p><p><strong>Màn hình rộng: </strong>12.9"</p><p><strong>Hệ điều hành: </strong>iPadOS 14</p><p><strong>Camera sau: </strong>Chính 12 MP &amp; Phụ 10 MP, TOF 3D LiDAR</p><p><strong>Camera trước: </strong>12 MP</p><p><strong>CPU:</strong> Apple M1 8 nhân</p><p><strong>RAM:</strong> 8 GB</p><p><strong>Bộ nhớ trong: </strong>256 GB</p><p><strong>Bộ nhớ trong còn lại khoảng: </strong>241 GB</p><p><strong>Thực hiện cuộc gọi: </strong>FaceTime</p><p><strong>Wifi: </strong>Wi-Fi 802.11 a/b/g/n/ac/ax</p><p><strong>Dung lượng pin: </strong>40.88 Wh (~ 10.835 mAh)</p><p><strong>Loại pin: </strong>Li-Po</p><p><strong>Công nghệ pin: </strong>Sạc pin nhanhTiết kiệm pin</p><p><strong>Hỗ trợ sạc tối đa: </strong>20 W</p><p><strong>Sạc kèm theo máy: </strong>20 W</p><p><strong>Chất liệu: </strong>Nhôm nguyên khối</p><p><strong>Kích thước, khối lượng: </strong>Dài 280.6 mm - Ngang 214.9 mm - Dày 6.4 mm - Nặng 685 g</p><p><strong>Thời điểm ra mắt: </strong>05/2021</p>', N'Apple đã trình làng máy tính bảng iPad Air 4 Wifi 64 GB (2020). Đây là thiết bị đầu tiên của hãng được trang bị chip A14 Bionic - chip di động mạnh nhất của Apple (năm 2020). Và có màn lột xác nhờ thiết kế được thừa hưởng từ iPad Pro với viền màn hình mỏng bo cong quanh máy.', 100, 100, 0, 26, N'may-tinh-bang-ipad-pro-m1-129-inch-wifi-cellular-256gb-2021', CAST(N'2021-07-18T17:25:24.600' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (70, N'Máy tính bảng Samsung Galaxy Tab A7 Lite', CAST(4490000 AS Decimal(18, 0)), N'<p><strong>Công nghệ màn hình: </strong>TFT LCD</p><p><strong>Độ phân giải: </strong>800 x 1340 Pixels</p><p><strong>Màn hình rộng: </strong>8.7" - Tần số quét Hãng không công bố</p><p><strong>Hệ điều hành: </strong>Android 11</p><p><strong>Tốc độ CPU: </strong>4 nhân 2.3 GHz &amp; 4 nhân 1.8 GHz</p><p><strong>Chip đồ hoạ (GPU): </strong>IMG PowerVR GE8320</p><p><strong>RAM: </strong>3 GB</p><p><strong>Bộ nhớ trong:&nbsp; &nbsp;</strong>32 GB</p><p><strong>Bộ nhớ còn lại (khả dụng) khoảng: </strong>22 GB</p><p><strong>Thẻ nhớ ngoài: &nbsp;</strong>Micro SD, hỗ trợ tối đa 1 TB</p><p><strong>Camera sau: </strong>8 MP</p><p><strong>Camera trước: </strong>2MP</p><p><strong>Mạng di động: </strong>Hỗ trợ 4G</p><p><strong>SIM:</strong> 1 Nano SIM</p><p><strong>Thực hiện cuộc gọi: </strong>Có</p><p><strong>Wifi: </strong>Wi-Fi 802.11 a/b/g/n/ac</p><p><strong>Dung lượng pin: </strong>5100 mAh</p><p><strong>Loại pin: </strong>Li-Ion</p><p><strong>Công nghệ pin: </strong>Sạc pin nhanh, tiết kiệm pin</p><p><strong>Hỗ trợ sạc tối đa: </strong>15 W</p><p><strong>Sạc kèm theo máy: </strong>7.5 W</p><p><strong>Chất liệu: </strong>Nhôm nguyên khối</p><p><strong>Kích thước, khối lượng: </strong>Dài 212.5 mm - Ngang 124.7 mm - Dày 8 mm - Nặng 371 g</p><p><strong>Thời điểm ra mắt: </strong>05/2021</p><p><strong>Hãng: </strong>Samsung</p>', N'Galaxy Tab A7 Lite là phiên bản rút gọn của dòng máy tính bảng "ăn khách" Galaxy Tab A7 thuộc thương hiệu Samsung, đáp ứng nhu cầu giải trí của khách hàng thuộc phân khúc bình dân với màn hình lớn nhưng vẫn gọn nhẹ hợp túi tiền.', 70, 70, 1, 27, N'may-tinh-bang-samsung-galaxy-tab-a7-lite', CAST(N'2021-07-18T17:37:45.117' AS DateTime), CAST(N'2021-07-18T17:43:00.400' AS DateTime), N'hieunguyen', N'hieunguyen')
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (71, N'Máy tính bảng Samsung Galaxy Tab A7 (2020)', CAST(7190000 AS Decimal(18, 0)), N'<p><strong>Công nghệ màn hình: </strong>TFT LCD</p><p><strong>Độ phân giải: </strong>1200 x 2000 Pixels</p><p><strong>Màn hình rộng: </strong>10.4"</p><p><strong>Hệ điều hành: </strong>Android 10</p><p><strong>Tốc độ CPU: </strong>Snapdragon 662 8 nhân (4 nhân 2 GHz &amp; 4 nhân 1.8 GHz)</p><p><strong>Chip đồ hoạ (GPU): </strong>Adreno 610</p><p><strong>RAM: </strong>3 GB</p><p><strong>Bộ nhớ trong:&nbsp; </strong>64 GB</p><p><strong>Bộ nhớ còn lại (khả dụng) khoảng: </strong>49 GB</p><p><strong>Thẻ nhớ ngoài: &nbsp;</strong>Micro SD, hỗ trợ tối đa 1 TB</p><p><strong>Camera sau: </strong>8 MP</p><p><strong>Camera trước: 5 </strong>MP</p><p><strong>Mạng di động: </strong>Hỗ trợ 4G</p><p><strong>SIM:</strong> 1 Nano SIM</p><p><strong>Thực hiện cuộc gọi: </strong>Có</p><p><strong>Wifi: </strong>Wi-Fi 802.11 a/b/g/n/ac</p><p><strong>Dung lượng pin: </strong>7040 mAh</p><p><strong>Loại pin: </strong>Li-Ion</p><p><strong>Công nghệ pin: </strong>Sạc pin nhanh</p><p><strong>Hỗ trợ sạc tối đa: </strong>10 W</p><p><strong>Sạc kèm theo máy: </strong>7.8 W</p><p><strong>Chất liệu: </strong>Nhôm nguyên khối</p><p><strong>Kích thước, khối lượng: </strong>Dài 247.6 mm - Ngang 157.4 mm - Dày 7 mm - Nặng 477 g</p><p><strong>Thời điểm ra mắt: </strong>10/2020</p><p><strong>Hãng: </strong>Samsung</p>', N'Samsung Galaxy Tab A7 (2020) là một chiếc máy tính bảng có thiết kế đẹp, cấu hình khá, nhiều tính năng tiện ích, một công cụ đắc lực hỗ trợ bạn trong công việc cũng như trong học tập hay giải trí. Màn hình lớn cho trải nghiệm bất tận', 70, 69, 1, 27, N'may-tinh-bang-samsung-galaxy-tab-a7-2020', CAST(N'2021-07-18T17:42:24.277' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (72, N'Android Tivi Sony 4K 43 inch KD-43X7500H', CAST(11900000 AS Decimal(18, 0)), N'<p><strong>Loại Tivi: </strong>Android Tivi</p><p><strong>Kích cỡ màn hình: </strong>43 inch</p><p><strong>Độ phân giải: </strong>Ultra HD 4K</p><p><strong>Loại màn hình: </strong>LED viền (Edge LED), IPS LCD</p><p><strong>Công nghệ hình ảnh: </strong>Chuyển động mượt Motionflow XR 200</p><p><strong>Công nghệ âm thanh: </strong>Bộ khuếch đại âm thanh S-Master Digital Amplifier</p><p><strong>Tổng công suất loa: </strong>20W</p><p><strong>Hệ điều hành: </strong>Android 9.0</p><p><strong>Ứng dụng phổ biến: </strong>Google Play, MyTV, VieON, YouTube, FPT Play</p><p><strong>Điều khiển tivi bằng điện thoại: </strong>Ứng dụng Android TV</p><p><strong>Kết nối Internet: </strong>Cổng mạng LAN, Wifi</p><p><strong>Kết nối không dây: </strong>Bluetooth (Kết nối bàn phím, chuột)</p><p><strong>Cổng nhận hình ảnh, âm thanh: </strong>3 cổng HDMI có 1 cổng HDMI ARC</p><p><strong>Cổng xuất âm thanh: </strong>1 cổng 3.5 mm, 1 cổng Optical (Digital Audio), 1 cổng ARC</p><p><strong>Kích thước có chân, đặt bàn: </strong>Ngang 97 cm - Cao 63 cm - Dày 28.6 cm</p><p><strong>Khối lượng có chân: </strong>12.5 Kg</p><p><strong>Kích thước không chân, treo tường: </strong>Ngang 97 cm - Cao 57 cm - Dày 5.7 cm</p><p><strong>Khối lượng không chân: </strong>12 Kg</p><p><strong>Nơi sản xuất: </strong>Malaysia</p><p><strong>Chất liệu chân đế: </strong>Nhựa lõi thép</p><p><strong>Chất liệu viền tivi: </strong>Nhựa</p><p><strong>Năm ra mắt: </strong>2020</p><p><strong>Hãng: </strong>Sony</p>', N'Android Tivi Sony 4K 43 inch KD-43X7500H sở hữu chân đế giống hình chữ V úp ngược thanh mảnh nhưng chắc chắn với khung viền tivi màu đen tạo nên sự mạnh mẽ và sang trọng, mang đến tổng thể hài hòa đẹp mắt cho không gian nội thất nhà bạn.', 50, 50, 1, 29, N'android-tivi-sony-4k-43-inch-kd-43x7500h', CAST(N'2021-07-18T17:56:16.100' AS DateTime), CAST(N'2021-07-18T18:04:35.780' AS DateTime), N'hieunguyen', N'hieunguyen')
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (73, N'Smart Tivi Casper 32 inch 32HG5200', CAST(5890000 AS Decimal(18, 0)), N'<p><strong>Loại Tivi: </strong>Android Tivi</p><p><strong>Kích cỡ màn hình: </strong>32 inch</p><p><strong>Độ phân giải: </strong>HD</p><p><strong>Loại màn hình: </strong>LED nền (Direct LED), VA LCD</p><p><strong>Công nghệ hình ảnh: </strong>2K HDRMàn hình siêu sáng Super Brightness</p><p><strong>Công nghệ âm thanh: </strong>Nature Sound, Dolby Audio</p><p><strong>Tổng công suất loa: </strong>20W</p><p><strong>Hệ điều hành: </strong>Android 9.0</p><p><strong>Ứng dụng phổ biến: </strong>Google Play, MyTV, VieON, YouTube, FPT Play</p><p><strong>Kết nối Internet: </strong>Cổng mạng LAN, Wifi</p><p><strong>Cổng nhận hình ảnh: </strong>1 cổng Composite, 1 cổng VGA (chỉ nhận hình ảnh)</p><p><strong>Cổng xuất âm thanh: </strong>1 cổng 3.5 mm, 1 cổng Optical (Digital Audio)</p><p><strong>Kích thước có chân, đặt bàn: </strong>Ngang 72.5 cm - Cao 47.8 cm - Dày 19.4 cm</p><p><strong>Khối lượng có chân: </strong>3.9 Kg</p><p><strong>Kích thước không chân, treo tường: </strong>Ngang 72.5 cm - Cao 42.7 cm - Dày 8.1 cm</p><p><strong>Khối lượng không chân: </strong>3.8</p><p><strong>Nơi sản xuất: </strong>Thái Lan</p><p><strong>Chất liệu chân đế: </strong>Nhựa</p><p><strong>Chất liệu viền tivi: </strong>Nhựa</p><p><strong>Năm ra mắt: </strong>2021</p><p><strong>Hãng: </strong>Casper</p>', N'Smart Tivi Casper 32 inch 32HG5200 được thiết kế với vóc dáng vô cùng đơn giản, viền tivi mỏng 9,9 mm kết hợp với chân đế hình chữ V úp ngược mang lại tổng thể chiếc tivi trở nên sang trọng. Tivi Casper 32 inch phù hợp trưng bày ở những nơi có không gian nhỏ như: Phòng ngủ, phòng khách nhỏ', 50, 50, 1, 29, N'smart-tivi-casper-32-inch-32hg5200', CAST(N'2021-07-18T18:04:21.457' AS DateTime), CAST(N'2021-07-18T18:06:47.447' AS DateTime), N'hieunguyen', N'hieunguyen')
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (74, N'Loa kéo Mobell MK-2120C 30W', CAST(1890000 AS Decimal(18, 0)), N'<p><strong>Loại sản phẩm: </strong>Loa kéo</p><p><strong>Tổng công suất: </strong>30 W</p><p><strong>Thời gian sử dụng: </strong>2 - 3 tiếng</p><p><strong>Thời gian sạc: </strong>Khoảng 6 tiếng</p><p><strong>Số đường tiếng của loa: </strong>2 đường tiếng (tiếng Bass và tiếng Treble)</p><p><strong>Phím điều khiển: </strong>Điều chỉnh âm thanh, Nút nguồn, Âm thanh mic</p><p><strong>Tiện ích: </strong>2 micro kèm theo, bánh xe dễ di chuyển, có kèm remote</p><p><strong>Kết nối không dây: </strong>Bluetooth 5.0</p><p><strong>Loa chính: </strong>Dài 32.5 Cm - Rộng 28.5 Cm - Cao 23.5 Cm</p><p><strong>Số lượng loa Bass: </strong>1 loa</p><p><strong>Kích thước loa Bass: </strong>Khoảng 8 cm</p><p><strong>Số lượng loa Treble: </strong>1 loa</p><p><strong>Chất liệu loa:</strong> Thùng gỗ</p><p><strong>Thương hiệu của: </strong>Việt Nam</p><p><strong>Sản xuất tại: </strong>Việt Nam</p><p><strong>Dòng sản phẩm: </strong>2021</p><p><strong>Hãng: </strong>Mobell</p>', N'Loa kéo Mobell MK-2120C 30W có các chi tiết màu đen, màu nền là sắc nâu của gỗ cho vẻ ngoài thanh lịch, thời thượng, tạo điểm nhấn cho mọi không gian sử dụng. Chất liệu thùng loa bằng gỗ cao cấp mang đến chất âm hay, vang hơn.', 50, 50, 1, 30, N'loa-keo-mobell-mk-2120c-30w', CAST(N'2021-07-18T18:31:28.797' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (75, N'Loa kéo Karaoke Nanomax S-900', CAST(4390000 AS Decimal(18, 0)), N'<p><strong>Loại sản phẩm: </strong>Loa kéo</p><p><strong>Tổng công suất: </strong>420 W</p><p><strong>Thời gian sử dụng: </strong>4 - 8 tiếng</p><p><strong>Thời gian sạc: </strong>Khoảng 4 tiếng</p><p><strong>Số đường tiếng của loa: </strong>2 đường tiếng (tiếng Bass và tiếng Treble)</p><p><strong>Phím điều khiển: </strong>Điều chỉnh âm thanh, Nút nguồn, Âm thanh mic</p><p><strong>Tiện ích: </strong>Có cổng USB</p><p><strong>Kết nối không dây: </strong>Bluetooth 5.0</p><p><strong>Kết nối khác: </strong>Cổng Guitar, USB</p><p><strong>Loa chính: </strong>Dài 69 Cm - Rộng 36 Cm - Cao 39 Cm</p><p><strong>Số lượng loa Bass: </strong>1 loa</p><p><strong>Kích thước loa Bass: </strong>Khoảng 30 cm</p><p><strong>Chất liệu loa:</strong> Gỗ sơn gai màu đen chống trầy</p><p><strong>Thương hiệu của: </strong>Việt Nam</p><p><strong>Sản xuất tại: </strong>Việt Nam</p><p><strong>Dòng sản phẩm: </strong>2020</p><p><strong>Hãng: </strong>Nanomax</p>', N'Loa kéo Mobell MK-2120C 30W có các chi tiết màu đen, màu nền là sắc nâu của gỗ cho vẻ ngoài thanh lịch, thời thượng, tạo điểm nhấn cho mọi không gian sử dụng. Chất liệu thùng loa bằng gỗ cao cấp mang đến chất âm hay, vang hơn.', 50, 50, 1, 30, N'loa-keo-karaoke-nanomax-s-900', CAST(N'2021-07-18T18:37:12.437' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (76, N'Quạt điều hoà Kangaroo KG50F79', CAST(6000000 AS Decimal(18, 0)), N'<p><strong>Phạm vi làm mát:</strong> Phòng 30 - 40 m²<br><strong>Công suất:</strong> 150 W<br><strong>Tốc độ gió:</strong> 4 mức gió<br><strong>Chế độ gió:</strong> Gió ngủ, Gió tự nhiên, Gió thường<br>Điều khiển: Cảm ứng, Có remote đi kèm</p>', N'Quạt điều hòa Kangaroo có 2 hộp đá khô kèm theo giúp làm mát hiệu quả hơn cho những ngày nắng nóng cao điểm
', 50, 50, 3, 31, N'quat-dieu-hoa-kangaroo-kg50f79', CAST(N'2021-07-23T14:21:56.053' AS DateTime), CAST(N'2021-07-23T14:23:52.210' AS DateTime), N'hieunguyen', N'hieunguyen')
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (77, N'Điện thoại OPPO Reno5', CAST(9000000 AS Decimal(18, 0)), N'<p><strong>Màn hình: </strong>AMOLED6.43"Full HD+<br><strong>Hệ điều hành:</strong> Android 11<br><strong>Camera sau:</strong> Chính 64 MP &amp; Phụ 8 MP, 2 MP, 2 MP<br><strong>Camera trước:</strong> 44 MP<br><strong>Chip:</strong> Snapdragon 720G<br><strong>RAM:</strong> 8 GB<br><strong>Bộ nhớ trong:</strong> 128 GB<br><strong>SIM:</strong> 2 Nano SIMHỗ trợ 4G<br><strong>Pin, Sạc:</strong> 4310 mAh50 W</p>', N'OPPO Reno5 là sự kết hợp đầy ấn tượng giữa hiệu năng và thiết kế, mang đến cho người dùng một chiếc điện thoại tích hợp nhiều công nghệ camera, sạc pin hàng đầu của OPPO trong một mức giá tầm trung.', 10, 8, 1, 32, N'dien-thoai-oppo-reno5', CAST(N'2021-07-29T23:29:46.643' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (78, N'Điện thoại OPPO A74', CAST(6690000 AS Decimal(18, 0)), N'<p><strong>Màn hình:</strong> AMOLED6.43"Full HD+</p><p><strong>Hệ điều hành:</strong> Android 11</p><p><strong>Camera sau:</strong> Chính 48 MP &amp; Phụ 2 MP, 2 MP</p><p><strong>Camera trước: </strong>16 MP</p><p><strong>Chip:</strong> Snapdragon 662</p><p><strong>RAM:</strong> 8 GB</p><p><strong>Bộ nhớ trong:</strong> 128 GB</p><p><strong>SIM:</strong> 2 Nano SIMHỗ trợ 4G</p><p><strong>Pin, Sạc:</strong> 5000 mAh33 W</p>', N'OPPO luôn đa dạng hoá các sản phẩm của mình từ giá rẻ cho đến cao cấp. Trong đó, điện thoại OPPO A74 4G được nằm trong phân khúc tầm trung rất đáng chú ý với nhiều tính năng và smartphone cũng chính là bản nâng cấp của OPPO A73 ra mắt trước đó.', 10, 9, 1, 32, N'dien-thoai-oppo-a74', CAST(N'2021-07-29T23:35:11.773' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (79, N'Điện thoại OPPO Find X3 Pro 5G', CAST(26990000 AS Decimal(18, 0)), N'<p><strong>Màn hình:</strong> AMOLED6.7"Quad HD+ (2K+)</p><p><strong>Hệ điều hành: </strong>Android 11</p><p><strong>Camera sau:</strong> Chính 50 MP &amp; Phụ 50 MP, 13 MP, 3 MP</p><p><strong>Camera trước:</strong> 32 MP</p><p><strong>Chip:</strong> Snapdragon 888</p><p><strong>RAM:</strong> 12 GB</p><p><strong>Bộ nhớ trong:</strong> 256 GB</p><p><strong>SIM: </strong>2 Nano SIMHỗ trợ 5G</p><p><strong>Pin, Sạc:</strong> 4500 mAh65 W</p>', N'OPPO đã làm khuynh đảo thị trường smartphone khi cho ra đời chiếc điện thoại OPPO Find X3 Pro 5G. Đây là một sản phẩm có thiết kế độc đáo, sở hữu cụm camera khủng, cấu hình thuộc top đầu trong thế giới Android.', 10, 8, 1, 32, N'dien-thoai-oppo-find-x3-pro-5g', CAST(N'2021-07-29T23:38:15.443' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (80, N'Điện thoại OPPO Reno6 Z 5G', CAST(9500000 AS Decimal(18, 0)), N'<p><strong>Màn hình: </strong>AMOLED6.43"Full HD+</p><p><strong>Hệ điều hành: </strong>Android 11</p><p><strong>Camera sau: </strong>Chính 64 MP &amp; Phụ 8 MP, 2 MP</p><p><strong>Camera trước:</strong> 32 MP</p><p><strong>Chip: </strong>MediaTek Dimensity 800U 5G</p><p><strong>RAM: </strong>8 GB</p><p><strong>Bộ nhớ trong:</strong> 128 GB</p><p><strong>SIM:</strong> 2 Nano SIM Hỗ trợ 5G</p><p><strong>Pin, Sạc:</strong> 4310 mAh30 W</p>', N'Reno6 Z 5G đến từ nhà OPPO với hàng loạt sự nâng cấp và cải tiến không chỉ ngoại hình bên ngoài mà còn sức mạnh bên trong. Đặc biệt, chiếc điện thoại được hãng đánh giá “chuyên gia chân dung bắt trọn mọi cảm xúc chân thật nhất”, đây chắc chắn sẽ là một “siêu phẩm" mà bạn không thể bỏ qua.', 10, 8, 1, 32, N'dien-thoai-oppo-reno6-z-5g', CAST(N'2021-07-29T23:40:42.577' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (81, N'Điện thoại OPPO A94', CAST(9000000 AS Decimal(18, 0)), N'<p>Màn hình: AMOLED6.43"Full HD+<br>Hệ điều hành: Android 11<br>Camera sau: Chính 48 MP &amp; Phụ 8 MP, 2 MP, 2 MP<br>Camera trước: 32 MP<br>Chip: MediaTek Helio P95<br>RAM: 8 GB<br>Bộ nhớ trong: 128 GB<br>SIM: 2 Nano SIMHỗ trợ 4G<br>Pin, Sạc: 4310 mAh30 W</p>', N'Mẫu smartphone tầm trung của OPPO - OPPO A94 đã được giới thiệu đến người dùng với nhiều cải tiến nổi trội về thiết kế, pin và camera cũng như kế thừa những điểm mạnh của OPPO A93.', 10, 8, 1, 32, N'dien-thoai-oppo-a94', CAST(N'2021-07-30T09:13:10.450' AS DateTime), NULL, N'hieunguyen', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Specifications], [Description], [GoodsReceipt], [Inventory], [Status], [CategoryId], [Alias], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (82, N'OPPO Reno5 Marvel', CAST(9690000 AS Decimal(18, 0)), N'<p>Màn hình: AMOLED, 6.43", Full HD+<br>Hệ điều hành: Android 11<br>Camera sau: Chính 64 MP &amp; Phụ 8 MP, 2 MP, 2 MP<br>Camera trước: 44 MP<br>Chip: Snapdragon 720G<br>RAM: 8 GB<br>Bộ nhớ trong: 128 GB<br>SIM: 2 Nano SIM, Hỗ trợ 4G<br>Pin, Sạc: 4310 mAh, 50 W</p>', N'Lấy cảm hứng từ những nhân vật siêu anh hùng Avenger. Bộ phụ kiện đi kèm OPPO Reno5 Marvel bao gồm ốp lưng, tai nghe và dụng cụ lấy sim. Được thiết kế tinh sảo đến từng chi tiết với những nét biểu tượng đặc trưng của Marvel', 10, 10, 1, 32, N'oppo-reno5-marvel', CAST(N'2021-07-30T14:37:23.300' AS DateTime), NULL, N'hieunguyen', NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductInventory] ON 

INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (1, 1, 50, CAST(18040500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T21:01:50.823' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (2, 55, 50, CAST(33240500 AS Decimal(18, 0)), 1, CAST(N'2021-07-11T02:16:07.793' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (3, 54, 50, CAST(37990500 AS Decimal(18, 0)), 1, CAST(N'2021-07-11T02:11:27.357' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (4, 53, 50, CAST(30913000 AS Decimal(18, 0)), 1, CAST(N'2021-07-11T01:16:08.690' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (5, 52, 50, CAST(39748000 AS Decimal(18, 0)), 1, CAST(N'2021-07-11T01:12:07.123' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (6, 51, 50, CAST(16805500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T23:14:08.943' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (7, 50, 50, CAST(246010100 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T23:13:10.453' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (8, 49, 50, CAST(181260000 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T23:12:07.180' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (9, 48, 50, CAST(4740499 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T23:10:54.037' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (10, 47, 50, CAST(34105000 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T23:09:43.730' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (11, 46, 50, CAST(3790500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T23:08:35.677' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (12, 45, 50, CAST(2137500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T23:07:18.380' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (13, 44, 50, CAST(8540500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T23:06:10.570' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (14, 43, 50, CAST(3790500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T23:05:10.000' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (15, 42, 50, CAST(10060500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T23:01:41.070' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (16, 41, 50, CAST(9823000 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T23:00:39.917' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (17, 56, 50, CAST(31340500 AS Decimal(18, 0)), 1, CAST(N'2021-07-11T02:20:02.410' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (18, 40, 50, CAST(14145500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:59:23.883' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (19, 57, 50, CAST(20415500 AS Decimal(18, 0)), 1, CAST(N'2021-07-11T02:23:19.270' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (20, 59, 50, CAST(25612000 AS Decimal(18, 0)), 1, CAST(N'2021-07-11T02:31:46.883' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (21, 74, 50, CAST(1795500 AS Decimal(18, 0)), 1, CAST(N'2021-07-18T18:31:28.797' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (22, 73, 50, CAST(5595500 AS Decimal(18, 0)), 1, CAST(N'2021-07-18T18:04:21.457' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (23, 72, 50, CAST(11305000 AS Decimal(18, 0)), 1, CAST(N'2021-07-18T17:56:16.100' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (24, 71, 70, CAST(6830500 AS Decimal(18, 0)), 1, CAST(N'2021-07-18T17:42:24.277' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (25, 70, 70, CAST(4265500 AS Decimal(18, 0)), 1, CAST(N'2021-07-18T17:37:45.117' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (26, 69, 100, CAST(36565500 AS Decimal(18, 0)), 1, CAST(N'2021-07-18T17:25:24.600' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (27, 68, 100, CAST(16140500 AS Decimal(18, 0)), 1, CAST(N'2021-07-18T17:20:40.190' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (28, 67, 100, CAST(153900 AS Decimal(18, 0)), 1, CAST(N'2021-07-18T16:51:09.477' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (29, 66, 100, CAST(1320500 AS Decimal(18, 0)), 1, CAST(N'2021-07-18T16:38:25.707' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (30, 65, 100, CAST(655500 AS Decimal(18, 0)), 1, CAST(N'2021-07-18T16:31:41.857' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (31, 64, 100, CAST(237500 AS Decimal(18, 0)), 1, CAST(N'2021-07-18T16:28:31.897' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (32, 63, 50, CAST(1567500 AS Decimal(18, 0)), 1, CAST(N'2021-07-18T16:16:08.413' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (33, 62, 50, CAST(5690500 AS Decimal(18, 0)), 1, CAST(N'2021-07-18T16:08:54.080' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (34, 61, 50, CAST(43282000 AS Decimal(18, 0)), 1, CAST(N'2021-07-11T02:43:24.067' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (35, 60, 50, CAST(46445500 AS Decimal(18, 0)), 1, CAST(N'2021-07-11T02:35:26.463' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (36, 58, 50, CAST(44165500 AS Decimal(18, 0)), 1, CAST(N'2021-07-11T02:28:15.253' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (37, 39, 50, CAST(12245500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:58:18.513' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (38, 38, 50, CAST(5215500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:57:06.467' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (39, 37, 50, CAST(17765000 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:55:55.700' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (40, 16, 50, CAST(20415500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:30:01.340' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (41, 15, 50, CAST(16900500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:28:32.740' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (42, 14, 50, CAST(19465500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:26:42.767' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (43, 13, 50, CAST(12150500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:25:32.917' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (44, 12, 50, CAST(19465500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:10:17.223' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (45, 11, 50, CAST(10345500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:09:08.330' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (46, 10, 50, CAST(17375500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:06:21.067' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (47, 9, 50, CAST(17755500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:05:20.597' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (48, 8, 50, CAST(14240500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:03:59.237' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (49, 7, 50, CAST(10915500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:02:31.307' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (50, 6, 50, CAST(10630500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T21:54:57.870' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (51, 5, 50, CAST(10450000 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T21:53:24.663' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (52, 4, 50, CAST(16140500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T21:52:19.130' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (53, 3, 50, CAST(10155500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T21:50:52.867' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (54, 2, 50, CAST(33240500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T21:41:19.223' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (55, 17, 50, CAST(20130500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:31:05.220' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (56, 18, 50, CAST(20225500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:32:06.957' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (57, 19, 50, CAST(4360500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:33:31.423' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (58, 20, 50, CAST(2935500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:35:49.113' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (59, 36, 50, CAST(15285500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:54:56.793' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (60, 35, 50, CAST(10915500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:53:47.483' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (61, 34, 50, CAST(17185500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:52:46.767' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (62, 33, 50, CAST(4645500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:51:45.290' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (63, 32, 50, CAST(24405500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:50:10.087' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (64, 31, 50, CAST(22790500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:49:13.490' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (65, 30, 50, CAST(37990500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:48:08.840' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (66, 75, 50, CAST(4170500 AS Decimal(18, 0)), 1, CAST(N'2021-07-18T18:37:12.437' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (67, 29, 50, CAST(37040500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:47:11.367' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (68, 27, 50, CAST(18135500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:44:50.510' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (69, 26, 50, CAST(19370500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:43:55.713' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (70, 25, 50, CAST(21365500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:42:29.847' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (71, 24, 50, CAST(9965500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:40:35.410' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (72, 23, 50, CAST(11200500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:39:29.880' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (73, 22, 50, CAST(19000000 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:38:19.390' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (74, 21, 50, CAST(16150000 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:37:15.063' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (75, 28, 50, CAST(39890500 AS Decimal(18, 0)), 1, CAST(N'2021-07-07T22:46:07.307' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (76, 76, 50, CAST(5700000 AS Decimal(18, 0)), 1, CAST(N'2021-07-23T14:21:56.053' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (77, 1, 10, CAST(18700000 AS Decimal(18, 0)), 1, CAST(N'2021-07-27T21:10:18.257' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (78, 77, 10, CAST(7000000 AS Decimal(18, 0)), 1, CAST(N'2021-07-29T23:31:27.383' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (79, 78, 10, CAST(5000000 AS Decimal(18, 0)), 1, CAST(N'2021-07-29T23:35:35.543' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (80, 79, 10, CAST(22000000 AS Decimal(18, 0)), 1, CAST(N'2021-07-29T23:38:52.033' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (81, 80, 10, CAST(7000000 AS Decimal(18, 0)), 1, CAST(N'2021-07-29T23:41:01.427' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (82, 81, 10, CAST(7000000 AS Decimal(18, 0)), 1, CAST(N'2021-07-30T09:13:30.093' AS DateTime))
INSERT [dbo].[ProductInventory] ([Id], [ProductId], [GoodsReceipt], [CostPrice], [UserId], [CreatedDate]) VALUES (83, 82, 10, CAST(7000000 AS Decimal(18, 0)), 1, CAST(N'2021-07-30T14:37:42.283' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductInventory] OFF
SET IDENTITY_INSERT [dbo].[ProductPhoto] ON 

INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (263, 1, N'762ee92e-fb95-4896-8c3b-cec76413de65.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (264, 1, N'd2e5473b-03c1-4aa1-8e91-f176057f2ae1.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (265, 1, N'5232d450-228f-4a45-9d2f-9c6f58e1b969.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (266, 1, N'ed000f88-32cc-410a-a184-08df26b671ff.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (267, 2, N'9e4daed3-8113-4a13-97fa-3184a6ca3c90.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (268, 2, N'1a11622c-f769-42eb-84f5-c8ab6999a88c.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (269, 2, N'ec2b9aae-dec7-48dc-ad53-2ed19777df7d.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (270, 2, N'c9d805d8-9c2f-4513-a144-2152ea409a90.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (271, 3, N'932e92cb-6013-4346-8ee1-71a833795d35.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (272, 3, N'5c62f07c-18d8-4717-83f9-5e9c49e77e1b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (273, 3, N'9f23f342-fc24-4dd5-9cf8-6af80dd4935b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (274, 3, N'33833735-9eec-4c57-820a-d8f301f1f926.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (275, 4, N'5f2dfbd7-1bce-4d4d-9566-6471f5043387.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (276, 4, N'4f489620-cf60-4579-b5b1-3ef0a4a5a6e2.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (277, 4, N'a26f456d-5397-4443-93d2-4a81cb9bdfe0.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (278, 4, N'e8f771db-5213-4885-a99b-8a556bdc08ce.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (279, 5, N'3a7e57d0-fcd3-4697-b214-b9978f5c7e66.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (280, 5, N'5c2a7097-72bb-459a-8c6f-dfdd6e9832cd.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (281, 5, N'ebd12c53-33c6-4da2-adc6-c0abd1c239b3.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (282, 5, N'd11a3ddd-8411-4ba5-b238-a27873d19800.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (283, 6, N'1647a67e-61d8-4107-bd0d-40ab3b11eb2c.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (284, 6, N'462be193-94fd-48f6-80c0-bf17be1a54e9.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (285, 6, N'cbe4704a-738a-4b7e-a4e9-0646fc8a78c0.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (286, 6, N'2147260d-cbe2-4de4-baf6-542f8d9e70ef.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (287, 7, N'603098ed-36f2-4a0a-b1c6-ce689361b22c.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (288, 7, N'a92bb2ce-4ea8-4076-9447-fb795d770bb9.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (289, 7, N'fca1fd6f-d952-4071-b897-23d770148a8f.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (290, 7, N'e993e489-99ac-4b78-b242-1a9544d1cf0e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (291, 8, N'43a4e09f-234c-41a7-84fe-6218eb80ce55.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (292, 8, N'a844f3ba-3803-403f-a9a9-eb700ec962c4.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (293, 8, N'1aefdff6-0eb7-4a30-8d9b-e43b43c87d66.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (294, 8, N'89fb793b-9d87-42db-a6de-408b7a84228e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (295, 9, N'd4769fda-af32-49e5-94bc-f22eb3716a6b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (296, 9, N'116d6f36-3d20-4e1e-8db1-679ea0d8d859.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (297, 9, N'6112af8c-c55a-478b-9629-3efaa659c4f5.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (298, 9, N'aa3f1ed6-a192-43d2-b1f9-285a4330b109.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (299, 10, N'03a886e9-ec42-4888-8deb-8e9a8f39c258.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (300, 10, N'c5159feb-7aed-41bc-9329-8007e9af8cc9.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (301, 10, N'65c60415-cc76-4c39-b18e-b0f611d5f3c5.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (302, 10, N'7a4f4b40-17ee-4df5-9d46-e1034d83ec9c.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (303, 11, N'7614835a-bbce-460a-a632-9dc7c06543cf.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (304, 11, N'c019f33d-715e-41fa-9b3e-04bbdef800f3.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (305, 11, N'4979ddc0-206b-44ce-8c06-4621205f6416.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (306, 11, N'555c3ce2-6e94-4823-9b99-c2d7ba9e9efe.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (307, 12, N'1e74ea11-2766-4ced-8c03-be972422cf4b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (308, 12, N'35554ec5-2f79-463d-bce1-f9e7e0895a3d.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (309, 12, N'b14b3760-a075-434a-829f-755149d19b1f.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (310, 12, N'51ba818a-6046-4c3a-973d-b954db6be4f4.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (311, 13, N'812940c1-438f-4c5a-ab52-817486a62471.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (312, 13, N'd06e7920-c708-4846-bede-bd851194e476.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (313, 13, N'8c6366f3-bced-46b0-a0de-153ce9779008.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (314, 13, N'2c184245-a1bc-4606-9667-b51492e7d509.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (315, 14, N'a52a442a-e9aa-4073-b3c6-eef2b41b0fa9.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (316, 14, N'da4832e7-6249-4ab6-9e5d-3d5f1bee95c7.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (317, 14, N'59182281-6e8a-4677-a34c-569d378ae8e8.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (318, 14, N'34e8ebc0-0b0e-4c9c-bb8b-42e51209c1f2.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (319, 15, N'ab5aac10-653f-4c19-b793-36ed37fd29a8.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (320, 15, N'ccbdae97-a259-4e71-ab4d-f9b3282d41e3.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (321, 15, N'4365c298-a77b-4e05-86ba-7db5da0b3743.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (322, 15, N'22522091-6983-4a8d-86ca-bff14d2d400f.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (323, 16, N'cd981756-a99e-4b31-be08-9f5ed72823a0.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (324, 16, N'42c6427e-3909-4b80-9d1f-d08ff485ccf1.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (325, 16, N'230fc364-acc0-4b70-91a4-e3a0e3bd3b7b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (326, 16, N'7336af8d-abe3-437b-817d-c3d47769dd2e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (327, 17, N'b45e46af-0d07-43b4-8d7b-2061e5f36d05.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (328, 17, N'80c4a0ac-98fe-4a6d-943f-f1d6ede705fd.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (329, 17, N'd49469fc-7a08-4ff7-b362-a15f87c237a1.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (330, 17, N'aa9ff79a-595e-4e44-a64d-8660a4855046.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (331, 18, N'bb263fec-ba89-43c7-9f22-af6ef3460fc8.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (332, 18, N'321ade2f-8433-4f48-98cb-7cb98b71e2cf.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (333, 18, N'6f724c44-0f4c-4783-84d9-87eeda752c26.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (334, 18, N'e6fea379-9d91-4026-b204-63c98619b7e7.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (335, 19, N'4b1be525-b998-4393-be29-65535cc2612c.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (336, 19, N'f8a3a46b-f86b-495e-b131-d6646b3cf224.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (337, 19, N'25232851-8bc6-46d5-aa62-f291039e826d.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (338, 19, N'fd3eb2b8-a6af-46ad-b712-0665365ef477.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (339, 20, N'a4c8b62d-c8ce-4da0-8c9f-808b4d5b9f27.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (340, 20, N'd9c4b298-3726-4929-a2f7-c3e36bd719d6.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (341, 20, N'74f80d35-ba2d-42e2-bc7d-dd35b2fe1b55.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (342, 20, N'82c700ca-34e4-478e-8aa4-c6cb37a99af7.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (343, 21, N'2eebe960-1b85-4a0e-b7b8-5e7696614d64.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (344, 21, N'119d401e-b3a2-4832-95f4-98d3eedb2382.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (345, 21, N'2dd58b0b-677a-4aa0-b69d-5de0515db1d3.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (346, 21, N'8aeac3eb-d1cf-49ed-81c0-2f3085e3bddf.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (347, 22, N'45a0c0d5-3b38-453a-a976-03e6857ec88c.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (348, 22, N'f1895b2f-9e15-4fbc-aaaa-295d728f9840.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (349, 22, N'4066c10e-c95d-49a7-9d0f-61f013cd08e0.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (350, 22, N'04425564-9e3c-4df9-b24b-4dc0bdf9529b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (351, 23, N'38666b5b-4846-49c5-bcf9-e8370c969494.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (352, 23, N'6f60a09f-95d0-4d9b-bbcf-de4f74e82339.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (353, 23, N'52126817-fa8a-4d63-9c26-a6f1b11926c2.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (354, 23, N'b0bc0dc4-8e08-404c-8cf2-6939c37a2fc7.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (355, 24, N'3a7b9065-0f9b-4f83-9e97-0c7038850e45.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (356, 24, N'20ba9a50-55b5-43a7-b6db-03ac2ddc0043.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (357, 24, N'62f08993-4996-40c5-9437-6a6183d16bfc.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (358, 24, N'bc367300-2ade-47c1-a58a-a6f52b6f1dca.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (359, 25, N'6929b20e-231b-4c65-9f40-7ca4fed7d540.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (360, 25, N'43f25407-6516-46a5-b92e-12f59775d638.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (361, 25, N'5e9cd04e-8bcb-4bbb-a119-6c79efc02cca.jpg', 1)
GO
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (362, 25, N'b3fc2b83-b32a-4de6-b7eb-8e42ace885ec.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (363, 26, N'021179af-0b1b-4607-8057-ddae7eaf7489.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (364, 26, N'84aa4ca0-94be-4d80-ae2e-97f3acc8eb24.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (365, 26, N'93135c25-8742-453e-a3d3-a4e7c4cb3114.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (366, 26, N'8f2a734e-5b66-49ff-96a2-5aa14d6e2a6b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (367, 27, N'3a5ccc97-ea05-43ff-9e42-45efad329dbb.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (368, 27, N'4bb2e616-36f8-4b30-ac96-4b43c63ecf94.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (369, 27, N'000f7160-534a-4f97-a731-8f6a9a07bc6b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (370, 27, N'fcb1e726-6841-4d77-9971-493377024d55.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (371, 28, N'f5370623-c4fc-4d78-a7e1-6cb866767426.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (372, 28, N'9dba7c86-9bb2-48a3-821c-f603adf14aad.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (373, 28, N'8b778064-452f-4de5-83e9-fda6fc0d4d7b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (374, 28, N'b80a32bd-1b65-484c-96d0-28601654395e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (375, 29, N'd86db360-1b7e-40f1-be7c-82a063cbbfe6.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (376, 29, N'd86be0ba-5f97-43f0-9caf-c7242a91373b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (377, 29, N'403c0f5d-2385-4d6d-9944-33c11c7176d8.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (378, 29, N'c203b90e-2e97-42a7-a54f-0c861994b1f0.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (379, 30, N'f5be1766-a2ef-49df-b08d-2765558d8c28.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (380, 30, N'84c0c777-fc64-48e3-9283-abd48545f746.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (381, 30, N'2807e676-6c92-47d3-9015-0b70ddede6d4.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (382, 30, N'2e96a841-ab4a-49a0-a64d-728c6d9d9a50.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (383, 31, N'8a8d2eb1-8512-4c1d-bcdd-170f067f6158.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (384, 31, N'd7d313aa-5f47-4999-a302-6b7f284aaa82.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (385, 31, N'5f48a4eb-0a62-4caa-a145-e5e0a50af918.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (386, 31, N'1ff3b74d-4f51-43b1-b798-cc7db73402a3.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (387, 32, N'0917e27f-1da8-44c7-a704-b384b69819a6.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (388, 32, N'dbe6c271-b0a6-479a-8681-5f64688d1d80.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (389, 32, N'a75e9e87-6cc9-4b54-81ed-168a3bd2fa70.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (390, 32, N'95f08958-e108-401d-93c7-1e361c066af4.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (391, 33, N'61d0e9f6-d020-4221-af9a-06c5c62618c2.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (392, 33, N'd97920b6-2d5e-4b9d-8714-e4a4b0630066.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (393, 33, N'6a78818f-64a8-445c-81ea-8414f11831da.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (394, 33, N'1460c4a5-067b-44de-bd15-1c7c1647a09c.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (395, 34, N'45e55885-3bcc-4cf7-8c04-db68fa8965e2.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (396, 34, N'd9dc59cb-84f1-46b3-9347-3963c8c11c99.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (397, 34, N'96382ab9-fefc-411e-b702-80a3996ac071.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (398, 34, N'bd53d54a-1494-424d-9cea-2d835fa94016.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (399, 35, N'7280d5ff-2dad-47a1-866e-7191cd1b4a26.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (400, 35, N'c67b7a03-1e28-41a0-aebe-470a03001aa9.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (401, 35, N'4683e01d-4ad9-4146-9377-473d5ad38e61.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (402, 35, N'133542e6-4aa0-4df5-95e4-2f858f1d11ef.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (403, 36, N'eea10428-ed37-49b1-9a5f-b9215fb6a1e0.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (404, 36, N'c19c0932-945e-41c4-bb4c-4ea115c0e040.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (405, 36, N'7028a0c5-d970-4c9e-bd79-fdc5ddd82984.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (406, 36, N'45376628-f5e0-4520-a79c-38123e78e763.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (407, 37, N'76a96132-00eb-412c-b8f8-1e3bb639d1c1.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (408, 37, N'f5d427a5-6b78-4a5c-8e3f-26136d626706.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (409, 37, N'4246a305-e9ff-44a6-8a3b-2d97767c88df.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (410, 37, N'34e406d7-a309-4bf9-9080-543a09755511.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (411, 38, N'0656a500-c81d-4d88-90d5-ed36e905cbd3.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (412, 38, N'7796b7b1-39bb-4d46-9e94-d14706031eea.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (413, 38, N'048fb3fd-f3dc-433a-9a67-142539ca2765.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (414, 38, N'5a71dcac-77c0-43d6-8c25-e274da1dc27b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (415, 39, N'f2e9ce13-8ead-499f-a5ad-850cec8b3b3e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (416, 39, N'99e652ba-b60c-4565-9f3e-0e9f17c2b661.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (417, 39, N'0ad970ca-3f7d-43fc-90b4-ae2a4efdbb4e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (418, 39, N'dcef0008-7b72-4bd0-926a-8df372f39c45.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (419, 40, N'7b566a8c-fe67-4186-9a9b-2b0b3fa7b082.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (420, 40, N'3478eb18-bae7-44b5-9d56-5e7897540ab8.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (421, 40, N'13a7cd87-2f4c-441c-9747-bec54dabdddc.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (422, 40, N'a87fa977-502b-4b33-a8fd-a81cbe7e7e60.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (423, 41, N'1ea4e018-aa5c-4372-85af-47c5425e2a51.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (424, 41, N'5e74bcb1-c83b-4d21-b8e0-78ded4ab81c1.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (425, 41, N'6e349064-3e2c-42bc-b4a1-4812d9ebb5a7.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (426, 41, N'53c3e8a7-f94e-49b3-b6dc-1d9f689fbcdd.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (427, 42, N'9f2d0ebc-d86a-4531-936a-f871d5167dc5.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (428, 42, N'bc6a92f1-140f-4356-b1df-177cb127fe93.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (429, 42, N'a23efd41-2dcd-482e-83e0-65cf95ac862b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (430, 42, N'c82c0f37-b526-4b5c-abf5-d737acdf2461.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (431, 43, N'605db2a5-4c84-4ed8-996c-4d0d7a4d4c1c.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (432, 43, N'7b481fe6-af8e-4576-9bdb-6c26fb36223c.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (433, 43, N'fa553fe7-d3af-480e-8a33-5cd6c5a6a731.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (434, 43, N'fb0d71e3-ab0f-49bc-bf25-c7e30fe27bc5.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (435, 44, N'bbf3f59f-ac23-4f48-994c-273d331e372d.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (436, 44, N'e0603ddd-8724-4cff-85c3-278c06fc37e4.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (437, 44, N'5f288026-89da-4333-850a-992db38cc778.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (438, 44, N'611fbafb-44ea-4ac9-8c44-5da0f348843c.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (439, 45, N'7e4be21a-48c6-4e17-bd91-56bdd6f944d6.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (440, 45, N'17cbb2a2-1622-45fd-b7e7-23ac0fc9c40b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (441, 45, N'b1c20f46-7c92-42a0-9d6a-31e7752a122e.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (442, 45, N'ec2ea151-485d-48a7-8840-d2300dfc9e90.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (447, 47, N'76572412-4ea2-475a-be9d-ba35c7699711.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (448, 47, N'688b15fa-6db7-40e4-8e2f-406e7309cc8e.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (449, 47, N'faced8d3-c378-41ed-99e2-3b44a08cf607.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (450, 47, N'71dcf264-a455-4843-a9f0-08547d2c651d.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (451, 46, N'eb89c123-70e8-4bdc-b7e7-962380c03dd4.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (452, 46, N'd56fa16a-e296-405b-b40a-7608e8b7674a.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (453, 46, N'bf36339e-f421-4f02-82f4-cee514f1da61.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (454, 46, N'a58fbe42-6cfb-466e-ad5f-c7ce24d82b20.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (455, 48, N'b1a16606-68b1-4a26-9acb-41573d625abe.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (456, 48, N'0e6210b9-a302-41b3-8580-e50adce3c250.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (457, 48, N'134ac3af-8553-4b41-86a3-7de4d3707434.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (458, 48, N'66b4a9b0-8567-4bb5-9efa-fa93e7cef861.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (459, 49, N'46eb8aa1-930e-4d83-8c12-48db5e54eb7a.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (460, 49, N'24457437-c701-4bf8-aa02-d4b4b1146325.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (461, 49, N'85d61f7d-a7c8-4f72-abec-2147bb473c8e.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (462, 49, N'5526c8ff-af21-401a-997d-2b20b2443e46.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (463, 50, N'90f1615e-6067-4838-be84-d2ce38e81432.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (464, 50, N'a420b3ae-e4df-451c-8a16-42229517cb3d.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (465, 50, N'e2bdf7b5-8d8d-420a-9ed0-1dcb7227e263.webp', 1)
GO
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (466, 50, N'4331f48e-3604-4bad-b44f-0347ac343233.webp', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (467, 51, N'afe560d5-c4c9-490d-aa06-b5bb420fa901.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (468, 51, N'2ae505bd-ff9f-4217-88fe-d1be23666145.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (469, 51, N'8986e060-3fa5-4dc0-8dc4-965d070835f9.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (470, 51, N'2f642dcb-bdb6-49c6-8024-307fa9e20522.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (471, 52, N'c4f15014-a2e0-4998-b98a-f338fdaa6535.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (472, 52, N'6be6ddb5-dd1d-40d9-8f57-413bdd458db2.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (473, 52, N'c69e88e5-3c8b-48f7-ac35-62dbc53d6e1c.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (474, 52, N'25665aa6-67a3-426e-a154-ef4bf428992f.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (475, 53, N'716a00bd-4880-4295-9383-947e672dd558.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (476, 53, N'303dd308-90fc-4d27-84f6-b1388ba9170e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (477, 53, N'7e575dd7-4e29-4da0-8d7e-1bd0cb947b4c.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (478, 53, N'cf41a472-0ce8-4999-9320-7041b0ff31fd.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (479, 54, N'2863941f-f0a2-43a0-b4bb-be7ed47b9425.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (480, 54, N'deff5812-a398-4716-9179-de4d897d9478.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (481, 54, N'1b8a631c-1419-47a5-aa6a-178c302d0ecd.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (482, 54, N'213047f6-74a5-4f42-a32b-fff9c1a52bb9.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (483, 55, N'ca5a8e7e-fb21-4829-a5bf-683b83e6ca98.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (484, 55, N'c950f7c5-55e7-40b4-9bf1-32dcb45b80f7.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (485, 55, N'b3ea4146-aa76-40c7-92b0-65c60e87160d.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (486, 55, N'53af19dc-19dc-4829-b181-bd469a6329ea.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (487, 56, N'c0dc50f9-6a64-4473-a29f-cf54b950fd0f.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (488, 56, N'9b0f335c-1a7b-45f0-bbb2-20c6c5b7aa31.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (489, 56, N'8d5c25f2-98b5-4b0e-8486-54bc5c47ade8.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (490, 56, N'0fd017d1-8bb1-41ba-a91d-7f5ce1348e9b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (491, 57, N'5fe4496b-5f36-4873-8592-bfba24af410f.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (492, 57, N'ca088841-76fe-4d67-851e-efe21bbd5d9e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (493, 57, N'f4308a50-6419-4fc7-9c01-88539a69162f.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (494, 57, N'14e12ef2-24a4-4d86-88e0-543a14e59e80.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (495, 58, N'b2651993-38d6-47c4-89cc-a3124281eb55.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (496, 58, N'cc602a13-6127-402c-ae64-05370d1e6245.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (497, 58, N'25357839-31f6-4fe9-aec3-73037271d8ba.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (498, 58, N'7be450b5-75a8-4707-bea0-54981b40a1a7.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (499, 59, N'2240d065-5cf7-432d-81bc-5b312ff0381c.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (500, 59, N'c2db55a6-d795-402a-a69d-1fac12c57881.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (501, 59, N'1356e920-d5db-4755-8bba-176e8e755132.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (502, 59, N'ded9eced-d1d7-43c1-87f2-930fd5be603a.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (503, 60, N'cda359ff-462b-44e7-9e40-475eda17db4f.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (504, 60, N'd87771a5-74bd-443d-95c4-4d599737ec3b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (505, 60, N'2c2dc118-75a7-4745-9eb3-85ac3d5334df.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (506, 60, N'd0d403f3-79d5-4f47-9ccd-d541c5ac4336.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (507, 61, N'e02408ed-44a2-4fc6-b748-f4710461ea14.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (508, 61, N'd8890003-8f58-41f1-bd9b-65747fffd15f.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (509, 61, N'1f06fece-a7bf-48e5-936a-e7bbc37ce60f.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (510, 61, N'f33d4180-9acd-4ab3-87f8-fb2c67fa6b05.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (511, 62, N'58774352-02da-417f-9055-2aef3718c82a.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (512, 62, N'd4c4f5a2-3459-44fc-82f5-6e20a93a86a7.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (513, 62, N'25ea6e92-e5db-47d1-a7f0-da39bfd61d62.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (514, 62, N'8266f74b-f180-4164-9961-83442db78c10.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (515, 63, N'6d7443b9-10ed-41b6-bcd1-384067d3458a.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (516, 63, N'3fb5924b-665a-42b4-a498-249640219a5e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (517, 63, N'cb109f07-fbe1-48e9-ab88-57497101ba11.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (518, 63, N'161219ab-5d12-4a9b-b64b-65727efd24c7.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (519, 64, N'9fe5bf4b-26d7-4c88-ac4d-1afc19c0400d.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (520, 64, N'6d9ad352-ab6e-4b76-971c-c7c25f77fa58.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (521, 64, N'ccc643e4-b4bc-41f5-80f1-3d18d145c4fb.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (522, 64, N'fa214e74-489f-412f-b5e2-fadab414ee56.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (523, 65, N'f6df354a-d5d4-408e-bba1-295f6abb50e5.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (524, 65, N'cff073fc-62b1-4ce9-be5e-709ee6a2cd02.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (525, 65, N'97c777cb-dbc7-4ae2-b697-9ba6a86b5870.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (526, 65, N'14487251-73b5-4126-89e0-8ff27a74b5ba.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (527, 66, N'1f9199da-b069-4272-868e-00fb2aa22634.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (528, 66, N'8d1b348c-8098-4d0b-924e-91ea4e10c582.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (529, 66, N'38e09e3d-ee55-4527-beb0-0f2a896af2a0.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (530, 66, N'f15deee7-1e99-4a29-baea-2911fb8971b9.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (531, 67, N'8992a2ba-d2e4-4f64-9c42-a2282b3ea161.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (532, 67, N'23a54da6-6569-494e-805c-dc44231a9af6.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (533, 67, N'8f98d7e3-d728-449a-8abd-5abe11279c60.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (534, 67, N'0ae8edc2-0982-464e-9bfb-3ba4d69cb63c.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (535, 68, N'32c4fa19-20d2-4012-9ba0-2715850241b6.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (536, 68, N'879319f2-acce-4128-9080-921fa637982b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (537, 68, N'393f6922-6026-493b-92b6-3a21a0dff880.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (538, 68, N'f20a88c5-9570-4636-9c4e-f0f25712c741.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (539, 69, N'22b8f9ca-d17d-4615-904c-59b3716bd754.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (540, 69, N'f08e9fa6-d2b0-4162-950f-16d06dacfd79.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (541, 69, N'fd9e1d18-e666-4186-b7bf-d970e5530f8e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (542, 69, N'26ce6479-1eba-4275-81f4-4c48d3b06c4f.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (543, 70, N'624c002e-2b8a-4dcb-82ae-054b5a7c35aa.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (544, 70, N'7937cbf7-44ff-4a02-8bf8-ba7ac57dd367.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (545, 70, N'efe3a0f1-9d24-4c86-a705-6f6e3ac5a40b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (546, 70, N'39d8a901-831a-49e1-a2f7-8a8f92984995.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (547, 71, N'844b6d1b-bbb9-4623-9382-5f25560e193b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (548, 71, N'04979040-46dc-4a55-acee-16b6b4887607.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (549, 71, N'1a79000a-95ef-40d9-a4cb-e699d8295899.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (550, 71, N'e2d6e7a3-c5d8-4a31-b4d6-eb38388c7c7e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (551, 72, N'617e9e0b-6a8d-45cb-9b77-863ec48ff0aa.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (552, 72, N'ea92d4f6-1618-466b-887a-3f5f1e5de47c.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (553, 72, N'0472b9e6-058c-45ea-b9c2-035e71de393e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (554, 72, N'305b5af1-28bf-424d-8f9a-700cea6b542e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (555, 73, N'50329745-4633-41fd-ae6d-b6c5d2774381.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (556, 73, N'6d181147-3c16-4659-82d8-a168007f344a.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (557, 73, N'216b78b6-38d9-4ae2-b6a9-c5a221840213.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (558, 73, N'51c0c103-0fc2-489c-ab1c-7dd1101bbbd4.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (559, 74, N'fa4a8172-dbbb-4dcb-bc32-17616780fa98.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (560, 74, N'68389c44-cbfd-4e73-931d-6f4e8d3e7ed2.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (561, 74, N'dd431cef-7658-41ae-8575-a4e15e5a0e02.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (562, 74, N'031e1fa9-e80e-4058-a978-774d4156e13e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (563, 75, N'57d3aa87-f983-46c9-b706-8c2345541ead.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (564, 75, N'17c150cd-7f7d-4a49-a8a9-7317c061342f.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (565, 75, N'8f7d68f8-5c0c-46ab-b4d8-e5224417654c.jpg', 1)
GO
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (566, 75, N'b01c0e95-f2d6-4b94-a889-45aeaca3f06f.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (567, 76, N'6f59f54d-ff55-4b65-80e8-ce761d5ce627.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (568, 76, N'04d6c90c-3ea8-4634-be4b-a205078b519e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (569, 76, N'2662cc8e-de2a-43c2-bd18-86851306055b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (571, 76, N'a27f964b-bb21-4fc2-87d1-6879e73be52e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (572, 77, N'1254b409-bf6f-47aa-b596-3fd51ff686f8.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (573, 77, N'aaad24ac-923c-4b75-8a2c-a2bbfc0bf006.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (574, 77, N'357e48aa-63b7-447c-aa6b-24494a068dfd.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (575, 77, N'1ecc3ddf-b7a5-45e4-b425-72d96afb0d4e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (576, 78, N'0ae9ea0c-6a92-4edb-b741-b138b23fdd9b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (577, 78, N'ea98b61a-a461-495b-af3d-c7fb6caafdcf.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (578, 78, N'6d0e5bfc-0aa7-4587-999f-731d19083d4c.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (579, 78, N'69af0550-01cc-4731-a2aa-eddc1c245cc0.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (580, 79, N'328df1bb-7a3c-4c67-870e-fb21e8a02e00.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (581, 79, N'94d51804-b0ee-46b9-8d7a-713baac82642.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (582, 79, N'01cc7480-3d32-44de-a260-782a83af5070.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (583, 79, N'ff4daa0d-d004-49af-adf7-a6fe853a8757.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (584, 80, N'190add32-4936-4536-9d3c-6a30563a91af.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (585, 80, N'db98b496-0d12-4473-be3c-6962e4daf6fc.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (586, 80, N'57ea0751-0696-44e8-905d-ee7de1e72573.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (587, 80, N'c7fad786-98d1-45e1-b5e4-5d46fa991e71.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (588, 81, N'6e25807c-b420-46c8-9c04-cc90b6d0bfd4.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (589, 81, N'af73598a-8df2-46a0-b149-cca9688718f2.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (590, 81, N'd683250d-bda7-4d0b-b772-73a8ef10ec5e.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (591, 81, N'452cec7b-82b4-4a67-afbc-28998af200a0.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (592, 82, N'35bb986f-9e57-4c3d-b78c-afcc330bc442.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (593, 82, N'2e256097-b966-4ae3-beff-f098a1eea562.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (594, 82, N'bffc221f-63ca-401a-a9cb-47a66f5fae7b.jpg', 1)
INSERT [dbo].[ProductPhoto] ([Id], [ProductId], [Url], [IsDefault]) VALUES (595, 82, N'b7d892ac-6026-468b-ba16-9ddc92d80ca6.jpg', 1)
SET IDENTITY_INSERT [dbo].[ProductPhoto] OFF
SET IDENTITY_INSERT [dbo].[ProductReview] ON 

INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (1, 1, 3, 5, N'Sản phẩm chạy rất ổn định', CAST(N'2021-07-10T11:00:18.860' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (2, 1, 3, 5, N'Rất tốt', CAST(N'2021-07-10T12:58:26.677' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (3, 13, 27, 5, N'Mình đã nhận được sản phẩm, đóng gói rất đẹp', CAST(N'2021-07-16T15:24:21.273' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (4, 13, 27, 5, N'Sản phẩm rất đẹp', CAST(N'2021-07-16T15:24:51.773' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (5, 13, 27, 5, N'Mình rất ưng ý', CAST(N'2021-07-16T15:25:50.230' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (6, 6, 55, 5, N'Sản phẩm trên cả tuyệt vời', CAST(N'2021-07-20T19:48:40.723' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (7, 3, 30, 5, N'Máy dùng rất ổn định', CAST(N'2021-07-22T11:14:42.577' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (8, 3, 29, 5, N'Rất tốt', CAST(N'2021-07-22T11:16:19.197' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (9, 6, 57, 5, N'Mình đã mua và dùng rất tốt nha, cho cả việc lập trình', CAST(N'2021-07-22T23:53:20.057' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (10, 6, 4, 4, N'Với tầm giá này thì cấu hình máy khá ổn, dùng ổn định', CAST(N'2021-07-22T23:54:55.747' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (11, 6, 56, 5, N'Cấu hình hết sức tuyệt vời', CAST(N'2021-07-22T23:56:38.547' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (12, 6, 4, 5, N'Sau một thời gian dùng mình thấy rất tốt', CAST(N'2021-07-22T23:58:40.627' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (13, 6, 56, 4, N'Sau 1 ngày dùng, máy chạy rất ổn', CAST(N'2021-07-23T10:48:03.493' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (14, 6, 5, 5, N'Máy dùng không tốt như mong đợi', CAST(N'2021-07-24T20:24:41.803' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (15, 6, 21, 4, N'Hơi thất vọng vì sản phẩm khá đắt nhưng hiệu năng không tốt', CAST(N'2021-07-24T20:26:27.870' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (16, 6, 28, 4, N'Cũng tạm ổn', CAST(N'2021-07-24T20:27:01.597' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (17, 3, 8, 5, N'Thấy mọi người bình luận tốt nên mua, quả là tuyệt vời', CAST(N'2021-07-25T16:07:07.550' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (18, 3, 22, 4, N'Máy dùng tạm ổn', CAST(N'2021-07-25T16:13:15.943' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (19, 3, 79, 5, N'Mình rất ưng ý', CAST(N'2021-07-29T23:47:52.110' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (20, 17, 79, 5, N'Điện thoại đẹp, nhiều chức năng, cảm biến vân tay trong màn hình, có hỗ trợ 5G', CAST(N'2021-07-30T00:03:04.697' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (21, 2, 77, 5, N'Giao hàng rất nhanh', CAST(N'2021-07-30T08:57:15.533' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (22, 2, 78, 5, N'Điện thoại phù hợp với túi tiền', CAST(N'2021-07-30T08:57:38.133' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (23, 2, 80, 5, N'Điện thoại có hỗ trợ 5G', CAST(N'2021-07-30T08:58:04.677' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (24, 2, 81, 5, N'Điện thoại phù hợp với túi tiền', CAST(N'2021-07-30T09:19:37.070' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (25, 2, 77, 4, N'Điện thoại chụp hình đẹp', CAST(N'2021-07-30T09:56:54.193' AS DateTime), 1)
INSERT [dbo].[ProductReview] ([Id], [UserId], [ProductId], [RateStar], [Text], [CreateDate], [Status]) VALUES (26, 2, 80, 4, N'Điện thoại phù hợp với túi tiền', CAST(N'2021-07-30T14:44:23.727' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ProductReview] OFF
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([Id], [Icon], [Name], [Status]) VALUES (1, NULL, N'Laptop - Thiết bị IT', 1)
INSERT [dbo].[ProductType] ([Id], [Icon], [Name], [Status]) VALUES (2, NULL, N'Điện Thoại - Máy tính bảng', 1)
INSERT [dbo].[ProductType] ([Id], [Icon], [Name], [Status]) VALUES (3, NULL, N'Máy ảnh - Quay phim', 1)
INSERT [dbo].[ProductType] ([Id], [Icon], [Name], [Status]) VALUES (4, NULL, N'Điện tử - Điện lạnh', 1)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Description]) VALUES (1, N'Admin', N'ADMIN', N'9d086ddb-5c75-489d-bd74-ed8a01cf73df', N'Quản trị viên')
INSERT [dbo].[Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Description]) VALUES (2, N'Emp', N'EMP', N'10d6a280-bacf-41a3-a5a5-a610dfa8514b', N'Nhân viên')
INSERT [dbo].[Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Description]) VALUES (3, N'User', N'USER', N'a4b341ff-1378-41eb-a72f-d11052d6ece1', N'Người dùng đã đăng ký')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstMiddleName], [LastName], [Address], [Status], [Gender], [Birthday], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, N'hieunguyen', N'HIEUNGUYEN', N'hieutanmy321@gmail.com', N'HIEUTANMY321@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFSnpnXD9w+tqRpB5jCBMMiRS7C98CLhRE/gSaaG8F3VGFEiKIMBDDFCZW76zhbwWQ==', N'09ed54c9-553d-4636-b28a-4d7884c9f397', N'c7fbe909-bf7a-4a59-8602-e28b59e00d50', N'0965924083', 0, 0, NULL, 0, 0, N'Nguyễn Trung', N'Hiếu', N'KTX Cỏ May, khu phố 6, phường Linh Trung, quận Thủ Đức, TP.HCM', 0, 0, CAST(N'1999-05-25T00:00:00.000' AS DateTime), CAST(N'2021-07-07T20:34:38.827' AS DateTime), CAST(N'2021-07-13T06:18:08.423' AS DateTime), NULL, N'hieunguyen')
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstMiddleName], [LastName], [Address], [Status], [Gender], [Birthday], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (2, N'hieuvo', N'HIEUVO', N'17110299@student.hcmute.edu.vn', N'17110299@STUDENT.HCMUTE.EDU.VN', 0, N'AQAAAAEAACcQAAAAEDDk1yxVUwB3LMbIMatV2dhCQAhyX9kFaeyiTVhvW3WZmKIvdB+EniY1j9UzG1l12A==', N'ccfb0799-6c77-4c27-a6f5-4778846a1849', N'9c1b7222-db81-4bd5-8ede-c2107f25f208', NULL, 0, 0, NULL, 0, 0, N'Võ Trọng', N'Hiếu', N'KTX Cỏ May, khu phố 6, phường Linh Trung, quận Thủ Đức, TP.HCM', 0, 0, NULL, CAST(N'2021-07-07T20:34:38.827' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstMiddleName], [LastName], [Address], [Status], [Gender], [Birthday], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (3, N'datle', N'DATLE', N'dat@gmail.com', N'DAT@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECDJ/wAjwaO2XHXXgOToqiL+GsuLM/QveYjPokqEGiCB0Lg2GCvMZkuWpFCmjcjstA==', N'aae0ce9d-b7b2-4a25-89d1-5bd052a8e249', N'735893cc-096a-4def-be50-ef097d562489', NULL, 0, 0, NULL, 0, 0, N'Lê Tấn', N'Đạt', N'KTX Cỏ May, khu phố 6, phường Linh Trung, quận Thủ Đức, TP.HCM', 0, 0, CAST(N'1999-05-12T00:00:00.000' AS DateTime), CAST(N'2021-07-07T20:34:38.827' AS DateTime), CAST(N'2021-07-22T20:32:07.700' AS DateTime), NULL, N'hieunguyen')
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstMiddleName], [LastName], [Address], [Status], [Gender], [Birthday], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (4, N'17110298@student.hcmute.edu.vn', N'17110298@STUDENT.HCMUTE.EDU.VN', N'17110298@student.hcmute.edu.vn', N'17110298@STUDENT.HCMUTE.EDU.VN', 0, N'AQAAAAEAACcQAAAAEJi7HAYaF705llQ9MOc8NSizg+qM6aXXZzm8ZUvpidB2p17VGyJq0GMTqM9WtWGJ3g==', N'X6X52QNKKTGW6YJMKMGTGANDNN7Z2EL4', N'd8a458d1-1089-428a-8486-7530b6275ae7', NULL, 0, 0, NULL, 0, 0, N'Nguyen Trung', N'Hieu', NULL, 0, 0, CAST(N'1999-05-25T00:00:00.000' AS DateTime), CAST(N'2021-07-08T18:19:27.683' AS DateTime), CAST(N'2021-07-19T21:38:39.273' AS DateTime), NULL, N'hieunguyen')
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstMiddleName], [LastName], [Address], [Status], [Gender], [Birthday], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, N'electronicshop0123@gmail.com', N'ELECTRONICSHOP0123@GMAIL.COM', N'electronicshop0123@gmail.com', N'ELECTRONICSHOP0123@GMAIL.COM', 0, NULL, N'J2KE455VOVOX5ZCFYJVSXXXC2YSZR332', N'cb8ac5b4-5e36-4d60-b870-cfc382c29d2c', NULL, 0, 0, NULL, 0, 0, N'Electronic', N'Shop', NULL, 0, 0, NULL, CAST(N'2021-07-10T20:56:34.143' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstMiddleName], [LastName], [Address], [Status], [Gender], [Birthday], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (6, N'hieunt76124@gmail.com', N'HIEUNT76124@GMAIL.COM', N'hieunt76124@gmail.com', N'HIEUNT76124@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIuaOUDO7Y16XCXn0DWvwiyZJzphM8R4CymFUhJvTPcTgsXE14JsGunhpZqRlz2NQA==', N'4WLVJGSL4MWLGCVCNSOWPMGAH3ATGDRZ', N'e048fa21-dfbc-429b-be7d-0b3d6ccae283', NULL, 0, 0, NULL, 0, 0, N'Nguyễn Trung', N'Hiếu', NULL, 0, 0, CAST(N'1999-05-25T00:00:00.000' AS DateTime), CAST(N'2021-07-12T15:49:00.277' AS DateTime), CAST(N'2021-07-23T14:15:01.703' AS DateTime), NULL, N'hieunt76124@gmail.com')
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstMiddleName], [LastName], [Address], [Status], [Gender], [Birthday], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, N'nguyentrunghieu25051999@gmail.com', N'NGUYENTRUNGHIEU25051999@GMAIL.COM', N'nguyentrunghieu25051999@gmail.com', N'NGUYENTRUNGHIEU25051999@GMAIL.COM', 0, NULL, N'7JOVZROVYI4KOZNX2JT3PIBQK7ZELFJQ', N'605b0265-0a5e-41d7-acd6-4d8e54b5cbe8', NULL, 0, 0, NULL, 0, 0, N'Nguyễn Trung', N'Hiếu', NULL, 0, 0, NULL, CAST(N'2021-07-14T17:45:36.883' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstMiddleName], [LastName], [Address], [Status], [Gender], [Birthday], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, N'hieutrung', N'HIEUTRUNG', N'hieu@gmail.com', N'HIEU@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGn3PCXJX/ER/hYfEHLOw9V36CD3UNU6J1XXVKax7uGfwEZ9ZoHMhUIpWx5iMfc9qg==', N'EYYKDVW4UYD2TBUD4DTM6CFBWBVCZWR4', N'7c343649-40b9-48ca-b80b-826b90ed88ae', NULL, 0, 0, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, CAST(N'2021-07-16T10:32:40.370' AS DateTime), NULL, N'hieutrung', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstMiddleName], [LastName], [Address], [Status], [Gender], [Birthday], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, N'hieutrungnguyen', N'HIEUTRUNGNGUYEN', N'hieutanmy123@gmail.com', N'HIEUTANMY123@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEDktg5q0bJzTCeXfIjshq5nxucMZFI3pO1KABP9d6kh4PJ2hIL2QSEzTQ9+LphEy0w==', N'PSNPW7YTOH7MVXPEYFUQYGCUPE6ZP3WY', N'954fd420-e073-4e65-8842-89ade6100aac', NULL, 0, 0, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, CAST(N'2021-07-16T10:36:23.560' AS DateTime), NULL, N'hieutrungnguyen', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstMiddleName], [LastName], [Address], [Status], [Gender], [Birthday], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, N'loctruong', N'LOCTRUONG', N'loctruong@gmail.com', N'LOCTRUONG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGPNmiH6zdB37Jvhk92vdj0lQ69r7+/96jKEJk3mdWiuEjhTeGI282e33OOF06MlsA==', N'72X5RGXGV5MXGTVUG4KH22BLKHE2KVZP', N'7d94b356-4b6a-4f16-8663-751fd7991997', NULL, 0, 0, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, CAST(N'2021-07-20T21:04:28.677' AS DateTime), NULL, N'loctruong', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstMiddleName], [LastName], [Address], [Status], [Gender], [Birthday], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, N'hieutrung123', N'HIEUTRUNG123', N'hieutrung@gmail.com', N'HIEUTRUNG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAmpZ926KBJPGW5rnPQTjfNMpIhSDW0oWA7zfW3gMyraUMnb4LasuYkwWkdaU0V6fQ==', N'V43PCD4DELVKJCWBL2AWT2HWHU4D4YK5', N'a6361916-f23d-47e1-8d7e-ec2bdbc4c93c', NULL, 0, 0, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, CAST(N'2021-07-21T23:53:43.717' AS DateTime), NULL, N'hieutrung123', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstMiddleName], [LastName], [Address], [Status], [Gender], [Birthday], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (16, N'namnguyen@gmail.com', N'NAMNGUYEN@GMAIL.COM', N'namnguyen@gmail.com', N'NAMNGUYEN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBemlvATnTp7Hj60hhIORLIiBvF3wqiQREIXr60XpzFpOQvAqr1ko/Krhd5Dc+s8Tw==', N'XKFQRUNU5DCYEYL6F6GIXSW3EMSYYQ5S', N'f4bf9797-57e3-4a05-aad0-b2b985aafcc8', N'0987654320', 0, 0, NULL, 1, 0, N'Nguyễn Văn', N'Nam', N'Thủ Đức', 2, 0, CAST(N'2000-01-01T00:00:00.000' AS DateTime), CAST(N'2021-07-23T14:27:49.517' AS DateTime), CAST(N'2021-07-23T14:28:28.407' AS DateTime), N'hieunguyen', N'hieunguyen')
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstMiddleName], [LastName], [Address], [Status], [Gender], [Birthday], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (17, N'hieutrong0123@gmail.com', N'HIEUTRONG0123@GMAIL.COM', N'hieutrong0123@gmail.com', N'HIEUTRONG0123@GMAIL.COM', 0, NULL, N'4DEVUHUPJ6PPRHSO6UZBEYATS3BXIRCB', N'bb5f1242-9d79-48bf-8413-63e5ed1fbb3f', NULL, 0, 0, NULL, 1, 0, N'Võ', N'Trọng Hiếu', NULL, 0, 0, NULL, CAST(N'2021-07-29T23:50:28.093' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserLogin] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'102730109531563853880', N'Google', 17)
INSERT [dbo].[UserLogin] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'103465478481762983550', N'Google', 5)
INSERT [dbo].[UserLogin] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'104774717165410105978', N'Google', 11)
INSERT [dbo].[UserLogin] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'111253879410520980724', N'Google', 4)
INSERT [dbo].[UserLogin] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'117653205388178844421', N'Google', 6)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (2, 2)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (3, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (4, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (5, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (6, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (11, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (12, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (13, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (14, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (15, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (16, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (17, 3)
/****** Object:  Index [IX_ProductInventory_ProductId]    Script Date: 01/08/2021 23:47:30 ******/
CREATE NONCLUSTERED INDEX [IX_ProductInventory_ProductId] ON [dbo].[ProductInventory]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductInventory_UserId]    Script Date: 01/08/2021 23:47:30 ******/
CREATE NONCLUSTERED INDEX [IX_ProductInventory_UserId] ON [dbo].[ProductInventory]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (CONVERT([bit],(0),(0))) FOR [Status]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT (CONVERT([bit],(0),(0))) FOR [Status]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT (CONVERT([bit],(0),(0))) FOR [Deleted]
GO
ALTER TABLE [dbo].[FavoriteProduct] ADD  DEFAULT (CONVERT([bit],(0),(0))) FOR [Status]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0.0)) FOR [TotalMoney]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (CONVERT([bit],(0),(0))) FOR [Received]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product_ProductId]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User_UserId]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category_RootId] FOREIGN KEY([RootId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category_RootId]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_ProductType_ProductTypeId] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_ProductType_ProductTypeId]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Comment_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Comment] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Comment_ParentId]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product_ProductId]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User_UserId]
GO
ALTER TABLE [dbo].[FavoriteProduct]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteProduct_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[FavoriteProduct] CHECK CONSTRAINT [FK_FavoriteProduct_Product_ProductId]
GO
ALTER TABLE [dbo].[FavoriteProduct]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteProduct_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FavoriteProduct] CHECK CONSTRAINT [FK_FavoriteProduct_User_UserId]
GO
ALTER TABLE [dbo].[LoginHistory]  WITH CHECK ADD  CONSTRAINT [FK_LoginHistory_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[LoginHistory] CHECK CONSTRAINT [FK_LoginHistory_User_UserId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus_StatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus_StatusId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User_UserId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order_OrderId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product_ProductId]
GO
ALTER TABLE [dbo].[OrderStatusDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderStatusDetail_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderStatusDetail] CHECK CONSTRAINT [FK_OrderStatusDetail_Order_OrderId]
GO
ALTER TABLE [dbo].[OrderStatusDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderStatusDetail_OrderStatus_StatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[OrderStatusDetail] CHECK CONSTRAINT [FK_OrderStatusDetail_OrderStatus_StatusId]
GO
ALTER TABLE [dbo].[OrderStatusDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderStatusDetail_User_EmpId] FOREIGN KEY([EmpId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[OrderStatusDetail] CHECK CONSTRAINT [FK_OrderStatusDetail_User_EmpId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category_CategoryId]
GO
ALTER TABLE [dbo].[ProductInventory]  WITH CHECK ADD  CONSTRAINT [FK_ProductInventory_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_Product_ProductId]
GO
ALTER TABLE [dbo].[ProductInventory]  WITH CHECK ADD  CONSTRAINT [FK_ProductInventory_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_User_UserId]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product_ProductId]
GO
ALTER TABLE [dbo].[ProductReview]  WITH CHECK ADD  CONSTRAINT [FK_ProductReview_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductReview] CHECK CONSTRAINT [FK_ProductReview_Product_ProductId]
GO
ALTER TABLE [dbo].[ProductReview]  WITH CHECK ADD  CONSTRAINT [FK_ProductReview_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ProductReview] CHECK CONSTRAINT [FK_ProductReview_User_UserId]
GO
ALTER TABLE [dbo].[RoleClaim]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaim_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleClaim] CHECK CONSTRAINT [FK_RoleClaim_Role_RoleId]
GO
ALTER TABLE [dbo].[UserClaim]  WITH CHECK ADD  CONSTRAINT [FK_UserClaim_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaim] CHECK CONSTRAINT [FK_UserClaim_User_UserId]
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD  CONSTRAINT [FK_UserLogin_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogin] CHECK CONSTRAINT [FK_UserLogin_User_UserId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role_RoleId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User_UserId]
GO
ALTER TABLE [dbo].[UserToken]  WITH CHECK ADD  CONSTRAINT [FK_UserToken_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserToken] CHECK CONSTRAINT [FK_UserToken_User_UserId]
GO
ALTER TABLE [dbo].[WatchedProduct]  WITH CHECK ADD  CONSTRAINT [FK_WatchedProduct_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[WatchedProduct] CHECK CONSTRAINT [FK_WatchedProduct_Product_ProductId]
GO
ALTER TABLE [dbo].[WatchedProduct]  WITH CHECK ADD  CONSTRAINT [FK_WatchedProduct_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[WatchedProduct] CHECK CONSTRAINT [FK_WatchedProduct_User_UserId]
GO
USE [master]
GO
ALTER DATABASE [ElectronicShopDb] SET  READ_WRITE 
GO
