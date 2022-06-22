USE [library]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 22.06.2022 22:09:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[Author_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [char](50) NULL,
	[Last_name] [char](50) NULL,
	[Book_ID] [int] NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[Author_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 22.06.2022 22:09:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Book_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](50) NULL,
	[Release_year] [datetime] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Author]    Script Date: 22.06.2022 22:09:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Author](
	[Book_ID] [int] NULL,
	[Author_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 22.06.2022 22:09:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](40) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lending]    Script Date: 22.06.2022 22:09:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lending](
	[AuthorID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[Lend_date] [datetime] NOT NULL,
	[Exp_return_date] [datetime] NULL,
	[Real_return_date] [datetime] NULL,
	[ReaderID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Press]    Script Date: 22.06.2022 22:09:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Press](
	[Press_ID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NULL,
	[Name] [char](40) NULL,
 CONSTRAINT [PK_Press] PRIMARY KEY CLUSTERED 
(
	[Press_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reader]    Script Date: 22.06.2022 22:09:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reader](
	[Reader_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [char](10) NULL,
	[Last_name] [char](10) NULL,
	[Passport_num] [float] NULL,
	[Address] [char](60) NULL,
	[Phone] [float] NULL,
	[City_ID] [int] NULL,
 CONSTRAINT [PK_Reader] PRIMARY KEY CLUSTERED 
(
	[Reader_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Theme]    Script Date: 22.06.2022 22:09:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theme](
	[Theme_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](30) NULL,
	[BookID] [int] NULL,
 CONSTRAINT [PK_Theme] PRIMARY KEY CLUSTERED 
(
	[Theme_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Lending] ADD  DEFAULT (getdate()) FOR [Lend_date]
GO
ALTER TABLE [dbo].[Book_Author]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author_Author] FOREIGN KEY([Author_ID])
REFERENCES [dbo].[Author] ([Author_ID])
GO
ALTER TABLE [dbo].[Book_Author] CHECK CONSTRAINT [FK_Book_Author_Author]
GO
ALTER TABLE [dbo].[Book_Author]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author_Book] FOREIGN KEY([Book_ID])
REFERENCES [dbo].[Book] ([Book_ID])
GO
ALTER TABLE [dbo].[Book_Author] CHECK CONSTRAINT [FK_Book_Author_Book]
GO
ALTER TABLE [dbo].[Lending]  WITH CHECK ADD  CONSTRAINT [FK_Lending_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([Book_ID])
GO
ALTER TABLE [dbo].[Lending] CHECK CONSTRAINT [FK_Lending_Book]
GO
ALTER TABLE [dbo].[Lending]  WITH CHECK ADD  CONSTRAINT [FK_Lending_Reader] FOREIGN KEY([ReaderID])
REFERENCES [dbo].[Reader] ([Reader_ID])
GO
ALTER TABLE [dbo].[Lending] CHECK CONSTRAINT [FK_Lending_Reader]
GO
ALTER TABLE [dbo].[Press]  WITH CHECK ADD  CONSTRAINT [FK_Press_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([Book_ID])
GO
ALTER TABLE [dbo].[Press] CHECK CONSTRAINT [FK_Press_Book]
GO
ALTER TABLE [dbo].[Reader]  WITH CHECK ADD  CONSTRAINT [FK_Reader_City] FOREIGN KEY([City_ID])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[Reader] CHECK CONSTRAINT [FK_Reader_City]
GO
ALTER TABLE [dbo].[Theme]  WITH CHECK ADD  CONSTRAINT [FK_Theme_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([Book_ID])
GO
ALTER TABLE [dbo].[Theme] CHECK CONSTRAINT [FK_Theme_Book]
GO
