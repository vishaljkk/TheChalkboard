USE [master]
GO
/****** Object:  Database [Chalkboard]    Script Date: 24-08-2020 20:21:22 ******/
CREATE DATABASE [Chalkboard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Chalkboard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Chalkboard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Chalkboard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Chalkboard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Chalkboard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Chalkboard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Chalkboard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Chalkboard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Chalkboard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Chalkboard] SET ARITHABORT OFF 
GO
ALTER DATABASE [Chalkboard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Chalkboard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Chalkboard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Chalkboard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Chalkboard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Chalkboard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Chalkboard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Chalkboard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Chalkboard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Chalkboard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Chalkboard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Chalkboard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Chalkboard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Chalkboard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Chalkboard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Chalkboard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Chalkboard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Chalkboard] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Chalkboard] SET  MULTI_USER 
GO
ALTER DATABASE [Chalkboard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Chalkboard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Chalkboard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Chalkboard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Chalkboard] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Chalkboard] SET QUERY_STORE = OFF
GO
USE [Chalkboard]
GO
ALTER DATABASE SCOPED CONFIGURATION SET ACCELERATED_PLAN_FORCING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ADAPTIVE_JOINS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ON_ROWSTORE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DEFERRED_COMPILATION_TV = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_ONLINE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_RESUMABLE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET GLOBAL_TEMPORARY_TABLE_AUTO_DROP = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET INTERLEAVED_EXECUTION_TVF = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ISOLATE_SECURITY_POLICY_CARDINALITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LAST_QUERY_PLAN_STATS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LIGHTWEIGHT_QUERY_PROFILING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ROW_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET TSQL_SCALAR_UDF_INLINING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET VERBOSE_TRUNCATION_WARNINGS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
USE [Chalkboard]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 24-08-2020 20:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[ActivityTypeId] [int] NOT NULL,
	[ActivityName] [varchar](100) NOT NULL,
	[ActivityDescription] [varchar](max) NOT NULL,
	[ActivityStartDate] [datetime] NULL,
	[ActivityEndDate] [datetime] NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[ActivityImages] [varchar](100) NULL,
	[IsPublished] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityEntries]    Script Date: 24-08-2020 20:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityEntries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivitiesId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Entry] [varbinary](max) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsPublished] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityEntryComment]    Script Date: 24-08-2020 20:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityEntryComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityEntriesId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Comment] [varchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityEntryFlag]    Script Date: 24-08-2020 20:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityEntryFlag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityEntriesId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[FlagReasonId] [int] NOT NULL,
	[FlagReasonComment] [varchar](max) NOT NULL,
	[AdminComment] [varchar](max) NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityEntryReaction]    Script Date: 24-08-2020 20:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityEntryReaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityEntriesId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ReactionId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityType]    Script Date: 24-08-2020 20:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 24-08-2020 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
	[CategoryDescription] [varchar](500) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlagReason]    Script Date: 24-08-2020 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlagReason](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [varchar](10) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupCategory]    Script Date: 24-08-2020 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMember]    Script Date: 24-08-2020 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMember](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[GroupRoleId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupRights]    Script Date: 24-08-2020 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupRights](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupRoles]    Script Date: 24-08-2020 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[RoleCode] [varchar](5) NOT NULL,
	[RoleDesc] [varchar](100) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 24-08-2020 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentGroupId] [int] NULL,
	[GroupName] [varchar](500) NOT NULL,
	[GroupDescription] [varchar](max) NOT NULL,
	[GroupTypeId] [int] NULL,
	[GroupRightsId] [int] NULL,
	[GroupCode] [varchar](10) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[Path] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupType]    Script Date: 24-08-2020 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[TypeDescription] [varchar](200) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfileRights]    Script Date: 24-08-2020 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileRights](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 24-08-2020 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProfileName] [varchar](100) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reaction]    Script Date: 24-08-2020 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReactionType] [varchar](10) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 24-08-2020 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [varchar](250) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserOTP]    Script Date: 24-08-2020 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOTP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserProfileId] [int] NOT NULL,
	[OTP] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPreferences]    Script Date: 24-08-2020 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPreferences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 24-08-2020 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProfileRightsId] [int] NULL,
	[FirstName] [varchar](250) NOT NULL,
	[MiddleName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[Email] [varchar](150) NOT NULL,
	[PhoneNo] [varchar](20) NULL,
	[StreetName1] [varchar](250) NULL,
	[StreetName2] [varchar](250) NULL,
	[AptNo] [varchar](10) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](5) NULL,
	[Country] [varchar](20) NULL,
	[Zip] [varchar](6) NULL,
	[ProfilePicture] [varbinary](max) NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Activities] ON 
GO
INSERT [dbo].[Activities] ([Id], [GroupId], [ActivityTypeId], [ActivityName], [ActivityDescription], [ActivityStartDate], [ActivityEndDate], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ActivityImages], [IsPublished]) VALUES (1, 4, 1, N'Activity One', N'First Picture Description', CAST(N'2020-07-12T15:57:05.303' AS DateTime), CAST(N'2020-09-12T15:57:05.303' AS DateTime), 1, 1, CAST(N'2020-07-12T15:57:05.303' AS DateTime), NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Activities] OFF
GO
SET IDENTITY_INSERT [dbo].[ActivityType] ON 
GO
INSERT [dbo].[ActivityType] ([Id], [TypeName], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Pictures', 1, 1, CAST(N'2020-07-11T06:18:27.877' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[ActivityType] ([Id], [TypeName], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Stories', 1, 1, CAST(N'2020-07-11T06:18:28.010' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[ActivityType] ([Id], [TypeName], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'Games', 1, 1, CAST(N'2020-07-11T06:18:28.010' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[ActivityType] ([Id], [TypeName], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'Animations', 1, 1, CAST(N'2020-07-11T06:18:28.013' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ActivityType] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([Id], [CategoryName], [CategoryDescription], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Private', N'Private', 1, 1, CAST(N'2020-06-20T15:14:21.183' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Category] ([Id], [CategoryName], [CategoryDescription], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'School', N'School', 1, 1, CAST(N'2020-06-20T15:14:21.260' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupMember] ON 
GO
INSERT [dbo].[GroupMember] ([Id], [GroupId], [UserId], [GroupRoleId], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 3, 3, 1, 1, 1, CAST(N'2020-06-21T05:57:44.680' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[GroupMember] ([Id], [GroupId], [UserId], [GroupRoleId], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 3, 4, 2, 1, 1, CAST(N'2020-06-21T05:57:44.680' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[GroupMember] ([Id], [GroupId], [UserId], [GroupRoleId], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, 3, 5, 2, 1, 1, CAST(N'2020-06-21T05:57:44.680' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[GroupMember] ([Id], [GroupId], [UserId], [GroupRoleId], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, 3, 6, 2, 1, 1, CAST(N'2020-06-21T05:57:44.680' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[GroupMember] ([Id], [GroupId], [UserId], [GroupRoleId], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, 3, 7, 2, 1, 1, CAST(N'2020-06-21T05:57:44.680' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[GroupMember] ([Id], [GroupId], [UserId], [GroupRoleId], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, 3, 8, 2, 1, 1, CAST(N'2020-06-21T05:57:44.683' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[GroupMember] ([Id], [GroupId], [UserId], [GroupRoleId], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, 4, 4, 1, 1, 1, CAST(N'2020-06-21T06:04:17.140' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[GroupMember] ([Id], [GroupId], [UserId], [GroupRoleId], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, 4, 5, 1, 1, 1, CAST(N'2020-06-21T06:04:17.140' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[GroupMember] ([Id], [GroupId], [UserId], [GroupRoleId], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, 5, 6, 1, 1, 1, CAST(N'2020-06-21T06:04:17.143' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[GroupMember] ([Id], [GroupId], [UserId], [GroupRoleId], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 5, 7, 1, 1, 1, CAST(N'2020-06-21T06:04:17.143' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[GroupMember] ([Id], [GroupId], [UserId], [GroupRoleId], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, 5, 8, 1, 1, 1, CAST(N'2020-06-21T06:04:17.143' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[GroupMember] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupRoles] ON 
GO
INSERT [dbo].[GroupRoles] ([Id], [RoleName], [RoleCode], [RoleDesc], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'GroupAdmin', N'GA', N'Group Admin', 1, 1, CAST(N'2020-06-21T05:40:41.767' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[GroupRoles] ([Id], [RoleName], [RoleCode], [RoleDesc], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'GroupMember', N'GM', N'Group Member', 1, 1, CAST(N'2020-06-21T05:40:41.780' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[GroupRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 
GO
INSERT [dbo].[Groups] ([Id], [ParentGroupId], [GroupName], [GroupDescription], [GroupTypeId], [GroupRightsId], [GroupCode], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Path]) VALUES (3, NULL, N'School One', N'School One', NULL, NULL, N'1000', 1, 1, CAST(N'2020-06-20T15:24:04.107' AS DateTime), NULL, NULL, N'3/')
GO
INSERT [dbo].[Groups] ([Id], [ParentGroupId], [GroupName], [GroupDescription], [GroupTypeId], [GroupRightsId], [GroupCode], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Path]) VALUES (4, 3, N'1 A', N'Class 1 A', NULL, NULL, N'1000', 1, 1, CAST(N'2020-06-20T15:30:40.543' AS DateTime), NULL, NULL, N'3/4/')
GO
INSERT [dbo].[Groups] ([Id], [ParentGroupId], [GroupName], [GroupDescription], [GroupTypeId], [GroupRightsId], [GroupCode], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Path]) VALUES (5, 3, N'1 B', N'Class 1 B', NULL, NULL, N'1000', 1, 1, CAST(N'2020-06-20T15:30:40.563' AS DateTime), NULL, NULL, N'3/5/')
GO
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Profiles] ON 
GO
INSERT [dbo].[Profiles] ([Id], [UserId], [ProfileName], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 24, N'Ashwin Purushotham', 1, 1, CAST(N'2020-06-14T07:46:57.363' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Profiles] ([Id], [UserId], [ProfileName], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, 25, N'Principal One', 1, 1, CAST(N'2020-06-20T15:08:00.430' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Profiles] ([Id], [UserId], [ProfileName], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, 26, N'Teacher One', 1, 1, CAST(N'2020-06-20T15:08:00.437' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Profiles] ([Id], [UserId], [ProfileName], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, 27, N'Teacher Two', 1, 1, CAST(N'2020-06-20T15:08:00.437' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Profiles] ([Id], [UserId], [ProfileName], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, 28, N'Teacher Three', 1, 1, CAST(N'2020-06-20T15:08:00.437' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Profiles] ([Id], [UserId], [ProfileName], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, 29, N'Teacher Four', 1, 1, CAST(N'2020-06-20T15:08:00.437' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Profiles] ([Id], [UserId], [ProfileName], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, 30, N'Teacher Five', 1, 1, CAST(N'2020-06-20T15:08:00.437' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Profiles] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'apurushotham', N'PfTB_^Pq7:LT', 1, 1, CAST(N'2020-06-13T12:43:53.153' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'apurushotham', N'W8KVIB;spxu|', 1, 1, CAST(N'2020-06-13T12:46:11.900' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'apurushotham', N'XxXpDzkS:33r', 1, 1, CAST(N'2020-06-13T12:57:00.737' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'apurushotham', N'1tC$kEYX=Z_a', 1, 1, CAST(N'2020-06-13T12:58:07.283' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'apurushotham', N'1/k5i+4vZm(*', 1, 1, CAST(N'2020-06-13T12:59:23.703' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'apurushotham', N'9jwU;p*]U_;9', 1, 1, CAST(N'2020-06-13T13:00:05.210' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, N'apurushotham', N'it(t3K0}Njxs', 1, 1, CAST(N'2020-06-13T13:00:55.527' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, N'apurushotham', N'O?ZLYHmqG7f4', 1, 1, CAST(N'2020-06-13T13:01:47.160' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, N'apurushotham', N'M9u[u*d$q5cA', 1, 1, CAST(N'2020-06-13T13:06:22.810' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, N'apurushotham', N'T%bG-::CO(ai', 1, 1, CAST(N'2020-06-13T13:08:04.920' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (12, N'apurushotham', N'X!}h93+dE|oz', 1, 1, CAST(N'2020-06-13T13:10:33.460' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (13, N'apurushotham', N'v@lPNnE74Y[)', 1, 1, CAST(N'2020-06-13T13:11:22.673' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (14, N'apurushotham', N'U]GZPT-A%-zH', 1, 1, CAST(N'2020-06-13T13:15:08.593' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (15, N'apurushotham', N'Pb0Y+ZiQa!6m', 1, 1, CAST(N'2020-06-13T13:17:50.777' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (16, N'apurushotham', N'.>ugF88w#)p[', 1, 1, CAST(N'2020-06-13T14:18:11.930' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (17, N'apurushotham', N'0pyxsu-d^W#i', 1, 1, CAST(N'2020-06-13T15:26:42.860' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (18, N'apurushotham', N'pi2Pg!&2O6rq', 1, 1, CAST(N'2020-06-13T15:28:46.517' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (19, N'apurushotham', N'97?jricxMT7s', 1, 1, CAST(N'2020-06-13T15:29:12.650' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20, N'apurushotham', N'G!H-sTF=;/+H', 1, 1, CAST(N'2020-06-13T15:39:20.973' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (21, N'apurushotham', N'Jsfjsr9JK={J', 1, 1, CAST(N'2020-06-13T15:40:28.123' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (22, N'ashwin2251@gmail.com', N'1*uK#i5S?Z>k', 1, 1, CAST(N'2020-06-13T16:29:31.090' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (24, N'ap225@gmail.com', N'1+eV8QOK=@sn', 1, 1, CAST(N'2020-06-14T07:46:57.363' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (25, N'PrincipalOne@school.org', N'', 1, 1, CAST(N'2020-06-20T14:54:25.833' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (26, N'TeacherOne@school.org', N'', 1, 1, CAST(N'2020-06-20T14:54:25.840' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (27, N'TeacherTwo@school.org', N'', 1, 1, CAST(N'2020-06-20T14:54:25.840' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (28, N'TeacherThree@school.org', N'', 1, 1, CAST(N'2020-06-20T14:54:25.840' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (29, N'TeacherFour@school.org', N'', 1, 1, CAST(N'2020-06-20T14:54:25.840' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (30, N'TeacherFive@school.org', N'', 1, 1, CAST(N'2020-06-20T14:54:25.843' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 2, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T12:43:53.153' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, 3, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T12:46:12.920' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, 4, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T12:57:00.737' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, 5, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T12:58:07.283' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, 6, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T12:59:23.703' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, 7, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T13:00:05.210' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, 8, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T13:00:55.527' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, 9, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T13:01:47.160' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 10, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T13:06:22.810' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, 11, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T13:08:04.920' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (12, 12, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T13:10:33.460' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (13, 13, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T13:11:22.673' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (14, 14, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T13:15:08.593' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (15, 15, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T13:17:50.777' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (16, 16, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T14:18:11.930' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (17, 17, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T15:26:42.860' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (18, 18, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T15:28:46.517' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (19, 19, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T15:29:12.650' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20, 20, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T15:39:20.973' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (21, 21, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T15:40:28.123' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (22, 22, NULL, N'Ashwin Purushotham', NULL, NULL, N'ashwin2251@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-13T16:29:31.090' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (23, 24, NULL, N'Ashwin Purushotham', NULL, NULL, N'ap225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-14T07:46:57.363' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (24, 25, NULL, N'Principal One', NULL, NULL, N'PrincipalOne@school.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-20T14:59:24.530' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (25, 26, NULL, N'Teacher One', NULL, NULL, N'TeacherOne@school.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-20T14:59:24.533' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (26, 27, NULL, N'Teacher Two', NULL, NULL, N'TeacherTwo@school.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-20T14:59:24.540' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (27, 28, NULL, N'Teacher Three', NULL, NULL, N'TeacherThree@school.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-20T14:59:24.540' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (28, 29, NULL, N'Teacher Four', NULL, NULL, N'TeacherFour@school.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-20T14:59:24.543' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [UserId], [ProfileRightsId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [StreetName1], [StreetName2], [AptNo], [City], [State], [Country], [Zip], [ProfilePicture], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (29, 30, NULL, N'Teacher Five', NULL, NULL, N'TeacherFive@school.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2020-06-20T14:59:24.543' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
ALTER TABLE [dbo].[Activities] ADD  DEFAULT ((0)) FOR [IsPublished]
GO
ALTER TABLE [dbo].[ActivityEntries] ADD  DEFAULT ((0)) FOR [IsPublished]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD FOREIGN KEY([ActivityTypeId])
REFERENCES [dbo].[ActivityType] ([Id])
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[ActivityEntries]  WITH CHECK ADD FOREIGN KEY([ActivitiesId])
REFERENCES [dbo].[Activities] ([Id])
GO
ALTER TABLE [dbo].[ActivityEntries]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Profiles] ([Id])
GO
ALTER TABLE [dbo].[ActivityEntryComment]  WITH CHECK ADD FOREIGN KEY([ActivityEntriesId])
REFERENCES [dbo].[ActivityEntries] ([Id])
GO
ALTER TABLE [dbo].[ActivityEntryComment]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ActivityEntryFlag]  WITH CHECK ADD FOREIGN KEY([ActivityEntriesId])
REFERENCES [dbo].[ActivityEntries] ([Id])
GO
ALTER TABLE [dbo].[ActivityEntryFlag]  WITH CHECK ADD FOREIGN KEY([FlagReasonId])
REFERENCES [dbo].[FlagReason] ([Id])
GO
ALTER TABLE [dbo].[ActivityEntryFlag]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ActivityEntryReaction]  WITH CHECK ADD FOREIGN KEY([ActivityEntriesId])
REFERENCES [dbo].[ActivityEntries] ([Id])
GO
ALTER TABLE [dbo].[ActivityEntryReaction]  WITH CHECK ADD FOREIGN KEY([ReactionId])
REFERENCES [dbo].[Reaction] ([Id])
GO
ALTER TABLE [dbo].[ActivityEntryReaction]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[GroupCategory]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[GroupCategory]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[GroupMember]  WITH CHECK ADD FOREIGN KEY([GroupRoleId])
REFERENCES [dbo].[GroupRoles] ([Id])
GO
ALTER TABLE [dbo].[GroupMember]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[GroupMember]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Profiles] ([Id])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([GroupRightsId])
REFERENCES [dbo].[GroupRights] ([Id])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([GroupTypeId])
REFERENCES [dbo].[GroupType] ([Id])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([ParentGroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserOTP]  WITH CHECK ADD FOREIGN KEY([UserProfileId])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[UserPreferences]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[UserPreferences]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD FOREIGN KEY([ProfileRightsId])
REFERENCES [dbo].[ProfileRights] ([Id])
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Chalkboard] SET  READ_WRITE 
GO
