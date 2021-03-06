USE [master]
GO
/****** Object:  Database [TimeTracking]    Script Date: 10/13/2016 6:58:16 AM ******/
CREATE DATABASE [TimeTracking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimeTracking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TimeTracking_Primary.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TimeTracking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TimeTracking_Primary.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TimeTracking] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimeTracking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimeTracking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TimeTracking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TimeTracking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TimeTracking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TimeTracking] SET ARITHABORT OFF 
GO
ALTER DATABASE [TimeTracking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TimeTracking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TimeTracking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TimeTracking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TimeTracking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TimeTracking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TimeTracking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TimeTracking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TimeTracking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TimeTracking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TimeTracking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TimeTracking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TimeTracking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TimeTracking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TimeTracking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TimeTracking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TimeTracking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TimeTracking] SET RECOVERY FULL 
GO
ALTER DATABASE [TimeTracking] SET  MULTI_USER 
GO
ALTER DATABASE [TimeTracking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimeTracking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimeTracking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimeTracking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TimeTracking] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TimeTracking', N'ON'
GO
USE [TimeTracking]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 10/13/2016 6:58:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Created] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag]    Script Date: 10/13/2016 6:58:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[TagID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Created] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Time]    Script Date: 10/13/2016 6:58:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time](
	[TimeID] [uniqueidentifier] NOT NULL,
	[ProjectID] [uniqueidentifier] NULL,
	[UserID] [uniqueidentifier] NULL,
	[Description] [nvarchar](max) NULL,
	[Date] [datetimeoffset](7) NULL,
	[Start] [time](7) NULL,
	[Stop] [time](7) NULL,
	[Created] [datetimeoffset](7) NULL,
	[Modified] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Time_Tag]    Script Date: 10/13/2016 6:58:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time_Tag](
	[TimeID] [uniqueidentifier] NOT NULL,
	[TagID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Time_Tag] PRIMARY KEY CLUSTERED 
(
	[TimeID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 10/13/2016 6:58:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Created] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Project] ([ProjectID], [Name], [Created]) VALUES (N'40e0931d-4591-4c20-bae3-19aaddd5ff9a', N'Mobile', CAST(N'2016-10-01T00:00:00.0000000+07:00' AS DateTimeOffset))
INSERT [dbo].[Project] ([ProjectID], [Name], [Created]) VALUES (N'cc73a080-48d7-4d88-8733-8f6e7319e116', N'Backend', CAST(N'2016-10-01T00:00:00.0000000+07:00' AS DateTimeOffset))
INSERT [dbo].[Project] ([ProjectID], [Name], [Created]) VALUES (N'b1e0b8d6-a459-4a50-8f05-a39b78c81690', N'Reporting', CAST(N'2016-10-01T00:00:00.0000000+07:00' AS DateTimeOffset))
INSERT [dbo].[Project] ([ProjectID], [Name], [Created]) VALUES (N'2804979e-ecea-4559-a432-ba5201146eeb', N'Web', CAST(N'2016-10-01T00:00:00.0000000+07:00' AS DateTimeOffset))
INSERT [dbo].[Project] ([ProjectID], [Name], [Created]) VALUES (N'0d364f3a-dbe4-4b46-ad86-c79c6c601761', N'Support', CAST(N'2016-10-01T00:00:00.0000000+07:00' AS DateTimeOffset))
INSERT [dbo].[Tag] ([TagID], [Name], [Created]) VALUES (N'5680add6-7b0f-4bb7-a0b2-0ab95f8a7f69', N'HTML', NULL)
INSERT [dbo].[Tag] ([TagID], [Name], [Created]) VALUES (N'a0223c33-3e1c-4bd0-9ee9-4b62dd3828fd', N'C#', NULL)
INSERT [dbo].[Tag] ([TagID], [Name], [Created]) VALUES (N'3f20e34f-8020-4453-809c-6a88ee0f234e', N'Javascript', NULL)
INSERT [dbo].[Tag] ([TagID], [Name], [Created]) VALUES (N'203b2400-69dd-48c2-87f5-7d4ac868edc3', N'Database', NULL)
INSERT [dbo].[Tag] ([TagID], [Name], [Created]) VALUES (N'9f7f905d-c212-49e1-ad89-f349e8628c33', N'QA', NULL)
INSERT [dbo].[Time] ([TimeID], [ProjectID], [UserID], [Description], [Date], [Start], [Stop], [Created], [Modified]) VALUES (N'eeced9f2-b1d8-4be3-b91b-17cf70b8789e', N'cc73a080-48d7-4d88-8733-8f6e7319e116', N'b19cf060-5892-4568-9d8a-7508a5e854d5', N'Modify database object', CAST(N'2016-10-05T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'2016-10-05T00:00:00.0000000+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Time] ([TimeID], [ProjectID], [UserID], [Description], [Date], [Start], [Stop], [Created], [Modified]) VALUES (N'f05d8330-5682-46a1-9af7-cea1107e12aa', N'2804979e-ecea-4559-a432-ba5201146eeb', N'b19cf060-5892-4568-9d8a-7508a5e854d5', N'Implement report view', CAST(N'2016-10-06T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), CAST(N'2016-10-06T00:00:00.0000000+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Time] ([TimeID], [ProjectID], [UserID], [Description], [Date], [Start], [Stop], [Created], [Modified]) VALUES (N'290957f1-e1e4-4779-9650-fa6d04e7aab3', N'cc73a080-48d7-4d88-8733-8f6e7319e116', N'100b00cd-71da-458c-8616-73e9e29bdc25', N'Fix Bug #7262', CAST(N'2016-10-05T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'2016-10-05T00:00:00.0000000+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Time_Tag] ([TimeID], [TagID]) VALUES (N'eeced9f2-b1d8-4be3-b91b-17cf70b8789e', N'203b2400-69dd-48c2-87f5-7d4ac868edc3')
INSERT [dbo].[Time_Tag] ([TimeID], [TagID]) VALUES (N'f05d8330-5682-46a1-9af7-cea1107e12aa', N'5680add6-7b0f-4bb7-a0b2-0ab95f8a7f69')
INSERT [dbo].[Time_Tag] ([TimeID], [TagID]) VALUES (N'f05d8330-5682-46a1-9af7-cea1107e12aa', N'a0223c33-3e1c-4bd0-9ee9-4b62dd3828fd')
INSERT [dbo].[Time_Tag] ([TimeID], [TagID]) VALUES (N'f05d8330-5682-46a1-9af7-cea1107e12aa', N'3f20e34f-8020-4453-809c-6a88ee0f234e')
INSERT [dbo].[Time_Tag] ([TimeID], [TagID]) VALUES (N'290957f1-e1e4-4779-9650-fa6d04e7aab3', N'5680add6-7b0f-4bb7-a0b2-0ab95f8a7f69')
INSERT [dbo].[User] ([UserID], [Name], [Created]) VALUES (N'04cdfc3b-85ec-4ef9-a5af-63eaa2a7700c', N'Tara Wilson', CAST(N'2016-01-01T00:00:00.0000000+07:00' AS DateTimeOffset))
INSERT [dbo].[User] ([UserID], [Name], [Created]) VALUES (N'100b00cd-71da-458c-8616-73e9e29bdc25', N'Alan Shore', CAST(N'2016-01-01T00:00:00.0000000+07:00' AS DateTimeOffset))
INSERT [dbo].[User] ([UserID], [Name], [Created]) VALUES (N'b19cf060-5892-4568-9d8a-7508a5e854d5', N'Denny Crane', CAST(N'2016-01-01T00:00:00.0000000+07:00' AS DateTimeOffset))
INSERT [dbo].[User] ([UserID], [Name], [Created]) VALUES (N'780d9f3e-fd57-49ef-96e3-c33338fd5a99', N'Katie Piper', CAST(N'2016-01-01T00:00:00.0000000+07:00' AS DateTimeOffset))
INSERT [dbo].[User] ([UserID], [Name], [Created]) VALUES (N'ebfb36e2-0c01-4d10-ad29-c4a6e4b4ea9b', N'Brad Chase', CAST(N'2016-01-01T00:00:00.0000000+07:00' AS DateTimeOffset))
INSERT [dbo].[User] ([UserID], [Name], [Created]) VALUES (N'ffaf02f7-d0ff-412e-8793-cf4c584259b6', N'Rob Carter', CAST(N'2016-01-01T00:00:00.0000000+07:00' AS DateTimeOffset))
ALTER TABLE [dbo].[Time]  WITH CHECK ADD  CONSTRAINT [FK_Time_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
ALTER TABLE [dbo].[Time] CHECK CONSTRAINT [FK_Time_Project]
GO
ALTER TABLE [dbo].[Time]  WITH CHECK ADD  CONSTRAINT [FK_Time_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Time] CHECK CONSTRAINT [FK_Time_User]
GO
ALTER TABLE [dbo].[Time_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Time_Tag_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([TagID])
GO
ALTER TABLE [dbo].[Time_Tag] CHECK CONSTRAINT [FK_Time_Tag_Tag]
GO
ALTER TABLE [dbo].[Time_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Time_Tag_Time] FOREIGN KEY([TimeID])
REFERENCES [dbo].[Time] ([TimeID])
GO
ALTER TABLE [dbo].[Time_Tag] CHECK CONSTRAINT [FK_Time_Tag_Time]
GO
USE [master]
GO
ALTER DATABASE [TimeTracking] SET  READ_WRITE 
GO
