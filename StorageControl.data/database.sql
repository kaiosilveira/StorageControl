USE [master]
GO
/****** Object:  Database [commerce.storage]    Script Date: 23/07/2016 21:53:33 ******/
CREATE DATABASE [commerce.storage]
 CONTAINMENT = NONE
ALTER DATABASE [commerce.storage] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [commerce.storage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [commerce.storage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [commerce.storage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [commerce.storage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [commerce.storage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [commerce.storage] SET ARITHABORT OFF 
GO
ALTER DATABASE [commerce.storage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [commerce.storage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [commerce.storage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [commerce.storage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [commerce.storage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [commerce.storage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [commerce.storage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [commerce.storage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [commerce.storage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [commerce.storage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [commerce.storage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [commerce.storage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [commerce.storage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [commerce.storage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [commerce.storage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [commerce.storage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [commerce.storage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [commerce.storage] SET RECOVERY FULL 
GO
ALTER DATABASE [commerce.storage] SET  MULTI_USER 
GO
ALTER DATABASE [commerce.storage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [commerce.storage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [commerce.storage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [commerce.storage] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [commerce.storage] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'commerce.storage', N'ON'
GO
USE [commerce.storage]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[instrument_types]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[instrument_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[instruments]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[instruments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[manufacturer] [varchar](50) NULL,
	[model] [varchar](50) NULL,
	[unit_price] [decimal](10, 2) NULL,
	[amount] [int] NULL,
	[category_id] [int] NULL,
	[type_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name]) VALUES (1, N'Cordas')
INSERT [dbo].[categories] ([id], [name]) VALUES (3, N'Percussão')
INSERT [dbo].[categories] ([id], [name]) VALUES (10, N'Sopro')
INSERT [dbo].[categories] ([id], [name]) VALUES (16, N'Voz')
SET IDENTITY_INSERT [dbo].[categories] OFF
SET IDENTITY_INSERT [dbo].[instrument_types] ON 

INSERT [dbo].[instrument_types] ([id], [name]) VALUES (3, N'Baixo')
INSERT [dbo].[instrument_types] ([id], [name]) VALUES (4, N'Guitarra')
INSERT [dbo].[instrument_types] ([id], [name]) VALUES (5, N'Violão')
INSERT [dbo].[instrument_types] ([id], [name]) VALUES (6, N'Viola')
INSERT [dbo].[instrument_types] ([id], [name]) VALUES (7, N'Teclado')
SET IDENTITY_INSERT [dbo].[instrument_types] OFF
SET IDENTITY_INSERT [dbo].[instruments] ON 

INSERT [dbo].[instruments] ([id], [manufacturer], [model], [unit_price], [amount], [category_id], [type_id]) VALUES (6, N'Tajima', N'Flying V', CAST(7999.00 AS Decimal(10, 2)), 1, 1, 4)
INSERT [dbo].[instruments] ([id], [manufacturer], [model], [unit_price], [amount], [category_id], [type_id]) VALUES (7, N'Yamaha', N'Y', CAST(2400.23 AS Decimal(10, 2)), 1, 1, 4)
SET IDENTITY_INSERT [dbo].[instruments] OFF
ALTER TABLE [dbo].[instruments]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[instruments]  WITH CHECK ADD FOREIGN KEY([type_id])
REFERENCES [dbo].[instrument_types] ([id])
GO
/****** Object:  StoredProcedure [dbo].[create_category]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[create_category]
@name varchar(50)
as
begin
	insert into categories(name)
	values(@name)
	select @@ROWCOUNT
end
GO
/****** Object:  StoredProcedure [dbo].[create_instrument]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[create_instrument]
@manufacturer varchar(50),
@model varchar(50),
@unit_price decimal(10, 2),
@amount int,
@category_id int,
@type_id int
as
begin
	insert into instruments(manufacturer, model, unit_price, amount, category_id, type_id)
	values(
		@manufacturer,
		@model,
		@unit_price,
		@amount,
		(select id from categories where id = @category_id),
		(select id from instrument_types where id = @type_id)
	)
	select @@ROWCOUNT
end
GO
/****** Object:  StoredProcedure [dbo].[create_instrument_type]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[create_instrument_type]
@name varchar(50)
as
begin
	insert into instrument_types(name)
	values(@name)

	select @@ROWCOUNT
end
GO
/****** Object:  StoredProcedure [dbo].[delete_category]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_category]
@id int
as
begin
	delete from categories
	where id = @id
	
	select @@ROWCOUNT
end
GO
/****** Object:  StoredProcedure [dbo].[delete_instrument]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[delete_instrument]
@id int
as
begin
	delete from instruments
	where id = @id	
	select @@ROWCOUNT
end
GO
/****** Object:  StoredProcedure [dbo].[delete_instrument_type]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_instrument_type]
@id int
as 
begin
	delete from instrument_types
	where id = @id
	
	select @@ROWCOUNT
end
GO
/****** Object:  StoredProcedure [dbo].[get_category]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_category]
@id int
as
begin
	select id as [Id], name as [Name] from categories
	where id = @id
end

GO
/****** Object:  StoredProcedure [dbo].[get_instrument]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_instrument]
@id int
as
begin
	select
		i.id as [Id],
		i.manufacturer as [Manufacturer],
		i.model as [Model],
		i.unit_price as [UnitPrice],
		i.amount as [Amount],
		c.id as [Id],
		c.name as [Name],
		it.id as [Id],
		it.name as [Name]
	from instruments as i
	join categories as c on c.id = i.category_id
	join instrument_types as it on it.id = i.type_id
	where i.id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[get_instrument_type]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_instrument_type]
@id int
as 
begin
	select id as [Id], name as [Name] from instrument_types
	where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[list_categories]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[list_categories]
as
begin
	select id as [Id], name as [Name] from categories
end

GO
/****** Object:  StoredProcedure [dbo].[list_instrument_types]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[list_instrument_types]
as 
begin
select id as [Id], name as [Name] from instrument_types
end
GO
/****** Object:  StoredProcedure [dbo].[list_instruments]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[list_instruments]
as
begin
	select
		i.id as [Id],
		i.manufacturer as [Manufacturer],
		i.model as [Model],
		i.unit_price as [UnitPrice],
		i.amount as [Amount],
		c.id as [Id],
		c.name as [Name],
		it.id as [Id],
		it.name as [Name]
	from instruments as i
	join categories as c on c.id = i.category_id
	join instrument_types as it on it.id = i.type_id
end
GO
/****** Object:  StoredProcedure [dbo].[update_category]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[update_category]
@id int,
@name varchar(50)
as
begin
	update categories
	set name = @name
	where id = @id
	
	select @@ROWCOUNT
end
GO
/****** Object:  StoredProcedure [dbo].[update_instrument]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_instrument]
@id int,
@manufacturer varchar(50),
@model varchar(50),
@unit_price decimal(10, 2),
@amount int,
@category_id int,
@type_id int
as
begin
	update instruments
	set 
		manufacturer = @manufacturer,
		model = @model,
		unit_price = @unit_price,
		amount = @amount,
		category_id = @category_id,
		[type_id] = @type_id
	where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[update_instrument_type]    Script Date: 23/07/2016 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_instrument_type]
@id int,
@name varchar(50)
as 
begin
	update instrument_types
	set name = @name
	where id = @id

	select @@ROWCOUNT
end
GO
USE [master]
GO
ALTER DATABASE [commerce.storage] SET  READ_WRITE 
GO
