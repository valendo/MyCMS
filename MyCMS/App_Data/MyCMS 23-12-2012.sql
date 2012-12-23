USE [master]
GO
/****** Object:  Database [MyCMS]    Script Date: 12/23/2012 22:07:03 ******/
CREATE DATABASE [MyCMS] ON  PRIMARY 
( NAME = N'MyCMS', FILENAME = N'D:\WebForm\cms\My CMS\Database\MyCMS.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyCMS_log', FILENAME = N'D:\WebForm\cms\My CMS\Database\MyCMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MyCMS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyCMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyCMS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [MyCMS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [MyCMS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [MyCMS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [MyCMS] SET ARITHABORT OFF
GO
ALTER DATABASE [MyCMS] SET AUTO_CLOSE ON
GO
ALTER DATABASE [MyCMS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [MyCMS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [MyCMS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [MyCMS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [MyCMS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [MyCMS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [MyCMS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [MyCMS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [MyCMS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [MyCMS] SET  DISABLE_BROKER
GO
ALTER DATABASE [MyCMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [MyCMS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [MyCMS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [MyCMS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [MyCMS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [MyCMS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [MyCMS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [MyCMS] SET  READ_WRITE
GO
ALTER DATABASE [MyCMS] SET RECOVERY SIMPLE
GO
ALTER DATABASE [MyCMS] SET  MULTI_USER
GO
ALTER DATABASE [MyCMS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [MyCMS] SET DB_CHAINING OFF
GO
USE [MyCMS]
GO
/****** Object:  Table [dbo].[Texts]    Script Date: 12/23/2012 22:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Texts](
	[TextId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleId] [int] NULL,
	[Content] [ntext] NULL,
 CONSTRAINT [PK_Texts] PRIMARY KEY CLUSTERED 
(
	[TextId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Texts] ON
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (1, 1, N'Content of module 1')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (2, 2, N'Content of module 2')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (3, 3, N'Content of module 3')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (4, 17, N'hello tai vo1')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (5, 18, N'dr4646')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (6, 19, N'hello')
SET IDENTITY_INSERT [dbo].[Texts] OFF
/****** Object:  Table [dbo].[Pages]    Script Date: 12/23/2012 22:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[PageId] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[ParentId] [int] NULL,
	[PageSEO] [nvarchar](200) NULL,
	[PageOrder] [int] NULL,
	[IsVisible] [bit] NULL,
	[Description] [nvarchar](500) NULL,
	[Keywords] [nvarchar](500) NULL,
	[Theme] [nvarchar](50) NULL,
	[Layout] [nvarchar](50) NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Pages] ON
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Theme], [Layout]) VALUES (1, N'Home', N'Home', -1, N'home', 1, 1, N'Descripiton of home page', N'home, page, module, cms', N'Default', N'Home.ascx')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Theme], [Layout]) VALUES (2, N'About', N'About us', -1, N'about', 1, 1, N'', N'', N'Default', N'Detail.ascx')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Theme], [Layout]) VALUES (4, N'SubHome1', N'Sub Home 1', 1, N'subhome1', 4, 1, NULL, NULL, N'Default', N'Home.ascx')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Theme], [Layout]) VALUES (5, N'SubHome11', N'Sub Home 1.1', 4, N'subhome11', 5, 1, NULL, NULL, N'Default', N'Home.ascx')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Theme], [Layout]) VALUES (6, N'SubAbout', N'Sub About', 2, N'subabout', 6, 1, NULL, NULL, N'Default', N'Home.ascx')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Theme], [Layout]) VALUES (7, N'gds', N'sg', -1, N'sg', 2, 1, N'sgs', N'sg', N'Custom', N'2Columns.ascx')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Theme], [Layout]) VALUES (8, N'gssh', N'shs', 7, N'dhf', 4, 0, N'', N'', N'Custom', N'2Columns.ascx')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Theme], [Layout]) VALUES (9, N'1112', N'1111', -1, N'1111', 3, 1, N'sgs', N'sg', N'Default', N'Detail.ascx')
SET IDENTITY_INSERT [dbo].[Pages] OFF
/****** Object:  Table [dbo].[PageModules]    Script Date: 12/23/2012 22:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageModules](
	[PageModuleId] [int] IDENTITY(1,1) NOT NULL,
	[PageId] [int] NULL,
	[ModuleId] [int] NULL,
	[PaneName] [nvarchar](50) NULL,
	[ModuleOrder] [int] NULL,
	[ModuleTitle] [nvarchar](max) NULL,
	[DisplayTitle] [bit] NULL,
 CONSTRAINT [PK_PageModules] PRIMARY KEY CLUSTERED 
(
	[PageModuleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PageModules] ON
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (3, 3, 1, N'LeftPane', 1, N'Text 3', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (7, 1, 6, N'RightPane', 1, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (9, 1, 8, N'RightPane', 0, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (11, 1, 10, N'RightPane', 2, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (12, 1, 11, N'RightPane', 3, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (15, 1, 14, N'ContentPane', 0, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (16, 1, 15, N'ContentPane', 1, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (17, 1, 16, N'LeftPane', 0, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (18, 1, 17, N'ContentPane', 2, N'Default', 1)
SET IDENTITY_INSERT [dbo].[PageModules] OFF
/****** Object:  Table [dbo].[Modules]    Script Date: 12/23/2012 22:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modules](
	[ModuleId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleDefId] [int] NULL,
 CONSTRAINT [PK_Modules] PRIMARY KEY CLUSTERED 
(
	[ModuleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Modules] ON
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (1, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (2, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (3, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (4, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (5, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (6, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (8, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (9, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (10, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (11, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (12, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (13, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (14, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (15, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (16, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (17, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (18, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (19, 1)
SET IDENTITY_INSERT [dbo].[Modules] OFF
/****** Object:  Table [dbo].[ModuleDefinitions]    Script Date: 12/23/2012 22:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleDefinitions](
	[ModuleDefId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleName] [nvarchar](50) NULL,
	[ModuleFolder] [nvarchar](50) NULL,
 CONSTRAINT [PK_ModuleDefinitions] PRIMARY KEY CLUSTERED 
(
	[ModuleDefId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ModuleDefinitions] ON
INSERT [dbo].[ModuleDefinitions] ([ModuleDefId], [ModuleName], [ModuleFolder]) VALUES (1, N'Text', N'Text')
INSERT [dbo].[ModuleDefinitions] ([ModuleDefId], [ModuleName], [ModuleFolder]) VALUES (2, N'Flash', N'Flash')
INSERT [dbo].[ModuleDefinitions] ([ModuleDefId], [ModuleName], [ModuleFolder]) VALUES (3, N'Youtube', N'Youtube')
INSERT [dbo].[ModuleDefinitions] ([ModuleDefId], [ModuleName], [ModuleFolder]) VALUES (4, N'Video', N'Video')
SET IDENTITY_INSERT [dbo].[ModuleDefinitions] OFF
