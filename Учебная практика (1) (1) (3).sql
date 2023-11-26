Use Practicaycheb
--ЛАБКА 2
CREATE DATABASE Practicaycheba
CREATE TABLE Academiki (
    ID_Academiki INT PRIMARY KEY,
    Name NVARCHAR(100),
    HB DATE,
    Spec VARCHAR(50),
    Years_Zvan INT
);
INSERT INTO Academiki (ID_Academiki, Name, HB, Spec, Years_Zvan)
VALUES
    (1, 'Аничков Николай Николаевич', '1885-11-03', 'медицина', 1939),
    (2, 'Бартольд Василий Владимирович', '1869-11-15', 'историк', 1913),
    (3, 'Белопольский Аристарх Аполлонович', '1854-07-13', 'астрофизик', 1903),
    (4, 'Бородин Иван Парфеньевич', '1847-01-30', 'ботаник', 1902),
    (5, 'Вальден Павел Иванович', '1863-07-26', 'химик-технолог', 1910),
    (6, 'Вернадский Владимир Иванович', '1863-03-12', 'геохимик', 1908),
    (7, 'Виноградов Павел Гаврилович', '1854-11-30', 'историк', 1914),
    (8, 'Ипатьев Владимир Николаевич', '1867-11-21', 'химик', 1916),
    (9, 'Истрин Василий Михайлович', '1865-02-22', 'филолог', 1907),
    (10, 'Карпинский Александр Петрович', '1847-01-07', 'геолог', 1889),
    (11, 'Коковцов Павел Константинович', '1861-07-01', 'историк', 1906),
    (12, 'Курнаков Николай Семёнович', '1860-12-06', 'химик', 1913),
    (13, 'Марр Николай Яковлевич', '1865-01-06', 'лингвист', 1912),
    (14, 'Насонов Николай Викторович', '1855-02-26', 'зоолог', 1906),
    (15, 'Ольденбург Сергей Фёдорович', '1863-09-26', 'историк', 1903),
    (16, 'Павлов Иван Петрович', '1849-09-26', 'физиолог', 1907),
    (17, 'Перетц Владимир Николаевич', '1870-01-31', 'филолог', 1914),
    (18, 'Соболевский Алексей Иванович', '1857-01-07', 'лингвист', 1900),
    (19, 'Стеклов Владимир Андреевич', '1864-01-09', 'математик', 1912);
--1.Вывести ФИО, специализацию и дату рождения всех академиков
SELECT Name,Spec,HB
FROM Academiki
--2.Создать вычисляемое поле «О присвоении звания», которое содержит информацию об академиках
--в виде: «Петров Петр Петрович получил звание в 1974».
SELECT 
Name +' получил звание в ' + Years_Zvan AS звание
FROM Academiki
--3.Вывести ФИО академиков и вычисляемое поле «Через 5 лет после присвоения звания».
SELECT Name, [Через 5 лет] = Years_Zvan + 5
FROM Academiki
-- 4.Вывести список годов присвоения званий, убрав дубликаты.
SELECT DISTINCT Years_Zvan
FROM Academiki
--5.	Вывести список академиков, отсортированный по убыванию даты рождения.
 SELECT *
 FROM Academiki
 order by HB DESC
--6.	Вывести список академиков, отсортированный в обратном алфавитном порядке специализаций, 
--по убыванию года присвоения звания, и в алфавитном порядке ФИО.
SELECT * 
FROM Academiki
ORDER BY Years_Zvan DESC, Spec DESC, Name ASC
--7.	Вывести первую строку из списка академиков, отсортированного в обратном ал-фавитном порядке ФИО.
SELECT TOP 1
*
FROM Academiki
ORDER BY Name DESC
--8.	Вывести фамилию академика, который раньше всех получил звание.
SELECT TOP 1
*
FROM Academiki
ORDER BY Years_Zvan DESC

--9.	Вывести первые 10% строк из списка академиков, отсортированного в алфавитном порядке ФИО.
SELECT TOP 10 PERCENT
*
FROM Academiki
ORDER BY Name

--10.	Вывести из таблицы «Академики», отсортированной по возрастанию года присво-ения звания,
--список академиков, у которых год присвоения звания – один из первых пяти в отсортированной таблице.
SELECT TOP 5 WITH TIES
*
FROM Academiki
ORDER BY Years_Zvan

--11.	Вывести, начиная с десятого, список академиков, отсортированный по возраста-нию даты рождения.
SELECT 
*
FROM Academiki
ORDER BY Name OFFSET 9 ROWS

--12.	Вывести девятую и десятую строку из списка академиков, отсортированного в ал-фавитном порядке ФИО.
SELECT 
*
FROM Academiki
ORDER BY NAME OFFSET 8 ROWS FETCH NEXT 2 ROWS ONLY

--ЛАБКА 3 
CREATE TABLE Country (
	ID_Country int PRIMARY KEY, 
  Name NVARCHAR(100),
  Capital NVARCHAR(100),
  Square INT,
  Population INT,
  Continent NVARCHAR(50)
);

INSERT INTO Country (ID_Country, Name, Capital, Square, Population,  Continent) VALUES
  (1, 'Австрия', 'Вена', 83858, 8741753, 'Европа'),
  (2, 'Азербайджан', 'Баку', 86600, 9705600, 'Азия'),
  (3, 'Албания', 'Тирана', 28748, 2866026, 'Европа'),
  (4, 'Алжир', 'Алжир', 2381740, 39813722, 'Африка'),
  (5, 'Ангола', 'Луанда', 1246700, 25831000, 'Африка'),
  (6, 'Аргентина', 'Буэнос-Айрес', 2766890, 43847000, 'Южная Америка'),
  (7, 'Афганистан', 'Кабул', 647500, 29822848, 'Азия'),
  (8, 'Бангладеш', 'Дакка', 144000, 160221000, 'Азия'),
  (9,  'Бахрейн', 'Манама', 701, 1397000, 'Азия'),
  (10,'Белиз', 'Бельмопан', 22966, 377968, 'Северная Америка'),
  ( 11, 'Белоруссия', 'Минск', 207595, 9498400, 'Европа'),
  (12, 'Бельгия', 'Брюссель', 30528, 11250585, 'Европа'),
  (13, 'Бенин', 'Порто-Ново', 112620, 11167000, 'Африка'),
  (14, 'Болгария', 'София', 110910, 7153784, 'Европа'),
  (15, 'Боливия', 'Сукре', 1098580, 10985059, 'Южная Америка'),
  (16,'Ботсвана', 'Габороне', 600370, 2209208, 'Африка'),
  ( 17, 'Бразилия', 'Бразилиа', 8511965, 206081432, 'Южная Америка'),
  (18,'Буркина-Фасо', 'Уагадугу', 274200, 19034397, 'Африка'),
  (19, 'Бутан', 'Тхимпху', 47000, 784000, 'Азия'),
  (20, 'Великобритания', 'Лондон', 244820, 65341183, 'Европа'),
  (21, 'Венгрия', 'Будапешт', 93030, 9830485, 'Европа'),
  (22, 'Венесуэла', 'Каракас', 912050, 31028637, 'Южная Америка'),
  (23, 'Восточный Тимор', 'Дили', 14874, 1167242, 'Азия'),
  (24, 'Вьетнам', 'Ханой', 329560, 91713300, 'Азия');
--1.	Вывести названия и столицы пяти наибольших стран по площади.
SELECT TOP 5  Name, Capital
FROM Country
ORDER BY Square

--2.	Вывести список африканских стран, население которых не превышает 1 млн. чел.
SELECT *
FROM Country
WHERE
 (Continent ='Африка') AND (Population!>1000000)

--3.	Вывести список стран, население которых больше 5 млн. чел., а площадь меньше

--100	тыс. кв. км, и они расположены не в Европе.
SELECT *
FROM Country
WHERE (Population>5000000) AND (Square !> 100000) AND (Continent='Европа')

--4.	Вывести список стран Северной и Южной Америки, население которых больше

--20	млн. чел., или стран Африки, у которых население больше 30 млн. чел.
SELECT*
FROM Country
WHERE (Continent='Северная Америка' ) AND (Continent='Южная Америка') AND (Population!>20000000)
OR
(Continent='Африка') AND (Population!>30000000)

--5.	Вывести список стран, население которых составляет от 10 до 100 млн. чел.,
--а пло-щадь не больше 500 тыс. кв. км.
SELECT *
FROM Country
WHERE 
(Population BETWEEN 10000000 AND 100000000)
AND
(Square !> 500000)
--6.	Вывести список стран, названия которых не начинаются с буквы «К».
SELECT*
FROM Country
WHERE Name NOT LIKE 'К%'

--7.	Вывести список стран, в названии которых третья буква – «а», а предпоследняя –

--«и».
SELECT *
FROM Country
WHERE Name LIKE '__а%и'

--8.	Вывести список стран, в названии которых вторая буква – гласная.
SELECT *
FROM Country
WHERE Name LIKE '_[у,е,ы,а,о,э,я,и,ю,ё]%'

--9.	Вывести список стран, названия которых начинаются с букв от «К» до «П».
SELECT *
FROM Country
WHERE Name LIKE '[К-П]%'

--10.	Вывести список стран, названия которых начинаются с букв от «А» до «Г», но не с буквы «Б».
SELECT *
FROM Country
WHERE Name LIKE '[А-Г]%' AND Name  LIKE '[^Б]%'

--11.	Вывести список стран, столицы которых есть в базе.
SELECT *
FROM Country 
WHERE capital IS NOT NULL

--12.	Вывести список стран Африки, Северной и Южной Америки.
SELECT *
FROM Country
WHERE Continent IN ('Африка','Северная Америка','Южная Америка')

--ЛАБКА 4
-- 1.	Вывести список академиков, отсортированный по количеству символов в ФИО.
SELECT *
FROM Academiki
ORDER BY LEN (Name) 
--2.	Вывести список академиков, убрать лишние пробелы в ФИО.
SELECT 
	TRIM (Name) AS ФИО, HB, Spec, Years_Zvan
FROM Academiki
--3.	Найти позиции «ов» в ФИО каждого академика. Вывести ФИО и номер позиции.
SELECT Name, CHARINDEX ('ов',Name) AS Позиция_ов
FROM Academiki
--4.	Вывести ФИО и последние две буквы специализации для каждого академика.
SELECT Name, RIGHT(Spec, 2) AS Спец_2
FROM Academiki
--5.	Вывести список академиков, ФИО в формате Фамилия и Инициалы.
 SELECT CONCAT (SUBSTRING(Name, CHARINDEX('', Name) + 1, LEN(Name)), ',', LEFT (Name, 1) + '.')
 FROM Academiki
--6.	Вывести список специализаций в правильном и обратном виде. Убрать дубликаты.
SELECT DISTINCT Spec, REVERSE (Spec) AS Спец_Обр
FROM Academiki
--7.	Вывести свою фамилию в одной строке столько раз, сколько вам лет.
SELECT REPLICATE ('Шабаева.Калинина', 18)
--9.	Вывести количество дней до конца семестра.
SELECT DATEDIFF(DAY,'20231110','20231229')

--10.	Вывести количество месяцев от вашего рождения.
SELECT DATEDIFF(MONTH,  '20231110','20240403')
--11.	Вывести ФИО и високосность года рождения каждого академика.
SELECT Name, HB, 
CASE WHEN YEAR(HB) % 4 = 0 AND (YEAR(HB) % 100 <> 0 OR YEAR(HB) % 400 = 0) 
THEN 'Високосный' ELSE 'НЕТ' 
END AS Leap_Year
FROM Academiki
--12.	Вывести список специализаций без повторений. Для каждой специализации выве-сти «длинный» или «короткий», 
--в зависимости от количества символов.
SELECT DISTINCT Spec,
	CASE
	WHEN LEN(Spec)>6 THEN 'длинный'
	WHEN LEN(Spec)<7 THEN 'короткий'
	END
FROM Academiki


-- ЛАБКА 5

--1.	Вывести минимальную площадь стран.
SELECT MIN (Square) AS Мин_площадь
FROM Country
--2.	Вывести наибольшую по населению страну в Северной и Южной Америке.
SELECT MAX(Population) AS Макс_нас
FROM Country
WHERE Continent BETWEEN 'Северная Америка' AND 'Южная Америка'
--3.	Вывести среднее население стран. Результат округлить до одного знака.
SELECT 
	ROUND(AVG(CAST (Population AS FLOAT)), 1) AS Среднее_население
FROM Country
--4.	Вывести количество стран, у которых название заканчивается на «ан», кроме стран, 
--у которых название заканчивается на «стан».
SELECT 
	COUNT(*) AS Количество
FROM Country
WHERE Name LIKE '%ан' AND Name NOT LIKE '%стан'
--5.	Вывести количество континентов, где есть страны, название которых начинается с
--буквы «Р».
SELECT 
	COUNT(*) AS Количество
FROM Country
WHERE LEFT(Name, 1) = 'Р' 
--6.	Сколько раз страна с наибольшей площадью больше, чем страна с наименьшей площадью?
SELECT 
	MAX(Square) - MIN (Square) AS Разница
FROM Country
--7.	Вывести количество стран с населением больше, чем 100 млн. чел. на каждом кон-тиненте. 
--Результат отсортировать по количеству стран по возрастанию.
SELECT Continent,
	COUNT (*) AS Количество
FROM Country
WHERE Population> 100000000
GROUP BY Continent
ORDER BY Количество 
--8.	Вывести количество стран по количеству букв в названии. Результат отсортировать по убыванию.
SELECT 
	LEN(Name) AS  Количество_букв,
	COUNT (Name) AS Количество_Стран
FROM Country
GROUP BY LEN(Name)
ORDER BY Количество_букв DESC
--9.	Ожидается, что через 20 лет население мира вырастет на 10%.
--Вывести список континентов с прогнозируемым населением:
SELECT Continent, (SUM(Population *1.1)) AS FLOAT
FROM Country
GROUP BY Continent

--10.	Вывести список континентов, где разница по площади между наибольшими и наименьшими странами не более в 10000 раз:
SELECT Continent
FROM Country
GROUP BY Continent
HAVING MAX(CAST(Population AS DECIMAL)) <= 1000 * MIN(CAST(Population AS DECIMAL ))
--11.	Вывести среднюю длину названий Африканских стран.
SELECT AVG(CAST(LEN (Name)AS FLOAT)) AS Среняя_длина
FROM Country
WHERE Continent = 'Африка'
--12.	Вывести список континентов, у которых средняя плотность среди стран с населе-нием более 1 млн. чел. 
--больше, чем 30 чел. на кв. км.
SELECT Continent, AVG (CAST(Population as float)/ Square) as Плотность
FROM Country
WHERE Square > 1000000
GROUP BY Continent
HAVING AVG (CAST(Population as float)/ Square)> 30

--ЛАБКА 6
-- Факультет
CREATE TABLE Faculty (
    Abbreviation VARCHAR(2) PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Faculty (Abbreviation, Name)
VALUES ('Ен', 'Естественные науки'),
       ('Гн', 'Гуманитарные науки'),
       ('Ит', 'Информационные технологии'),
       ('Фм', 'Физико-математический');

--Кафедра
CREATE TABLE Department (
    Code VARCHAR(2) PRIMARY KEY,
    Name VARCHAR(50),
    FacultyAbbreviation VARCHAR(2),
    FOREIGN KEY (FacultyAbbreviation) REFERENCES Faculty (Abbreviation)
);
INSERT INTO Department (Code, Name, FacultyAbbreviation)
VALUES ('вм', 'Высшая математика', 'Ен'),
       ('ис', 'Информационные системы', 'Ит'),
       ('мм', 'Математическое моделирование', 'Фм'),
       ('оф', 'Общая физика', 'Ен'),
       ('пи', 'Прикладная информатика', 'Ит'),
       ('эф', 'Экспериментальная физика', 'Фм');

--  Сотрудник
CREATE TABLE Employee (
    TabNumber INT PRIMARY KEY,
    DepartmentCode VARCHAR(2),
    LastName VARCHAR(50),
    Position VARCHAR(20),
    Salary DECIMAL(10, 2),
    ChiefTabNumber INT,
    FOREIGN KEY (DepartmentCode) REFERENCES Department (Code),
    FOREIGN KEY (ChiefTabNumber) REFERENCES Employee (TabNumber)
);

INSERT INTO Employee (TabNumber, DepartmentCode, LastName, Position, Salary, ChiefTabNumber)
VALUES (101, 'пи', 'Прохоров П.П.', 'зав. кафедрой', 35000.00, 101),
       (102, 'пи', 'Семенов С.С.', 'преподаватель', 25000.00, 101),
       (105, 'пи', 'Петров П.П.', 'преподаватель', 25000.00, 101),
       (153, 'пи', 'Сидорова С.С.', 'инженер', 15000.00, 102),
       (201, 'ис', 'Андреев А.А.', 'зав. кафедрой', 35000.00, 201),
       (202, 'ис', 'Борисов Б.Б.', 'преподаватель', 25000.00, 201),
       (241, 'ис', 'Глухов Г.Г.', 'инженер', 20000.00, 201),
       (242, 'ис', 'Чернов Ч.Ч.', 'инженер', 15000.00, 202),
       (301, 'мм', 'Басов Б.Б.', 'зав. кафедрой', 35000.00, 301),
       (302, 'мм', 'Сергеева С.С.', 'преподаватель', 25000.00, 301),
       (401, 'оф', 'Волков В.В.', 'зав. кафедрой', 35000.00, 401),
       (402, 'оф', 'Зайцев З.З.', 'преподаватель', 25000.00, 401),
       (403, 'оф', 'Смирнов С.С.', 'преподаватель', 15000.00, 401),
       (435, 'оф', 'Лисин Л.Л.', 'инженер', 20000.00, 402),
       (501, 'вм', 'Кузнецов К.К.', 'зав. кафедрой', 35000.00, 501),
       (502, 'вм', 'Романцев Р.Р.', 'преподаватель', 25000.00, 501),
       (503, 'вм', 'Соловьев С.С.', 'преподаватель', 25000.00, 501),
       (601, 'эф', 'Зверев З.З.', 'зав. кафедрой', 35000.00, 601),
       (602, 'эф', 'Сорокина С.С.', 'преподаватель', 25000.00, 601),
       (614, 'эф', 'Григорьев Г.Г.', 'инженер', 20000.00, 602);


-- Специальность
CREATE TABLE Specialization (
    Number VARCHAR(10) NOT NULL PRIMARY KEY,
    Direction VARCHAR(50) NOT NULL,
    Code VARCHAR(10) NOT NULL
);
INSERT INTO Specialization (Number, Direction, Code)
VALUES
    ('01.03.04', 'Прикладная математика', 'мм'),
    ('09.03.02', 'Информационные системы и технологии', 'ис'),
    ('09.03.03', 'Прикладная информатика', 'пи'),
    ('14.03.02', 'Ядерные физика и технологии', 'эф'),
    ('38.03.05', 'Бизнес-информатика', 'ис');


-- Дисциплина
CREATE TABLE Discipline (
    Code INT NOT NULL PRIMARY KEY,
    Volume INT NOT NULL,
    Title VARCHAR(50) NOT NULL,
    Executor VARCHAR(50) NOT NULL
);
INSERT INTO Discipline (Code, Volume, Title, Executor)
VALUES
    (101, 320, 'Математика', 'вм'),
    (102, 160, 'Информатика', 'пи'),
    (103, 160, 'Физика', 'оф'),
    (202, 120, 'Базы данных', 'ис'),
    (204, 160, 'Электроника', 'эф'),
    (205, 80, 'Программирование', 'пи'),
    (209, 80, 'Моделирование', 'мм');


-- Заявка
CREATE TABLE Application (
    Code INT NOT NULL ,
    Number VARCHAR(10) NOT NULL
);
INSERT INTO Application (Code, Number)
VALUES
(101,'01.03.04'),
(205,'01.03.04'),
(209,'01.03.04'),
(101,'09.03.02'),
(102,'09.03.02'),
(103,'09.03.02'),
(202,'09.03.02'),
(205,'09.03.02'),
(209,'09.03.02'),
(101,'09.03.03'),
(102,'09.03.03'),
(103,'09.03.03'),
(202,'09.03.03'),
(205,'09.03.03'),
(101,'14.03.02'),
(102,'14.03.02'),
(103,'14.03.02'),
(204,'14.03.02'),
(101,'38.03.05'),
(103,'38.03.05'),
(202,'38.03.05'),
(209,'38.03.05');

--Зав_кафедрой
CREATE TABLE Department_Request (
    Tab_Number INT NOT NULL,
	Stag INT NOT NULL
);

INSERT INTO Department_Request 
VALUES 
	(101,15),
	(201,18),
	(301,20),
	(401,10),
	(501,18),
	(601,8);

-- Инженер
CREATE TABLE Engineer (
    Tab_Number INT NOT NULL,
    Specialization VARCHAR(50) NOT NULL
);

INSERT INTO Engineer (Tab_Number, Specialization)
VALUES
    (153, 'электроник'),
    (241, 'электроник'),
    (242, 'программист'),
    (435, 'электроник'),
    (614, 'программист');


-- Преподаватель
CREATE TABLE Teacher (
    Tab_Number INT NOT NULL PRIMARY KEY,
    Rang VARCHAR(50) NOT NULL,
    Degree VARCHAR(50) NOT NULL
);

INSERT INTO Teacher (Tab_Number, Rang, Degree)
VALUES
    (101, 'профессор', 'д. т.н.'),
    (102, 'доцент', 'к. ф.-м. н.'),
    (105, 'доцент', 'к. т.н.'),
    (201, 'профессор', 'д. ф.-м. н.'),
    (202, 'доцент', 'к. ф.-м. н.'),
    (301, 'профессор', 'д. т.н.'),
    (302, 'доцент', 'к. т.н.'),
    (401, 'профессор', 'д. т.н.'),
    (402, 'доцент', 'к. т.н.'),
    (403, 'ассистент', '-'),
    (501, 'профессор', 'д. ф.-м. н.'),
    (502, 'профессор', 'д. ф.-м. н.'),
    (503, 'доцент', 'к. ф.-м. н.'),
    (601, 'профессор', 'д. ф.-м. н.')

-- Студент
CREATE TABLE Student (
    Reg_Number INT NOT NULL PRIMARY KEY,
    Number VARCHAR(10) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL
);
INSERT INTO Student (Reg_Number, Number, Last_Name)
VALUES
    (10101, '09.03.03', 'Николаева Н. Н.'),
    (10102, '09.03.03', 'Иванов И. И.'),
    (10103, '09.03.03', 'Крюков К. К.'),
    (20101, '09.03.02', 'Андреев А. А.'),
    (20102, '09.03.02', 'Федоров Ф. Ф.'),
    (30101, '14.03.02', 'Бондаренко Б. Б.'),
    (30102, '14.03.02', 'Цветков К. К.'),
    (30103, '14.03.02', 'Петров П. П.'),
    (50101, '01.03.04', 'Сергеев С. С.'),
    (50102, '01.03.04', 'Кудрявцев К. К.'),
    (80101, '38.03.05', 'Макаров М. М.'),
    (80102, '38.03.05', 'Яковлев Я. Я.');

-- Экзамен
CREATE TABLE Exam (
    Date DATE NOT NULL,
    Code INT NOT NULL,
    Reg_Number INT NOT NULL,
    Tab_Number INT NOT NULL,
    Room VARCHAR(10) NOT NULL,
    Grade INT NOT NULL
);
INSERT INTO Exam (Date, Code, Reg_Number, Tab_Number, Room, Grade)
VALUES
    ('2015-06-05', 102, 10101, 102, 'т505', 4),
    ('2015-06-05', 102, 10102, 102, 'т505', 4),
    ('2015-06-05', 202, 20101, 202, 'т506', 4),
    ('2015-06-05', 202, 20102, 202, 'т506', 3),
    ('2015-06-07', 102, 30101, 105, 'ф419', 3),
    ('2015-06-07', 102, 30102, 101, 'т506', 4),
    ('2015-06-07', 102, 80101, 102, 'м425', 5),
    ('2015-06-09', 205, 80102, 402, 'м424', 4),
    ('2015-06-09', 209, 20101, 302, 'ф333', 3),
    ('2015-06-10', 101, 10101, 501, 'т506', 4),
    ('2015-06-10', 101, 10102, 501, 'т506', 4),
    ('2015-06-10', 204, 30102, 601, 'ф349', 5),
    ('2015-06-10', 209, 80101, 301, 'э105', 5),
    ('2015-06-10', 209, 80102, 301, 'э105', 4),
    ('2015-06-12', 101, 80101, 502, 'с324', 4),
    ('2015-06-15', 101, 30101, 503, 'ф417', 4),
    ('2015-06-15', 101, 50101, 501, 'ф201', 5),
    ('2015-06-15', 101, 50102, 501, 'ф201', 3),
    ('2015-06-15', 103, 10101, 403, 'ф414', 4),
    ('2015-06-17', 102, 10101, 102, 'т505', 5);
--	1.	Вывести из таблиц «Кафедра», «Специальность» и «Студент» данные о студентах, которые обучаются на данном факультете (например, «ит»).
SELECT 
s.Last_Name AS Студент , s2.Direction AS Направление, d.Name AS кафедра
FROM Student s
INNER JOIN Specialization s2 ON s.Number = s2.Number 
INNER JOIN Department d ON s2.Code=d.Code
WHERE d.FacultyAbbreviation='Ит'
--2.Вывести из таблиц «Кафедра», «Специальность» и «Сотрудник» данные о выпус-кающих кафедрах (факультет, шифр, название, фамилию заведующего). Выпускающей счита-ется та кафедра, на которую есть ссылки в таблице «Специальность».
SELECT f.Name AS Faculty, d.Code, d.Name AS Department, e.LastName AS ChiefLastName
FROM Department d
JOIN Faculty f ON d.FacultyAbbreviation = f.Abbreviation
JOIN Employee e ON d.Code = e.DepartmentCode
WHERE e.Position = 'зав. кафедрой';
--3.Вывести в запросе для каждого сотрудника номер и фамилию его непосредствен-ного руководителя. Для заведующих кафедрами поле руководителя оставить пустым.
SELECT e1.TabNumber, e1.LastName, e2.LastName AS ChiefLastName
FROM Employee e1
LEFT JOIN Employee e2 ON e1.ChiefTabNumber = e2.TabNumber;
--4.Вывести список студентов, сдавших минимум два экзамена.
SELECT s.Last_Name, COUNT(e.Reg_Number) AS ExamsCount
FROM Student s
JOIN Exam e ON s.Reg_Number = e.Reg_Number
GROUP BY s.Last_Name
HAVING COUNT(e.Reg_Number) >= 2;
--5.Вывести список инженеров с зарплатой, меньшей 20000 руб.
SELECT e.LastName
FROM Employee e
JOIN Engineer eng ON e.TabNumber = eng.Tab_Number
WHERE e.Salary < 20000;
--6.Вывести список студентов, сдавших экзамены в заданной аудитории.
SELECT s.Last_Name
FROM Student s
JOIN Exam e ON s.Reg_Number = e.Reg_Number
WHERE e.Room = 'т505';
--7.Вывести из таблиц «Студент» и «Экзамен» учетные номера и фамилии студентов, а также количество сданных экзаменов и средний балл для каждого студента только для тех студентов, у которых средний балл не меньше заданного (например, 4).
SELECT s.Reg_Number, s.Last_Name, COUNT(e.Reg_Number) AS ExamsCount, AVG(e.Grade) AS AverageGrade
FROM Student s
JOIN Exam e ON s.Reg_Number = e.Reg_Number
GROUP BY s.Reg_Number, s.Last_Name
HAVING AVG(e.Grade) >= 4;
--8.Вывести список заведующих кафедрами и их зарплаты, и степень.
SELECT e.LastName, e.Salary, t.Degree
FROM Employee e
JOIN Teacher t ON e.TabNumber = t.Tab_Number
WHERE e.Position = 'зав. кафедрой';
---9.Вывести список профессоров.
SELECT e.LastName
FROM Employee e
JOIN Teacher t ON e.TabNumber = t.Tab_Number
WHERE t.Rang = 'профессор';
--10.Вывести название дисциплины, фамилию, должность и степень преподавателя, дату и место проведения экзаменов в хронологическом порядке в заданном интервале даты.
SELECT d.Title, e.LastName, e.Position, t.Degree, ex.Date, ex.Room
FROM Exam ex
JOIN Discipline d ON ex.Code = d.Code
JOIN Employee e ON ex.Tab_Number = e.TabNumber
JOIN Teacher t ON e.TabNumber = t.Tab_Number
WHERE ex.Date BETWEEN '2015-06-05' AND '2015-06-17';
--11.Вывести фамилию преподавателей, принявших более трех экзаменов.
SELECT e.LastName, COUNT(ex.Tab_Number) AS ExamsCount
FROM Employee e
JOIN Exam ex ON e.TabNumber = ex.Tab_Number
GROUP BY e.LastName
HAVING COUNT(ex.Tab_Number) > 3;
--12.Вывести список студентов, не сдавших ни одного экзамена в указанной дате.
SELECT s.Last_Name
FROM Student s
LEFT JOIN Exam e ON s.Reg_Number = e.Reg_Number AND e.Date = '2023-05-15'
WHERE e.Reg_Number IS NULL;

-- ЛАБКА 7 

--1.	Вывести объединенный результат выполнения запросов, которые выбирают страны с площадью меньше 500 кв. км и с площадью больше 5 млн. кв. км:
SELECT *
FROM Country
WHERE Square < 500
UNION
SELECT * 
FROM Country
WHERE Square> 5000000
--2.	Вывести список стран с площадью больше 1 млн. кв. км, исключить страны с насе-лением меньше 100 млн. чел.:
SELECT * 
FROM Country 
WHERE Square > 1000000
EXCEPT 
SELECT * 
FROM Country 
WHERE Population < 100000000
--3.	Вывести список стран с площадью меньше 500 кв. км и с населением меньше 100	тыс. чел.
SELECT * 
FROM Country
WHERE Square < 500
INTERSECT 
SELECT *
FROM Country
WHERE Population < 100000

-- ЛАБКА 8 
--1.	Вывести список стран и процентное соотношение площади каждой из них к общей площади всех стран мира.
SELECT *,
ROUND (CAST(Square AS FLOAT) * 100 /(SELECT SUM(SQUARE) FROM Country), 3) AS Процент
FROM Country 
ORDER BY Процент DESC

--2.	Вывести список стран мира, плотность населения которых больше, чем средняя плотность населения всех стран мира.
SELECT * 
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country)
--3.	С помощью подзапроса вывести список европейских стран, население которых меньше 5 млн. чел.
SELECT *
FROM ( SELECT * FROM Country WHERE Continent = 'Европа') A
WHERE Population > 50000000

--4.	Вывести список стран и процентное соотношение их площади к суммарной пло-щади той части мира, где они находятся.
SELECT *,
ROUND(CAST(Square AS FLOAT) * 100 /
(SELECT SUM(Square) FROM Country Б
WHERE А.Continent = Б.Continent), 3) AS Процент
 
FROM
Country А

ORDER BY
Процент DESC

--5.	Вывести список стран мира, площадь которых больше, чем средняя площадь стран той части света, где они находятся.
 SELECT *
FROM
Country  А
WHERE
Population> (
SELECT
AVG(Population)
FROM
Country Б
WHERE
Б.Continent = А.Continent
)

--6.	Вывести список стран мира, которые находятся в тех частях света, средняя плот-ность населения которых превышает общемировую.
SELECT *
FROM
Country А
WHERE
Population > (
SELECT
AVG(Population)
FROM
Country Б
WHERE
Б.Continent = А.Continent
)
--7.	Вывести список южноамериканских стран, в которых живет больше людей, чем в любой африканской стране.
SELECT *
FROM Country
WHERE
Continent = 'Южная Америка'
AND
Population> ALL (
SELECT
Population
FROM
Country
WHERE
Continent = 'Африка'
)
--8.	Вывести список африканских стран, в которых живет больше людей, чем хотя бы в одной южноамериканской стране.
SELECT *
FROM
Country
WHERE
Continent = 'Африка'
AND
Population > ANY (
SELECT
Population
FROM
Country
WHERE
Continent = 'Южная Америка'
)
--9.	Если в Африке есть хотя бы одна страна, площадь которой больше 2 млн. кв. км, вывести список всех африканских стран.
SELECT *
FROM
Country
WHERE
Continent = 'Африка'
AND
EXISTS (
SELECT *
FROM
Country
WHERE
Continent = 'Африка'
AND
Square> 2000000
)
--10.	Вывести список стран той части света, где находится страна «Фиджи».
SELECT *
FROM
Country
WHERE
Continent = (
SELECT
Continent
FROM
Country
WHERE
Name= 'Фиджи'
)
--11.	Вывести список стран, население которых не превышает население страны «Фиджи».
SELECT *
FROM
Country
WHERE
Population !> (
SELECT
Population
FROM
Country
WHERE
Name = 'Фиджи'
)
--12.	Вывести название страны с наибольшим населением среди стран с наименьшей площадью на каждом континенте.
SELECT *
FROM
Country
WHERE
Population = (
SELECT
MAX(Мин_Нас)
FROM
(
SELECT
MIN(Population) AS Мин_Нас
FROM
Country
GROUP BY
Continent
) A
)

--ЛАБКА 9 

--1.	Создать таблицу «Управление_ВашаФамилия». Определить основной ключ, иден-тификатор, значение по умолчанию
CREATE TABLE Management_SHK
( ID_Management_SHK INT PRIMARY KEY,
Name_Mn NVARCHAR (50), 
SName_Mn NVARCHAR (50) NOT NULL,
Generated_Mn INT DEFAULT (1)
);

--2.	Создать таблицу «Страны_ВашаФамилия». Определить основной ключ, разреше-ние / запрет на NULL, условие на вводимое значение.
CREATE TABLE Countries_SHK
(ID_Countries_SHK INT PRIMARY KEY,
    Name_Countries_SHK NVARCHAR(50) NOT NULL, 
    Population_Countries_SHK INT CHECK (Population_Countries_SHK >= 0)
	)
--3.	Создать таблицу «Цветы_ВашаФамилия». Определить основной ключ, значения столбца «ID» сделать уникальными, для столбца «Класс» установить значение по умолчанию «Двудольные».
CREATE TABLE Flowers_SHK
(
ID_Flowers_SHK INT PRIMARY KEY ,
Name_Fl NVARCHAR(50) NOT NULL,
Class_Fl NVARCHAR (50) DEFAULT 'Двудольные'
UNIQUE(ID_Flowers_SHK)
)
--4.	Создать таблицу «Животные_ВашаФамилия». Определить основной ключ, значе-ния столбца «ID» сделать уникальными, для столбца «Отряд» установить значение по умол-чанию «Хищные».
CREATE TABLE Animals_SHK
( ID_Animals_SHK INT PRIMARY KEY IDENTITY,
Name_An NVARCHAR(50) NOT NULL,
Otriad_An NVARCHAR(50) DEFAULT 'Хищные'
UNIQUE(ID_Animals_SHK)
)

--ЛАБКА 10
CREATE TABLE Ученики
(	
	ID_Ученики INT PRIMARY KEY IDENTITY (1,1),
	SName NVARCHAR (50) NOT NULL,
	Predmet NVARCHAR (50) NOT NULL,
	School NVARCHAR (50) NOT NULL,
	Ball FLOAT CHECK ((Ball>=0)AND (Ball<=100)) NULL
)	
INSERT INTO Ученики ( SName, Predmet, School, Ball )
VALUES
(	'Иванова','Математика',	'Лицей', 98.5),					
('Петров', 'Физика', 'Лицей',99),					
( 'Сидоров', 'Математика', 'Лицей', 	88),					
(	 'Полухина', 'Физика', 'Гимназия',	78),
(	'Матвеева', 'Химия', 'Лицей', 	92),
(	'Касимов', 'Химия', 'Гимназия',	68),
(	'Нурулин',	'Математика', 'Гимназия',	81),
(	'Авдеев', 'Физика',	'Лицей',	87),
(	 'Никитина', 'Химия', 'Лицей', 	94),
( 'Барышева', 'Химия', 'Лицей',	88)

--1.	В таблицу «Ученики» внести новую запись для ученика школы № 18 Трошкова, оценка которого по химии неизвестна.
INSERT INTO Ученики ( SName, Predmet, School, Ball )
VALUES ('Трошкова', 'Химия', 'Школа №18', NULL)
--2.	В таблицу «Ученики» внести три строки.
INSERT INTO Ученики ( SName, Predmet, School, Ball )
VALUES 
('Калинина', 'Химия', 'Школа №18', 95),
('Газиев', 'Биология', 'Школа №18', 80),
('Суханов', 'Математика', 'Школа №18', 85)
--3.	В таблице «Ученики» изменить данные Трошкова, школу исправить на № 21, пред-мет на математику, а оценку на 56.
UPDATE Ученики
SET  School = 'Школа №21',
 Predmet = 'Математика',
 Ball = 56
WHERE SName = 'Трошкова'
--4.	В таблице «Ученики» изменить данные всех учеников по химии, оценку увеличить на 10%, если она ниже 60 баллов.
UPDATE Ученики
SET Ball = Ball * 1.1
WHERE Predmet = 'Химия' AND Ball < 60
--5.	В таблице «Ученики» удалить данные всех учеников из школы №21.
DELETE FROM Ученики
WHERE School='Школа №21'
--6.	Создать таблицу «Гимназисты» и скопировать туда данные всех гимназистов, кроме тех, которые набрали меньше 60 баллов.
SELECT *
INTO Гимназисты
FROM Ученики
WHERE Ball<60
--7.	Очистить таблицу «Гимназисты».
 TRUNCATE TABLE Гимназисты

 --ЛАБКА 11
-- 1.	Даны числа A и B. Найти и вывести их произведение.
   DECLARE @A INT , @B INT, @C INT 
   SET @A = 5
   SET @B = 5 
   SET @C = @A * @B
   PRINT @C

--2.	В таблице «Ученики» найти разницу между средними баллами лицеистов и гимназистов.
DECLARE @LICEY FLOAT, @GIMN FLOAT, @DUFF FLOAT 
SET @LICEY = 
(SELECT AVG(Ball) FROM Ученики WHERE School = 'Лицей')
SET @GIMN= 
(SELECT AVG(Ball) FROM Ученики WHERE School = 'Гимназия')
SET @DUFF = ABS(@LICEY- @GIMN)
PRINT @DUFF

--3.	В таблице «Ученики» проверить на четность количество строк.
DECLARE @col_str int
set @col_str = (Select COUNT(ID_Ученики from Ученики)
if (@col_str%2 = 0)
print 'четное = ' + CAST(@col_str AS VARCHAR(4))
else 
print 'нечетное = ' + CAST(@col_str AS VARCHAR(4))
--4.	Дано четырехзначное число. Вывести сумму его цифр.
   DECLARE @A INT , @B INT, @C INT 
   SET @A = 1254
   SET @B = 3214
   SET @C = @A + @B
   PRINT @C
--5.	Даны случайные целые числа a, b и c. Найти наименьшее из них.
DECLARE @a INT = RAND() * 100, @b INT = RAND() * 100
IF @a<@b
PRINT '@a=' + CAST (@a AS VARCHAR(3))
ELSE 
PRINT '@b= ' + CAST (@b AS VARCHAR(3))
--6.	Дано случайное целое число a. Проверить, делится ли данное число на 11.
DECLARE @U INT = RAND() * 100
IF @U % 11 =  0 
PRINT CAST (@U AS VARCHAR(3)) + 'ДЕЛИТСЯ НА 11'
ELSE 
PRINT CAST (@U AS VARCHAR(3)) + ' НЕ ДЕЛИТСЯ НА 11'
--7.	Дано случайное целое число N (N < 1000). Если оно является степенью числа 3, то вывести «Да», если не является – вывести «Нет».
DECLARE @K INT = RAND() * 1000
WHILE @K%3 = 0
SET @K= @K/3
IF @K=1
PRINT 'ДА'
ELSE 
PRINT 'НЕТ'
--8.	Даны случайные целые числа a и b. Найти наименьший общий кратный (НОК).
DECLARE @a INT = RAND() * 1000, @b INT = RAND() * 1000 
PRINT '@a = ' + CAST(@a AS VARCHAR(4)) 
PRINT '@b = ' + CAST(@b AS VARCHAR(4))
WHILE @a != @b
BEGIN
IF @a > @b
SET @a = @a - @b
ELSE
SET @b = @b - @a
END
PRINT 'НОK = ' + CAST(@a AS VARCHAR(4))
--9.	Даны два целых числа A и B (A<B). Найти сумму квадратов всех целых чисел от A до B включительно.
DECLARE @A INT = 5, @B INT = 10, @S INT = 0
WHILE @A <=@B
BEGIN 
SET @S = SQUARE (@S+@A)
SET @A = SQUARE(@A +1)
END
PRINT 'СУММА='+ CAST (@S AS VARCHAR (5))
--10.	Найти первое натуральное число, которое при делении на 2, 3, 4, 5, и 6 дает остаток 1, но делится на 7.
DECLARE @A10 INT = 1
WHILE @A10 < 500
BEGIN
IF(@A10 % 2 = 1) AND (@A10 % 3 = 1) AND (@A10 % 4 = 1) AND (@A10 % 5 = 1) AND (@A10 % 6 = 1) AND (@A10 % 7 = 0)
PRINT @A10
SET @A10 = @A10 + 1
END
--11.	Вывести свою фамилию на экран столько раз, сколько в нем букв.
DECLARE @V INT,  @C CHAR(7) = 'Шабаева'
SET  @V = LEN(@C)
WHILE @V>0
BEGIN 
PRINT @C
SET @V=@V-1
END
--12.	Напишите код для вывода на экран с помощью цикла:
--Н
--иНи
--жиНиж
--нжиНижн
--енжиНижне
--венжиНижнев
--авенжиНижнева
--равенжиНижневар
--травенжиНижневарт
--отравенжиНижневарто
--вотравенжиНижневартов
--свотравенжиНижневартовс
--ксвотравенжиНижневартовск
DECLARE @text NVARCHAR(MAX)
SET @text = 'Нижневартовск'
DECLARE @i INT
SET @i = 1
WHILE @i <= LEN(@text)
BEGIN
    DECLARE @formattedText NVARCHAR(MAX)
    IF @i = 1
    BEGIN
        SET @formattedText = SUBSTRING(@text, 1, 1)
    END
    ELSE
    BEGIN
        SET @formattedText = REPLICATE('', LEN(@text) - @i) + REVERSE(SUBSTRING(@text, 2, @i - 1)) + SUBSTRING(@text, 1, @i)
    END    
    PRINT @formattedText
    SET @i = @i + 1
END

--ЛАБКА 12
--1.	Напишите функцию для вывода названия страны с заданной столицей, и вызовите ее.
CREATE FUNCTION Zad_11
(@Capital AS VARCHAR(50))
RETURNS VARCHAR(50)
AS
BEGIN
DECLARE @C AS VARCHAR(50)
SELECT
@C = Name
FROM
Country
WHERE
Capital = @Capital
RETURN @C
END
SELECT dbo.Zad_1('Вена')


--2.	Напишите функцию для перевода населения в млн. чел. и вызовите ее.
CREATE FUNCTION Zad_2
(
@Population AS FLOAT
)
RETURNS FLOAT
AS
BEGIN
DECLARE @P AS FLOAT
SET @P = ROUND(@Population / 1000000, 2)
RETURN @P
END
SELECT
*,
dbo.Zad_2(Population) AS [млн. чел]
FROM
Country

--3.	Напишите функцию для вычисления плотности населения заданной части света и вызовите ее.
CREATE FUNCTION Zad_3
(
@Population AS INT,

@Square AS FLOAT
)
RETURNS FLOAT
AS
BEGIN
DECLARE @P AS FLOAT
SET @P = ROUND(CAST(@Population AS FLOAT) / @Square, 2)
RETURN @P
END
 
--4.	Напишите функцию для поиска страны, третьей по населению и вызовите ее.
CREATE FUNCTION Zad_4()
RETURNS VARCHAR(50)
AS
BEGIN
DECLARE @Name AS VARCHAR(50)
DECLARE @Max1 AS FLOAT
DECLARE @Max2 AS FLOAT
DECLARE @Max3 AS FLOAT
SELECT
@Max1 = MAX(Square)
FROM
Country
SELECT
@Max2 = MAX(Square)
FROM
Country
WHERE
Square < @Max1
SELECT
@Max3 = MAX(Square)
FROM
Country
WHERE
Square<@Max2
SELECT
@Name = Name
FROM
Country
WHERE
Square = @Max3
RETURN @Name
END
SELECT
dbo.Zad_4() AS [Третья по площади страна]

--5.	Напишите функцию для поиска страны с максимальным населением в заданной ча-сти света и вызовите ее. Если часть света не указана, выбрать Азию.
CREATE FUNCTION Zad_5
(
@Continent AS VARCHAR(50) = 'Азия'
)
RETURNS VARCHAR(50)
AS
BEGIN
DECLARE @Name AS VARCHAR(50)
DECLARE @Max AS FLOAT
SELECT
@Max = MAX(Population)
FROM
Country
WHERE
Continent = @Continent
SELECT
@Name=Name
FROM
Country
WHERE
Continent = @Continent
AND
Population= @Max
RETURN @Name
END
SELECT
dbo.Zad_5(DEFAULT) AS [Наименьшая по населению страна в Азии]

--6.	Напишите функцию для замены букв в заданном слове от третьей до предпослед-ней на “тест” и примените ее для столицы страны.
CREATE FUNCTION Zad_66
(
@A AS VARCHAR(50)
)
RETURNS VARCHAR(50)
AS
BEGIN
RETURN LEFT(@A, 1) + REPLICATE('тест', LEN(@A) - 3) + RIGHT(@A, 1)
END
SELECT Name,
dbo.Zad_66(Capital) as Столица
,Continent
,Square
,Population
FROM
Country

--7.	Напишите функцию, которая возвращает количество стран, не содержащих в назва-нии заданную букву.
CREATE FUNCTION Zad_7
(
@C AS CHAR (1)
)
RETURNS INT 
AS
BEGIN 
DECLARE @K AS INT
SELECT @K = COUNT(*)
FROM Country
WHERE CHARINDEX(@C, Name) = 0
RETURN @K
END
SELECT
dbo.Zad_7('А')
--8.	Напишите функцию для возврата списка стран с площадью меньше заданного числа и вызовите ее.
CREATE FUNCTION Zad_88
(
@S AS INT
)
RETURNS TABLE
AS
RETURN (
SELECT
*
FROM
Country
WHERE
Square < @S
)
SELECT
*
FROM
dbo.Zad_88(10000000)

--9.	Напишите функцию для возврата списка стран с населением в интервале заданных значений и вызовите ее.
CREATE FUNCTION Zad_9
(
@A AS FLOAT,
@B AS FLOAT
)
RETURNS TABLE
AS
RETURN (
SELECT
*
FROM
Country
WHERE
Population BETWEEN @A AND @B
)
SELECT
*
FROM
dbo.Zad_9(100000, 2000000)
--10.	Напишите функцию для возврата таблицы с названием континента и суммарным населением и вызовите ее.
CREATE FUNCTION Zad_10
(
)
RETURNS @COUNT
TABLE (
NAME VARCHAR(100),
SPREAD FLOAT
)
AS
BEGIN
INSERT @COUNT
SELECT Continent, SUM(Population) 
FROM Country
GROUP BY Continent
RETURN
END
SELECT * 
FROM dbo.Zad_10()
--11.	Напишите функцию IsPalindrom(P) целого типа, возвращающую 1, если целый па-раметр P (P > 0) является палиндромом, и 0 в противном случае.
CREATE FUNCTION Zad_111 
(
@N AS INT
)
RETURNS INT
AS
BEGIN
    DECLARE @TEMP AS INT
    SET @TEMP = @N
    DECLARE @REV AS INT
    SET @REV = 0
    DECLARE @BIG AS INT
    DECLARE @RESULT AS INT
    WHILE (@N > 0)
    BEGIN
        SET @BIG = @N % 10
        SET @REV = @REV * 10 + @BIG
        SET @N = @N / 10
    END
    IF (@TEMP = @TEMP)
        SET @RESULT = 1
    ELSE
        SET @RESULT = 0
    RETURN @RESULT
END

--ЛАБКА 13
--1.	Создайте представление, содержащее список африканских стран, население которых больше 10 млн. чел., а площадь больше 500 тыс. кв. км, и используйте его.
CREATE VIEW Zad_1_13
AS
SELECT *
FROM
    Country
WHERE	
    Population> 10000000 
    AND Square > 500000
SELECT *
FROM
 Zad_1_13
--2.	Создайте представление, содержащее список континентов, среднюю площадь стран, которые находятся на нем, среднюю плотность населения, и используйте его.
CREATE VIEW Zad_2_13
AS
SELECT
 Continent,
AVG(Square) AS Сред_площадь,
AVG(Population * 1.0 / Square) AS Сред_плотность_населения
FROM
Country
GROUP BY
Continent;

SELECT
    Continent,
    Сред_площадь,
    Сред_плотность_населения
FROM
    Zad_2_13
--3.	Создайте представление, содержащее фамилии преподавателей, их должность, зва-ние, степень, место работы, количество их экзаменов, и используйте его.
CREATE VIEW Zad_3_13
AS
SELECT e.LastName, e.Position, t.Rang, t.Degree, e.DepartmentCode, COUNT(emp.Code) 'Количество экзаменов' 
FROM dbo.Teacher t Join dbo.Employee e ON t.Tab_Number = e.TabNumber
JOIN dbo.Exam emp ON t.Tab_Number = emp.Tab_Number 
JOIN dbo.Department d ON e.DepartmentCode = d.Code
GROUP BY  e.LastName, e.Position, t.Rang, t.Degree, e.DepartmentCode
SELECT *
FROM Zad_3_13
--4.	Создайте табличную переменную, содержащую три столбца («Номер месяца», «Название месяца», «Количество дней»), заполните ее для текущего года, и используйте ее.
DECLARE @Zad_4 TABLE
(
    Number INT,
    Name NVARCHAR(50),
    Quantity INT
);

INSERT INTO @Zad_4 (Number, Name, Quantity)
SELECT
    MONTH(GETDATE()),
    DATENAME(MONTH, GETDATE()),
    DAY(EOMONTH(GETDATE()));

SELECT *
FROM @Zad_4;
--5.	Создайте табличную переменную, содержащую список стран, площадь которых в 100	раз меньше, чем средняя площадь стран на континенте, где они находятся, и используйте ее.
DECLARE @Zad_5 TABLE
(
    Name VARCHAR(50),
    Capital VARCHAR(50),
    Square FLOAT,
    Population INT,
    Continent VARCHAR(50)
);
INSERT INTO @Zad_5 (Name, Capital, Square, Population, Continent)
SELECT
    Name,
    Capital,
    Square,
    Population,
    Continent
FROM
    Country
WHERE
    Square * 100 < (
        SELECT
            AVG(Square)
        FROM
            Country
        WHERE
            Continent = Continent
    );

SELECT *
FROM
    @Zad_5;

--6.	Создайте локальную временную таблицу, имеющую три столбца («Номер недели», «Количество экзаменов», «Количество студентов»), заполните и используйте ее.
SELECT
DATEPART(WEEK, Date) AS [Номер недели], 
COUNT(DISTINCT e.Code) AS [Количество экзаменов], 
COUNT(DISTINCT e.Reg_Number) AS [Количество студентов]
INTO Zad_6
FROM dbo.Exam e
GROUP BY DATEPART(WEEK, Date)
SELECT * 
FROM Zad_6
--7.	Создайте глобальную временную таблицу, содержащую название континентов, наибольшую и наименьшую площадь стран на них, заполните и используйте ее.
CREATE TABLE Zad_7
(
    Continent VARCHAR(50),
    BigSquare FLOAT,
    SmallSquare FLOAT
);
INSERT INTO Zad_7 (Continent, BigSquare, SmallSquare)
SELECT
    Continent,
    MAX(Square) AS НаибольшаяПлощадь,
    MIN(Square) AS НаименьшаяПлощадь
FROM
    Country
GROUP BY
    Continent;
SELECT *
FROM
 Zad_7;
--8.	С помощью обобщенных табличных выражений напишите запрос для вывода списка сотрудников, чьи зарплаты меньше, чем средняя зарплата по факультету, их зарплаты и назва-ние факультета.
WITH СЗК AS
(
SELECT d.Name AS Кафедра, d.Code, AVG(Salary) AS [Средняя зарплата по кафедре]
FROM dbo.Employee emp
INNER JOIN dbo.Department d ON d.Code = emp.DepartmentCode
GROUP BY d.Name, d.Code
)
SELECT emp.LastName, emp.Salary, a.Кафедра, a.[Средняя зарплата по кафедре]
FROM dbo.Employee emp
INNER JOIN СЗК a ON a.Code = emp.DepartmentCode
WHERE emp.Salary < a.[Средняя зарплата по кафедре]
SELECT * 
FROM dbo.Employee emp
--9.	Напишите команды для удаления всех созданных вами представлений.
DROP VIEW Zad_1_13
DROP VIEW Zad_2_13
DROP VIEW Zad_3_13
--ЛАБКА 14
--1.	Создайте курсор, содержащий отсортированные по баллам фамилии и баллы уче-ников, откройте его, выведите первую строку, закройте и освободите курсор.
DECLARE Zad_1 CURSOR
FOR
SELECT
SNAme,
Ball
FROM
Ученики
ORDER BY
Ball 
OPEN Zad_1
FETCH Zad_1
CLOSE Zad_1
DEALLOCATE Zad_1

--2.	Создайте курсор с прокруткой, содержащий список учеников, откройте его,
--выве-дите пятую, предыдущую, с конца четвертую, следующую, первую строку, закройте и освобо-дите курсор.
DECLARE Zad_2 CURSOR SCROLL
FOR
SELECT *
FROM
Ученики
OPEN Zad_2
FETCH ABSOLUTE 5 FROM Zad_2
FETCH PRIOR FROM Zad_2
FETCH ABSOLUTE -4 FROM Zad_2
FETCH NEXT FROM Zad_2
FETCH FIRST FROM Zad_2
CLOSE Zad_2
DEALLOCATE Zad_2
--3.	Создайте курсор с прокруткой, содержащий список учеников,
--откройте его, выве-дите последнюю, шесть позиций назад находящуюся,
--четыре позиций вперед находящуюся строку, закройте и освободите курсор.
DECLARE Zad_3 CURSOR SCROLL
FOR
SELECT *
FROM
Ученики
OPEN Zad_3
FETCH LAST FROM Zad_3
FETCH RELATIVE -6 FROM Zad_3
FETCH RELATIVE 4 FROM Zad_3
CLOSE Zad_3
DEALLOCATE Zad_3
--4.	С помощью курсора, вычислите сумму баллов у учеников с наибольшим и наименьшим баллом.
DECLARE Zad_4 CURSOR SCROLL
FOR
SELECT
Ball
FROM
Ученики
ORDER BY
Ball
DECLARE @Small FLOAT = 0, @big FLOAT,@Summ FLOAT
OPEN Zad_4
FETCH FIRST FROM Zad_4 INTO @Small
FETCH LAST FROM Zad_4 INTO @Big
SET @Summ=@small+@Big
PRINT @Summ
CLOSE Zad_4
DEALLOCATE Zad_4

--5.	С помощью курсора, сгенерируйте строку вида
--«Ученики <список фамилий и названий предметов, разделенных запятыми> участвовали в олимпиаде».
DECLARE Zad_5 CURSOR SCROLL FOR
SELECT
SName,Predmet
FROM
Ученики
DECLARE @Student VARCHAR(100), @SNAme VARCHAR(50), @Predmet VARCHAR(50)
OPEN Zad_5
--SET @S = 'Ученики'
FETCH NEXT FROM Zad_5 INTO @SName, @Predmet
WHILE @@FETCH_STATUS = 0
BEGIN
SET @Student='Ученики'+','+@Sname+'по предмету "'+@Predmet+'"'
FETCH NEXT FROM Zad_5 INTO @Sname, @Predmet
END
SET @Student = @Student + ' участвовали на олимпиаде.'
PRINT @Student
CLOSE Zad_5
DEALLOCATE Zad_5
--6.	Создайте курсор, содержащий список учеников,
--с его помощью выведите учеников с нечетной позицией.
DECLARE Zad_6 CURSOR FOR
SELECT SName
FROM Ученики;
OPEN Zad_6;
DECLARE @Name NVARCHAR(MAX);
DECLARE @Position INT;
SET @Position = 1;
FETCH NEXT FROM Zad_6 INTO @Name;
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @Position % 2 = 1
    BEGIN
        PRINT 'Ученик с нечетной позицией: ' + @Name;
    END
    SET @Position = @Position + 1;
    FETCH NEXT FROM Zad_6 INTO @Name;
END;
CLOSE Zad_6;
DEALLOCATE Zad_6;

--7.	Создайте курсор, содержащий отсортированный по убыванию баллов список уче-ников, 
--откройте его, для каждого ученика выведите фамилию, предмет, 
--школу, баллы и про-центное соотношение баллов с предыдущим учеником.
DECLARE Zad_7 CURSOR FOR
SELECT SName, Predmet, School, Ball
FROM Ученики
ORDER BY Ball DESC;
OPEN Zad_7;
DECLARE @S_Name NVARCHAR(MAX);
DECLARE @Predmett NVARCHAR(MAX);
DECLARE @School NVARCHAR(MAX);
DECLARE @Ball INT;
DECLARE @LastBall INT;
DECLARE @Procent DECIMAL(5,2);
SET @S_Name = '';
SET @Predmett = '';
SET @School = '';
SET @Ball = 0;
SET @LastBall = 0;
FETCH NEXT FROM Zad_7 INTO @S_Name, @Predmett, @School, @Ball;
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @LastBall = 0
        SET @Procent = 0;
    ELSE
        SET @Procent = (CAST(@Ball AS DECIMAL(5,2)) / CAST(@LastBall AS DECIMAL(5,2))) * 100;
    PRINT 'Фамилия: ' + @S_Name;
    PRINT 'Предмет: ' + @Predmett;
    PRINT 'Школа: ' + @School;
    PRINT 'Баллы: ' + CAST(@Ball AS NVARCHAR(MAX));
    PRINT 'Процентное соотношение с предыдущим учеником: ' + CAST(@Procent AS NVARCHAR(MAX)) + '%';
    SET @LastBall = @Ball;
    FETCH NEXT FROM Zad_7 INTO @S_Name, @Predmett, @School, @Ball;
END;
CLOSE Zad_7;
DEALLOCATE Zad_7;
--ЛАБКА 15
--1.	Вывести список учеников и разницу между баллами ученика и максимальным бал-лом в каждой строке.
SELECT *,
Ball- MAX(Ball) OVER() AS Разница_C_Макс_баллом
FROM
Ученики

--2.	Вывести список учеников и процентное соотношение к среднему баллу в каждой строке.
SELECT * ,
Ball * 100 / AVG(Ball) OVER() AS Процент_Соотнош
FROM
Ученики
--3.	Вывести список учеников и минимальный балл в школе в каждой строке.
SELECT *,
MIN(Ball) OVER(PARTITION BY School) AS Сред_Шк
FROM
Ученики
--4.	Вывести список учеников и суммарный балл в школе в каждой строке, отсортиро-вать по школам в оконной функции.
SELECT *,
SUM(Ball) OVER(PARTITION BY School ORDER BY School) AS сумм_балл
FROM Ученики
--5.	Вывести список учеников и номер строки при сортировке по фамилиям в обратном алфавитном порядке.
SELECT
ROW_NUMBER() OVER(ORDER BY SName DESC) AS Номер_строки,
*
FROM
Ученики
--6.	Вывести список учеников, номер строки внутри школы и количество учеников в школе при сортировке по баллам по убыванию.
SELECT
ROW_NUMBER() OVER(PARTITION BY School ORDER BY Ball DESC) AS Номер_строки,
*
FROM
Ученики

--7.	Вывести список учеников и ранг по баллам.
SELECT
RANK() OVER( ORDER BY Ball DESC) AS Ранг,
*
FROM
Ученики
--8.	Вывести список учеников и сжатый ранг по баллам. Результат отсортировать по фамилии в алфавитном порядке.
SELECT
DENSE_RANK() OVER( ORDER BY Ball DESC) AS Ранг,
*
FROM
Ученики
ORDER BY
SName
--9.	Вывести список учеников, распределенных по пяти группам по фамилии.
SELECT
NTILE(5) OVER(ORDER BY SName) AS Гр_Фам,
*
FROM
Ученики
--10.	Вывести список учеников, распределенных по трем группам по баллам внутри школы.
SELECT
NTILE(3) OVER(PARTITION BY School ORDER BY Ball DESC) AS Гр_Балл,
*
FROM
Ученики
--11.	Вывести список учеников и разницу с баллами ученика, находящегося выше на три позиции при сортировке по возрастанию баллов.
SELECT 
*,
Ball, Ball - LAG(Ball, 3) OVER (ORDER BY Ball ASC) AS Разница
FROM 
Ученики
ORDER BY Ball
--12.	Вывести список учеников и разницу с баллами следующего ученика при сорти-ровке по убыванию баллов, значение по умолчанию использовать 0.
SELECT 
* , COALESCE(у.Ball - у.Ball, 0) AS разница
FROM 
Ученики у
LEFT JOIN Ученики у1 ON у.ID_Ученики= у1.ID_Ученики + 1
ORDER BY у.Ball DESC;

--ЛАКБА 16

--1.	Напишите запрос, который выводит максимальный балл учеников по школам, по каждому предмету по каждой школе и промежуточные итоги.
SELECT SName, School, Predmet, MAX(Ball) AS МАКСИМАЛЬНЫЙ_БАЛЛ 
FROM Ученики
GROUP BY SName, School, Predmet WITH ROLLUP
--2.	Напишите запрос, который выводит минимальный балл учеников по школам и по предметам, и промежуточные итоги.
SELECT SName, School, Predmet, MIN(Ball) AS МИН_БАЛЛ 
FROM Ученики
GROUP BY SName, School, Predmet WITH CUBE
--3.	Напишите запрос, который выводит средний балл учеников по школам и по предметам.
SELECT Predmet,School,AVG(Ball) AS средний_балл 
FROM Ученики
GROUP BY GROUPING SETS(Predmet, School) 
--4.	Напишите запрос, который выводит количество учеников по каждой школе по пред-метам и промежуточные итоги. NULL значения заменить на соответствующий текст.
SELECT
COALESCE(Predmet, 'ИТОГО') AS Предмет,
COALESCE(School, 'Итого') AS Школа,
COUNT(SName) AS Количество
FROM Ученики
GROUP BY
ROLLUP(Predmet, School)
--5.	Напишите запрос, который выводит суммарный балл учеников по школам и по пред-метам, и промежуточные итоги. В итоговых строках NULL значения заменить на соответству-ющий текст в зависимости от группировки.
SELECT 
IIF(GROUPING(Predmet)=1, 'ИТОГО', Predmet) AS Предмет, 
IIF(GROUPING(School)=1, 'Итого', School) AS Школа , 
SUM(Ball) AS СУМ_БАЛЛ
FROM Ученики 
GROUP BY CUBE(Predmet,School)
--6.	Напишите запрос, который выводит максимальный балл учеников по школам и по предметам. В итоговых строках NULL значения заменить на соответствующий текст в зави-симости от уровней группировки.
SELECT CASE GROUPING_ID(Predmet, School) 
WHEN 1 THEN 'Итого по предметам' 
WHEN 3 THEN 'Итого' 
ELSE ''END AS Итого ,
ISNULL(Predmet, '') AS Предмет,
ISNULL(School, '') AS Школа ,
MAX(Ball) AS МАКСИМАЛЬНЫЙ_БАЛЛ
FROM Ученики
GROUP BY ROLLUP(Predmet, School)
--7.	Напишите запрос, который выводит средний балл учеников по школам в столбцы.
SELECT School, AVG(Ball) AS PIVOT_TABLE
FROM Ученики
GROUP BY School   
--8.	Напишите запрос, который выводит средний балл учеников по школам в столбцы и по предметам в строки.
SELECT Predmet, AVG(CASE WHEN School = 'Гимназия' THEN Ball END) AS 'Гимназия', 
AVG(CASE WHEN School = 'Лицей' THEN Ball END) AS 'Лицей'FROM Ученики
GROUP BY Predmet;
--9.	Напишите запрос, который выводит названия предметов, фамилии учеников и школы в один столбец.
 SELECT
SName,
[Предмет или школа]
FROM Ученики
UNPIVOT (
[Предмет или школа] FOR Значение IN (Predmet, School)) unpvt

--ЛАБКА 17
--1.	Создайте и запустите динамический SQL-запрос, выбирающий первые N строк из заданной таблицы.
DECLARE @DSQL VARCHAR(100)
DECLARE @TN VARCHAR(50)
SET @TN = 'Ученики'
SET @DSQL = 'SELECT TOP 3 * FROM Ученики ' + @TN
EXECUTE (@DSQL)
--2.	Создайте и запустите динамический SQL-запрос, выбирающий все страны из таблицы «Страны», последняя буква названия которых расположена в заданном диапазоне.
DECLARE @L1 CHAR (1)
DECLARE @L2 CHAR (1)
SET @L1 = 'к'
SET @L2 = 'ю'
EXECUTE ('SELECT * FROM COUNTRY WHERE Name LIKE ''%[' + @L1 + '-' + @L2 +']''')
--3.	Создайте временную таблицу #Temp и добавьте к ней название столбцов таблицы «Страны». Создайте курсор, который, построчно читая таблицу #Temp, 
--выбирает каждый раз соответствующий столбец из таблицы «Страны».
CREATE TABLE #Temp (
  Name VARCHAR(55),
  Capital VARCHAR(55),
  Square FLOAT,
  Population BIGINT,
  Continent VARCHAR(55)
);
INSERT INTO #Temp (Name, Capital, Square, Population, Continent)
SELECT Name, Capital, Square, Population, Continent
FROM Country;
DECLARE cursor_countries1 CURSOR FOR 
SELECT Name, Capital, Square, Population, Continent
FROM #Temp;
DECLARE @Name VARCHAR(55),
        @Capital VARCHAR(55),
        @Square FLOAT,
        @Population BIGINT,
        @Continent VARCHAR(55);
OPEN cursor_countries1;
FETCH NEXT FROM cursor_countries1 INTO @Name, @Capital, @Square, @Population, @Continent;
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT @Name;
FETCH NEXT FROM cursor_countries1 INTO @Name, @Capital, @Square, @Population, @Continent;
END
CLOSE cursor_countries1;
DEALLOCATE cursor_countries1;
DROP TABLE #Temp;
--4.	Создайте процедуру, которая принимает как параметр список столбцов, название таблицы и выбирает заданные столбцы из заданной таблицы.
CREATE PROCEDURE SelectColumnsFromTable(
    @columns VARCHAR(MAX),
    @tableName VARCHAR(100)
)
AS
BEGIN
    DECLARE @sqlQuery NVARCHAR(MAX)
    SET @sqlQuery = 'SELECT ' + @columns + ' FROM ' + @tableName  
    EXEC sp_executesql @sqlQuery
END
EXEC SelectColumnsFromTable 'Name, Capital, Square', 'Country'
--5.	Создайте процедуру, принимающую как параметр список столбцов, название таб-лицы, название проверяемого столбца, знак сравнения, значение проверки и выбирающую за-данные столбцы из заданной таблицы в заданных условиях.
CREATE PROCEDURE SelectProcedur
    @Columns NVARCHAR(MAX),
    @TableName NVARCHAR(MAX),
    @CheckColumn NVARCHAR(MAX),
    @ComparisonOperator NVARCHAR(2),
    @ComparisonValue INT
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)
    SET @SQL = 'SELECT ' + @Columns + ' FROM ' + @TableName + ' WHERE ' + @CheckColumn + ' ' + @ComparisonOperator + ' ' + CAST(@ComparisonValue AS NVARCHAR(MAX)) 
    EXEC sp_executesql @SQL
END
EXEC SelectProcedur 'Name, Capital, Square', 'Country', 'Population', '>', 100000
--6.	Выберите список европейских стран из таблицы «Страны» и экспортируйте в RAW формате XML.
SELECT *
FROM Country
WHERE Continent = 'Европа'
FOR XML RAW
--7.	Выберите список стран с населением больше 100 млн. чел. из таблицы «Страны» и экспортируйте в PATH формате XML.
SELECT * 
FROM Country
WHERE Population >100000000
FOR XML PATH
--8.	Выберите список учеников из школы «Лицей» из таблицы «Ученики» и экспорти-руйте в PATH формате JSON
 SELECT * 
 FROM Ученики
 WHERE School = 'Лицей'
 FOR JSON PATH


