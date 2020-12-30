USE [master]
GO
/****** Object:  Database [RepairServices]    Script Date: 16.12.2020 22:40:51 ******/
CREATE DATABASE [RepairServices]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RepairServices', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\RepairServices.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RepairServices_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\RepairServices_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RepairServices].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RepairServices] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RepairServices] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RepairServices] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RepairServices] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RepairServices] SET ARITHABORT OFF 
GO
ALTER DATABASE [RepairServices] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RepairServices] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RepairServices] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RepairServices] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RepairServices] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RepairServices] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RepairServices] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RepairServices] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RepairServices] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RepairServices] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RepairServices] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RepairServices] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RepairServices] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RepairServices] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RepairServices] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RepairServices] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RepairServices] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RepairServices] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RepairServices] SET  MULTI_USER 
GO
ALTER DATABASE [RepairServices] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RepairServices] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RepairServices] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RepairServices] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RepairServices] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RepairServices] SET QUERY_STORE = OFF
GO
USE [RepairServices]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 16.12.2020 22:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[Код_клиента] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NOT NULL,
	[Телефон] [nvarchar](20) NOT NULL,
	[Адрес] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 16.12.2020 22:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[Номер_заказа] [int] IDENTITY(1,1) NOT NULL,
	[Код_клиента] [int] NOT NULL,
	[Дата_заказа] [datetime] NOT NULL,
	[Статус] [bit] NOT NULL,
	[Описание] [nvarchar](max) NULL,
	[Дата_завершения] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Услуги]    Script Date: 16.12.2020 22:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуги](
	[Код_услуги] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](200) NOT NULL,
	[Единица_измерения] [nvarchar](50) NULL,
	[Цена_за_единицу_руб] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK__Услуги__66B713203BCD311C] PRIMARY KEY CLUSTERED 
(
	[Код_услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Оказанные_услуги]    Script Date: 16.12.2020 22:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Оказанные_услуги](
	[N_пп] [int] IDENTITY(1,1) NOT NULL,
	[Код_услуги] [int] NOT NULL,
	[Номер_заказа] [int] NOT NULL,
	[Номер_сотрудника] [int] NOT NULL,
	[Количество] [int] NOT NULL,
	[Примечание] [nvarchar](max) NULL,
 CONSTRAINT [PK__Оказанны__71AE31F9397329EA] PRIMARY KEY CLUSTERED 
(
	[N_пп] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Квитанция]    Script Date: 16.12.2020 22:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Квитанция]
As
Select Клиенты.Код_клиента, Фамилия, Имя, Отчество, Телефон, Sum(Цена_за_единицу_руб*Количество) As Сумма From Заказы
Join Клиенты on Заказы.Код_клиента = Клиенты.Код_клиента
Join Оказанные_услуги on Оказанные_услуги.Номер_заказа = Заказы.Номер_заказа
Join Услуги on Оказанные_услуги.Код_услуги = Услуги.Код_услуги
Group by Клиенты.Код_клиента, Фамилия, Имя, Отчество, Телефон
GO
/****** Object:  View [dbo].[Заработок_в_каждом_месяце]    Script Date: 16.12.2020 22:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Заработок_в_каждом_месяце]
As

Select Месяц, Count(Месяц) As Количество_услуг, Sum(Количество * Цена_за_единицу_руб) As Сумма_заказов From (
Select Month(Дата_заказа) As Месяц, Количество, Цена_за_единицу_руб From Заказы
Join Оказанные_услуги on Оказанные_услуги.Номер_заказа = Заказы.Номер_заказа
Join Услуги on Услуги.Код_услуги = Оказанные_услуги.Код_услуги ) As Сумма_за_месяц
Group by Месяц
GO
/****** Object:  View [dbo].[Сумма_заказов_месяц]    Script Date: 16.12.2020 22:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Сумма_заказов_месяц]
As
Select Код_клиента, месяц, Фамилия, Имя, Отчество, Телефон, Sum(Цена_за_единицу_руб * Количество) As Сумма From (
SELECT        dbo.Клиенты.Код_клиента, Month(Заказы.Дата_заказа) As месяц, dbo.Клиенты.Фамилия, dbo.Клиенты.Имя, dbo.Клиенты.Отчество, dbo.Клиенты.Телефон, dbo.Услуги.Цена_за_единицу_руб , dbo.Оказанные_услуги.Количество
FROM            dbo.Заказы INNER JOIN
                         dbo.Клиенты ON dbo.Заказы.Код_клиента = dbo.Клиенты.Код_клиента INNER JOIN
                         dbo.Оказанные_услуги ON dbo.Оказанные_услуги.Номер_заказа = dbo.Заказы.Номер_заказа INNER JOIN
                         dbo.Услуги ON dbo.Оказанные_услуги.Код_услуги = dbo.Услуги.Код_услуги) As Сумма_заказов
Group by Код_клиента, месяц, Фамилия, Имя, Отчество, Телефон
GO
/****** Object:  Table [dbo].[Использованные_материалы]    Script Date: 16.12.2020 22:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Использованные_материалы](
	[N_пп] [int] IDENTITY(1,1) NOT NULL,
	[Код_м] [int] NOT NULL,
	[Номер_заказа] [int] NOT NULL,
	[Количество] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[N_пп] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Материалы]    Script Date: 16.12.2020 22:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Материалы](
	[Код_материала] [int] IDENTITY(1,1) NOT NULL,
	[Цена] [decimal](18, 2) NOT NULL,
	[Наименование] [nvarchar](200) NOT NULL,
	[Количество_в_остатке] [int] NULL,
	[примечание] [nvarchar](max) NULL,
 CONSTRAINT [PK__Материал__3BDD7ED454BC5261] PRIMARY KEY CLUSTERED 
(
	[Код_материала] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 16.12.2020 22:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[Номер_сотрудника] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NOT NULL,
	[Адрес] [nvarchar](200) NOT NULL,
	[Дата_рождения] [datetime] NOT NULL,
	[Телефон] [nvarchar](20) NULL,
 CONSTRAINT [PK__Сотрудни__81F7262D675E4513] PRIMARY KEY CLUSTERED 
(
	[Номер_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Заказы] ON 

INSERT [dbo].[Заказы] ([Номер_заказа], [Код_клиента], [Дата_заказа], [Статус], [Описание], [Дата_завершения]) VALUES (1, 1, CAST(N'2020-12-12T00:00:00.000' AS DateTime), 1, NULL, CAST(N'2020-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Заказы] ([Номер_заказа], [Код_клиента], [Дата_заказа], [Статус], [Описание], [Дата_завершения]) VALUES (3, 5, CAST(N'2020-12-01T00:00:00.000' AS DateTime), 1, NULL, CAST(N'2020-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Заказы] ([Номер_заказа], [Код_клиента], [Дата_заказа], [Статус], [Описание], [Дата_завершения]) VALUES (4, 1, CAST(N'2020-09-09T00:00:00.000' AS DateTime), 1, NULL, CAST(N'2020-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Заказы] ([Номер_заказа], [Код_клиента], [Дата_заказа], [Статус], [Описание], [Дата_завершения]) VALUES (5, 2, CAST(N'2020-12-14T00:00:00.000' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[Заказы] ([Номер_заказа], [Код_клиента], [Дата_заказа], [Статус], [Описание], [Дата_завершения]) VALUES (6, 2, CAST(N'2020-11-14T00:00:00.000' AS DateTime), 1, NULL, CAST(N'2020-11-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Заказы] ([Номер_заказа], [Код_клиента], [Дата_заказа], [Статус], [Описание], [Дата_завершения]) VALUES (7, 3, CAST(N'2020-02-01T00:00:00.000' AS DateTime), 1, NULL, CAST(N'2020-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Заказы] ([Номер_заказа], [Код_клиента], [Дата_заказа], [Статус], [Описание], [Дата_завершения]) VALUES (8, 8, CAST(N'2020-11-20T00:00:00.000' AS DateTime), 1, NULL, CAST(N'2020-11-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Заказы] ([Номер_заказа], [Код_клиента], [Дата_заказа], [Статус], [Описание], [Дата_завершения]) VALUES (9, 3, CAST(N'2020-12-15T00:00:00.000' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[Заказы] ([Номер_заказа], [Код_клиента], [Дата_заказа], [Статус], [Описание], [Дата_завершения]) VALUES (10, 7, CAST(N'2020-07-03T00:00:00.000' AS DateTime), 1, N'', CAST(N'2020-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Заказы] ([Номер_заказа], [Код_клиента], [Дата_заказа], [Статус], [Описание], [Дата_завершения]) VALUES (11, 1, CAST(N'2020-12-12T00:00:00.000' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[Заказы] ([Номер_заказа], [Код_клиента], [Дата_заказа], [Статус], [Описание], [Дата_завершения]) VALUES (12, 6, CAST(N'2020-11-20T00:00:00.000' AS DateTime), 1, NULL, CAST(N'2020-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Заказы] ([Номер_заказа], [Код_клиента], [Дата_заказа], [Статус], [Описание], [Дата_завершения]) VALUES (13, 5, CAST(N'2020-12-14T03:24:55.257' AS DateTime), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Заказы] OFF
GO
SET IDENTITY_INSERT [dbo].[Использованные_материалы] ON 

INSERT [dbo].[Использованные_материалы] ([N_пп], [Код_м], [Номер_заказа], [Количество]) VALUES (1, 11, 1, 5)
INSERT [dbo].[Использованные_материалы] ([N_пп], [Код_м], [Номер_заказа], [Количество]) VALUES (3, 12, 1, 4)
INSERT [dbo].[Использованные_материалы] ([N_пп], [Код_м], [Номер_заказа], [Количество]) VALUES (4, 13, 3, 2)
INSERT [dbo].[Использованные_материалы] ([N_пп], [Код_м], [Номер_заказа], [Количество]) VALUES (9, 8, 9, 3)
INSERT [dbo].[Использованные_материалы] ([N_пп], [Код_м], [Номер_заказа], [Количество]) VALUES (10, 14, 9, 10)
INSERT [dbo].[Использованные_материалы] ([N_пп], [Код_м], [Номер_заказа], [Количество]) VALUES (11, 15, 9, 47)
SET IDENTITY_INSERT [dbo].[Использованные_материалы] OFF
GO
SET IDENTITY_INSERT [dbo].[Клиенты] ON 

INSERT [dbo].[Клиенты] ([Код_клиента], [Фамилия], [Имя], [Отчество], [Телефон], [Адрес], [Email]) VALUES (1, N'Стручкова', N'Марина', N'Робертовна', N'89706316226
', N'г. Челябинск, ул.Каслинская 64-17
', N'xl9bc5@gmail.com
')
INSERT [dbo].[Клиенты] ([Код_клиента], [Фамилия], [Имя], [Отчество], [Телефон], [Адрес], [Email]) VALUES (2, N'Рудакова', N'Елена', N'Юрьевна', N'89604088225
', N'г. Челябинск, ул.Ленина 32/А
', N'f9jxjd14@gmail.com
')
INSERT [dbo].[Клиенты] ([Код_клиента], [Фамилия], [Имя], [Отчество], [Телефон], [Адрес], [Email]) VALUES (3, N'Зырянова', N'Елена', N'Александровна', N'89593447234
', N'г. Миасс, проспект Автозаводцев 25
', N'myrfqpb@mail.ru
')
INSERT [dbo].[Клиенты] ([Код_клиента], [Фамилия], [Имя], [Отчество], [Телефон], [Адрес], [Email]) VALUES (5, N'Ялунина', N'Анна', N'Олеговна', N'89627629398
', N'г. Челябинск, ул.Кирова 13
', NULL)
INSERT [dbo].[Клиенты] ([Код_клиента], [Фамилия], [Имя], [Отчество], [Телефон], [Адрес], [Email]) VALUES (6, N'Востриков', N'Василий', N'Дмитриевич', N'89265912891
', N'г. Челябинск, ул.Цинковая 5
', NULL)
INSERT [dbo].[Клиенты] ([Код_клиента], [Фамилия], [Имя], [Отчество], [Телефон], [Адрес], [Email]) VALUES (7, N'Дедюхин', N'Михаил', N'Васильевич', N'89508974394
', N'г. Челябинск, ул. Братьев Кашириных 137
', N'kc29hc0e@yandex.ru
')
INSERT [dbo].[Клиенты] ([Код_клиента], [Фамилия], [Имя], [Отчество], [Телефон], [Адрес], [Email]) VALUES (8, N'Пашнин', N'Алексей', N'Юрьевич', N'89762564947
', N'г. Челябинск, ул.Блюхера 3/В
', N'q4aptu@mail.ru
')
INSERT [dbo].[Клиенты] ([Код_клиента], [Фамилия], [Имя], [Отчество], [Телефон], [Адрес], [Email]) VALUES (9, N'Басыров', N'Артур', N'Азаматович', N'89545251381
', N'г. Златоуст, ул.Качмарская 1
', NULL)
SET IDENTITY_INSERT [dbo].[Клиенты] OFF
GO
SET IDENTITY_INSERT [dbo].[Материалы] ON 

INSERT [dbo].[Материалы] ([Код_материала], [Цена], [Наименование], [Количество_в_остатке], [примечание]) VALUES (1, CAST(1100.00 AS Decimal(18, 2)), N'Грунтовка "Бетоноконтакт"', 1000, N'Вес, кг: 12.1')
INSERT [dbo].[Материалы] ([Код_материала], [Цена], [Наименование], [Количество_в_остатке], [примечание]) VALUES (2, CAST(250.00 AS Decimal(18, 2)), N'Монтажный клей', 200, N'310 мл')
INSERT [dbo].[Материалы] ([Код_материала], [Цена], [Наименование], [Количество_в_остатке], [примечание]) VALUES (3, CAST(9.00 AS Decimal(18, 2)), N'Соединитель потолочных профилей', 3000, N'60х27 мм')
INSERT [dbo].[Материалы] ([Код_материала], [Цена], [Наименование], [Количество_в_остатке], [примечание]) VALUES (6, CAST(7.50 AS Decimal(18, 2)), N'Подвес прямой для потолочного профиля', 3000, N'60х27 мм')
INSERT [dbo].[Материалы] ([Код_материала], [Цена], [Наименование], [Количество_в_остатке], [примечание]) VALUES (7, CAST(263.00 AS Decimal(18, 2)), N'Стяжка пола Bergauf', 523, N'Вес, кг: 12.1')
INSERT [dbo].[Материалы] ([Код_материала], [Цена], [Наименование], [Количество_в_остатке], [примечание]) VALUES (8, CAST(897.00 AS Decimal(18, 2)), N'Эмаль для пола Luxens', 230, N'1.9 кг цвет красное дерево
')
INSERT [dbo].[Материалы] ([Код_материала], [Цена], [Наименование], [Количество_в_остатке], [примечание]) VALUES (9, CAST(399.00 AS Decimal(18, 2)), N'Силиконовый универсальный герметик', 459, N'бесцветный')
INSERT [dbo].[Материалы] ([Код_материала], [Цена], [Наименование], [Количество_в_остатке], [примечание]) VALUES (10, CAST(213.00 AS Decimal(18, 2)), N'Малярный нож', 228, N'металлический корпус')
INSERT [dbo].[Материалы] ([Код_материала], [Цена], [Наименование], [Количество_в_остатке], [примечание]) VALUES (11, CAST(45.00 AS Decimal(18, 2)), N'Плоская кисть', 443, NULL)
INSERT [dbo].[Материалы] ([Код_материала], [Цена], [Наименование], [Количество_в_остатке], [примечание]) VALUES (12, CAST(147.00 AS Decimal(18, 2)), N'Краска для труб', 299, N'Вес, кг: 1')
INSERT [dbo].[Материалы] ([Код_материала], [Цена], [Наименование], [Количество_в_остатке], [примечание]) VALUES (13, CAST(390.00 AS Decimal(18, 2)), N'Штукатурка гипсовая', 598, N'Вес, кг: 30')
INSERT [dbo].[Материалы] ([Код_материала], [Цена], [Наименование], [Количество_в_остатке], [примечание]) VALUES (14, CAST(100.00 AS Decimal(18, 2)), N'Напольный плинтус', 1000, N'2400х82 мм')
INSERT [dbo].[Материалы] ([Код_материала], [Цена], [Наименование], [Количество_в_остатке], [примечание]) VALUES (15, CAST(1390.00 AS Decimal(18, 2)), N'Ламинированная паркетная доска', 4300, N'1215 х 195 х 12 мм')
SET IDENTITY_INSERT [dbo].[Материалы] OFF
GO
SET IDENTITY_INSERT [dbo].[Оказанные_услуги] ON 

INSERT [dbo].[Оказанные_услуги] ([N_пп], [Код_услуги], [Номер_заказа], [Номер_сотрудника], [Количество], [Примечание]) VALUES (2, 5, 1, 4, 1, N'')
INSERT [dbo].[Оказанные_услуги] ([N_пп], [Код_услуги], [Номер_заказа], [Номер_сотрудника], [Количество], [Примечание]) VALUES (3, 13, 3, 5, 10, NULL)
INSERT [dbo].[Оказанные_услуги] ([N_пп], [Код_услуги], [Номер_заказа], [Номер_сотрудника], [Количество], [Примечание]) VALUES (10, 9, 9, 6, 34, NULL)
INSERT [dbo].[Оказанные_услуги] ([N_пп], [Код_услуги], [Номер_заказа], [Номер_сотрудника], [Количество], [Примечание]) VALUES (11, 11, 9, 6, 34, NULL)
INSERT [dbo].[Оказанные_услуги] ([N_пп], [Код_услуги], [Номер_заказа], [Номер_сотрудника], [Количество], [Примечание]) VALUES (12, 2, 4, 3, 25, NULL)
INSERT [dbo].[Оказанные_услуги] ([N_пп], [Код_услуги], [Номер_заказа], [Номер_сотрудника], [Количество], [Примечание]) VALUES (13, 6, 5, 8, 12, NULL)
INSERT [dbo].[Оказанные_услуги] ([N_пп], [Код_услуги], [Номер_заказа], [Номер_сотрудника], [Количество], [Примечание]) VALUES (14, 6, 7, 8, 22, NULL)
INSERT [dbo].[Оказанные_услуги] ([N_пп], [Код_услуги], [Номер_заказа], [Номер_сотрудника], [Количество], [Примечание]) VALUES (15, 10, 6, 7, 3, NULL)
INSERT [dbo].[Оказанные_услуги] ([N_пп], [Код_услуги], [Номер_заказа], [Номер_сотрудника], [Количество], [Примечание]) VALUES (16, 12, 8, 5, 32, NULL)
INSERT [dbo].[Оказанные_услуги] ([N_пп], [Код_услуги], [Номер_заказа], [Номер_сотрудника], [Количество], [Примечание]) VALUES (18, 8, 10, 7, 28, NULL)
INSERT [dbo].[Оказанные_услуги] ([N_пп], [Код_услуги], [Номер_заказа], [Номер_сотрудника], [Количество], [Примечание]) VALUES (19, 13, 11, 7, 6, NULL)
INSERT [dbo].[Оказанные_услуги] ([N_пп], [Код_услуги], [Номер_заказа], [Номер_сотрудника], [Количество], [Примечание]) VALUES (20, 5, 12, 9, 1, NULL)
INSERT [dbo].[Оказанные_услуги] ([N_пп], [Код_услуги], [Номер_заказа], [Номер_сотрудника], [Количество], [Примечание]) VALUES (21, 4, 13, 1, 10, NULL)
INSERT [dbo].[Оказанные_услуги] ([N_пп], [Код_услуги], [Номер_заказа], [Номер_сотрудника], [Количество], [Примечание]) VALUES (22, 12, 11, 4, 6, NULL)
INSERT [dbo].[Оказанные_услуги] ([N_пп], [Код_услуги], [Номер_заказа], [Номер_сотрудника], [Количество], [Примечание]) VALUES (23, 2, 1, 3, 34, N'')
SET IDENTITY_INSERT [dbo].[Оказанные_услуги] OFF
GO
SET IDENTITY_INSERT [dbo].[Сотрудники] ON 

INSERT [dbo].[Сотрудники] ([Номер_сотрудника], [Фамилия], [Имя], [Отчество], [Адрес], [Дата_рождения], [Телефон]) VALUES (1, N'Данилов', N'Елизар', N'Иванович', N'г. Копейск, ул. 8 марта 9
', CAST(N'1975-12-12T00:00:00.000' AS DateTime), N'89603045833
')
INSERT [dbo].[Сотрудники] ([Номер_сотрудника], [Фамилия], [Имя], [Отчество], [Адрес], [Дата_рождения], [Телефон]) VALUES (2, N'Прокофьев', N'Роман', N'Тимурович', N'г. Челябинск, ул.Островского 18
', CAST(N'1977-11-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Сотрудники] ([Номер_сотрудника], [Фамилия], [Имя], [Отчество], [Адрес], [Дата_рождения], [Телефон]) VALUES (3, N'Богданов', N'Арсений', N'Матвеевич', N'поселок Миасское, ул.Егорова 333/Б
', CAST(N'1985-09-12T00:00:00.000' AS DateTime), N'89545251381
')
INSERT [dbo].[Сотрудники] ([Номер_сотрудника], [Фамилия], [Имя], [Отчество], [Адрес], [Дата_рождения], [Телефон]) VALUES (4, N'Соколов', N'Фадей', N'Геннадьевич', N'поселок Миасское, ул.Горького 188 
', CAST(N'1988-03-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Сотрудники] ([Номер_сотрудника], [Фамилия], [Имя], [Отчество], [Адрес], [Дата_рождения], [Телефон]) VALUES (5, N'Захаров', N'Софрон', N'Андреевич', N'г. Копейск, ул. 8 марта 7
', CAST(N'1990-02-13T00:00:00.000' AS DateTime), N'89795452017
')
INSERT [dbo].[Сотрудники] ([Номер_сотрудника], [Фамилия], [Имя], [Отчество], [Адрес], [Дата_рождения], [Телефон]) VALUES (6, N'Тюрин', N'Андрей', N'Анатольевич', N'г. Челябинск, ул.Карла Маркса 8/Б
', CAST(N'1984-05-03T00:00:00.000' AS DateTime), N'89281687288
')
INSERT [dbo].[Сотрудники] ([Номер_сотрудника], [Фамилия], [Имя], [Отчество], [Адрес], [Дата_рождения], [Телефон]) VALUES (7, N'Быкова', N'Эльза', N'Сергеевна', N'г. Копейск, ул.Ленина 98-2
', CAST(N'1986-05-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Сотрудники] ([Номер_сотрудника], [Фамилия], [Имя], [Отчество], [Адрес], [Дата_рождения], [Телефон]) VALUES (8, N'Алевцева', N'Елизавета', N'Олеговна', N'г. Копейск, ул.Ангарская 42/А
', CAST(N'1989-12-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Сотрудники] ([Номер_сотрудника], [Фамилия], [Имя], [Отчество], [Адрес], [Дата_рождения], [Телефон]) VALUES (9, N'Ефимова', N'Елизавета', N'Витальевна', N'г. Копейск, Армейская 16
', CAST(N'1992-02-04T00:00:00.000' AS DateTime), N'89769221281
')
INSERT [dbo].[Сотрудники] ([Номер_сотрудника], [Фамилия], [Имя], [Отчество], [Адрес], [Дата_рождения], [Телефон]) VALUES (11, N'Попов', N'Михаил', N'Михайлович', N'г. Челябинск, ул.Качмарская 1
', CAST(N'1979-10-01T00:00:00.000' AS DateTime), N'89762564947
')
SET IDENTITY_INSERT [dbo].[Сотрудники] OFF
GO
SET IDENTITY_INSERT [dbo].[Услуги] ON 

INSERT [dbo].[Услуги] ([Код_услуги], [Наименование], [Единица_измерения], [Цена_за_единицу_руб]) VALUES (1, N'Демонтаж напольных плинтусов', N'м п.', CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Услуги] ([Код_услуги], [Наименование], [Единица_измерения], [Цена_за_единицу_руб]) VALUES (2, N'Демонтаж старой паркетной доски или ламината', N'м кв.', CAST(90.00 AS Decimal(18, 2)))
INSERT [dbo].[Услуги] ([Код_услуги], [Наименование], [Единица_измерения], [Цена_за_единицу_руб]) VALUES (4, N'Разводка электрики', N'м кв.', CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[Услуги] ([Код_услуги], [Наименование], [Единица_измерения], [Цена_за_единицу_руб]) VALUES (5, N'Окраска труб отопления', N'шт', CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[Услуги] ([Код_услуги], [Наименование], [Единица_измерения], [Цена_за_единицу_руб]) VALUES (6, N'Оклейка стен обоями', N'м кв.', CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Услуги] ([Код_услуги], [Наименование], [Единица_измерения], [Цена_за_единицу_руб]) VALUES (7, N'Очистка стен от обоев', N'м кв.', CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[Услуги] ([Код_услуги], [Наименование], [Единица_измерения], [Цена_за_единицу_руб]) VALUES (8, N'Частичный ремонт стен + шкурка + грунтовка', N'м кв.', CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Услуги] ([Код_услуги], [Наименование], [Единица_измерения], [Цена_за_единицу_руб]) VALUES (9, N'Монтаж напольных плинтус', N'м п.', CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Услуги] ([Код_услуги], [Наименование], [Единица_измерения], [Цена_за_единицу_руб]) VALUES (10, N'Демонтаж + монтаж дверной обналички', N'шт ', CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[Услуги] ([Код_услуги], [Наименование], [Единица_измерения], [Цена_за_единицу_руб]) VALUES (11, N'Укладка паркетной доски или ламината', N'м п.', CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Услуги] ([Код_услуги], [Наименование], [Единица_измерения], [Цена_за_единицу_руб]) VALUES (12, N'Грунтование плит перекрытия на 1 слой', N'м кв.', CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Услуги] ([Код_услуги], [Наименование], [Единица_измерения], [Цена_за_единицу_руб]) VALUES (13, N'Штукатурка стен по маякам до 3 см', N'м кв.', CAST(300.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Услуги] OFF
GO
ALTER TABLE [dbo].[Заказы] ADD  CONSTRAINT [DF_Заказы_Дата_заказа]  DEFAULT (getdate()) FOR [Дата_заказа]
GO
ALTER TABLE [dbo].[Заказы] ADD  CONSTRAINT [DF_Заказы_Статус]  DEFAULT ((0)) FOR [Статус]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD FOREIGN KEY([Код_клиента])
REFERENCES [dbo].[Клиенты] ([Код_клиента])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Использованные_материалы]  WITH CHECK ADD  CONSTRAINT [FK__Использов__Код_м__33D4B598] FOREIGN KEY([Код_м])
REFERENCES [dbo].[Материалы] ([Код_материала])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Использованные_материалы] CHECK CONSTRAINT [FK__Использов__Код_м__33D4B598]
GO
ALTER TABLE [dbo].[Использованные_материалы]  WITH CHECK ADD FOREIGN KEY([Номер_заказа])
REFERENCES [dbo].[Заказы] ([Номер_заказа])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Оказанные_услуги]  WITH CHECK ADD  CONSTRAINT [FK__Оказанные__Код_у__2D27B809] FOREIGN KEY([Код_услуги])
REFERENCES [dbo].[Услуги] ([Код_услуги])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Оказанные_услуги] CHECK CONSTRAINT [FK__Оказанные__Код_у__2D27B809]
GO
ALTER TABLE [dbo].[Оказанные_услуги]  WITH CHECK ADD  CONSTRAINT [FK__Оказанные__Номер__2E1BDC42] FOREIGN KEY([Номер_заказа])
REFERENCES [dbo].[Заказы] ([Номер_заказа])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Оказанные_услуги] CHECK CONSTRAINT [FK__Оказанные__Номер__2E1BDC42]
GO
ALTER TABLE [dbo].[Оказанные_услуги]  WITH CHECK ADD  CONSTRAINT [FK__Оказанные__Номер__2F10007B] FOREIGN KEY([Номер_сотрудника])
REFERENCES [dbo].[Сотрудники] ([Номер_сотрудника])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Оказанные_услуги] CHECK CONSTRAINT [FK__Оказанные__Номер__2F10007B]
GO
USE [master]
GO
ALTER DATABASE [RepairServices] SET  READ_WRITE 
GO
