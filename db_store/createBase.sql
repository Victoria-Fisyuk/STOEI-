USE [dbStore]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_dbo.Orders_dbo.User_Id]
GO
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_dbo.Orders_dbo.Payment_Id]
GO
ALTER TABLE [dbo].[OrderProducts] DROP CONSTRAINT [FK_dbo.OrderProducts_dbo.Products_Product_Id]
GO
ALTER TABLE [dbo].[OrderProducts] DROP CONSTRAINT [FK_dbo.OrderProducts_dbo.Orders_Order_Id]
GO
ALTER TABLE [dbo].[Contacts] DROP CONSTRAINT [FK_dbo.Contacts_dbo.Users_ID]
GO
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [DF__tmp_ms_xx__Statu__72C60C4A]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26.05.2016 8:58:40 ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 26.05.2016 8:58:40 ******/
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 26.05.2016 8:58:40 ******/
DROP TABLE [dbo].[Products]
GO
/****** Object:  Table [dbo].[PaymentTypes]    Script Date: 26.05.2016 8:58:40 ******/
DROP TABLE [dbo].[PaymentTypes]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 26.05.2016 8:58:40 ******/
DROP TABLE [dbo].[Orders]
GO
/****** Object:  Table [dbo].[OrderProducts]    Script Date: 26.05.2016 8:58:40 ******/
DROP TABLE [dbo].[OrderProducts]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 26.05.2016 8:58:40 ******/
DROP TABLE [dbo].[Contacts]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 26.05.2016 8:58:40 ******/
DROP TABLE [dbo].[Categories]
GO
USE [master]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 26.05.2016 8:58:40 ******/
DROP LOGIN [NT SERVICE\Winmgmt]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 26.05.2016 8:58:40 ******/
DROP LOGIN [NT SERVICE\SQLWriter]
GO
/****** Object:  Login [NT Service\MSSQL$SQLEXPRESS]    Script Date: 26.05.2016 8:58:40 ******/
DROP LOGIN [NT Service\MSSQL$SQLEXPRESS]
GO
/****** Object:  Login [NT AUTHORITY\система]    Script Date: 26.05.2016 8:58:40 ******/
DROP LOGIN [NT AUTHORITY\система]
GO
/****** Object:  Login [DEV-ПК\DEV]    Script Date: 26.05.2016 8:58:40 ******/
DROP LOGIN [DEV-ПК\DEV]
GO
/****** Object:  Login [BUILTIN\Пользователи]    Script Date: 26.05.2016 8:58:40 ******/
DROP LOGIN [BUILTIN\Пользователи]
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 26.05.2016 8:58:40 ******/
DROP LOGIN [##MS_PolicyTsqlExecutionLogin##]
GO
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 26.05.2016 8:58:40 ******/
DROP LOGIN [##MS_PolicyEventProcessingLogin##]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 26.05.2016 8:58:40 ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'¼Á´Çêâ-Aw¯Ý2þ1àgI', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 26.05.2016 8:58:40 ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'¼ÄüÕoïë87ü¥à¸²f®ßMjÌYºÓ', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/****** Object:  Login [BUILTIN\Пользователи]    Script Date: 26.05.2016 8:58:40 ******/
CREATE LOGIN [BUILTIN\Пользователи] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [DEV-ПК\DEV]    Script Date: 26.05.2016 8:58:40 ******/
CREATE LOGIN [DEV-ПК\DEV] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT AUTHORITY\система]    Script Date: 26.05.2016 8:58:40 ******/
CREATE LOGIN [NT AUTHORITY\система] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT Service\MSSQL$SQLEXPRESS]    Script Date: 26.05.2016 8:58:40 ******/
CREATE LOGIN [NT Service\MSSQL$SQLEXPRESS] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 26.05.2016 8:58:40 ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 26.05.2016 8:58:40 ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DEV-ПК\DEV]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQL$SQLEXPRESS]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
USE [dbStore]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 26.05.2016 8:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CategoryDiscount_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[Categories] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 26.05.2016 8:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] NOT NULL,
	[PersonFullName] [nvarchar](256) NULL,
	[Organization] [nvarchar](256) NULL,
	[PostZip] [nvarchar](256) NULL,
	[City] [nvarchar](256) NULL,
	[Street] [nvarchar](256) NULL,
	[House] [nvarchar](256) NULL,
	[Room] [nvarchar](256) NULL,
	[Telephone] [nvarchar](50) NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[Contacts] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[OrderProducts]    Script Date: 26.05.2016 8:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [decimal](18, 0) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Order_Id] [int] NULL,
	[Product_Id] [int] NULL,
 CONSTRAINT [PK_dbo.OrderProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[OrderProducts] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 26.05.2016 8:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TotalCost] [decimal](16, 2) NOT NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[User_Id] [int] NULL,
	[Payment_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[Orders] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[PaymentTypes]    Script Date: 26.05.2016 8:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameMethod] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.PaymentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[PaymentTypes] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Products]    Script Date: 26.05.2016 8:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DescriptionSecond] [nvarchar](max) NULL,
	[Price] [decimal](16, 2) NOT NULL,
	[ImageData] [varbinary](max) NULL,
	[ImageMimeType] [varchar](50) NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Category_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Products] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 26.05.2016 8:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[Roles] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26.05.2016 8:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Password] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[isActivate] [bit] NULL DEFAULT (NULL),
	[Role_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[Users] TO  SCHEMA OWNER 
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (NULL) FOR [Status]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Contacts_dbo.Users_ID] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_dbo.Contacts_dbo.Users_ID]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderProducts_dbo.Orders_Order_Id] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_dbo.OrderProducts_dbo.Orders_Order_Id]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderProducts_dbo.Products_Product_Id] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_dbo.OrderProducts_dbo.Products_Product_Id]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Orders_dbo.Payment_Id] FOREIGN KEY([Payment_Id])
REFERENCES [dbo].[PaymentTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_dbo.Orders_dbo.Payment_Id]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Orders_dbo.User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_dbo.Orders_dbo.User_Id]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
