USE [master]
GO
/****** Object:  Database [GSM]    Script Date: 18.10.2019 12:21:57 ******/
CREATE DATABASE [GSM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GSM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GSM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GSM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GSM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GSM] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GSM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GSM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GSM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GSM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GSM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GSM] SET ARITHABORT OFF 
GO
ALTER DATABASE [GSM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GSM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GSM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GSM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GSM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GSM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GSM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GSM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GSM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GSM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GSM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GSM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GSM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GSM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GSM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GSM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GSM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GSM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GSM] SET  MULTI_USER 
GO
ALTER DATABASE [GSM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GSM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GSM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GSM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GSM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GSM] SET QUERY_STORE = OFF
GO
USE [GSM]
GO
/****** Object:  User [tgcn]    Script Date: 18.10.2019 12:21:57 ******/
CREATE USER [tgcn] FOR LOGIN [tgcnn] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 18.10.2019 12:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[b_ID] [int] NOT NULL,
	[sub_ID] [int] NOT NULL,
	[b_Minutes] [int] NOT NULL,
	[b_SMS] [int] NOT NULL,
	[b_Total_Depth] [float] NOT NULL,
	[b_Last_Discharge_Time] [date] NOT NULL,
	[t_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[b_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delay_Test]    Script Date: 18.10.2019 12:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delay_Test](
	[dt_ID] [int] NOT NULL,
	[b_ID] [int] NOT NULL,
	[dt_Delay] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Delay_Test] PRIMARY KEY CLUSTERED 
(
	[dt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delayed_Debts]    Script Date: 18.10.2019 12:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delayed_Debts](
	[dd_ID] [int] NOT NULL,
	[dt_ID] [int] NOT NULL,
	[dd_New_Debt] [float] NOT NULL,
	[dd_New_Last_Discharge] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dd_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operators]    Script Date: 18.10.2019 12:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operators](
	[op_ID] [int] NOT NULL,
	[op_Name] [varchar](250) NOT NULL,
	[op_Region_Name] [varchar](250) NOT NULL,
	[op_Offices] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[op_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 18.10.2019 12:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[ow_ID] [int] NOT NULL,
	[op_ID] [int] NOT NULL,
	[ow_Name] [varchar](250) NOT NULL,
	[ow_Surname] [varchar](250) NOT NULL,
	[ow_Address] [varchar](max) NOT NULL,
	[ow_Country] [varchar](50) NOT NULL,
	[ow_Phone_Number] [varchar](50) NOT NULL,
	[ow_Fax_Number] [varchar](50) NULL,
	[ow_Company_Name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ow_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sub_Web]    Script Date: 18.10.2019 12:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sub_Web](
	[subw_ID] [int] NOT NULL,
	[sub_ID] [int] NOT NULL,
	[subw_Nick_Name] [varchar](250) NOT NULL,
	[subw_Password] [varchar](max) NOT NULL,
	[subw_Last_Login] [date] NOT NULL,
	[subw_Login_Amount_Per_Month] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subw_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscribers]    Script Date: 18.10.2019 12:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscribers](
	[sub_ID] [int] NOT NULL,
	[t_ID] [int] NOT NULL,
	[op_ID] [int] NOT NULL,
	[sub_Phone_Number] [varchar](20) NOT NULL,
	[sub_Name] [varchar](250) NOT NULL,
	[sub_Surname] [varchar](100) NOT NULL,
	[sub_Main_Address] [varchar](max) NOT NULL,
	[sub_Work_Address] [varchar](max) NULL,
	[sub_Country] [varchar](100) NOT NULL,
	[sub_Identity_Documents_Number] [varchar](20) NOT NULL,
	[sub_Abroad_Connection] [varchar](20) NOT NULL,
	[sub_Create_Time] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sub_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tariff]    Script Date: 18.10.2019 12:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tariff](
	[t_ID] [int] NOT NULL,
	[t_Name] [varchar](250) NOT NULL,
	[t_Costs_Per_Minutes] [float] NOT NULL,
	[t_Costs_Per_SMS] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[t_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [b_Minutes], [b_SMS], [b_Total_Depth], [b_Last_Discharge_Time], [t_ID]) VALUES (1, 1, 320, 125, 166.25, CAST(N'2019-11-06' AS Date), 1)
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [b_Minutes], [b_SMS], [b_Total_Depth], [b_Last_Discharge_Time], [t_ID]) VALUES (2, 2, 500, 100, 150, CAST(N'2019-11-12' AS Date), 3)
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [b_Minutes], [b_SMS], [b_Total_Depth], [b_Last_Discharge_Time], [t_ID]) VALUES (3, 3, 430, 255, 149.55, CAST(N'2019-11-25' AS Date), 2)
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [b_Minutes], [b_SMS], [b_Total_Depth], [b_Last_Discharge_Time], [t_ID]) VALUES (4, 4, 100, 700, 60.5, CAST(N'2019-11-22' AS Date), 4)
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [b_Minutes], [b_SMS], [b_Total_Depth], [b_Last_Discharge_Time], [t_ID]) VALUES (5, 5, 275, 300, 152.5, CAST(N'2019-11-28' AS Date), 1)
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [b_Minutes], [b_SMS], [b_Total_Depth], [b_Last_Discharge_Time], [t_ID]) VALUES (6, 6, 360, 600, 210, CAST(N'2019-11-19' AS Date), 1)
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [b_Minutes], [b_SMS], [b_Total_Depth], [b_Last_Discharge_Time], [t_ID]) VALUES (7, 7, 320, 300, 114.6, CAST(N'2019-11-14' AS Date), 2)
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [b_Minutes], [b_SMS], [b_Total_Depth], [b_Last_Discharge_Time], [t_ID]) VALUES (8, 8, 455, 660, 169.95, CAST(N'2019-11-03' AS Date), 2)
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [b_Minutes], [b_SMS], [b_Total_Depth], [b_Last_Discharge_Time], [t_ID]) VALUES (9, 9, 670, 888, 247.74, CAST(N'2019-11-15' AS Date), 2)
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delay]) VALUES (1, 1, N'DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delay]) VALUES (2, 2, N'NOT DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delay]) VALUES (3, 3, N'DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delay]) VALUES (4, 4, N'NOT DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delay]) VALUES (5, 5, N'DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delay]) VALUES (6, 6, N'DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delay]) VALUES (7, 7, N'NOT DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delay]) VALUES (8, 8, N'DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delay]) VALUES (9, 9, N'DELAYED')
INSERT [dbo].[Delayed_Debts] ([dd_ID], [dt_ID], [dd_New_Debt], [dd_New_Last_Discharge]) VALUES (1, 1, 179.55, CAST(N'2019-12-06' AS Date))
INSERT [dbo].[Delayed_Debts] ([dd_ID], [dt_ID], [dd_New_Debt], [dd_New_Last_Discharge]) VALUES (2, 2, 162, CAST(N'2019-12-12' AS Date))
INSERT [dbo].[Delayed_Debts] ([dd_ID], [dt_ID], [dd_New_Debt], [dd_New_Last_Discharge]) VALUES (3, 3, 161.51, CAST(N'2019-12-25' AS Date))
INSERT [dbo].[Delayed_Debts] ([dd_ID], [dt_ID], [dd_New_Debt], [dd_New_Last_Discharge]) VALUES (4, 4, 65.34, CAST(N'2019-12-22' AS Date))
INSERT [dbo].[Delayed_Debts] ([dd_ID], [dt_ID], [dd_New_Debt], [dd_New_Last_Discharge]) VALUES (5, 5, 164.7, CAST(N'2019-12-28' AS Date))
INSERT [dbo].[Delayed_Debts] ([dd_ID], [dt_ID], [dd_New_Debt], [dd_New_Last_Discharge]) VALUES (6, 6, 226.8, CAST(N'2019-12-19' AS Date))
INSERT [dbo].[Delayed_Debts] ([dd_ID], [dt_ID], [dd_New_Debt], [dd_New_Last_Discharge]) VALUES (7, 7, 123.76, CAST(N'2019-12-14' AS Date))
INSERT [dbo].[Delayed_Debts] ([dd_ID], [dt_ID], [dd_New_Debt], [dd_New_Last_Discharge]) VALUES (8, 8, 183.54, CAST(N'2019-12-03' AS Date))
INSERT [dbo].[Delayed_Debts] ([dd_ID], [dt_ID], [dd_New_Debt], [dd_New_Last_Discharge]) VALUES (9, 9, 267.55, CAST(N'2019-12-15' AS Date))
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (1, N'İstanbul', N'Marmara', N'Main Office')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (2, N'Tekirdağ', N'Marmara', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (3, N'Bursa', N'Marmara', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (4, N'Gaziantep', N'Southeastern Anatolia', N'Main Office')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (5, N'Kilis', N'Southeastern Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (6, N'Şanlıurfa', N'Southeastern Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (7, N'İzmir', N'Aegean', N'Main Office')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (8, N'Denizli', N'Aegean', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (9, N'Manisa', N'Aegean', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (10, N'Aydın', N'Aegean', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (11, N'Erzurum', N'Eastern Anatolia', N'Main Office')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (12, N'Malatya', N'Eastern Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (13, N'Muş', N'Eastern Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (14, N'Erzincan', N'Eastern Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (15, N'Ankara', N'Central Anatolia', N'Main Office')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (16, N'Konya', N'Central Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (17, N'Eskişehir', N'Central Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (18, N'Sivas', N'Central Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (19, N'Trabzon', N'Black Sea', N'Main Office')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (20, N'Rize', N'Black Sea', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (21, N'Samsun', N'Black Sea', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (22, N'Çorum', N'Black Sea', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (23, N'Kastamonu', N'Black Sea', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (24, N'Antalya', N'Mediterranean', N'Main Office')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (25, N'Mersin', N'Mediterranean', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (26, N'Bodrum', N'Mediterranean', N'Branch')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (1, 1, N'Nihat', N'Keşmiş', N'İstanbul Bahçelievler No:55', N'Malatya', N'+90 535 154 5878', NULL, N'YOUDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (2, 7, N'Mehmet ', N'Ardıç', N'İzmir Mavişehir', N'Ankara', N'+90 532 780 3467', N'+90 850 222 1500', N'CODEVER')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (3, 14, N'İlyas', N'Umut', N'Erzincan Sanayii Bölgesi', N'İzmir', N'+90 544 123 6700', N'+90 850 444 0002', N'SOFTDEV')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (4, 13, N'İlyas', N'Umut', N'Muş Merkez', N'İzmir', N'+90 544 123 6700', N'+90 850 444 0001', N'SOFTDEV')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (5, 12, N'İlyas', N'Umut', N'Malatya Merkez', N'İzmir', N'+90 544 123 6700', N'+90 850 444 0003', N'SOFTDEV')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (6, 11, N'İlyas', N'Umut', N'Erzurum Çarşı', N'İzmir', N'+90 544 123 6700', N'+90 850 444 0004', N'SOFTDEV')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (7, 4, N'Zeynep', N'Avşar', N'Gaziantep Merkez', N'Mersin', N'+90 542 535 7835', NULL, N'TECHDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (8, 5, N'Tuğcan', N'Canık', N'Kilis Merkez', N'İstanbul', N'+90 530 168 1255', N'+90 850 111 4444', N'GREATECH')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (9, 19, N'Uğur', N'Aysal', N'Trabzon Merkez', N'Trabzon', N'+90 542 112 5544', NULL, N'CODERROR')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (10, 20, N'Ahmet', N'Takan', N'Rize Merkez', N'Rize', N'+90 532 685 1234', NULL, N'TECHODEC')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (11, 3, N'Tanju', N'Öztürk', N'Bursa Merkez', N'Bursa', N'+90 544 635 4533', N'+850 222 0000', N'DEVENGERS')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (12, 8, N'İkbal', N'Söker', N'Denizli Merkez', N'Denizli', N'+90 532 333 1234', NULL, N'LUDEVO')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (1, 1, N'cngz1', N'cngskl44', CAST(N'2019-10-15' AS Date), N'12')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (2, 2, N'alperr2', N'alpershn99', CAST(N'2019-10-12' AS Date), N'15')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (3, 3, N'melikee_35', N'melike3535', CAST(N'2019-10-10' AS Date), N'10')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (4, 4, N'dilara_11', N'dilara35', CAST(N'2019-10-16' AS Date), N'13')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (5, 5, N'fırat_4', N'frtfrt06', CAST(N'2019-10-12' AS Date), N'23')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (6, 6, N'ece_33', N'ecenur33', CAST(N'2019-10-05' AS Date), N'14')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (7, 7, N'kemalus2', N'kemal53', CAST(N'2019-10-12' AS Date), N'18')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (8, 8, N'volki23', N'volkanust07', CAST(N'2019-10-16' AS Date), N'22')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (9, 9, N'akif2', N'akif99', CAST(N'2019-10-14' AS Date), N'20')
INSERT [dbo].[Subscribers] ([sub_ID], [t_ID], [op_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [sub_Abroad_Connection], [sub_Create_Time]) VALUES (1, 1, 1, N'+90 505 554 9228', N'Cengizhan', N'Sökel', N'İstanbul Bağcılar', NULL, N'İstanbul', N'ZBLZ9L5FZ', N'ALLOW', CAST(N'2019-10-16' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [t_ID], [op_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [sub_Abroad_Connection], [sub_Create_Time]) VALUES (2, 3, 4, N'+90 505 553 4925', N'Alper', N'Şahin', N'Gaziantep Şehitkamil', N'Gaziantep Sanayii', N'Gaziantep', N'39R4F5DEU', N'DENY', CAST(N'2019-06-05' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [t_ID], [op_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [sub_Abroad_Connection], [sub_Create_Time]) VALUES (3, 2, 7, N'+90 530 655 1553', N'Melike', N'Deniz', N'İzmir Karşıyaka', NULL, N'İzmir', N'88Q49JVZ4', N'ALLOW', CAST(N'2019-01-11' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [t_ID], [op_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [sub_Abroad_Connection], [sub_Create_Time]) VALUES (4, 4, 11, N'+90 555 559 7325', N'Dilara', N'Tanış', N'İzmir Karşıyaka', NULL, N'İzmir', N'2Z98UMX7E', N'DENY', CAST(N'2018-11-01' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [t_ID], [op_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [sub_Abroad_Connection], [sub_Create_Time]) VALUES (5, 1, 2, N'+90 505 552 0949', N'Fırat', N'Tokgöz', N'Ankara Merkez', N'Ankara Sanayii', N'İstanbul', N'Y3RJBTBS5', N'ALLOW', CAST(N'2017-12-21' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [t_ID], [op_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [sub_Abroad_Connection], [sub_Create_Time]) VALUES (6, 1, 15, N'+90 505 557 2453', N'Ecenur', N'Uçar', N'Mersin Mezitli', NULL, N'Mersin', N'WMAP4DJVU', N'DENY', CAST(N'2019-01-18' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [t_ID], [op_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [sub_Abroad_Connection], [sub_Create_Time]) VALUES (7, 2, 19, N'+90 544 555 1234', N'Kemal', N'Usanmaz', N'Rize Merkez', NULL, N'Trabzon', N'TYPBA476Z', N'DENY', CAST(N'2018-06-16' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [t_ID], [op_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [sub_Abroad_Connection], [sub_Create_Time]) VALUES (8, 2, 24, N'+90 530 125 8833', N'Volkan', N'Üstbaş', N'Antalya Merkez', NULL, N'İstanbul', N'VEJ9FZ693', N'DENY', CAST(N'2018-04-22' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [t_ID], [op_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [sub_Abroad_Connection], [sub_Create_Time]) VALUES (9, 1, 2, N'+90 540 450 3525', N'Akif', N'Kent', N'Tekirdağ Merkez', N'Tekirdağ Sanayii', N'Tekirdağ', N'KUK93WDHT', N'ALLOW', CAST(N'2018-06-18' AS Date))
INSERT [dbo].[Tariff] ([t_ID], [t_Name], [t_Costs_Per_Minutes], [t_Costs_Per_SMS]) VALUES (1, N'ZOOM', 0.5, 0.05)
INSERT [dbo].[Tariff] ([t_ID], [t_Name], [t_Costs_Per_Minutes], [t_Costs_Per_SMS]) VALUES (2, N'STUDENT', 0.33, 0.03)
INSERT [dbo].[Tariff] ([t_ID], [t_Name], [t_Costs_Per_Minutes], [t_Costs_Per_SMS]) VALUES (3, N'TALKTIVE', 0.2, 0.5)
INSERT [dbo].[Tariff] ([t_ID], [t_Name], [t_Costs_Per_Minutes], [t_Costs_Per_SMS]) VALUES (4, N'SILENT', 0.6, 0.015)
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD FOREIGN KEY([sub_ID])
REFERENCES [dbo].[Subscribers] ([sub_ID])
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD FOREIGN KEY([t_ID])
REFERENCES [dbo].[Tariff] ([t_ID])
GO
ALTER TABLE [dbo].[Delay_Test]  WITH CHECK ADD FOREIGN KEY([b_ID])
REFERENCES [dbo].[Bills] ([b_ID])
GO
ALTER TABLE [dbo].[Delayed_Debts]  WITH CHECK ADD FOREIGN KEY([dt_ID])
REFERENCES [dbo].[Delay_Test] ([dt_ID])
GO
ALTER TABLE [dbo].[Delayed_Debts]  WITH CHECK ADD FOREIGN KEY([dt_ID])
REFERENCES [dbo].[Delay_Test] ([dt_ID])
GO
ALTER TABLE [dbo].[Owner]  WITH CHECK ADD FOREIGN KEY([op_ID])
REFERENCES [dbo].[Operators] ([op_ID])
GO
ALTER TABLE [dbo].[Sub_Web]  WITH CHECK ADD FOREIGN KEY([sub_ID])
REFERENCES [dbo].[Subscribers] ([sub_ID])
GO
ALTER TABLE [dbo].[Subscribers]  WITH CHECK ADD FOREIGN KEY([op_ID])
REFERENCES [dbo].[Operators] ([op_ID])
GO
ALTER TABLE [dbo].[Subscribers]  WITH CHECK ADD FOREIGN KEY([t_ID])
REFERENCES [dbo].[Tariff] ([t_ID])
GO
USE [master]
GO
ALTER DATABASE [GSM] SET  READ_WRITE 
GO
