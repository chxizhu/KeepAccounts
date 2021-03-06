USE [master]
GO
/****** Object:  Database [KeepAccountsDB]    Script Date: 2019/9/9 11:59:20 ******/
CREATE DATABASE [KeepAccountsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KeepAccountsDB', FILENAME = N'D:\sqlserver2012\MSSQL11.MSSQLSERVER\MSSQL\DATA\KeepAccountsDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KeepAccountsDB_log', FILENAME = N'D:\sqlserver2012\MSSQL11.MSSQLSERVER\MSSQL\DATA\KeepAccountsDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KeepAccountsDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KeepAccountsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KeepAccountsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [KeepAccountsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KeepAccountsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KeepAccountsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET RECURSIVE_TRIGGERS ON 
GO
ALTER DATABASE [KeepAccountsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KeepAccountsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KeepAccountsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET RECOVERY FULL 
GO
ALTER DATABASE [KeepAccountsDB] SET  MULTI_USER 
GO
ALTER DATABASE [KeepAccountsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KeepAccountsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KeepAccountsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KeepAccountsDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'KeepAccountsDB', N'ON'
GO
USE [KeepAccountsDB]
GO
/****** Object:  Table [dbo].[T_Bill]    Script Date: 2019/9/9 11:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Bill](
	[billid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [varchar](50) NOT NULL,
	[billtime] [datetime] NOT NULL,
	[money] [float] NOT NULL,
	[category] [varchar](50) NOT NULL,
	[operation] [varchar](50) NOT NULL,
	[remark] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Expenditure]    Script Date: 2019/9/9 11:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Expenditure](
	[expenditureid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [varchar](50) NOT NULL,
	[expendituretime] [datetime] NOT NULL,
	[expendituremoney] [float] NOT NULL,
	[expenditurecategory] [varchar](50) NOT NULL,
	[expenditureoperation] [varchar](50) NOT NULL,
	[expenditureremark] [varchar](50) NULL,
 CONSTRAINT [PK_T_Expenditure] PRIMARY KEY CLUSTERED 
(
	[expenditureid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_User]    Script Date: 2019/9/9 11:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_User](
	[uid] [varchar](50) NOT NULL,
	[uname] [varchar](50) NOT NULL,
	[password] [int] NOT NULL,
 CONSTRAINT [PK_T_User] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[V_UserBill]    Script Date: 2019/9/9 11:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_UserBill]
AS
SELECT  NEWID() AS ID, dbo.T_User.uid, dbo.T_User.uname, dbo.T_User.password, dbo.T_Bill.billid, dbo.T_Bill.billtime, 
                   dbo.T_Bill.money, dbo.T_Bill.category, dbo.T_Bill.operation, dbo.T_Bill.remark
FROM      dbo.T_User INNER JOIN
                   dbo.T_Bill ON dbo.T_User.uid = dbo.T_Bill.userid


GO
SET IDENTITY_INSERT [dbo].[T_Bill] ON 

INSERT [dbo].[T_Bill] ([billid], [userid], [billtime], [money], [category], [operation], [remark]) VALUES (1, N'201901', CAST(0x0000A2D500000000 AS DateTime), 200, N'购物', N'支出', N'购物消费')
INSERT [dbo].[T_Bill] ([billid], [userid], [billtime], [money], [category], [operation], [remark]) VALUES (2, N'201901', CAST(0x0000A2D500000000 AS DateTime), 300, N'交通', N'支出', N'购物消费')
INSERT [dbo].[T_Bill] ([billid], [userid], [billtime], [money], [category], [operation], [remark]) VALUES (3, N'201901', CAST(0x0000A2D500DBCCC0 AS DateTime), 3000, N'工资', N'收入', N'工资消费')
INSERT [dbo].[T_Bill] ([billid], [userid], [billtime], [money], [category], [operation], [remark]) VALUES (4, N'201901', CAST(0x0000A2D500DBCCC0 AS DateTime), 200, N'理财', N'收入', N'理财消费')
INSERT [dbo].[T_Bill] ([billid], [userid], [billtime], [money], [category], [operation], [remark]) VALUES (14, N'201901', CAST(0x0000AAC300000000 AS DateTime), 100, N'医疗', N'支出', N'开始')
INSERT [dbo].[T_Bill] ([billid], [userid], [billtime], [money], [category], [operation], [remark]) VALUES (12, N'201901', CAST(0x0000AABB00000000 AS DateTime), 500, N'旅行', N'支出', N'旅行')
INSERT [dbo].[T_Bill] ([billid], [userid], [billtime], [money], [category], [operation], [remark]) VALUES (8, N'201901', CAST(0x0000AABF00000000 AS DateTime), 500, N'学习', N'支出', N'餐饮')
INSERT [dbo].[T_Bill] ([billid], [userid], [billtime], [money], [category], [operation], [remark]) VALUES (9, N'201902', CAST(0x0000AABB00000000 AS DateTime), 200.5, N'理财', N'收入', N'工资')
INSERT [dbo].[T_Bill] ([billid], [userid], [billtime], [money], [category], [operation], [remark]) VALUES (13, N'201901', CAST(0x0000AAC300000000 AS DateTime), 200, N'其他', N'收入', N'开始')
SET IDENTITY_INSERT [dbo].[T_Bill] OFF
INSERT [dbo].[T_User] ([uid], [uname], [password]) VALUES (N'201901', N' 伊索萦', 123456)
INSERT [dbo].[T_User] ([uid], [uname], [password]) VALUES (N'201902', N'123456', 123456)
INSERT [dbo].[T_User] ([uid], [uname], [password]) VALUES (N'201903', N'123456', 123456)
INSERT [dbo].[T_User] ([uid], [uname], [password]) VALUES (N'201904', N'111111', 123456)
ALTER TABLE [dbo].[T_Bill]  WITH CHECK ADD  CONSTRAINT [FK_T_Income_T_User] FOREIGN KEY([userid])
REFERENCES [dbo].[T_User] ([uid])
GO
ALTER TABLE [dbo].[T_Bill] CHECK CONSTRAINT [FK_T_Income_T_User]
GO
ALTER TABLE [dbo].[T_Expenditure]  WITH CHECK ADD  CONSTRAINT [FK_T_Expenditure_T_User] FOREIGN KEY([userid])
REFERENCES [dbo].[T_User] ([uid])
GO
ALTER TABLE [dbo].[T_Expenditure] CHECK CONSTRAINT [FK_T_Expenditure_T_User]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "T_User"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 186
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T_Bill"
            Begin Extent = 
               Top = 0
               Left = 334
               Bottom = 249
               Right = 501
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_UserBill'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_UserBill'
GO
USE [master]
GO
ALTER DATABASE [KeepAccountsDB] SET  READ_WRITE 
GO
