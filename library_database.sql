CREATE TABLE [BOOK]
(
[BookID] [int] IDENTITY(1,1) NOT NULL,
[Name] [varchar](100) NOT NULL,
[Release_year]  [datetime] NOT NULL DEFAULT (getdate()),
CONSTRAINT [PK_BOOK] PRIMARY KEY ([BookID] ASC)
);

CREATE TABLE [AUTHOR]
(
[AuthorID] [int] IDENTITY(1,1) NOT NULL,
[First_name] [varchar](100) NOT NULL,
[Last_name] [varchar](100) NOT NULL,
[Book_ID] [int] not null,
CONSTRAINT [PK_AUTHOR] PRIMARY KEY ([AuthorID] ASC, [Book_ID] ASC)
);

CREATE TABLE [BOOKAUTHOR]
(
[Book_ID] [int] not null,
[AuthorID] [int] NOT NULL,
CONSTRAINT [PK_BOOKAUTHOR] PRIMARY KEY ([Book_ID] ASC,[AuthorID] ASC)
);


CREATE TABLE [PRESS]
(
[PressID] [int] IDENTITY(1,1) NOT NULL,
[Name] [varchar](100) NOT NULL,
[Book_ID] [int] not null,
CONSTRAINT [PK_PRESS] PRIMARY KEY ([PressID] ASC,[Book_ID] ASC)
);

CREATE TABLE [THEME]
(
[ThemeID] [int] IDENTITY(1,1) NOT NULL,
[Name] [varchar](100) NOT NULL,
[Book_ID] [int] not null,
CONSTRAINT [PK_THEME] PRIMARY KEY ([ThemeID] ASC,[Book_ID] ASC)
);

CREATE TABLE [Lending]
(
[Book_ID] [int] not null,
[AuthorID] [int] NOT NULL,
[Reader_ID] [int] not null,
[Lend_date]  [datetime] NOT NULL DEFAULT (getdate()),
[Exp_return_date]  [datetime] NOT NULL DEFAULT (getdate()),
[Real_return_date]  [datetime] NOT NULL DEFAULT (getdate()),
CONSTRAINT [PK_Lending] PRIMARY KEY ([Book_ID] ASC,[AuthorID] ASC, [Reader_ID] ASC)
);

CREATE TABLE [Reader]
(
[ReaderID] [int] IDENTITY(1,1) NOT NULL,
[FirstName] [varchar](100) NOT NULL,
[LastName] [varchar](100) NOT NULL,
[Passport_num] [int] NOT NULL,
[Address] [varchar](300) NOT NULL,
[Phone] [int] NOT NULL,
[Book_ID] [int] not null,
[City_ID]
CONSTRAINT [PK_Reader] PRIMARY KEY ([ReaderID] ASC,[Book_ID] ASC, [City_ID] ASC)
CONSTRAINT [PK_City] PRIMARY KEY ([CityID] ASC)
);








