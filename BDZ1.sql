/*
Вы можете создать пустую базу данных на своем компьютере
и запустить скрипт ниже, решение прилагается в нем же:
*/

USE [BDZ1]
GO
ALTER TABLE [dbo].[Форма_оценки] DROP CONSTRAINT [FK_Форма_оценки_Предметы]
GO
ALTER TABLE [dbo].[Факультеты] DROP CONSTRAINT [FK_Факультеты_Группы]
GO
ALTER TABLE [dbo].[Учебные_планы] DROP CONSTRAINT [FK_Учебные_планы_Факультеты]
GO
ALTER TABLE [dbo].[Учебные_планы] DROP CONSTRAINT [FK_Учебные_планы_Предметы]
GO
ALTER TABLE [dbo].[Успеваемость] DROP CONSTRAINT [FK_Успеваемость_Студенты]
GO
ALTER TABLE [dbo].[Успеваемость] DROP CONSTRAINT [FK_Успеваемость_Предметы]
GO
ALTER TABLE [dbo].[Сотрудники] DROP CONSTRAINT [FK_Сотрудники_Подразделения]
GO
ALTER TABLE [dbo].[Расписание_21-22] DROP CONSTRAINT [FK_Расписание_21-22_Предметы]
GO
ALTER TABLE [dbo].[Расписание_21-22] DROP CONSTRAINT [FK_Расписание_21-22_Персоны]
GO
ALTER TABLE [dbo].[Преподаватели] DROP CONSTRAINT [FK_Преподаватели_Предметы]
GO
ALTER TABLE [dbo].[Преподаватели] DROP CONSTRAINT [FK_Преподаватели_Персоны]
GO
ALTER TABLE [dbo].[Подразделения] DROP CONSTRAINT [FK_Подразделения_Университеты]
GO
ALTER TABLE [dbo].[Персоны] DROP CONSTRAINT [FK_Персоны_Студенты]
GO
ALTER TABLE [dbo].[Персоны] DROP CONSTRAINT [FK_Персоны_Сотрудники]
GO
ALTER TABLE [dbo].[Ответственные_работники] DROP CONSTRAINT [FK_Ответственные_работники_Сотрудники]
GO
ALTER TABLE [dbo].[Ответственные_работники] DROP CONSTRAINT [FK_Ответственные_работники_Подразделения]
GO
ALTER TABLE [dbo].[История_студентов] DROP CONSTRAINT [FK_История_студентов_Студенты]
GO
ALTER TABLE [dbo].[Ведомости_подробно] DROP CONSTRAINT [FK_Ведомости_подробно_Студенты]
GO
ALTER TABLE [dbo].[Ведомости_подробно] DROP CONSTRAINT [FK_Ведомости_подробно_Ведомости]
GO
ALTER TABLE [dbo].[Ведомости] DROP CONSTRAINT [FK_Ведомости_Предметы]
GO
ALTER TABLE [dbo].[Ведомости] DROP CONSTRAINT [FK_Ведомости_Персоны]
GO
/****** Object:  Table [dbo].[Форма_оценки]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Форма_оценки]') AND type in (N'U'))
DROP TABLE [dbo].[Форма_оценки]
GO
/****** Object:  Table [dbo].[Факультеты]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Факультеты]') AND type in (N'U'))
DROP TABLE [dbo].[Факультеты]
GO
/****** Object:  Table [dbo].[Факсы]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Факсы]') AND type in (N'U'))
DROP TABLE [dbo].[Факсы]
GO
/****** Object:  Table [dbo].[Учебные_планы]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Учебные_планы]') AND type in (N'U'))
DROP TABLE [dbo].[Учебные_планы]
GO
/****** Object:  Table [dbo].[Успеваемость]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Успеваемость]') AND type in (N'U'))
DROP TABLE [dbo].[Успеваемость]
GO
/****** Object:  Table [dbo].[Университеты]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Университеты]') AND type in (N'U'))
DROP TABLE [dbo].[Университеты]
GO
/****** Object:  Table [dbo].[Студенты]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Студенты]') AND type in (N'U'))
DROP TABLE [dbo].[Студенты]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Сотрудники]') AND type in (N'U'))
DROP TABLE [dbo].[Сотрудники]
GO
/****** Object:  Table [dbo].[Расписание_21-22]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Расписание_21-22]') AND type in (N'U'))
DROP TABLE [dbo].[Расписание_21-22]
GO
/****** Object:  Table [dbo].[Преподаватели]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Преподаватели]') AND type in (N'U'))
DROP TABLE [dbo].[Преподаватели]
GO
/****** Object:  Table [dbo].[Предметы]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Предметы]') AND type in (N'U'))
DROP TABLE [dbo].[Предметы]
GO
/****** Object:  Table [dbo].[Почта]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Почта]') AND type in (N'U'))
DROP TABLE [dbo].[Почта]
GO
/****** Object:  Table [dbo].[Подразделения]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Подразделения]') AND type in (N'U'))
DROP TABLE [dbo].[Подразделения]
GO
/****** Object:  Table [dbo].[Персоны]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Персоны]') AND type in (N'U'))
DROP TABLE [dbo].[Персоны]
GO
/****** Object:  Table [dbo].[Ответственные_работники]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ответственные_работники]') AND type in (N'U'))
DROP TABLE [dbo].[Ответственные_работники]
GO
/****** Object:  Table [dbo].[Номера_телефонов]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Номера_телефонов]') AND type in (N'U'))
DROP TABLE [dbo].[Номера_телефонов]
GO
/****** Object:  Table [dbo].[История_студентов]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[История_студентов]') AND type in (N'U'))
DROP TABLE [dbo].[История_студентов]
GO
/****** Object:  Table [dbo].[Группы]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Группы]') AND type in (N'U'))
DROP TABLE [dbo].[Группы]
GO
/****** Object:  Table [dbo].[Ведомости_подробно]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ведомости_подробно]') AND type in (N'U'))
DROP TABLE [dbo].[Ведомости_подробно]
GO
/****** Object:  Table [dbo].[Ведомости]    Script Date: 06.11.2022 17:13:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ведомости]') AND type in (N'U'))
DROP TABLE [dbo].[Ведомости]
GO
/****** Object:  Table [dbo].[Ведомости]    Script Date: 06.11.2022 17:13:03 ******/
/*
Таблица Ведомости действительно находится в 3НФ форме:
Оно, очевидно, находится в 1НФ форме, в 2НФ форме - т.к. ключ таблицы Ведомости - атомарный,
а значит никакие данные в ней не зависят от части ключа. Наконец, она находится в 3НФ форме,
т.к. никакой из приведенных в таблице атрибутов не зависит от какого либо другого
неключевого атрибута.

Не лишним было бы здесь сделать триггер на insert: номер семестра не может быть таким, что
преподаватель, отметившийся в ведомости не ведет ни у кого соответствующий предмет во
вносимом семестре. Также, дата сдачи должна укладываться в текущий год. Более того, 
преподаватель должен вести соответствующий предмет.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ведомости](
	[Номер_ведомости] [int] NOT NULL,
	[Преподаватель_Id] [int] NOT NULL,
	[Дата_сдачи] [date] NULL,
	[Номер_семестра] [int] NULL,
	[Название_предмета] [nvarchar](100) NULL,
 CONSTRAINT [PK_Ведомости_подробно] PRIMARY KEY CLUSTERED 
(
	[Номер_ведомости] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ведомости_подробно]    Script Date: 06.11.2022 17:13:03 ******/
/*
Необходимость в таблице Ведомости_подробно возникла как раз-таки из-за приведения таблицы Ведомости
в 3НФ. Ясно, что таблица Ведомости_подробно находится в 1НФ форме, а также что она в 2НФ форме: ни
оценка студента, ни попытка сдачи студентом не зависят только лишь от студента (у студента могут 
быть разные оценки по разным экзаменам или пересдача по одному предмету, но закрытый досрок по 
другому) или только лишь от номера ведомости, в которой хранится соответствующая информация (в одну 
ведомость могу тбыть внесены студенты с разными оценками, или получившие изначально пересдачу на 
досроке). Наконец, данная таблица также находится и в 3НФ. Действительно, попытка сдачи не зависит
от оценки, а оценка - от попытки сдачи, значит, и транзитивных зависимостей быть не может.

Не лишним было бы здесь сделать триггер на insert: студент должен обучаться в соответствующем в
таблице ведомости семестре, а также в учебном плане его факультета должен находиться сдаваемый предмет.
Оценка, очевидно, должна соответствовать форме оценки из таблицы Предметы. Наконец, самый сложный тут
триггер должен состоять в том, что попытка сдачи студентом должна коррелировать с реальной расстановкой
дел: она должна быть минимальной по всем сдачам соответствующего предмета.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ведомости_подробно](
	[Номер_ведомости] [int] NOT NULL,
	[Студент_Id] [int] NOT NULL,
	[Оценка] [nvarchar](50) NULL,
	[Попытка_сдачи] [int] NULL,
 CONSTRAINT [PK_Ведомости] PRIMARY KEY CLUSTERED 
(
	[Номер_ведомости] ASC,
	[Студент_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Группы]    Script Date: 06.11.2022 17:13:03 ******/
/*
Очевидно, что данная таблице находится в 1НФ, 2НФ, а также в 3НФ, ведь никаких транзитивных зависимостей,
в силу того, что мы имеем лишь два поля, одно из которых подчинено другому - ключевому полю.

Триггеры на insert здесь не требуются.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Группы](
	[Факультет_Id] [int] NOT NULL,
	[Номер_группы] [int] NULL,
 CONSTRAINT [PK_Группы] PRIMARY KEY CLUSTERED 
(
	[Факультет_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[История_студентов]    Script Date: 06.11.2022 17:13:03 ******/
/*
Очевидно, таблица находится в 1НФ, а также в 2НФ, ведь номер группы студента зависит в такой таблице
не только от самого студента, но теперь уже и от даты, ведь он мог перевестись. Также таблица находится
и в 3НФ, ведь подчиненных атрибутов, кроме номера группы, здесь попросту нет, а значит и транзитивных
зависимостей здесь тоже быть не может.

Не лишним было бы здесь сделать триггер на insert: дата должна соответствовать текущему году, а также
новый номер группы студента должен соответствовать номерам группы факультета, на котором он учится.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[История_студентов](
	[Студент_Id] [int] NOT NULL,
	[Номер_группы] [int] NULL,
	[Дата] [date] NOT NULL,
 CONSTRAINT [PK_История_студентов] PRIMARY KEY CLUSTERED 
(
	[Студент_Id] ASC,
	[Дата] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Номера_телефонов]    Script Date: 06.11.2022 17:13:03 ******/
/*
Данная таблица является типичным примером таблиц, сопоставляющих многое ко многим, и как следствие,
является 3НФ.

Триггеры на insert здесь не понадобятся.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Номера_телефонов](
	[Телефон_Id] [int] NOT NULL,
	[Номер_телефона] [nvarchar](14) NOT NULL,
 CONSTRAINT [PK_Номера_телефонов_1] PRIMARY KEY CLUSTERED 
(
	[Номер_телефона] ASC,
	[Телефон_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ответственные_работники]    Script Date: 06.11.2022 17:13:03 ******/
/*
Очевидно, данная таблица находится в 1НФ, а также в 2НФ. В 3НФ таблица находится
потому что телефон, рабочие часы и т.д. у ответственного работника исключительно
свои, не подчиняющиеся подразделению, в котором он работает. Отсутствие остальных
транхитивных зависимостей очевидно.

Триггеры на insert здесь не понадобятся.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ответственные_работники](
	[Персона_Id] [int] NOT NULL,
	[Подразделение_Id] [int] NOT NULL,
	[Телефон_Id] [int] NULL,
	[Рабочие_часы] [nvarchar](50) NULL,
	[Почта_Id] [int] NULL,
	[Факс_Id] [nvarchar](50) NULL,
 CONSTRAINT [PK_Ответственные_работники_1] PRIMARY KEY CLUSTERED 
(
	[Персона_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Персоны]    Script Date: 06.11.2022 17:13:03 ******/
/*
Данная таблица является просто сводной таблицей данных по данному Id, и
очевидно что она находится в 3НФ. Также, необходимости в триггерах на эту
таблицу тоже быть не может.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Персоны](
	[Персона_Id] [int] NOT NULL,
	[Имя] [nvarchar](50) NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Дата_рождения] [date] NULL,
	[Учёное_звание] [nvarchar](100) NULL,
	[Учёная_степень] [nvarchar](100) NULL,
 CONSTRAINT [PK_Персоны] PRIMARY KEY CLUSTERED 
(
	[Персона_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Подразделения]    Script Date: 06.11.2022 17:13:03 ******/
/*
Очевидно, что таблица находится в 1НФ и в 2НФ. Также, она находится в 3НФ.
Действительно, единственные претенденты на основание транзитивной зависимости -
атрибуты университет_Id и   физический_адрес. Но ни один неключевой атрибут
не может зависеть исключительно от университет_Id, т.к. например не всегда
кафедры располагаются там же, где и интститут. Аналогично, ни один неключевой
атрибут не будет зависеть от физический_адрес в исключительности, ведь часто
бывает например так, что несколько кафедр расположены по одному и тому же
физическому адресу.

Не лишним здесь будет создать триггеры на insert: вносимые почта_Id, телефон_Id
и т.д. должны находиться в таблице многое-ко-многим Номера телефонов, и т.д.
Реализовать хочется именно таким образом, чтобы каждому держателю телефона, почты
и т.д. присваивался его телефонный или прочий Id, по которому в дальнейшем
восстанавливался из соответствующих таблиц весь набор телефонов, почтовых адресов
и т.д. При такой реализации сослаться на таблицу телефонных номеров, например,
не получится, и единственный выход из такой ситуации - написание несложного триггера
на insert.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Подразделения](
	[Подразделение_Id] [int] NOT NULL,
	[Университет_Id] [int] NOT NULL,
	[Название] [nvarchar](200) NULL,
	[Физический_адрес] [nvarchar](200) NULL,
	[Рабочие_часы] [nvarchar](50) NULL,
	[Почта_Id] [nchar](10) NULL,
	[Телефон_Id] [nchar](10) NULL,
	[Факс_Id] [nchar](10) NULL,
 CONSTRAINT [PK_Подразделения_1] PRIMARY KEY CLUSTERED 
(
	[Подразделение_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Почта]    Script Date: 06.11.2022 17:13:03 ******/
/*
Данная таблица является просто сводной таблицей данных по данному Id в формате 
многое ко многим, так что очевидно что она находится в 3НФ. Также, необходимости в 
триггерах на эту таблицу тоже быть не может.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Почта](
	[Почта_Id] [int] NOT NULL,
	[Почта] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Почта_1] PRIMARY KEY CLUSTERED 
(
	[Почта] ASC,
	[Почта_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Предметы]    Script Date: 06.11.2022 17:13:03 ******/
/*
Данная таблица является просто сводной таблицей данных по данному Id, и
очевидно что она находится в 3НФ. Также, необходимости в триггерах на эту
таблицу тоже быть не может. Остается только добавить, что устанавливать
внешний ключ из Кафедра_Id на Подразделение_Id в таблице Подразделения
некорректно - ярким примером, не относящимся к кафедре напрямую (ну или
относящимся несколько опосредовано) является настоящий курс, ведет который
не определенная кафедра или подразделение, а сторонняя организация. Таким
организациям, например, можно присваивать Кафедра_Id = 0.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Предметы](
	[Название_предмета] [nvarchar](100) NOT NULL,
	[Количество_часов_лекций] [int] NULL,
	[Количество_часов_семинаров] [int] NULL,
	[Кафедра_Id] [int] NULL,
 CONSTRAINT [PK_Предметы] PRIMARY KEY CLUSTERED 
(
	[Название_предмета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Преподаватели]    Script Date: 06.11.2022 17:13:03 ******/
/*
Эта таблица - типичный пример таблицы многое-ко-многим, она очевидно находится в 3НФ, а
также к ней не нужно писать никаких триггеров, ведь внешние ссылки уже поддерживают те
необходимые связи, которые она требует.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Преподаватели](
	[Преподаватель_Id] [int] NOT NULL,
	[Название_предмета] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Преподаватели] PRIMARY KEY CLUSTERED 
(
	[Преподаватель_Id] ASC,
	[Название_предмета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Расписание_21-22]    Script Date: 06.11.2022 17:13:03 ******/
/*
Данная таблица очевидно имеет 3НФ, коль скоро первичный ключ выбран в ней корректно,
последнее при этом полностью очевидно. 

Не лишним будет записать триггеры на insert: номер семестра не может быть 
произвольным целым числом, он может принимать значение от 1 до 12 (вроде
мы можем реализовать здесь магистратуру тоже), а также номер группы
не может не содержаться в таблице Группы хотя бы для какого-то из факультетов.
Также, необходимо проверить, что преподаватель с id=преподаватель_id действительно
ведет заявленный предмет, и что этот предмет содержится в учебном плане
факультета данный группы, соответствующему именно данному семестру.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Расписание_21-22](
	[Номер_группы] [int] NOT NULL,
	[Номер_семестра] [int] NOT NULL,
	[Название_предмета] [nvarchar](100) NOT NULL,
	[Преподаватель_Id] [int] NOT NULL,
 CONSTRAINT [PK_Расписание_21-22] PRIMARY KEY CLUSTERED 
(
	[Номер_группы] ASC,
	[Название_предмета] ASC,
	[Номер_семестра] ASC,
	[Преподаватель_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 06.11.2022 17:13:03 ******/
/*
Ясно, что данная таблица находится в 1НФ и в 2Нф. То, что она находится в 3НФ можно объяснить так:
подразделение не зависит от должности (банально это могут быть ректораты разных вузов), как и 
должность целиком не определяется подразделением (в одном подразделении могут иметься 
разные должности). Значит, транзитивных зависимостей быть не может и мы имеем 3НФ.

Триггеры здесь не понадобятся, всю ссылочную целостность обеспечивают внешние ссылки.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[Сотрудник_Id] [int] NOT NULL,
	[Должность] [nvarchar](50) NULL,
	[Подразделение_Id] [int] NOT NULL,
 CONSTRAINT [PK_Работники] PRIMARY KEY CLUSTERED 
(
	[Сотрудник_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Студенты]    Script Date: 06.11.2022 17:13:03 ******/
/*
Так как первичный ключ атомарный, то таблица находится в 2НФ. Статус обучения студента очевидно
зависит только от самого студента. Факультет, на котором он обучается - также неотъемлемая
характеристика (постоянная в данной модели) самого студента, и только его. Аналогичное
устанавливается и про год поступления. Единственное, что может образовать транзитивную зависимость -
это зависимость номера группы от года поступления и факультета студента, что имеет место в реальности,
однако в нашей модели мы считаем, что это недопустимо, и группы номеруются одинаково из года в год,
вне зависимости от того, в каком году был набран поток. Тогда получаем, что транзитивные зависимости
в тиблице отсутствуют, и мы имеем 3НФ.

Таблица является, как было показано выше, чисто сводной по студенту с данным Id, и триггеры здесь по этой
причине не требуются.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Студенты](
	[Студент_Id] [int] NOT NULL,
	[Номер_группы] [int] NULL,
	[Год_поступления] [int] NULL,
	[Статус_обучения] [nvarchar](50) NULL,
	[Факультет_Id] [int] NULL,
 CONSTRAINT [PK_Студенты] PRIMARY KEY CLUSTERED 
(
	[Студент_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Университеты]    Script Date: 06.11.2022 17:13:03 ******/
/*
Ясно, что данная таблица находится в 1НФ и в 2НФ. Короткое и полное название, очевидно, целиком зависят от
самого университета, и больше не от чего. Аналогичное можно сказать и про юридический адрес. Присвоив
вузу вместо самой почты айди, по которому она будет вычисляться для данного вуза, мы исключили
возможность зависимости почты вуза от его полного или краткого названия, как это часто бывает, таким
образом получая, что ни один неключевой атрибут не может зависеть от другого неключевого атрибута,
и транзитивные зависимости в таблице исключены.

Так как данная таблица является является чисто сводной таблицей по данному вузу, триггеры в ней не нужны.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Университеты](
	[Университет_Id] [int] NOT NULL,
	[Короткое_название] [nvarchar](50) NULL,
	[Полное_название] [nvarchar](200) NULL,
	[Юридический_адрес] [nvarchar](200) NOT NULL,
	[Почта_Id] [int] NULL,
 CONSTRAINT [PK_Университеты_Юр_адреса] PRIMARY KEY CLUSTERED 
(
	[Университет_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Успеваемость]    Script Date: 06.11.2022 17:13:03 ******/
/*
Ясно, что данная таблица находится в 1НФ. Она также находится в 2НФ, так как оценка,
полученная студентом, зависит не только от него самого , но и от конкретного предмета
(у студента может быть одна оценка по одному, и другая по другому..), аналогично и в
обратную сторону. Далее, попытки сдачи у данного студента могут различаться для двух
разных предметов, в обратную сторону аналогично. С датой рассуждения похожие. Наконец,
номер ведомости может быть у одного студента разный по двум разным предметам, как и разный
по одному предмету у двух разных студентов (студенты сдавали разным преподавателям).
Таблица также находится в 3НФ, так как ни один неключевой атрибут не зависит от другого
неключевого. 

Вообще, эта таблица наверное собирается запросом, компанующим ее из таблицы Ведомости,
но если по некоторым причинам требуется вносить данные вручную, то:

Не лишним будет здесь написать триггер на insert:
Во-первых, попытка сдачи должна состоять хоть в одной Ведомости_подробно, соответствующей 
данному студенту, сдающему данный предмет в таблице Ведомости, причем эта попытка должна
иметь максимальное число, так как мы должны оторажать самую позднюю попытку сдачи в успеваемости.
Далее, оценка проставленная в успеваемости должна соответствовать позднейшей сдаче. Наконец,
номер ведомости должен соответствовать также позднейшей сдаче, а дата не выходить за пределы
текущего года.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Успеваемость](
	[Студент_Id] [int] NOT NULL,
	[Название_предмета] [nvarchar](100) NOT NULL,
	[Оценка] [nvarchar](50) NULL,
	[Попытка_сдачи] [int] NULL,
	[Дата] [date] NULL,
	[Номер_ведомости] [int] NULL,
 CONSTRAINT [PK_Успеваемость] PRIMARY KEY CLUSTERED 
(
	[Студент_Id] ASC,
	[Название_предмета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Учебные_планы]    Script Date: 06.11.2022 17:13:03 ******/
/*
Ясно, что данная таблица находится в 1НФ. Также она находится в 2НФ. Действительно, ясно
что форма оценки не зависит исключительно от факультета, названия предмета или от семестра.
Также ясно, что если исключить факультет из этих трех атрибутов, то зависимость будет
неполная, ведь у разных факультетов может быть разная отчетность по одному и тому же
предмету в одном и том же семестре. Если исключить семестр, то получаем, что в одном и том
же факультете один и тот же предмет сдается одинаково в разных семестрах, что не так, как
можно понять на примере УрМат-ов или Диффуров. Наконец, исключать название также из этой
тройки нельзя, ведь тогда получаем что на одном факультете в одном семестре все предметы
имеют одинаковую отчетность, что тоже не так. Итого, вся тройка ключевых атрибутов необходима,
и таблица в 2НФ. То, что она в 3НФ уже очевидно - у нее только один неключевой атрибут, и
транзитивных зависимостей по этой причине возникнуть не может.

Единственный триггер который необходимо установить здесь на insert -- триггер, который проверяет
что такая форма оценивания действительно имеет место быть, обращаться при этом она должна к таблице 
Форма оценивания.
Никакие другие триггеры здесь уже не нужны, так как таблица содержит информацию, которая не может противоречить
никакой другой, так как в некотором смысле является исходной для всех прочих - это с ней должны
сверяться остальные таблицы при внесении противоречивых данных. Ранее такое свойство мы называли
в решении сводной таблицей, содержащей чистые данные, которые не могут войти в противоречие с другими.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Учебные_планы](
	[Факультет_Id] [int] NOT NULL,
	[Название_предмета] [nvarchar](100) NOT NULL,
	[Номер_семестра] [int] NOT NULL,
	[Форма_оценки] [nvarchar](50) NULL,
 CONSTRAINT [PK_Учебные_планы] PRIMARY KEY CLUSTERED 
(
	[Факультет_Id] ASC,
	[Название_предмета] ASC,
	[Номер_семестра] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Факсы]    Script Date: 06.11.2022 17:13:03 ******/
/*
Как и в случае с таблицей Номера_телефонов, или Почта, данная таблица является типичным примером 
таблиц, сопоставляющих многое ко многим, и как следствие, является 3НФ.

Триггеры на insert здесь не понадобятся.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Факсы](
	[Факс_Id] [int] NOT NULL,
	[Факс] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Факсы_1] PRIMARY KEY CLUSTERED 
(
	[Факс] ASC,
	[Факс_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Факультеты]    Script Date: 06.11.2022 17:13:03 ******/
/*
Данная таблица очевидно находится в 3НФ, так как представляет из себя ни что иное как сопоставление
кодировки факультета с его названием.

Очевидно, триггеры на insert здесь никакие не нужны.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Факультеты](
	[Факультет_Id] [int] NOT NULL,
	[Название_факультета] [nvarchar](100) NULL,
 CONSTRAINT [PK_Факультеты_1] PRIMARY KEY CLUSTERED 
(
	[Факультет_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Форма_оценки]    Script Date: 06.11.2022 17:13:03 ******/
/*
Ясно, что данная таблица является таблицей в 1НФ. Форма оценки не одинаковая для всех
предметов данного семестра, как и не одинаковая для всех семестров при данном предмете
(обсуждалось ранее), а значит единственный неключевой в таблице атрибут всецело зависит 
от составного ключа, следовательно таблица в 2НФ. В 3НФ она находится просто потому, что
неключевой атрибут всего один, и транзитивным зависимостям просто неоткуда взяться.

Информация приведенная в данной таблице просто не может быть противоречивой: пусть даже
у данного курса нет предмета, описываемого для этого курса в таблице, форму отчетности как, 
например, запас на будущее, все равно можно предъявить. Стало быть, триггеры тут излишни.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Форма_оценки](
	[Номер_семестра] [int] NOT NULL,
	[Название_предмета] [nvarchar](100) NOT NULL,
	[Форма_оценки] [nvarchar](50) NULL,
 CONSTRAINT [PK_Успеваемость_подробно] PRIMARY KEY CLUSTERED 
(
	[Номер_семестра] ASC,
	[Название_предмета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ведомости]  WITH CHECK ADD  CONSTRAINT [FK_Ведомости_Персоны] FOREIGN KEY([Преподаватель_Id])
REFERENCES [dbo].[Персоны] ([Персона_Id])
GO
ALTER TABLE [dbo].[Ведомости] CHECK CONSTRAINT [FK_Ведомости_Персоны]
GO
ALTER TABLE [dbo].[Ведомости]  WITH CHECK ADD  CONSTRAINT [FK_Ведомости_Предметы] FOREIGN KEY([Название_предмета])
REFERENCES [dbo].[Предметы] ([Название_предмета])
GO
ALTER TABLE [dbo].[Ведомости] CHECK CONSTRAINT [FK_Ведомости_Предметы]
GO
ALTER TABLE [dbo].[Ведомости_подробно]  WITH CHECK ADD  CONSTRAINT [FK_Ведомости_подробно_Ведомости] FOREIGN KEY([Номер_ведомости])
REFERENCES [dbo].[Ведомости] ([Номер_ведомости])
GO
ALTER TABLE [dbo].[Ведомости_подробно] CHECK CONSTRAINT [FK_Ведомости_подробно_Ведомости]
GO
ALTER TABLE [dbo].[Ведомости_подробно]  WITH CHECK ADD  CONSTRAINT [FK_Ведомости_подробно_Студенты] FOREIGN KEY([Студент_Id])
REFERENCES [dbo].[Студенты] ([Студент_Id])
GO
ALTER TABLE [dbo].[Ведомости_подробно] CHECK CONSTRAINT [FK_Ведомости_подробно_Студенты]
GO
ALTER TABLE [dbo].[История_студентов]  WITH CHECK ADD  CONSTRAINT [FK_История_студентов_Студенты] FOREIGN KEY([Студент_Id])
REFERENCES [dbo].[Студенты] ([Студент_Id])
GO
ALTER TABLE [dbo].[История_студентов] CHECK CONSTRAINT [FK_История_студентов_Студенты]
GO
ALTER TABLE [dbo].[Ответственные_работники]  WITH CHECK ADD  CONSTRAINT [FK_Ответственные_работники_Подразделения] FOREIGN KEY([Подразделение_Id])
REFERENCES [dbo].[Подразделения] ([Подразделение_Id])
GO
ALTER TABLE [dbo].[Ответственные_работники] CHECK CONSTRAINT [FK_Ответственные_работники_Подразделения]
GO
ALTER TABLE [dbo].[Ответственные_работники]  WITH CHECK ADD  CONSTRAINT [FK_Ответственные_работники_Сотрудники] FOREIGN KEY([Персона_Id])
REFERENCES [dbo].[Сотрудники] ([Сотрудник_Id])
GO
ALTER TABLE [dbo].[Ответственные_работники] CHECK CONSTRAINT [FK_Ответственные_работники_Сотрудники]
GO
ALTER TABLE [dbo].[Персоны]  WITH CHECK ADD  CONSTRAINT [FK_Персоны_Сотрудники] FOREIGN KEY([Персона_Id])
REFERENCES [dbo].[Сотрудники] ([Сотрудник_Id])
GO
ALTER TABLE [dbo].[Персоны] CHECK CONSTRAINT [FK_Персоны_Сотрудники]
GO
ALTER TABLE [dbo].[Персоны]  WITH CHECK ADD  CONSTRAINT [FK_Персоны_Студенты] FOREIGN KEY([Персона_Id])
REFERENCES [dbo].[Студенты] ([Студент_Id])
GO
ALTER TABLE [dbo].[Персоны] CHECK CONSTRAINT [FK_Персоны_Студенты]
GO
ALTER TABLE [dbo].[Подразделения]  WITH CHECK ADD  CONSTRAINT [FK_Подразделения_Университеты] FOREIGN KEY([Университет_Id])
REFERENCES [dbo].[Университеты] ([Университет_Id])
GO
ALTER TABLE [dbo].[Подразделения] CHECK CONSTRAINT [FK_Подразделения_Университеты]
GO
ALTER TABLE [dbo].[Преподаватели]  WITH CHECK ADD  CONSTRAINT [FK_Преподаватели_Персоны] FOREIGN KEY([Преподаватель_Id])
REFERENCES [dbo].[Персоны] ([Персона_Id])
GO
ALTER TABLE [dbo].[Преподаватели] CHECK CONSTRAINT [FK_Преподаватели_Персоны]
GO
ALTER TABLE [dbo].[Преподаватели]  WITH CHECK ADD  CONSTRAINT [FK_Преподаватели_Предметы] FOREIGN KEY([Название_предмета])
REFERENCES [dbo].[Предметы] ([Название_предмета])
GO
ALTER TABLE [dbo].[Преподаватели] CHECK CONSTRAINT [FK_Преподаватели_Предметы]
GO
ALTER TABLE [dbo].[Расписание_21-22]  WITH CHECK ADD  CONSTRAINT [FK_Расписание_21-22_Персоны] FOREIGN KEY([Преподаватель_Id])
REFERENCES [dbo].[Персоны] ([Персона_Id])
GO
ALTER TABLE [dbo].[Расписание_21-22] CHECK CONSTRAINT [FK_Расписание_21-22_Персоны]
GO
ALTER TABLE [dbo].[Расписание_21-22]  WITH CHECK ADD  CONSTRAINT [FK_Расписание_21-22_Предметы] FOREIGN KEY([Название_предмета])
REFERENCES [dbo].[Предметы] ([Название_предмета])
GO
ALTER TABLE [dbo].[Расписание_21-22] CHECK CONSTRAINT [FK_Расписание_21-22_Предметы]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Подразделения] FOREIGN KEY([Подразделение_Id])
REFERENCES [dbo].[Подразделения] ([Подразделение_Id])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Подразделения]
GO
ALTER TABLE [dbo].[Успеваемость]  WITH CHECK ADD  CONSTRAINT [FK_Успеваемость_Предметы] FOREIGN KEY([Название_предмета])
REFERENCES [dbo].[Предметы] ([Название_предмета])
GO
ALTER TABLE [dbo].[Успеваемость] CHECK CONSTRAINT [FK_Успеваемость_Предметы]
GO
ALTER TABLE [dbo].[Успеваемость]  WITH CHECK ADD  CONSTRAINT [FK_Успеваемость_Студенты] FOREIGN KEY([Студент_Id])
REFERENCES [dbo].[Студенты] ([Студент_Id])
GO
ALTER TABLE [dbo].[Успеваемость] CHECK CONSTRAINT [FK_Успеваемость_Студенты]
GO
ALTER TABLE [dbo].[Учебные_планы]  WITH CHECK ADD  CONSTRAINT [FK_Учебные_планы_Предметы] FOREIGN KEY([Название_предмета])
REFERENCES [dbo].[Предметы] ([Название_предмета])
GO
ALTER TABLE [dbo].[Учебные_планы] CHECK CONSTRAINT [FK_Учебные_планы_Предметы]
GO
ALTER TABLE [dbo].[Учебные_планы]  WITH CHECK ADD  CONSTRAINT [FK_Учебные_планы_Факультеты] FOREIGN KEY([Факультет_Id])
REFERENCES [dbo].[Факультеты] ([Факультет_Id])
GO
ALTER TABLE [dbo].[Учебные_планы] CHECK CONSTRAINT [FK_Учебные_планы_Факультеты]
GO
ALTER TABLE [dbo].[Факультеты]  WITH CHECK ADD  CONSTRAINT [FK_Факультеты_Группы] FOREIGN KEY([Факультет_Id])
REFERENCES [dbo].[Группы] ([Факультет_Id])
GO
ALTER TABLE [dbo].[Факультеты] CHECK CONSTRAINT [FK_Факультеты_Группы]
GO
ALTER TABLE [dbo].[Форма_оценки]  WITH CHECK ADD  CONSTRAINT [FK_Форма_оценки_Предметы] FOREIGN KEY([Название_предмета])
REFERENCES [dbo].[Предметы] ([Название_предмета])
GO
ALTER TABLE [dbo].[Форма_оценки] CHECK CONSTRAINT [FK_Форма_оценки_Предметы]
GO
