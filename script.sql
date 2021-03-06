USE [master]
GO
/****** Object:  Database [NatinaolLevelPaper]    Script Date: 20-Jul-18 10:45:20 AM ******/
CREATE DATABASE [NatinaolLevelPaper]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NatinaolLevelPaper', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\NatinaolLevelPaper.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NatinaolLevelPaper_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\NatinaolLevelPaper_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NatinaolLevelPaper] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NatinaolLevelPaper].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NatinaolLevelPaper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET ARITHABORT OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [NatinaolLevelPaper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NatinaolLevelPaper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NatinaolLevelPaper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NatinaolLevelPaper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NatinaolLevelPaper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET RECOVERY FULL 
GO
ALTER DATABASE [NatinaolLevelPaper] SET  MULTI_USER 
GO
ALTER DATABASE [NatinaolLevelPaper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NatinaolLevelPaper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NatinaolLevelPaper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NatinaolLevelPaper] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NatinaolLevelPaper', N'ON'
GO
USE [NatinaolLevelPaper]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 20-Jul-18 10:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Subject] [varchar](max) NULL,
	[Message] [varchar](max) NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollementStatuses]    Script Date: 20-Jul-18 10:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EnrollementStatuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_EnrollementStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 20-Jul-18 10:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnrollmentStatusId] [int] NULL,
	[UserId] [int] NULL,
	[EventId] [int] NULL,
 CONSTRAINT [PK_Enrollments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Events]    Script Date: 20-Jul-18 10:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Image] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Fees] [varchar](50) NULL,
	[Eligibility] [nvarchar](max) NULL,
	[Spearker] [varchar](50) NULL,
	[Topics] [varchar](max) NULL,
	[Prize] [varchar](50) NULL,
	[Email] [nvarchar](60) NULL,
	[TermsAndCondition] [nvarchar](max) NULL,
	[Winner] [int] NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subcribers]    Script Date: 20-Jul-18 10:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subcribers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Subcribers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 20-Jul-18 10:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Age] [int] NULL,
	[Qualification] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[UserTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 20-Jul-18 10:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_UserTypes_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [Name], [Email], [Subject], [Message]) VALUES (1, N'khurram akram', N'khurram.akram39@gmaill.com', N'check', N'asjgdkasgkjdgaksjdasjkdjhas')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
SET IDENTITY_INSERT [dbo].[EnrollementStatuses] ON 

INSERT [dbo].[EnrollementStatuses] ([Id], [Name]) VALUES (1, N'Enroll')
INSERT [dbo].[EnrollementStatuses] ([Id], [Name]) VALUES (2, N'Unenroll')
SET IDENTITY_INSERT [dbo].[EnrollementStatuses] OFF
SET IDENTITY_INSERT [dbo].[Enrollments] ON 

INSERT [dbo].[Enrollments] ([Id], [EnrollmentStatusId], [UserId], [EventId]) VALUES (1, 1, 7, 16)
INSERT [dbo].[Enrollments] ([Id], [EnrollmentStatusId], [UserId], [EventId]) VALUES (2, 1, 7, 16)
INSERT [dbo].[Enrollments] ([Id], [EnrollmentStatusId], [UserId], [EventId]) VALUES (3, 1, 7, 16)
INSERT [dbo].[Enrollments] ([Id], [EnrollmentStatusId], [UserId], [EventId]) VALUES (4, 1, 7, 16)
SET IDENTITY_INSERT [dbo].[Enrollments] OFF
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([Id], [Name], [Image], [Date], [Fees], [Eligibility], [Spearker], [Topics], [Prize], [Email], [TermsAndCondition], [Winner]) VALUES (16, N'khurram akram', N'b4.jpg', N'2018-07-19', N'250', N'nothing', N'asif', N'asp mvc', N'1000', N'khurram.akram39@gmaill.com', N'no', 10)
INSERT [dbo].[Events] ([Id], [Name], [Image], [Date], [Fees], [Eligibility], [Spearker], [Topics], [Prize], [Email], [TermsAndCondition], [Winner]) VALUES (17, N'Php', N'b5.jpg', N'2018-07-27', N'1000', N'nothing', N'asif', N'Php queries', N'123', N'khurram.akram39@gmaill.com', N'no', 7)
SET IDENTITY_INSERT [dbo].[Events] OFF
SET IDENTITY_INSERT [dbo].[Subcribers] ON 

INSERT [dbo].[Subcribers] ([Id], [Email]) VALUES (1, N'khurram.akram39@gmaill.com')
INSERT [dbo].[Subcribers] ([Id], [Email]) VALUES (2, N'abc@gmail.com')
INSERT [dbo].[Subcribers] ([Id], [Email]) VALUES (3, N'admin@gmail.com')
INSERT [dbo].[Subcribers] ([Id], [Email]) VALUES (4, N'abc@gmail.com')
INSERT [dbo].[Subcribers] ([Id], [Email]) VALUES (5, N'abc@gmail.com')
INSERT [dbo].[Subcribers] ([Id], [Email]) VALUES (6, N'abc@gmail.com')
INSERT [dbo].[Subcribers] ([Id], [Email]) VALUES (7, N'abc@gmail.com')
SET IDENTITY_INSERT [dbo].[Subcribers] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Age], [Qualification], [Address], [Phone], [Email], [Password], [UserTypeId]) VALUES (7, N'abc', 12, N'Inter', N'street no#8,mehmoodabad no#4 ,karachi', N'03412802388', N'khurram.akram39@gmaill.com', N'12345', 4)
INSERT [dbo].[Users] ([Id], [Name], [Age], [Qualification], [Address], [Phone], [Email], [Password], [UserTypeId]) VALUES (8, N'admin', 20, N'phd', N'azizabad', N'03412802388', N'admin@gmail.com', N'12345', 3)
INSERT [dbo].[Users] ([Id], [Name], [Age], [Qualification], [Address], [Phone], [Email], [Password], [UserTypeId]) VALUES (9, N'younus', 22, N'inter', N'johar', N'03212802399', N'abc@gmail.com', N'12345', 4)
INSERT [dbo].[Users] ([Id], [Name], [Age], [Qualification], [Address], [Phone], [Email], [Password], [UserTypeId]) VALUES (10, N'usaid', 20, N'bsc', N'saddar', N'090078601', N'usaid@gmail.com', N'12345', 4)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (3, N'Admin')
INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (4, N'Customer')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_EnrollementStatuses] FOREIGN KEY([EnrollmentStatusId])
REFERENCES [dbo].[EnrollementStatuses] ([Id])
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_EnrollementStatuses]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Events] FOREIGN KEY([EventId])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Events]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Users]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Users] FOREIGN KEY([Winner])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypes1] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypes] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypes1]
GO
USE [master]
GO
ALTER DATABASE [NatinaolLevelPaper] SET  READ_WRITE 
GO
