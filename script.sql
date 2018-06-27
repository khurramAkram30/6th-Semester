USE [master]
GO
/****** Object:  Database [NatinaolLevelPaper]    Script Date: 26-Jun-18 10:37:41 AM ******/
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
/****** Object:  Table [dbo].[EnrollementStatuses]    Script Date: 26-Jun-18 10:37:42 AM ******/
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
/****** Object:  Table [dbo].[Enrollments]    Script Date: 26-Jun-18 10:37:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Enrollments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Qualification] [varchar](200) NULL,
	[Payment] [money] NULL,
	[Phone] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[EnrollmentStatusId] [int] NULL,
	[UserId] [int] NULL,
	[EventId] [int] NULL,
 CONSTRAINT [PK_Enrollments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Events]    Script Date: 26-Jun-18 10:37:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Fees] [money] NULL,
	[Eligibility] [nvarchar](max) NULL,
	[Spearker] [varchar](50) NULL,
	[Topics] [varchar](max) NULL,
	[Prize] [money] NULL,
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
/****** Object:  Table [dbo].[Subcribers]    Script Date: 26-Jun-18 10:37:42 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 26-Jun-18 10:37:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[UserTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 26-Jun-18 10:37:42 AM ******/
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
