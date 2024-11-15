USE [master]
GO
/****** Object:  Database [db_bookMana]    Script Date: 05/11/2017 10:15:41 ******/
CREATE DATABASE [db_bookMana] ON  PRIMARY 
( NAME = N'db_bookMana_Data', FILENAME = N'D:\db_bookMana_Data.MDF' , SIZE = 1792KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'db_bookMana_Log', FILENAME = N'D:\db_bookMana_Log.LDF' , SIZE = 3840KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
EXEC dbo.sp_dbcmptlevel @dbname=N'db_bookMana', @new_cmptlevel=80
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_bookMana].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [db_bookMana] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [db_bookMana] SET ANSI_NULLS OFF
GO
ALTER DATABASE [db_bookMana] SET ANSI_PADDING OFF
GO
ALTER DATABASE [db_bookMana] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [db_bookMana] SET ARITHABORT OFF
GO
ALTER DATABASE [db_bookMana] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [db_bookMana] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [db_bookMana] SET AUTO_SHRINK ON
GO
ALTER DATABASE [db_bookMana] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [db_bookMana] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [db_bookMana] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [db_bookMana] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [db_bookMana] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [db_bookMana] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [db_bookMana] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [db_bookMana] SET  DISABLE_BROKER
GO
ALTER DATABASE [db_bookMana] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [db_bookMana] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [db_bookMana] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [db_bookMana] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [db_bookMana] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [db_bookMana] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [db_bookMana] SET  READ_WRITE
GO
ALTER DATABASE [db_bookMana] SET RECOVERY SIMPLE
GO
ALTER DATABASE [db_bookMana] SET  MULTI_USER
GO
ALTER DATABASE [db_bookMana] SET PAGE_VERIFY TORN_PAGE_DETECTION
GO
ALTER DATABASE [db_bookMana] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_bookMana', N'ON'
GO
USE [db_bookMana]
GO
/****** Object:  Table [dbo].[t_admin]    Script Date: 05/11/2017 10:15:44 ******/
DROP TABLE [dbo].[t_admin]
GO
/****** Object:  Table [dbo].[t_book]    Script Date: 05/11/2017 10:15:44 ******/
DROP TABLE [dbo].[t_book]
GO
/****** Object:  Table [dbo].[t_catelog]    Script Date: 05/11/2017 10:15:44 ******/
DROP TABLE [dbo].[t_catelog]
GO
/****** Object:  Table [dbo].[t_jieyue]    Script Date: 05/11/2017 10:15:44 ******/
DROP TABLE [dbo].[t_jieyue]
GO
/****** Object:  Table [dbo].[t_tea]    Script Date: 05/11/2017 10:15:44 ******/
DROP TABLE [dbo].[t_tea]
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 05/11/2017 10:15:44 ******/
DROP TABLE [dbo].[t_user]
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 05/11/2017 10:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_user](
	[id] [int] NOT NULL,
	[loginname] [varchar](50) NULL,
	[loginpw] [varchar](50) NULL,
	[xuehao] [varchar](50) NULL,
	[xingming] [varchar](50) NULL,
	[xueyuan] [varchar](50) NULL,
	[zhuanye] [varchar](50) NULL,
	[tel] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[zhuangtai] [varchar](50) NULL,
	[del] [varchar](50) NULL,
 CONSTRAINT [PK_t_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[t_user] ([id], [loginname], [loginpw], [xuehao], [xingming], [xueyuan], [zhuanye], [tel], [email], [zhuangtai], [del]) VALUES (2, N'liu3718', N'000000', N'2009001', N'刘光亮', N'清华学院', N'计算机专业', N'13888888888', N'lui198331@yahoo.cn', N'b', N'no')
INSERT [dbo].[t_user] ([id], [loginname], [loginpw], [xuehao], [xingming], [xueyuan], [zhuanye], [tel], [email], [zhuangtai], [del]) VALUES (3, N'liqiang', N'000000', N'2009002', N'李强', N'清华学院', N'计算机专业', N'13999999999', N'liqiang@126.com', N'b', N'no')
INSERT [dbo].[t_user] ([id], [loginname], [loginpw], [xuehao], [xingming], [xueyuan], [zhuanye], [tel], [email], [zhuangtai], [del]) VALUES (4, N'wanggang', N'000000', N'2009005', N'王刚', N'清华学院', N'计算机专业', N'13222222222', N'wanggang@163.cn', N'b', N'no')
INSERT [dbo].[t_user] ([id], [loginname], [loginpw], [xuehao], [xingming], [xueyuan], [zhuanye], [tel], [email], [zhuangtai], [del]) VALUES (5, N'lixuesheng', N'000000', N'2009008', N'李雪松', N'清华学院', N'计算机专业', N'13612345678', N'liddfdf@yahoo.cn', N'b', N'no')
/****** Object:  Table [dbo].[t_tea]    Script Date: 05/11/2017 10:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_tea](
	[id] [int] NOT NULL,
	[loginname] [char](10) NULL,
	[loginpw] [char](10) NULL,
	[bianhao] [varchar](50) NULL,
	[xingming] [varchar](50) NULL,
	[sex] [varchar](50) NULL,
	[age] [varchar](50) NULL,
	[zhuangtai] [varchar](50) NULL,
	[del] [varchar](50) NULL,
 CONSTRAINT [PK_t_tea] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[t_tea] ([id], [loginname], [loginpw], [bianhao], [xingming], [sex], [age], [zhuangtai], [del]) VALUES (1, N'zhangsan  ', N'000000    ', N'001', N'张三', N'男', N'52', N'b', N'no')
INSERT [dbo].[t_tea] ([id], [loginname], [loginpw], [bianhao], [xingming], [sex], [age], [zhuangtai], [del]) VALUES (2, N'malaoshi  ', N'000000    ', N'002', N'马老师', N'男', N'50', N'b', N'no')
/****** Object:  Table [dbo].[t_jieyue]    Script Date: 05/11/2017 10:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_jieyue](
	[id] [int] NOT NULL,
	[bookId] [int] NULL,
	[duzheleixing] [varchar](50) NULL,
	[duzheId] [int] NULL,
	[jieyueShijian] [varchar](50) NULL,
	[daoqiShijian] [varchar](50) NULL,
	[guihuanshijian] [varchar](50) NULL,
	[del] [varchar](50) NULL,
 CONSTRAINT [PK_t_jieyue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[t_jieyue] ([id], [bookId], [duzheleixing], [duzheId], [jieyueShijian], [daoqiShijian], [guihuanshijian], [del]) VALUES (1, 1, N'user', 2, N'2017-03-01', N'2017-03-03', N'2017-03-03', N'no')
INSERT [dbo].[t_jieyue] ([id], [bookId], [duzheleixing], [duzheId], [jieyueShijian], [daoqiShijian], [guihuanshijian], [del]) VALUES (2, 10, N'tea', 1, N'2017-03-01', N'2017-03-03', N'2017-03-03', N'no')
INSERT [dbo].[t_jieyue] ([id], [bookId], [duzheleixing], [duzheId], [jieyueShijian], [daoqiShijian], [guihuanshijian], [del]) VALUES (3, 1, N'user', 4, N'2017-03-01', N'2017-03-03', N'2017-03-03', N'no')
INSERT [dbo].[t_jieyue] ([id], [bookId], [duzheleixing], [duzheId], [jieyueShijian], [daoqiShijian], [guihuanshijian], [del]) VALUES (4, 9, N'user', 2, N'2017-03-01', N'2017-03-05', N'', N'no')
INSERT [dbo].[t_jieyue] ([id], [bookId], [duzheleixing], [duzheId], [jieyueShijian], [daoqiShijian], [guihuanshijian], [del]) VALUES (5, 8, N'user', 5, N'2017-03-01', N'2017-03-05', N'', N'no')
INSERT [dbo].[t_jieyue] ([id], [bookId], [duzheleixing], [duzheId], [jieyueShijian], [daoqiShijian], [guihuanshijian], [del]) VALUES (6, 14, N'user', 2, N'2017-05-11', N'2017-05-21', N'', N'no')
/****** Object:  Table [dbo].[t_catelog]    Script Date: 05/11/2017 10:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_catelog](
	[catelog_id] [int] NOT NULL,
	[catelog_name] [varchar](50) NULL,
	[catelog_miaoshu] [varchar](5000) NULL,
	[catelog_del] [varchar](50) NULL,
 CONSTRAINT [PK_t_catelog] PRIMARY KEY CLUSTERED 
(
	[catelog_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[t_catelog] ([catelog_id], [catelog_name], [catelog_miaoshu], [catelog_del]) VALUES (2, N'计算机类', N'计算机类5', N'no')
INSERT [dbo].[t_catelog] ([catelog_id], [catelog_name], [catelog_miaoshu], [catelog_del]) VALUES (3, N'天文地理类', N'天文地理类', N'no')
INSERT [dbo].[t_catelog] ([catelog_id], [catelog_name], [catelog_miaoshu], [catelog_del]) VALUES (4, N'数学类', N'数学类', N'no')
INSERT [dbo].[t_catelog] ([catelog_id], [catelog_name], [catelog_miaoshu], [catelog_del]) VALUES (7, N'医药类', N'医药类', N'no')
INSERT [dbo].[t_catelog] ([catelog_id], [catelog_name], [catelog_miaoshu], [catelog_del]) VALUES (8, N'数学类', N'请输入内容', N'no')
/****** Object:  Table [dbo].[t_book]    Script Date: 05/11/2017 10:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_book](
	[book_id] [int] NOT NULL,
	[book_name] [varchar](50) NULL,
	[book_zuozhe] [varchar](50) NULL,
	[book_chubanshe] [varchar](50) NULL,
	[book_chubanriqi] [varchar](50) NULL,
	[book_isbm] [varchar](50) NULL,
	[book_price] [varchar](50) NULL,
	[book_yeshu] [varchar](50) NULL,
	[book_kucun] [varchar](50) NULL,
	[catelog_id] [int] NULL,
	[del] [varchar](50) NULL,
 CONSTRAINT [PK_t_book] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[t_book] ([book_id], [book_name], [book_zuozhe], [book_chubanshe], [book_chubanriqi], [book_isbm], [book_price], [book_yeshu], [book_kucun], [catelog_id], [del]) VALUES (1, N'java编程思想1', N'张孝祥', N'邮电出版社', N'2010-12-07', N'2345612', N'44', N'55', NULL, 2, N'no')
INSERT [dbo].[t_book] ([book_id], [book_name], [book_zuozhe], [book_chubanshe], [book_chubanriqi], [book_isbm], [book_price], [book_yeshu], [book_kucun], [catelog_id], [del]) VALUES (8, N'java编程思想2', N'张孝祥', N'邮电出版社', N'2010-12-07', N'4545454', N'44', N'44', N'100', 2, N'no')
INSERT [dbo].[t_book] ([book_id], [book_name], [book_zuozhe], [book_chubanshe], [book_chubanriqi], [book_isbm], [book_price], [book_yeshu], [book_kucun], [catelog_id], [del]) VALUES (9, N'java编程思想3', N'张孝祥', N'邮电出版社', N'2010-12-08', N'78655332', N'55', N'555', N'100', 2, N'no')
INSERT [dbo].[t_book] ([book_id], [book_name], [book_zuozhe], [book_chubanshe], [book_chubanriqi], [book_isbm], [book_price], [book_yeshu], [book_kucun], [catelog_id], [del]) VALUES (10, N'诸葛亮兵法', N'诸葛亮', N'青海出版社', N'2010-11-30', N'232323', N'30', N'800', NULL, 3, N'no')
INSERT [dbo].[t_book] ([book_id], [book_name], [book_zuozhe], [book_chubanshe], [book_chubanriqi], [book_isbm], [book_price], [book_yeshu], [book_kucun], [catelog_id], [del]) VALUES (14, N'医药大全', N'张孝祥', N'邮电出版社', N'2011-10-13', N'45682145552', N'55', N'500', NULL, 2, N'no')
/****** Object:  Table [dbo].[t_admin]    Script Date: 05/11/2017 10:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_admin](
	[userId] [int] NOT NULL,
	[userName] [varchar](50) NULL,
	[userPw] [varchar](50) NULL,
 CONSTRAINT [PK_t_admin] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[t_admin] ([userId], [userName], [userPw]) VALUES (2, N'admin', N'123')
