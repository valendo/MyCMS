USE [master]
GO
/****** Object:  Database [MyCMS]    Script Date: 12/28/2012 17:05:11 ******/
CREATE DATABASE [MyCMS] ON  PRIMARY 
( NAME = N'MyCMS', FILENAME = N'D:\Web\cms\My CMS\Database\MyCMS.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyCMS_log', FILENAME = N'D:\Web\cms\My CMS\Database\MyCMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[UsersOpenAuthData]    Script Date: 12/28/2012 17:05:13 ******/
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
/****** Object:  Table [dbo].[Applications]    Script Date: 12/28/2012 17:05:13 ******/
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
/****** Object:  Table [dbo].[Pages]    Script Date: 12/28/2012 17:05:13 ******/
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
/****** Object:  Table [dbo].[PageModules]    Script Date: 12/28/2012 17:05:13 ******/
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
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (15, 1, 14, N'ContentPane', 3, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (16, 1, 15, N'ContentPane', 1, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (18, 1, 17, N'ContentPane', 0, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (20, 1, 21, N'LeftPane', 0, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (22, 1, 23, N'LeftPane', 2, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (24, 4, 25, N'LeftPane', 0, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (25, 4, 26, N'ContentPane', 1, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (26, 4, 27, N'ContentPane', 0, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (27, 1, 28, N'LeftPane', 1, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (28, 4, 29, N'LeftPane', 3, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (29, 1, 30, N'ContentPane', 5, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (30, 1, 31, N'ContentPane', 2, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (31, 1, 32, N'LeftPane', 3, N'Default', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (32, 1, 33, N'LeftPane', 4, N'22233', 0)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (33, 1, 34, N'LeftPane', 5, N'hello', 1)
INSERT [dbo].[PageModules] ([PageModuleId], [PageId], [ModuleId], [PaneName], [ModuleOrder], [ModuleTitle], [DisplayTitle]) VALUES (34, 1, 35, N'ContentPane', 4, N'123', 1)
SET IDENTITY_INSERT [dbo].[PageModules] OFF
/****** Object:  Table [dbo].[Modules]    Script Date: 12/28/2012 17:05:13 ******/
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
SET IDENTITY_INSERT [dbo].[Modules] OFF
/****** Object:  Table [dbo].[ModuleDefinitions]    Script Date: 12/28/2012 17:05:13 ******/
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
/****** Object:  Table [dbo].[Texts]    Script Date: 12/28/2012 17:05:13 ******/
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
SET IDENTITY_INSERT [dbo].[Texts] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 12/28/2012 17:05:13 ******/
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
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'9ef84a54-c0ba-4bdd-bacc-ecc270d3e6c4', N'admin', 0, CAST(0x0000A1350045B0AC AS DateTime))
/****** Object:  Table [dbo].[Roles]    Script Date: 12/28/2012 17:05:13 ******/
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
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'd91fc719-8e65-483d-8172-1d18c75534f0', N'admin', NULL)
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'6b79b4c6-5180-43df-9816-8de1b9199723', N'host', NULL)
/****** Object:  Table [dbo].[UsersOpenAuthAccounts]    Script Date: 12/28/2012 17:05:13 ******/
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
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 12/28/2012 17:05:13 ******/
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
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'9ef84a54-c0ba-4bdd-bacc-ecc270d3e6c4', N'd91fc719-8e65-483d-8172-1d18c75534f0')
/****** Object:  Table [dbo].[Profiles]    Script Date: 12/28/2012 17:05:13 ******/
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
/****** Object:  Table [dbo].[Memberships]    Script Date: 12/28/2012 17:05:13 ******/
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
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'9d6231d6-d8db-4901-9180-6bd613183931', N'9ef84a54-c0ba-4bdd-bacc-ecc270d3e6c4', N'RzLFQqUu0DMHaBBc1/DF06xofKF3xH1X/xklcKSVdUs=', 1, N'ETk27yLfxz/xGw8/MPOpyw==', N'vothanhtai86@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A13500444706 AS DateTime), CAST(0x0000A1350045B0AC AS DateTime), CAST(0x0000A13500444706 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  ForeignKey [UserApplication]    Script Date: 12/28/2012 17:05:13 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [UserApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [UserApplication]
GO
/****** Object:  ForeignKey [RoleApplication]    Script Date: 12/28/2012 17:05:13 ******/
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [RoleApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [RoleApplication]
GO
/****** Object:  ForeignKey [FK_dbo.UsersOpenAuthAccounts_dbo.UsersOpenAuthData_ApplicationName_MembershipUserName]    Script Date: 12/28/2012 17:05:13 ******/
ALTER TABLE [dbo].[UsersOpenAuthAccounts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UsersOpenAuthAccounts_dbo.UsersOpenAuthData_ApplicationName_MembershipUserName] FOREIGN KEY([ApplicationName], [MembershipUserName])
REFERENCES [dbo].[UsersOpenAuthData] ([ApplicationName], [MembershipUserName])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersOpenAuthAccounts] CHECK CONSTRAINT [FK_dbo.UsersOpenAuthAccounts_dbo.UsersOpenAuthData_ApplicationName_MembershipUserName]
GO
/****** Object:  ForeignKey [UsersInRoleRole]    Script Date: 12/28/2012 17:05:13 ******/
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleRole]
GO
/****** Object:  ForeignKey [UsersInRoleUser]    Script Date: 12/28/2012 17:05:13 ******/
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleUser]
GO
/****** Object:  ForeignKey [UserProfile]    Script Date: 12/28/2012 17:05:13 ******/
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [UserProfile]
GO
/****** Object:  ForeignKey [MembershipApplication]    Script Date: 12/28/2012 17:05:13 ******/
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipApplication]
GO
/****** Object:  ForeignKey [MembershipUser]    Script Date: 12/28/2012 17:05:13 ******/
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipUser]
GO
