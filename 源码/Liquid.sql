USE [master]
GO
/****** Object:  Database [Liquid]    Script Date: 10/07/2020 19:10:10 ******/
CREATE DATABASE [Liquid]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Liquid', FILENAME = N'E:\Liquid.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Liquid_log', FILENAME = N'E:\Liquid_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Liquid] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Liquid].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Liquid] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Liquid] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Liquid] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Liquid] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Liquid] SET ARITHABORT OFF 
GO
ALTER DATABASE [Liquid] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Liquid] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Liquid] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Liquid] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Liquid] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Liquid] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Liquid] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Liquid] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Liquid] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Liquid] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Liquid] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Liquid] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Liquid] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Liquid] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Liquid] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Liquid] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Liquid] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Liquid] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Liquid] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Liquid] SET  MULTI_USER 
GO
ALTER DATABASE [Liquid] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Liquid] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Liquid] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Liquid] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Liquid]
GO
/****** Object:  Table [dbo].[Command]    Script Date: 10/07/2020 19:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Command](
	[CommandID] [int] IDENTITY(1,1) NOT NULL,
	[LogID] [int] NULL,
	[CommandInfo] [nvarchar](80) NULL,
	[CommandTime] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_COMMAND] PRIMARY KEY CLUSTERED 
(
	[CommandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Follow]    Script Date: 10/07/2020 19:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follow](
	[FollowID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[FollowUID] [int] NULL,
 CONSTRAINT [PK_FOLLOW] PRIMARY KEY CLUSTERED 
(
	[FollowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Forward]    Script Date: 10/07/2020 19:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forward](
	[ForwardID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[LogID] [int] NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_FORWARD] PRIMARY KEY CLUSTERED 
(
	[ForwardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Like]    Script Date: 10/07/2020 19:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[LikeID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[LogID] [int] NULL,
 CONSTRAINT [PK_LIKE] PRIMARY KEY CLUSTERED 
(
	[LikeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log]    Script Date: 10/07/2020 19:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log](
	[UserID] [int] NULL,
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[LogInfo] [nvarchar](80) NULL,
	[LogPic] [varchar](20) NULL,
	[Vlog] [varchar](20) NULL,
	[Command] [nvarchar](80) NULL,
	[Tag] [nvarchar](20) NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_LOG] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Messsage]    Script Date: 10/07/2020 19:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messsage](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[SendID] [int] NULL,
	[MessageInfo] [nvarchar](80) NULL,
	[MessgaeTime] [datetime] NULL,
 CONSTRAINT [PK_MESSSAGE] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 10/07/2020 19:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserNname] [nvarchar](20) NULL,
	[address] [nvarchar](40) NULL,
	[UserInfo] [nvarchar](80) NULL,
	[Email] [varchar](20) NULL,
	[Pwd] [varchar](20) NULL,
	[Icon] [varchar](20) NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Command] ON 

INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (1, 1, N'天气真的好', CAST(0x0000ABF400B58C90 AS DateTime), 2)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (2, 3, N'下次叫我一起', CAST(0x0000ABF400DEBF70 AS DateTime), 1)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (3, 4, N'为啥夹瓶盖', CAST(0x0000ABF400EF3A30 AS DateTime), 3)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (4, 4, N'好臀', CAST(0x0000ABF400EF8080 AS DateTime), 4)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (5, 4, N'牛笔', CAST(0x0000ABF400EFC6D0 AS DateTime), 5)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (6, 6, N'去哪里吃', CAST(0x0000ABF400F0E010 AS DateTime), 7)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (7, 8, N'我也去呀', CAST(0x0000ABF4010DB6E0 AS DateTime), 8)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (8, 11, N'吃了点带便', CAST(0x0000ABF40118B360 AS DateTime), 5)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (9, 12, N'那吃我吗', CAST(0x0000ABF40118F9B0 AS DateTime), 5)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (10, 15, N'我也想', CAST(0x0000ABF4013284C0 AS DateTime), 8)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (11, 17, N'本来就胖嗷', CAST(0x0000ABF401404060 AS DateTime), 5)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (12, 18, N'我帮你做', CAST(0x0000ABF40149DD50 AS DateTime), 1)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (13, 20, N'安', CAST(0x0000ABF401563960 AS DateTime), 5)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (14, 21, N'晚安', CAST(0x0000ABF40163AEB0 AS DateTime), 5)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (15, 22, N'晚安', CAST(0x0000ABF40163F500 AS DateTime), 5)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (16, 23, N'晚安', CAST(0x0000ABF401643B50 AS DateTime), 5)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (17, 24, N'晚安', CAST(0x0000ABF4016481A0 AS DateTime), 5)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (18, 25, N'晚安', CAST(0x0000ABF40164C7F0 AS DateTime), 5)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (19, 26, N'晚安', CAST(0x0000ABF401650E40 AS DateTime), 5)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (20, 27, N'晚安', CAST(0x0000ABF401655490 AS DateTime), 5)
INSERT [dbo].[Command] ([CommandID], [LogID], [CommandInfo], [CommandTime], [UserID]) VALUES (21, 28, N'我也', CAST(0x0000ABF500083D60 AS DateTime), 10)
SET IDENTITY_INSERT [dbo].[Command] OFF
SET IDENTITY_INSERT [dbo].[Follow] ON 

INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (1, 1, 2)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (3, 1, 3)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (4, 1, 4)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (5, 1, 5)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (6, 1, 6)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (7, 1, 7)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (8, 1, 8)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (9, 1, 9)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (10, 1, 10)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (11, 2, 1)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (12, 2, 3)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (13, 2, 4)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (14, 2, 5)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (15, 2, 6)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (16, 2, 7)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (17, 2, 8)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (18, 2, 9)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (19, 2, 10)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (20, 3, 1)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (21, 3, 2)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (22, 3, 4)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (23, 3, 5)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (24, 3, 6)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (25, 3, 7)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (26, 3, 8)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (27, 3, 9)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (28, 3, 10)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (29, 4, 1)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (30, 4, 2)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (31, 4, 3)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (32, 4, 5)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (33, 4, 6)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (34, 4, 7)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (35, 4, 8)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (36, 4, 9)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (37, 4, 10)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (38, 5, 1)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (39, 5, 2)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (40, 5, 3)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (41, 5, 4)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (42, 5, 6)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (43, 5, 7)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (44, 5, 8)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (46, 5, 9)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (47, 5, 10)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (48, 6, 1)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (49, 6, 2)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (50, 6, 3)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (51, 6, 4)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (52, 6, 5)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (53, 6, 10)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (54, 6, 7)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (55, 6, 8)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (56, 6, 9)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (57, 7, 1)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (58, 7, 2)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (59, 7, 3)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (60, 7, 4)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (61, 7, 5)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (62, 7, 6)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (63, 7, 8)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (64, 7, 9)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (65, 7, 10)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (66, 8, 1)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (67, 8, 2)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (68, 8, 3)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (69, 8, 4)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (70, 8, 5)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (71, 8, 6)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (72, 8, 7)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (73, 8, 9)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (74, 8, 10)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (75, 9, 1)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (76, 9, 2)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (77, 9, 3)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (78, 9, 4)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (79, 9, 5)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (80, 9, 6)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (81, 9, 7)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (82, 9, 8)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (83, 9, 10)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (84, 10, 1)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (85, 10, 2)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (86, 10, 3)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (87, 10, 4)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (88, 10, 5)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (89, 10, 6)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (90, 10, 7)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (91, 10, 8)
INSERT [dbo].[Follow] ([FollowID], [UserID], [FollowUID]) VALUES (92, 10, 9)
SET IDENTITY_INSERT [dbo].[Follow] OFF
SET IDENTITY_INSERT [dbo].[Forward] ON 

INSERT [dbo].[Forward] ([ForwardID], [UserID], [LogID], [Time]) VALUES (1, 1, 10, CAST(0x0000ABF401285B30 AS DateTime))
INSERT [dbo].[Forward] ([ForwardID], [UserID], [LogID], [Time]) VALUES (2, 2, 9, CAST(0x0000ABF4012741F0 AS DateTime))
INSERT [dbo].[Forward] ([ForwardID], [UserID], [LogID], [Time]) VALUES (3, 3, 11, CAST(0x0000ABF401198650 AS DateTime))
INSERT [dbo].[Forward] ([ForwardID], [UserID], [LogID], [Time]) VALUES (4, 4, 15, CAST(0x0000ABF40134FD90 AS DateTime))
INSERT [dbo].[Forward] ([ForwardID], [UserID], [LogID], [Time]) VALUES (5, 5, 16, CAST(0x0000ABF4013E9A80 AS DateTime))
INSERT [dbo].[Forward] ([ForwardID], [UserID], [LogID], [Time]) VALUES (6, 7, 17, CAST(0x0000ABF40142B930 AS DateTime))
INSERT [dbo].[Forward] ([ForwardID], [UserID], [LogID], [Time]) VALUES (7, 8, 20, CAST(0x0000ABF4015752A0 AS DateTime))
INSERT [dbo].[Forward] ([ForwardID], [UserID], [LogID], [Time]) VALUES (8, 9, 30, CAST(0x0000ABF5008116E0 AS DateTime))
INSERT [dbo].[Forward] ([ForwardID], [UserID], [LogID], [Time]) VALUES (9, 10, 31, CAST(0x0000ABF500815D30 AS DateTime))
INSERT [dbo].[Forward] ([ForwardID], [UserID], [LogID], [Time]) VALUES (10, 6, 20, CAST(0x0000ABF40158B230 AS DateTime))
SET IDENTITY_INSERT [dbo].[Forward] OFF
SET IDENTITY_INSERT [dbo].[Like] ON 

INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (1, 1, 2)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (2, 1, 3)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (3, 1, 4)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (4, 1, 5)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (5, 1, 6)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (6, 1, 20)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (7, 1, 25)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (8, 1, 26)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (9, 1, 30)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (10, 1, 31)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (11, 1, 32)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (12, 2, 1)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (13, 2, 2)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (14, 2, 3)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (15, 2, 4)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (16, 2, 5)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (17, 2, 7)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (18, 2, 8)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (19, 2, 9)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (20, 2, 10)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (21, 2, 11)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (22, 2, 15)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (23, 2, 17)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (24, 2, 18)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (25, 2, 20)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (26, 2, 26)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (27, 2, 27)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (28, 2, 28)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (29, 3, 1)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (30, 3, 6)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (31, 3, 7)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (32, 3, 8)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (33, 3, 12)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (34, 3, 13)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (35, 3, 14)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (36, 3, 15)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (37, 3, 16)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (38, 3, 17)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (39, 3, 19)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (40, 3, 21)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (41, 3, 22)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (42, 3, 23)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (43, 3, 24)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (44, 3, 27)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (45, 3, 28)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (46, 3, 30)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (47, 4, 2)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (48, 4, 6)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (49, 4, 7)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (50, 4, 9)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (51, 4, 10)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (52, 4, 11)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (53, 4, 12)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (54, 4, 13)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (55, 4, 15)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (56, 4, 30)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (57, 5, 1)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (58, 5, 3)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (59, 5, 4)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (60, 5, 7)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (61, 5, 11)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (62, 5, 15)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (63, 5, 27)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (64, 5, 28)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (65, 5, 29)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (66, 5, 30)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (67, 5, 31)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (68, 5, 32)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (69, 5, 33)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (70, 5, 34)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (71, 6, 20)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (72, 6, 21)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (73, 6, 22)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (74, 6, 23)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (75, 6, 24)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (76, 6, 25)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (77, 7, 13)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (78, 7, 30)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (79, 7, 32)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (80, 7, 33)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (81, 7, 34)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (82, 8, 6)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (83, 8, 11)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (84, 8, 15)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (85, 8, 26)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (86, 8, 34)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (87, 9, 1)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (88, 9, 3)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (89, 9, 5)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (90, 9, 7)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (91, 9, 9)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (92, 9, 11)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (93, 9, 12)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (94, 9, 15)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (95, 9, 16)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (96, 9, 18)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (97, 9, 19)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (98, 9, 22)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (99, 9, 24)
GO
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (100, 9, 29)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (101, 9, 30)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (102, 10, 1)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (103, 10, 10)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (104, 10, 15)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (105, 10, 20)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (106, 10, 25)
INSERT [dbo].[Like] ([LikeID], [UserID], [LogID]) VALUES (107, 10, 30)
SET IDENTITY_INSERT [dbo].[Like] OFF
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (1, 1, N'今天天气好好', N'3.jpg', NULL, NULL, N'天气', CAST(0x0000ABF400B54640 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (2, 2, N'今天天气真好啊', N'4.jpg', NULL, NULL, N'天气', CAST(0x0000ABF400D63BC0 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (2, 3, N'我直接出去骑自行车', N'2.jpg', NULL, NULL, N'运动', CAST(0x0000ABF400DE7920 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (1, 4, N'看我的屁股', N'1.jpg', NULL, NULL, N'运动', CAST(0x0000ABF400EEF3E0 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (3, 5, N'不知道干什么', N'5.jpg', NULL, NULL, N'心情', CAST(0x0000ABF400F05370 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (3, 6, N'要不去吃饭吧', N'7.jpg', NULL, NULL, N'美食', CAST(0x0000ABF400F099C0 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (2, 7, N'下雨了我傻了', N'40.jpg', NULL, NULL, N'天气', CAST(0x0000ABF400FA36B0 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (1, 8, N'去吃食堂了', N'37.jpg', NULL, NULL, N'美食', CAST(0x0000ABF4010D7090 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (4, 9, N'吃饭了', N'34.jpg', NULL, NULL, N'美食', CAST(0x0000ABF40116C730 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (5, 10, N'嘿嘿', N'33.jpg', NULL, NULL, N'心情', CAST(0x0000ABF40117E070 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (6, 11, N'你们晚饭吃什么', N'19.jpg', NULL, NULL, N'美食', CAST(0x0000ABF401186D10 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (7, 12, N'今天不吃晚饭了', N'18.jpg', NULL, NULL, N'美食', CAST(0x0000ABF40118B360 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (8, 13, N'看完了战狼2', N'13.jpg', NULL, NULL, N'电影', CAST(0x0000ABF40121C3B0 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (9, 14, N'下大雨了不想出门', N'20.jpg', NULL, NULL, N'天气', CAST(0x0000ABF401232340 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (10, 15, N'想吃烧烤', N'16.jpg', NULL, NULL, N'美食', CAST(0x0000ABF401323E70 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (1, 16, N'？？', N'29.jpg', NULL, NULL, N'心情', CAST(0x0000ABF4013BDB60 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (2, 17, N'我原来这么胖了吗', N'9.jpg', NULL, NULL, N'心情', CAST(0x0000ABF4013FFA10 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (3, 18, N'作业确实有点难嗷', N'8.jpg', NULL, NULL, N'心情', CAST(0x0000ABF401499700 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (4, 19, N'是不是该吃夜宵了', N'17.jpg', NULL, NULL, N'美食', CAST(0x0000ABF401549380 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (4, 20, N'还是睡觉吧', N'31.jpg', NULL, NULL, N'心情', CAST(0x0000ABF40155F310 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (3, 21, N'晚安', N'37.jpg', NULL, NULL, N'心情', CAST(0x0000ABF401624F20 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (5, 22, N'晚安', N'12.jpg', NULL, NULL, N'心情', CAST(0x0000ABF40163AEB0 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (6, 23, N'晚安', N'43.jpg', NULL, NULL, N'心情', CAST(0x0000ABF40163F500 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (7, 24, N'晚安', N'14.jpg', NULL, NULL, N'心情', CAST(0x0000ABF401643B50 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (8, 25, N'晚安', N'23.jpg', NULL, NULL, N'心情', CAST(0x0000ABF4016481A0 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (9, 26, N'晚安', N'35.jpg', NULL, NULL, N'心情', CAST(0x0000ABF40164C7F0 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (10, 27, N'晚安', N'39.jpg', NULL, NULL, N'心情', CAST(0x0000ABF401650E40 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (4, 28, N'有人还没睡吗', N'32.jpg', NULL, NULL, N'心情', CAST(0x0000ABF500057E40 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (5, 29, N'早！', N'34.jpg', NULL, NULL, N'心情', CAST(0x0000ABF50057E400 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (6, 30, N'早上好啊', N'24.jpg', NULL, NULL, N'心情', CAST(0x0000ABF50078D980 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (7, 31, N'早', N'22.jpg', NULL, NULL, N'心情', CAST(0x0000ABF5007B98A0 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (8, 32, N'都起这么早吗', N'25.jpg', NULL, NULL, N'心情', CAST(0x0000ABF5007E57C0 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (9, 33, N'别叫我起床了', N'36.jpg', NULL, NULL, N'心情', CAST(0x0000ABF50083D600 AS DateTime))
INSERT [dbo].[Log] ([UserID], [LogID], [LogInfo], [LogPic], [Vlog], [Command], [Tag], [Time]) VALUES (10, 34, N'一大早就叫了警察', N'11.jpg', NULL, NULL, N'心情', CAST(0x0000ABF5009C8E20 AS DateTime))
SET IDENTITY_INSERT [dbo].[Log] OFF
SET IDENTITY_INSERT [dbo].[Messsage] ON 

INSERT [dbo].[Messsage] ([MessageID], [UserID], [SendID], [MessageInfo], [MessgaeTime]) VALUES (1, 1, 2, N'出来吃饭吗？', CAST(0x0000ABF400B6EC20 AS DateTime))
INSERT [dbo].[Messsage] ([MessageID], [UserID], [SendID], [MessageInfo], [MessgaeTime]) VALUES (2, 2, 1, N'没钱不来', CAST(0x0000ABF400B80560 AS DateTime))
INSERT [dbo].[Messsage] ([MessageID], [UserID], [SendID], [MessageInfo], [MessgaeTime]) VALUES (3, 3, 1, N'吃火锅吗？', CAST(0x0000ABF50083D600 AS DateTime))
INSERT [dbo].[Messsage] ([MessageID], [UserID], [SendID], [MessageInfo], [MessgaeTime]) VALUES (4, 1, 3, N'8点吃火锅？', CAST(0x0000ABF500853590 AS DateTime))
INSERT [dbo].[Messsage] ([MessageID], [UserID], [SendID], [MessageInfo], [MessgaeTime]) VALUES (5, 1, 4, N'我想吃烧烤了', CAST(0x0000ABF5008462A0 AS DateTime))
INSERT [dbo].[Messsage] ([MessageID], [UserID], [SendID], [MessageInfo], [MessgaeTime]) VALUES (6, 4, 1, N'我不想出门', CAST(0x0000ABF500869520 AS DateTime))
INSERT [dbo].[Messsage] ([MessageID], [UserID], [SendID], [MessageInfo], [MessgaeTime]) VALUES (7, 4, 5, N'哥哥一起吃早饭吗', CAST(0x0000ABF500853590 AS DateTime))
INSERT [dbo].[Messsage] ([MessageID], [UserID], [SendID], [MessageInfo], [MessgaeTime]) VALUES (8, 5, 4, N'不好意思昨天忘记回了宝贝', CAST(0x0000ABF600AD08E0 AS DateTime))
INSERT [dbo].[Messsage] ([MessageID], [UserID], [SendID], [MessageInfo], [MessgaeTime]) VALUES (9, 7, 5, N'宝贝晚上想吃什么？', CAST(0x0000ABF6010D2A40 AS DateTime))
INSERT [dbo].[Messsage] ([MessageID], [UserID], [SendID], [MessageInfo], [MessgaeTime]) VALUES (10, 5, 7, N'今天晚上我得加班你先吃吧', CAST(0x0000ABF6010DB6E0 AS DateTime))
INSERT [dbo].[Messsage] ([MessageID], [UserID], [SendID], [MessageInfo], [MessgaeTime]) VALUES (11, 5, 8, N'晚上去看电影吗？', CAST(0x0000ABF6010DFD30 AS DateTime))
INSERT [dbo].[Messsage] ([MessageID], [UserID], [SendID], [MessageInfo], [MessgaeTime]) VALUES (12, 8, 5, N'去的哥哥，我还想吃日料', CAST(0x0000ABF6010E4380 AS DateTime))
INSERT [dbo].[Messsage] ([MessageID], [UserID], [SendID], [MessageInfo], [MessgaeTime]) VALUES (13, 9, 5, N'哥哥怎么两天不来找我啦', CAST(0x0000ABF601365D20 AS DateTime))
INSERT [dbo].[Messsage] ([MessageID], [UserID], [SendID], [MessageInfo], [MessgaeTime]) VALUES (14, 5, 9, N'哥哥在出差回来就找你', CAST(0x0000ABF6013E9A80 AS DateTime))
INSERT [dbo].[Messsage] ([MessageID], [UserID], [SendID], [MessageInfo], [MessgaeTime]) VALUES (15, 10, 5, N'在干嘛?', CAST(0x0000ABF700AA49C0 AS DateTime))
SET IDENTITY_INSERT [dbo].[Messsage] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserNname], [address], [UserInfo], [Email], [Pwd], [Icon]) VALUES (1, N'金蝉脱壳', N'浙江杭州', N'这个人太懒了', N'jctq@qq.com', N'jctq1234', N'1.jpg')
INSERT [dbo].[User] ([UserID], [UserNname], [address], [UserInfo], [Email], [Pwd], [Icon]) VALUES (2, N'百里挑一', N'浙江绍兴', N'这个人太懒了', N'blty@qq.com', N'blty1234', N'2.jpg')
INSERT [dbo].[User] ([UserID], [UserNname], [address], [UserInfo], [Email], [Pwd], [Icon]) VALUES (3, N'五颜六色', N'浙江温州', N'这个人太懒了', N'wyls@qq.com', N'wyls1234', N'3.jpg')
INSERT [dbo].[User] ([UserID], [UserNname], [address], [UserInfo], [Email], [Pwd], [Icon]) VALUES (4, N'众志成城', N'浙江台州', N'这个人太懒了', N'zzcc@qq.com', N'zzcc1234', N'4.jpg')
INSERT [dbo].[User] ([UserID], [UserNname], [address], [UserInfo], [Email], [Pwd], [Icon]) VALUES (5, N'兵荒马乱', N'福建厦门', N'这个人太懒了', N'bhml@qq.com', N'bhml1234', N'5.jpg')
INSERT [dbo].[User] ([UserID], [UserNname], [address], [UserInfo], [Email], [Pwd], [Icon]) VALUES (6, N'五光十色', N'山东青岛', N'这个人太懒了', N'wgss@qq.com', N'wgss1234', N'6.jpg')
INSERT [dbo].[User] ([UserID], [UserNname], [address], [UserInfo], [Email], [Pwd], [Icon]) VALUES (7, N'七上八下', N'浙江宁波', N'这个人太懒了', N'qsbx@qq.c', N'qsbx1234', N'7.jpg')
INSERT [dbo].[User] ([UserID], [UserNname], [address], [UserInfo], [Email], [Pwd], [Icon]) VALUES (8, N'八八四八', N'江苏南京', N'这个人太懒了', N'bbsb@qq.c', N'bbsb1234', N'8.jpg')
INSERT [dbo].[User] ([UserID], [UserNname], [address], [UserInfo], [Email], [Pwd], [Icon]) VALUES (9, N'酒香飘十里', N'广东深圳', N'这个人太懒了', N'jxps@qq.com', N'jxpsl1234', N'9.jpg')
INSERT [dbo].[User] ([UserID], [UserNname], [address], [UserInfo], [Email], [Pwd], [Icon]) VALUES (10, N'十全十美', N'湖北武汉', N'这个人太懒了', N'sqsm@qq.com', N'sqsm1234', N'10.jpg')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Command]  WITH CHECK ADD  CONSTRAINT [FK_COMMAND_REFERENCE_LOG] FOREIGN KEY([LogID])
REFERENCES [dbo].[Log] ([LogID])
GO
ALTER TABLE [dbo].[Command] CHECK CONSTRAINT [FK_COMMAND_REFERENCE_LOG]
GO
ALTER TABLE [dbo].[Command]  WITH CHECK ADD  CONSTRAINT [FK_COMMAND_REFERENCE_USER] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Command] CHECK CONSTRAINT [FK_COMMAND_REFERENCE_USER]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK_FOLLOW_REFERENCE_LOG] FOREIGN KEY([FollowUID])
REFERENCES [dbo].[Log] ([LogID])
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK_FOLLOW_REFERENCE_LOG]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK_FOLLOW_REFERENCE_USER] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK_FOLLOW_REFERENCE_USER]
GO
ALTER TABLE [dbo].[Forward]  WITH CHECK ADD  CONSTRAINT [FK_FORWARD_REFERENCE_LOG] FOREIGN KEY([LogID])
REFERENCES [dbo].[Log] ([LogID])
GO
ALTER TABLE [dbo].[Forward] CHECK CONSTRAINT [FK_FORWARD_REFERENCE_LOG]
GO
ALTER TABLE [dbo].[Forward]  WITH CHECK ADD  CONSTRAINT [FK_FORWARD_REFERENCE_USER] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Forward] CHECK CONSTRAINT [FK_FORWARD_REFERENCE_USER]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_LIKE_REFERENCE_LOG] FOREIGN KEY([LogID])
REFERENCES [dbo].[Log] ([LogID])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_LIKE_REFERENCE_LOG]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_LIKE_REFERENCE_USER] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_LIKE_REFERENCE_USER]
GO
ALTER TABLE [dbo].[Messsage]  WITH CHECK ADD  CONSTRAINT [FK_MESSSAGE_REFERENCE_USER] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Messsage] CHECK CONSTRAINT [FK_MESSSAGE_REFERENCE_USER]
GO
USE [master]
GO
ALTER DATABASE [Liquid] SET  READ_WRITE 
GO
