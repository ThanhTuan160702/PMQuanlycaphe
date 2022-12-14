USE [master]
GO
/****** Object:  Database [QuanLyQuanCaPhe]    Script Date: 8/20/2022 4:14:52 PM ******/
CREATE DATABASE [QuanLyQuanCaPhe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyQuanCaPhe', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyQuanCaPhe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyQuanCaPhe_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyQuanCaPhe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyQuanCaPhe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyQuanCaPhe', N'ON'
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET QUERY_STORE = OFF
GO
USE [QuanLyQuanCaPhe]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/20/2022 4:14:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [nvarchar](100) NOT NULL,
	[Displayname] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
	[Type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 8/20/2022 4:14:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [date] NOT NULL,
	[DateCheckOut] [date] NULL,
	[idTable] [int] NOT NULL,
	[status] [int] NOT NULL,
	[discount] [int] NULL,
	[TotalPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[billinfo]    Script Date: 8/20/2022 4:14:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billinfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[Count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 8/20/2022 4:14:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](100) NOT NULL,
	[IDCATEGORY] [int] NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 8/20/2022 4:14:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tablefood]    Script Date: 8/20/2022 4:14:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tablefood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[status] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([UserName], [Displayname], [Password], [Type]) VALUES (N'admin01', N' Anh Tuấn', N'1', 1)
INSERT [dbo].[Account] ([UserName], [Displayname], [Password], [Type]) VALUES (N'admin02', N'Thành Tuấn', N'0', 1)
INSERT [dbo].[Account] ([UserName], [Displayname], [Password], [Type]) VALUES (N'nv01', N'Quang Sinh', N'1', 0)
INSERT [dbo].[Account] ([UserName], [Displayname], [Password], [Type]) VALUES (N'nv02', N'Hoàng Tú', N'1', 0)
GO
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (1, CAST(N'2022-08-19' AS Date), CAST(N'2022-08-19' AS Date), 1, 1, 0, 6119994)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (2, CAST(N'2022-08-19' AS Date), CAST(N'2022-08-19' AS Date), 2, 1, 0, 2999997)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (3, CAST(N'2022-08-19' AS Date), CAST(N'2022-08-19' AS Date), 1, 1, 0, 2999997)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (4, CAST(N'2022-08-19' AS Date), CAST(N'2022-08-19' AS Date), 2, 1, 0, 75000)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (5, CAST(N'2022-08-19' AS Date), CAST(N'2022-08-19' AS Date), 3, 1, 0, 150000)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (6, CAST(N'2022-08-19' AS Date), CAST(N'2022-08-19' AS Date), 4, 1, 0, 120000)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (7, CAST(N'2022-08-19' AS Date), CAST(N'2022-08-19' AS Date), 1, 1, 0, 30000)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (8, CAST(N'2022-08-19' AS Date), CAST(N'2022-08-19' AS Date), 5, 1, 0, 90000)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (9, CAST(N'2022-08-19' AS Date), CAST(N'2022-08-19' AS Date), 7, 1, 0, 30000)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (10, CAST(N'2022-08-19' AS Date), CAST(N'2022-08-19' AS Date), 5, 1, 2, 29400)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (11, CAST(N'2022-08-19' AS Date), NULL, 7, 0, 0, NULL)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (12, CAST(N'2022-08-19' AS Date), CAST(N'2022-08-19' AS Date), 5, 1, 0, 30000)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (13, CAST(N'2022-08-20' AS Date), NULL, 2, 0, 0, NULL)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (14, CAST(N'2022-08-20' AS Date), NULL, 6, 0, 0, NULL)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (15, CAST(N'2022-08-20' AS Date), NULL, 5, 0, NULL, NULL)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (16, CAST(N'2022-08-20' AS Date), NULL, 1, 0, NULL, NULL)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (17, CAST(N'2022-08-20' AS Date), CAST(N'2022-08-20' AS Date), 3, 1, 0, 40000)
INSERT [dbo].[bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [TotalPrice]) VALUES (18, CAST(N'2022-08-20' AS Date), CAST(N'2022-08-20' AS Date), 3, 1, 0, 40000)
SET IDENTITY_INSERT [dbo].[bill] OFF
GO
SET IDENTITY_INSERT [dbo].[billinfo] ON 

INSERT [dbo].[billinfo] ([id], [idBill], [idFood], [Count]) VALUES (10, 4, 9, 1)
INSERT [dbo].[billinfo] ([id], [idBill], [idFood], [Count]) VALUES (11, 4, 13, 1)
INSERT [dbo].[billinfo] ([id], [idBill], [idFood], [Count]) VALUES (12, 4, 18, 1)
INSERT [dbo].[billinfo] ([id], [idBill], [idFood], [Count]) VALUES (13, 12, 13, 1)
INSERT [dbo].[billinfo] ([id], [idBill], [idFood], [Count]) VALUES (14, 10, 16, 2)
INSERT [dbo].[billinfo] ([id], [idBill], [idFood], [Count]) VALUES (15, 18, 8, 1)
INSERT [dbo].[billinfo] ([id], [idBill], [idFood], [Count]) VALUES (16, 18, 15, 1)
INSERT [dbo].[billinfo] ([id], [idBill], [idFood], [Count]) VALUES (17, 17, 17, 1)
INSERT [dbo].[billinfo] ([id], [idBill], [idFood], [Count]) VALUES (18, 17, 19, 1)
SET IDENTITY_INSERT [dbo].[billinfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [NAME], [IDCATEGORY], [price]) VALUES (8, N'Cà Phê Phin', 1, 25000)
INSERT [dbo].[Food] ([id], [NAME], [IDCATEGORY], [price]) VALUES (9, N'Cà Phê', 1, 20000)
INSERT [dbo].[Food] ([id], [NAME], [IDCATEGORY], [price]) VALUES (10, N'Cà Phê Sữa Đá', 1, 25000)
INSERT [dbo].[Food] ([id], [NAME], [IDCATEGORY], [price]) VALUES (11, N'Trà Sữa Chân Châu', 2, 30000)
INSERT [dbo].[Food] ([id], [NAME], [IDCATEGORY], [price]) VALUES (12, N'Trà Sữa MatCha', 2, 35000)
INSERT [dbo].[Food] ([id], [NAME], [IDCATEGORY], [price]) VALUES (13, N'Trà Sữa Đường Đen', 2, 30000)
INSERT [dbo].[Food] ([id], [NAME], [IDCATEGORY], [price]) VALUES (14, N'7Up', 3, 15000)
INSERT [dbo].[Food] ([id], [NAME], [IDCATEGORY], [price]) VALUES (15, N'Sting', 3, 15000)
INSERT [dbo].[Food] ([id], [NAME], [IDCATEGORY], [price]) VALUES (16, N'Pepsi', 3, 15000)
INSERT [dbo].[Food] ([id], [NAME], [IDCATEGORY], [price]) VALUES (17, N'Coca-cola', 3, 15000)
INSERT [dbo].[Food] ([id], [NAME], [IDCATEGORY], [price]) VALUES (18, N'Bánh Mì Que', 4, 25000)
INSERT [dbo].[Food] ([id], [NAME], [IDCATEGORY], [price]) VALUES (19, N'Bánh Phô Mai', 4, 25000)
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([id], [NAME]) VALUES (1, N'Cà Phê')
INSERT [dbo].[FoodCategory] ([id], [NAME]) VALUES (2, N'Trà Sữa')
INSERT [dbo].[FoodCategory] ([id], [NAME]) VALUES (3, N'Nước Ngọt')
INSERT [dbo].[FoodCategory] ([id], [NAME]) VALUES (4, N'Bánh')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Tablefood] ON 

INSERT [dbo].[Tablefood] ([id], [name], [status]) VALUES (1, N'Bàn 0', N'Trống')
INSERT [dbo].[Tablefood] ([id], [name], [status]) VALUES (2, N'Bàn 1', N'Trống')
INSERT [dbo].[Tablefood] ([id], [name], [status]) VALUES (3, N'Bàn 2', N'Trống')
INSERT [dbo].[Tablefood] ([id], [name], [status]) VALUES (4, N'Bàn 3', N'Trống')
INSERT [dbo].[Tablefood] ([id], [name], [status]) VALUES (5, N'Bàn 4', N'Trống')
INSERT [dbo].[Tablefood] ([id], [name], [status]) VALUES (6, N'Bàn 5', N'Trống')
INSERT [dbo].[Tablefood] ([id], [name], [status]) VALUES (7, N'Bàn 6', N'Trống')
INSERT [dbo].[Tablefood] ([id], [name], [status]) VALUES (8, N'Bàn 7', N'Trống')
INSERT [dbo].[Tablefood] ([id], [name], [status]) VALUES (9, N'Bàn 8', N'Trống')
INSERT [dbo].[Tablefood] ([id], [name], [status]) VALUES (10, N'Bàn 9', N'Trống')
INSERT [dbo].[Tablefood] ([id], [name], [status]) VALUES (11, N'Bàn 10', N'Trống')
SET IDENTITY_INSERT [dbo].[Tablefood] OFF
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'Thành Tuấn') FOR [Displayname]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Password]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT (getdate()) FOR [DateCheckIn]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[billinfo] ADD  DEFAULT ((0)) FOR [Count]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT (N'Chưa đặt tên') FOR [NAME]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[FoodCategory] ADD  DEFAULT (N'Chưa đặt tên') FOR [NAME]
GO
ALTER TABLE [dbo].[Tablefood] ADD  DEFAULT (N'Bàn chưa có tên') FOR [name]
GO
ALTER TABLE [dbo].[Tablefood] ADD  DEFAULT (N'Trống') FOR [status]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD FOREIGN KEY([idTable])
REFERENCES [dbo].[Tablefood] ([id])
GO
ALTER TABLE [dbo].[billinfo]  WITH CHECK ADD FOREIGN KEY([idBill])
REFERENCES [dbo].[bill] ([id])
GO
ALTER TABLE [dbo].[billinfo]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([IDCATEGORY])
REFERENCES [dbo].[FoodCategory] ([id])
GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDate]    Script Date: 8/20/2022 4:14:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[USP_GetListBillByDate]
@checkin date,@checkout date
as
begin
	select t.name as [Tên bàn], b.TotalPrice as [Tổng tiền], DateCheckIn as [Ngày vào],DateCheckOut as [Ngày ra],discount as [Giảm giá]
from dbo.bill as b,  dbo.TableFood as t
where datecheckin > =@checkin and DateCheckOut <= @checkout and b.status = 1
and t.id = b.idTable 
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDateAndPage]    Script Date: 8/20/2022 4:14:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetListBillByDateAndPage]
@checkin date,@checkout date,@page int
as
begin
	declare @pageRows int =10 
	Declare @selectRows int = @pageRows
	Declare @exceptRows int = (@page -1)*@pageRows

	;with BillShow as(select b.id, t.name as [Tên bàn], b.TotalPrice as [Tổng tiền], DateCheckIn as [Ngày vào],DateCheckOut as [Ngày ra],discount as [Giảm giá]
	from dbo.bill as b,  dbo.TableFood as t
	where datecheckin > =@checkin and DateCheckOut <= @checkout and b.status = 1
	and t.id = b.idTable)

	select top (@selectRows) * from BillShow where id not in (select top (@exceptRows) id from BillShow)
	
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetNumBillByDate]    Script Date: 8/20/2022 4:14:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[USP_GetNumBillByDate]
@checkin date,@checkout date
as
begin
	select count(*)
	from dbo.bill as b,  dbo.TableFood as t
	where datecheckin > =@checkin and DateCheckOut <= @checkout and b.status = 1
	and t.id = b.idTable 
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTableList]    Script Date: 8/20/2022 4:14:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetTableList]
As select * from dbo.Tablefood
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 8/20/2022 4:14:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[USP_InsertBill]
@idTable Int
As
Begin
	Insert dbo.Bill(DateCheckIn,DateCheckOut,idTable,status,discount)
	Values (GETDATE(),Null,@idTable,0,0)

End
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfo]    Script Date: 8/20/2022 4:14:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc  [dbo].[USP_InsertBillInfo]
@idBill Int,@idFood int, @count int
As
Begin
	Declare @isExitBillInfo int
	Declare @foodCount int = 1
	Select @isExitBillInfo = id, @foodCount = count from dbo.BillInfo where idBill = @idBill and idFood = @idFood

	if(@isExitBillInfo>0)
	Begin
		Declare @newCount int = @foodCount + @count
		if(@newCount>0)
		Update dbo.billinfo set count = @foodCount + @count where idFood = @idFood and idBill = @idBill
		else
		Delete dbo.billinfo where idBill = @idBill and idFood = @idFood
	End
	else 
	begin
		insert dbo.billinfo(idBill,idFood,Count)
		Values (@idBill,@idFood,@count)
	end

End
GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 8/20/2022 4:14:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Proc [dbo].[USP_Login]
@userName nvarchar(100) , @passWord nvarchar(100)
as
Begin
	Select * from dbo.Account where UserName = @userName and Password = @passWord
End
GO
/****** Object:  StoredProcedure [dbo].[USP_SwitchTable]    Script Date: 8/20/2022 4:14:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[USP_SwitchTable]
@idTable1 int , @idTable2 int
as
begin

	Declare @idFirstBill int
	Declare @idSecondBill int
	Declare @isFirstTableEmty int = 1
	Declare @isSecondTableEmty int = 1
	Select @idFirstBill=id from dbo.Bill where idTable = @idTable1 and Status = 0
	Select @idSecondBill=id from dbo.Bill where idTable = @idTable2 and Status = 0

	if(@idFirstBill is null)
	Begin
		insert into dbo.bill(DateCheckIn,DateCheckOut,idTable,status)
		Values(getdate(),null,@idTable1,0)
		Select @idFirstBill = Max(id) from dbo.Bill where idTable = @idTable1 and Status = 0
	
	End

	select @isFirstTableEmty = count(*) from dbo.billinfo where idBill = @idFirstBill

	if(@idSecondBill is null)
	Begin
		insert into dbo.bill(DateCheckIn,DateCheckOut,idTable,status)
		Values(getdate(),null,@idTable2,0)
		Select @idSecondBill = Max(id) from dbo.Bill where idTable = @idTable2 and Status = 0

	End
	select @isSecondTableEmty = count(*) from dbo.billinfo where idBill = @idSecondBill

	Select id into IDBillInfoTable from dbo.billinfo where idBill = @idSecondBill

	update dbo.billinfo set idBill = @idSecondBill where idBill = @idFirstBill

	update dbo.billinfo set idBill = @idFirstBill where id in (select * from IDBillInfoTable)

	drop table IDBillInfoTable
	if(@isFirstTableEmty = 0) update dbo.Tablefood set status = N'Trống' where id = @idTable2
	if(@isSecondTableEmty = 0) update dbo.Tablefood set status = N'Trống' where id = @idTable1
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateAccount]    Script Date: 8/20/2022 4:14:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[USP_UpdateAccount]
@userName Nvarchar(100), @displayName nvarchar(100), @password nvarchar(100), @newpassword nvarchar(100)
as
begin
	Declare @isRightPass int
	select @isRightPass = Count(*) from dbo.Account where userName = @userName and PassWord = @password
	if(@isRightPass =1 )
	begin
		if(@newpassword = null or @newpassword = '')
		begin
			update dbo.Account set Displayname = @displayName where username = @userName
		end
		else update dbo.Account set Displayname = @displayName, Password = @newpassword where userName = @userName
	end
end
GO
USE [master]
GO
ALTER DATABASE [QuanLyQuanCaPhe] SET  READ_WRITE 
GO
