USE [master]
GO
/****** Object:  Database [DATN_Dang2]    Script Date: 11/4/2022 2:12:10 PM ******/
CREATE DATABASE [DATN_Dang2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DATN_Dang2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DATN_Dang2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DATN_Dang2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DATN_Dang2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DATN_Dang2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DATN_Dang2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DATN_Dang2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DATN_Dang2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DATN_Dang2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DATN_Dang2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DATN_Dang2] SET ARITHABORT OFF 
GO
ALTER DATABASE [DATN_Dang2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DATN_Dang2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DATN_Dang2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DATN_Dang2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DATN_Dang2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DATN_Dang2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DATN_Dang2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DATN_Dang2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DATN_Dang2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DATN_Dang2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DATN_Dang2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DATN_Dang2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DATN_Dang2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DATN_Dang2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DATN_Dang2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DATN_Dang2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DATN_Dang2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DATN_Dang2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DATN_Dang2] SET  MULTI_USER 
GO
ALTER DATABASE [DATN_Dang2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DATN_Dang2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DATN_Dang2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DATN_Dang2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DATN_Dang2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DATN_Dang2] SET QUERY_STORE = OFF
GO
USE [DATN_Dang2]
GO
/****** Object:  Table [dbo].[authorities]    Script Date: 11/4/2022 2:12:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorities](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_id] [varchar](255) NULL,
	[user_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brands]    Script Date: 11/4/2022 2:12:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brands](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdate] [date] NULL,
	[logo] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 11/4/2022 2:12:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdate] [date] NULL,
	[name] [nvarchar](255) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discounts]    Script Date: 11/4/2022 2:12:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discounts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdate] [date] NULL,
	[number] [float] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favorites]    Script Date: 11/4/2022 2:12:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favorites](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[create_date] [datetime2](7) NULL,
	[product_id] [bigint] NULL,
	[user_id] [varchar](255) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[multiple_images]    Script Date: 11/4/2022 2:12:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[multiple_images](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[status] [bit] NULL,
	[product_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 11/4/2022 2:12:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[color] [nvarchar](255) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[order_id] [bigint] NULL,
	[product_id] [bigint] NULL,
	[image] [varchar](255) NULL,
	[total] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_tracks]    Script Date: 11/4/2022 2:12:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_tracks](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[status] [bit] NULL,
	[update_date] [datetime2](7) NULL,
	[order_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/4/2022 2:12:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[create_date] [datetime2](7) NULL,
	[phone] [varchar](255) NULL,
	[user_id] [varchar](255) NULL,
	[district] [nvarchar](255) NULL,
	[province] [nvarchar](255) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 11/4/2022 2:12:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[color] [nvarchar](255) NULL,
	[createdate] [date] NULL,
	[description] [nvarchar](255) NULL,
	[image] [varchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[size] [int] NULL,
	[status] [bit] NULL,
	[brand_id] [bigint] NULL,
	[category_id] [bigint] NULL,
	[discount_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 11/4/2022 2:12:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[comment] [varchar](255) NULL,
	[create_date] [date] NULL,
	[rating] [float] NULL,
	[product_id] [bigint] NULL,
	[user_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 11/4/2022 2:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/4/2022 2:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [varchar](255) NOT NULL,
	[address] [varchar](255) NULL,
	[create_date] [datetime2](7) NULL,
	[email] [varchar](255) NULL,
	[fullname] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[photo] [varchar](255) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vouchers]    Script Date: 11/4/2022 2:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vouchers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[discount_amount] [int] NULL,
	[end_date] [date] NULL,
	[max_user] [bigint] NULL,
	[start_date] [date] NULL,
	[status] [bit] NULL,
	[voucher_code] [varchar](255) NULL,
	[product_id] [bigint] NULL,
	[user_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[favorites] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD  CONSTRAINT [FK1pec5q5koxb1acppey05jvmgj] FOREIGN KEY([user_name])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[authorities] CHECK CONSTRAINT [FK1pec5q5koxb1acppey05jvmgj]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD  CONSTRAINT [FK7kj74d912rytfp5su91jfv0tg] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[authorities] CHECK CONSTRAINT [FK7kj74d912rytfp5su91jfv0tg]
GO
ALTER TABLE [dbo].[favorites]  WITH CHECK ADD  CONSTRAINT [FK6sgu5npe8ug4o42bf9j71x20c] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[favorites] CHECK CONSTRAINT [FK6sgu5npe8ug4o42bf9j71x20c]
GO
ALTER TABLE [dbo].[favorites]  WITH CHECK ADD  CONSTRAINT [FKk7du8b8ewipawnnpg76d55fus] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[favorites] CHECK CONSTRAINT [FKk7du8b8ewipawnnpg76d55fus]
GO
ALTER TABLE [dbo].[multiple_images]  WITH CHECK ADD  CONSTRAINT [FKjc78f5x1ik5jrr1ko0pceo3qh] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[multiple_images] CHECK CONSTRAINT [FKjc78f5x1ik5jrr1ko0pceo3qh]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK4q98utpd73imf4yhttm3w0eax] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK4q98utpd73imf4yhttm3w0eax]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FKjyu2qbqt8gnvno9oe9j2s2ldk] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FKjyu2qbqt8gnvno9oe9j2s2ldk]
GO
ALTER TABLE [dbo].[order_tracks]  WITH CHECK ADD  CONSTRAINT [FK1fdor1bwwupi7hiw4howp4ifo] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_tracks] CHECK CONSTRAINT [FK1fdor1bwwupi7hiw4howp4ifo]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK32ql8ubntj5uh44ph9659tiih] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK32ql8ubntj5uh44ph9659tiih]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK5cyj7v7fvm60i2ubciqfo2wxm] FOREIGN KEY([discount_id])
REFERENCES [dbo].[discounts] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK5cyj7v7fvm60i2ubciqfo2wxm]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FKa3a4mpsfdf4d2y6r8ra3sc8mv] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brands] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FKa3a4mpsfdf4d2y6r8ra3sc8mv]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FKcgy7qjc1r99dp117y9en6lxye] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FKcgy7qjc1r99dp117y9en6lxye]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FKpl51cejpw4gy5swfar8br9ngi] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FKpl51cejpw4gy5swfar8br9ngi]
GO
ALTER TABLE [dbo].[vouchers]  WITH CHECK ADD  CONSTRAINT [FK3sgwux4uor7og45vdilosjha8] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[vouchers] CHECK CONSTRAINT [FK3sgwux4uor7og45vdilosjha8]
GO
ALTER TABLE [dbo].[vouchers]  WITH CHECK ADD  CONSTRAINT [FKjus35megb8rkxphrkldlkir7y] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[vouchers] CHECK CONSTRAINT [FKjus35megb8rkxphrkldlkir7y]
GO
USE [master]
GO
ALTER DATABASE [DATN_Dang2] SET  READ_WRITE 
GO
