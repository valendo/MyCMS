USE [master]
GO
/****** Object:  Database [MyCMS]    Script Date: 01/15/2013 16:38:47 ******/
CREATE DATABASE [MyCMS] ON  PRIMARY 
( NAME = N'MyCMS', FILENAME = N'D:\Web\cms\My CMS\Database\MyCMS.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyCMS_log', FILENAME = N'D:\Web\cms\My CMS\Database\MyCMS_1.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[UsersOpenAuthData]    Script Date: 01/15/2013 16:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersOpenAuthData](
	[ApplicationName] [nvarchar](128) NOT NULL,
	[MembershipUserName] [nvarchar](128) NOT NULL,
	[HasLocalPassword] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.UsersOpenAuthData] PRIMARY KEY CLUSTERED 
(
	[ApplicationName] ASC,
	[MembershipUserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 01/15/2013 16:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationName] [nvarchar](235) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Applications] ([ApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'9d6231d6-d8db-4901-9180-6bd613183931', NULL)
/****** Object:  Table [dbo].[Pages]    Script Date: 01/15/2013 16:38:48 ******/
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
	[Layout] [nvarchar](50) NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Pages] ON
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (1, N'Trang chu', N'Trang chu', -1, N'trang-chu', 1, 1, N'Descripiton of home page', N'home, page, module, cms', N'Home')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (2, N'About', N'About us', -1, N'about', 1, 1, N'', N'', N'Detail')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (4, N'SubHome1', N'Sub Home 1', 1, N'subhome1', 4, 1, NULL, NULL, N'Home')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (5, N'SubHome11', N'Sub Home 1.1', 4, N'subhome11', 5, 1, NULL, NULL, N'Home')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (6, N'SubAbout', N'Sub About', 2, N'subabout', 6, 1, NULL, NULL, N'Home')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (7, N'gds', N'sg', -1, N'sg', 2, 1, N'sgs', N'sg', N'2Columns')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (8, N'gssh', N'shs', 7, N'dhf', 4, 0, N'', N'', N'2Columns')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (9, N'1112', N'1111', -1, N'1111', 3, 1, N'sgs', N'sg', N'Detail')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (10, N'aaa', N'bbbb', -1, N'bbbb', 4, 1, N'', N'', N'Home')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (11, N'325325', N'235235', 6, N'saggagg', 1, 1, N'', N'', N'Home')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (12, N'en', N'en', -1, N'en', 5, 1, N'', N'', N'Home')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (13, N'Home', N'home', 12, N'home', 6, 1, N'', N'', N'Home')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (14, N'tai', N'tai', -1, N'tai', 6, 1, N'', N'', N'Home')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (15, N'lan', N'lan', -1, N'lan', 7, 1, N'', N'', N'Detail')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (16, N'thy', N'thy', -1, N'thy', 8, 1, N'', N'', N'Home')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (17, N'sgsdg', N'sgdsg', 16, N'dsgdg', 1, 1, N'', N'', N'Detail')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (18, N'sgdg', N'sdgd', 16, N'sdgd', 2, 1, N'', N'', N'Detail')
INSERT [dbo].[Pages] ([PageId], [PageName], [Title], [ParentId], [PageSEO], [PageOrder], [IsVisible], [Description], [Keywords], [Layout]) VALUES (19, N'355', N'3535', 16, N'dsgdg-', 3, 1, N'', N'', N'Detail')
SET IDENTITY_INSERT [dbo].[Pages] OFF
/****** Object:  Table [dbo].[PagePermissions]    Script Date: 01/15/2013 16:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagePermissions](
	[PagePermissionId] [int] IDENTITY(1,1) NOT NULL,
	[PageId] [int] NULL,
	[Role] [nvarchar](256) NULL,
 CONSTRAINT [PK_PagePermissions] PRIMARY KEY CLUSTERED 
(
	[PagePermissionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PagePermissions] ON
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (8, 17, N'host')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (9, 17, N'vvn')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (11, 16, N'Registration')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (12, 16, N'Admin')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (13, 15, N'Admin')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (14, 15, N'Anonymous')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (15, 1, N'Admin')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (18, 18, N'Admin')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (19, 18, N'Anonymous')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (20, 19, N'Admin')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (21, 19, N'Registration')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (22, 1, N'Anonymous')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (23, 2, N'Admin')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (24, 2, N'Anonymous')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (25, 14, N'Admin')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (26, 14, N'Anonymous')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (27, 10, N'Admin')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (28, 10, N'Anonymous')
INSERT [dbo].[PagePermissions] ([PagePermissionId], [PageId], [Role]) VALUES (29, 9, N'Admin')
SET IDENTITY_INSERT [dbo].[PagePermissions] OFF
/****** Object:  Table [dbo].[PageModules]    Script Date: 01/15/2013 16:38:48 ******/
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
	[Container] [nvarchar](50) NULL,
 CONSTRAINT [PK_PageModules] PRIMARY KEY CLUSTERED 
(
	[PageModuleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PageModules] ON
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (3, 3, 1, N'LeftPane', 1, N'Text 3', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (7, 1, 6, N'RightPane', 1, N'Default', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (9, 1, 8, N'RightPane', 0, N'Default', 1, N'Title')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (11, 1, 10, N'RightPane', 2, N'Default', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (12, 1, 11, N'RightPane', 3, N'Default', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (15, 1, 14, N'ContentPane', 4, N'Default', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (16, 1, 15, N'ContentPane', 2, N'Default', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (18, 1, 17, N'ContentPane', 0, N'vo thanht ai', 1, N'Title')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (20, 1, 21, N'ContentPane', 3, N'Default', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (22, 1, 23, N'LeftPane', 1, N'Default', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (24, 4, 25, N'LeftPane', 0, N'Default', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (25, 4, 26, N'ContentPane', 1, N'Default', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (26, 4, 27, N'ContentPane', 0, N'Default', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (27, 1, 28, N'LeftPane', 0, N'Default', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (28, 4, 29, N'LeftPane', 3, N'Default', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (29, 1, 30, N'ContentPane', 6, N'Default', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (30, 1, 31, N'ContentPane', 1, N'Default', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (31, 1, 32, N'LeftPane', 2, N'Default', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (32, 1, 33, N'LeftPane', 3, N'22233', 0, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (33, 1, 34, N'LeftPane', 4, N'hello', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (34, 1, 35, N'ContentPane', 5, N'123', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (35, 1, 36, N'LeftPane', 5, N'sdgsdg', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (36, 17, 37, N'LeftPane', 7, N'Left content', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (37, 17, 38, N'ContentPane', 8, N'Content right', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (38, 1, 39, N'ContentPane', 7, N'yyyy', 1, N'')
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle], [Container]) VALUES (40, 1, 41, N'ContentPane', 8, N'12345', 1, N'Title')
SET IDENTITY_INSERT [dbo].[PageModules] OFF
/****** Object:  Table [dbo].[Modules]    Script Date: 01/15/2013 16:38:48 ******/
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
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (20, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (21, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (22, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (23, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (24, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (25, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (26, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (27, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (28, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (29, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (30, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (31, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (32, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (33, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (34, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (35, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (36, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (37, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (38, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (39, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (40, 1)
INSERT [dbo].[Modules] ([ModuleId], [ModuleDefId]) VALUES (41, 1)
SET IDENTITY_INSERT [dbo].[Modules] OFF
/****** Object:  Table [dbo].[ModuleDefinitions]    Script Date: 01/15/2013 16:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleDefinitions](
	[ModuleDefId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleName] [nvarchar](50) NULL,
	[ModuleFolder] [nvarchar](50) NULL,
	[Icon] [nvarchar](50) NULL,
 CONSTRAINT [PK_ModuleDefinitions] PRIMARY KEY CLUSTERED 
(
	[ModuleDefId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ModuleDefinitions] ON
INSERT [dbo].[ModuleDefinitions] ([ModuleDefId], [ModuleName], [ModuleFolder], [Icon]) VALUES (1, N'Text', N'Text', N'Text')
INSERT [dbo].[ModuleDefinitions] ([ModuleDefId], [ModuleName], [ModuleFolder], [Icon]) VALUES (2, N'Flash', N'Flash', N'Flash')
INSERT [dbo].[ModuleDefinitions] ([ModuleDefId], [ModuleName], [ModuleFolder], [Icon]) VALUES (3, N'Youtube', N'Youtube', N'Video')
INSERT [dbo].[ModuleDefinitions] ([ModuleDefId], [ModuleName], [ModuleFolder], [Icon]) VALUES (4, N'Video', N'Video', N'Widescreen')
SET IDENTITY_INSERT [dbo].[ModuleDefinitions] OFF
/****** Object:  Table [dbo].[Texts]    Script Date: 01/15/2013 16:38:48 ******/
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
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (4, 17, N'<p><a class="heroLink" href="http://www.bbc.co.uk/news/uk-20800447" rev="news|homepage|na|r|t|i|hero|content" style="font-family: Arial, sans-serif; letter-spacing: normal; text-decoration: initial; font-size: 1.538em; font-weight: bold; line-height: 1.1em; color: rgb(23, 79, 130); font-style: normal; font-variant: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);" title="Falklands attack surprised Thatcher"><img alt="Margaret Thatcher" src="http://ichef.bbci.co.uk/wwhomepage-3.5/ic/news/304-171/64878000/jpg/_64878400_jmjtzztr.jpg" style="font-family: Arial,sans-serif; letter-spacing: 0px; border: 0px none; vertical-align: middle; float: left; font-size: 0.6em; font-weight: normal; padding: 0px 0px 5px; width: 304px; height: 171px; margin-left: 10px; margin-right: 10px;" /><span style="font-family: Arial, sans-serif; letter-spacing: 0px;">Falklands attack surprised Thatcher</span></a></p>

<p class="summary" id="news_hero_summary" style="font-family: Arial, sans-serif; letter-spacing: normal; margin: 0px; padding: 0px; color: rgb(80, 80, 80); line-height: 1.231em; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">The 1982 invasion of the Falkland Islands by Argentina caught then UK Prime Minister Margaret Thatcher by surprise, newly released archive papers show.</p>
')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (5, 18, N'dr4646')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (6, 19, N'hello')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (7, 20, N'sgsg')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (8, 21, N'<p>sdgs0777</p>

<p>hello world</p>

<p>555</p>
')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (9, 22, N'gnh99988')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (10, 23, N'sdgsdg')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (11, 24, N'777777777777')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (12, 25, N'111')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (13, 26, N'222')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (14, 27, N'68668')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (15, 28, N'đh')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (16, 29, N'dsgds')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (17, 31, N'999')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (18, 32, N'ssssssssssss')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (19, 35, N'<p>hddfhs</p>

<p>dfhdfhdf</p>

<p>dfhdfh</p>

<p>dhdfh</p>
')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (20, 36, N'<p>sgsdgsgs</p>

<p>sgsdg</p>
')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (21, 37, N'<p>This is content on the left</p>

<p>This is content on the left</p>

<p>This is content on the left</p>
')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (22, 38, N'<p>This is content on the right</p>
')
INSERT [dbo].[Texts] ([TextId], [ModuleId], [Content]) VALUES (23, 39, N'<p>vo thanh tai</p>
')
SET IDENTITY_INSERT [dbo].[Texts] OFF
/****** Object:  Table [dbo].[Settings]    Script Date: 01/15/2013 16:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Key] [nvarchar](200) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_Settings_1] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Settings] ([Key], [Value]) VALUES (N'HomePage', N'-1')
INSERT [dbo].[Settings] ([Key], [Value]) VALUES (N'SiteTitle', N'My CMS')
/****** Object:  Table [dbo].[Users]    Script Date: 01/15/2013 16:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'e07f0ef4-402a-478c-8444-19b472cae13e', N'test8', 0, CAST(0x0000A13900FD2100 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'0c161b1f-f979-410c-832a-3d4ba484f932', N'test9', 0, CAST(0x0000A13900FE0D57 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'129fa617-929f-4262-a152-435d5d05c550', N'test4', 0, CAST(0x0000A13900FAF95B AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'b5c34054-b656-44b1-af12-4447dcaf79b9', N'test1', 0, CAST(0x0000A14400F503DC AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'8b5bdd66-a397-45c8-920f-4543657d5ebb', N'test5', 0, CAST(0x0000A13900FCFAF6 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'58c03883-d2d7-46d1-8b08-47b28259dca8', N'test2', 0, CAST(0x0000A13900FAD6C4 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'805fb475-aba5-49f6-a881-56160543f246', N'test3', 0, CAST(0x0000A13900FAE7A1 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'09e92872-5698-431a-84ad-641c20dfb39d', N'host', 0, CAST(0x0000A147006D704B AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'655cfa2b-c96d-451a-a331-9a4df2261b19', N'test6', 0, CAST(0x0000A13900FD0BF7 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'a278a595-00db-4805-bd2a-9ca4627c3f57', N'test7', 0, CAST(0x0000A13900FD1785 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'9ef84a54-c0ba-4bdd-bacc-ecc270d3e6c4', N'admin', 0, CAST(0x0000A14400EBE43B AS DateTime))
/****** Object:  Table [dbo].[Roles]    Script Date: 01/15/2013 16:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'41b053bf-934f-4cac-bdb2-2d9cd31b4091', N'Anonymous', NULL)
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'53cf3c6f-5e38-4dc3-95af-5dc52cc97b05', N'Admin', NULL)
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'2b9f8688-7d01-41f2-9743-a0e9533d5ada', N'Registration', NULL)
/****** Object:  Table [dbo].[UsersOpenAuthAccounts]    Script Date: 01/15/2013 16:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersOpenAuthAccounts](
	[ApplicationName] [nvarchar](128) NOT NULL,
	[ProviderName] [nvarchar](128) NOT NULL,
	[ProviderUserId] [nvarchar](128) NOT NULL,
	[ProviderUserName] [nvarchar](max) NOT NULL,
	[MembershipUserName] [nvarchar](128) NOT NULL,
	[LastUsedUtc] [datetime] NULL,
 CONSTRAINT [PK_dbo.UsersOpenAuthAccounts] PRIMARY KEY CLUSTERED 
(
	[ApplicationName] ASC,
	[ProviderName] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ApplicationName_MembershipUserName] ON [dbo].[UsersOpenAuthAccounts] 
(
	[ApplicationName] ASC,
	[MembershipUserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 01/15/2013 16:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'b5c34054-b656-44b1-af12-4447dcaf79b9', N'2b9f8688-7d01-41f2-9743-a0e9533d5ada')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'58c03883-d2d7-46d1-8b08-47b28259dca8', N'2b9f8688-7d01-41f2-9743-a0e9533d5ada')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'805fb475-aba5-49f6-a881-56160543f246', N'2b9f8688-7d01-41f2-9743-a0e9533d5ada')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'09e92872-5698-431a-84ad-641c20dfb39d', N'53cf3c6f-5e38-4dc3-95af-5dc52cc97b05')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'9ef84a54-c0ba-4bdd-bacc-ecc270d3e6c4', N'53cf3c6f-5e38-4dc3-95af-5dc52cc97b05')
/****** Object:  Table [dbo].[Profiles]    Script Date: 01/15/2013 16:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [nvarchar](4000) NOT NULL,
	[PropertyValueStrings] [nvarchar](4000) NOT NULL,
	[PropertyValueBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 01/15/2013 16:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowsStart] [datetime] NOT NULL,
	[Comment] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'e07f0ef4-402a-478c-8444-19b472cae13e', N'BNxNRTYIybQ7sNjf2Tz7PQjLnAtSx2iV1/Q8nCwHHCM=', 1, N'9sw0s/9zLLlUAfXK8U7qMg==', N'tai@vo.com', NULL, NULL, 1, 0, CAST(0x0000A13900FD20F6 AS DateTime), CAST(0x0000A13900FD20F6 AS DateTime), CAST(0x0000A13900FD20F6 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'0c161b1f-f979-410c-832a-3d4ba484f932', N'ZVpJMdb3YZXbLkS2adsMGyD8WXsHkfpvpL0LvH5dHIY=', 1, N'wLhZfwMoKZM7zgP1XaSZsw==', N'tai@vo.com1', NULL, NULL, 1, 0, CAST(0x0000A13900FD2E2F AS DateTime), CAST(0x0000A13A005862AF AS DateTime), CAST(0x0000A13900FD2E2F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'129fa617-929f-4262-a152-435d5d05c550', N'e9l+z65S47PsWqoStd3JEbqCXbGVp6tQRqOVl+7PPn8=', 1, N'aMRv3qQ6mxInNqeEY7iRuA==', N'test@test.com', NULL, NULL, 1, 0, CAST(0x0000A13900FAF950 AS DateTime), CAST(0x0000A13900FAF950 AS DateTime), CAST(0x0000A13900FAF950 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'b5c34054-b656-44b1-af12-4447dcaf79b9', N'XDNpEk7NqOALNO04WdtT626Uepr96RO1NGqTUA5nXvY=', 1, N'RITTrBB+VANbbBA0X6WNVQ==', N'test@test.com', NULL, NULL, 1, 0, CAST(0x0000A13900FAC92B AS DateTime), CAST(0x0000A14400F503DC AS DateTime), CAST(0x0000A13900FAC92B AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'8b5bdd66-a397-45c8-920f-4543657d5ebb', N'MCTUpMSqs/6fYkrxiC1wMFE/OG7JrvLtK7scIloqKlw=', 1, N'j1Qa8RvvxRX+BQpCMBpVjg==', N'tai@vo.com', NULL, NULL, 1, 0, CAST(0x0000A13900FCFAE9 AS DateTime), CAST(0x0000A13900FCFAE9 AS DateTime), CAST(0x0000A13900FCFAE9 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'58c03883-d2d7-46d1-8b08-47b28259dca8', N'g9kBUyDrqQm1ug6xiNpwAd+YzqafCWMKfa8cX7a4uZ0=', 1, N'NOAoxWdanAmCSqEa9I2SqA==', N'test@test.com', NULL, NULL, 1, 0, CAST(0x0000A13900FAD6B9 AS DateTime), CAST(0x0000A13900FAD6B9 AS DateTime), CAST(0x0000A13900FAD6B9 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'805fb475-aba5-49f6-a881-56160543f246', N'VW3R3YbqtF+N5VQb5ZOOLmDQggvsR1A8ECIxTru4Mug=', 1, N'/1c58+cHfa/iIBzqCPKzUA==', N'test@test.com', NULL, NULL, 1, 0, CAST(0x0000A13900FAE797 AS DateTime), CAST(0x0000A13900FAE797 AS DateTime), CAST(0x0000A13900FAE797 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'09e92872-5698-431a-84ad-641c20dfb39d', N'P/CwD875eDXKQV2Bv+vkyj0ENJZNB1cYdT3gNcgrXUg=', 1, N'BwmfeB0hPaHS9+tIlYClSg==', N'host@admin.test', NULL, NULL, 1, 0, CAST(0x0000A13900F74D65 AS DateTime), CAST(0x0000A147006D704B AS DateTime), CAST(0x0000A13900F74D65 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'655cfa2b-c96d-451a-a331-9a4df2261b19', N'Tc+imBRkr8gKMb6ou8kNW+jVK0C3MnRJT/AVep7KiVw=', 1, N'xGknozEJVOvKPcEoO/oAmg==', N'tai@vo.com', NULL, NULL, 1, 0, CAST(0x0000A13900FD0BEC AS DateTime), CAST(0x0000A13900FD0BEC AS DateTime), CAST(0x0000A13900FD0BEC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'a278a595-00db-4805-bd2a-9ca4627c3f57', N'zoZUh1g8qipQMpA2iX7JabZlKh1tQYinte454wUL97Y=', 1, N'6U1hsGrMlEpp/zivGgGlWw==', N'tai@vo.com', NULL, NULL, 1, 0, CAST(0x0000A13900FD1778 AS DateTime), CAST(0x0000A13900FD1778 AS DateTime), CAST(0x0000A13900FD1778 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'9ef84a54-c0ba-4bdd-bacc-ecc270d3e6c4', N'RzLFQqUu0DMHaBBc1/DF06xofKF3xH1X/xklcKSVdUs=', 1, N'ETk27yLfxz/xGw8/MPOpyw==', N'vothanhtai86@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A13500444706 AS DateTime), CAST(0x0000A14400EBE43B AS DateTime), CAST(0x0000A13500444706 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  ForeignKey [UserApplication]    Script Date: 01/15/2013 16:38:48 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [UserApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [UserApplication]
GO
/****** Object:  ForeignKey [RoleApplication]    Script Date: 01/15/2013 16:38:48 ******/
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [RoleApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [RoleApplication]
GO
/****** Object:  ForeignKey [FK_dbo.UsersOpenAuthAccounts_dbo.UsersOpenAuthData_ApplicationName_MembershipUserName]    Script Date: 01/15/2013 16:38:48 ******/
ALTER TABLE [dbo].[UsersOpenAuthAccounts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UsersOpenAuthAccounts_dbo.UsersOpenAuthData_ApplicationName_MembershipUserName] FOREIGN KEY([ApplicationName], [MembershipUserName])
REFERENCES [dbo].[UsersOpenAuthData] ([ApplicationName], [MembershipUserName])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersOpenAuthAccounts] CHECK CONSTRAINT [FK_dbo.UsersOpenAuthAccounts_dbo.UsersOpenAuthData_ApplicationName_MembershipUserName]
GO
/****** Object:  ForeignKey [UsersInRoleRole]    Script Date: 01/15/2013 16:38:48 ******/
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleRole]
GO
/****** Object:  ForeignKey [UsersInRoleUser]    Script Date: 01/15/2013 16:38:48 ******/
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleUser]
GO
/****** Object:  ForeignKey [UserProfile]    Script Date: 01/15/2013 16:38:48 ******/
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [UserProfile]
GO
/****** Object:  ForeignKey [MembershipApplication]    Script Date: 01/15/2013 16:38:48 ******/
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipApplication]
GO
/****** Object:  ForeignKey [MembershipUser]    Script Date: 01/15/2013 16:38:48 ******/
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipUser]
GO
