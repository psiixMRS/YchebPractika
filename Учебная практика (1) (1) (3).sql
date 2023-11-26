Use Practicaycheb
--����� 2
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
    (1, '������� ������� ����������', '1885-11-03', '��������', 1939),
    (2, '�������� ������� ������������', '1869-11-15', '�������', 1913),
    (3, '������������ �������� �����������', '1854-07-13', '����������', 1903),
    (4, '������� ���� �����������', '1847-01-30', '�������', 1902),
    (5, '������� ����� ��������', '1863-07-26', '�����-��������', 1910),
    (6, '���������� �������� ��������', '1863-03-12', '��������', 1908),
    (7, '���������� ����� ����������', '1854-11-30', '�������', 1914),
    (8, '������� �������� ����������', '1867-11-21', '�����', 1916),
    (9, '������ ������� ����������', '1865-02-22', '�������', 1907),
    (10, '���������� ��������� ��������', '1847-01-07', '������', 1889),
    (11, '�������� ����� ��������������', '1861-07-01', '�������', 1906),
    (12, '�������� ������� ��������', '1860-12-06', '�����', 1913),
    (13, '���� ������� ���������', '1865-01-06', '��������', 1912),
    (14, '������� ������� ����������', '1855-02-26', '������', 1906),
    (15, '���������� ������ Ը�������', '1863-09-26', '�������', 1903),
    (16, '������ ���� ��������', '1849-09-26', '��������', 1907),
    (17, '������ �������� ����������', '1870-01-31', '�������', 1914),
    (18, '����������� ������� ��������', '1857-01-07', '��������', 1900),
    (19, '������� �������� ���������', '1864-01-09', '���������', 1912);
--1.������� ���, ������������� � ���� �������� ���� ����������
SELECT Name,Spec,HB
FROM Academiki
--2.������� ����������� ���� �� ���������� �������, ������� �������� ���������� �� ����������
--� ����: ������� ���� �������� ������� ������ � 1974�.
SELECT 
Name +' ������� ������ � ' + Years_Zvan AS ������
FROM Academiki
--3.������� ��� ���������� � ����������� ���� ������ 5 ��� ����� ���������� �������.
SELECT Name, [����� 5 ���] = Years_Zvan + 5
FROM Academiki
-- 4.������� ������ ����� ���������� ������, ����� ���������.
SELECT DISTINCT Years_Zvan
FROM Academiki
--5.	������� ������ ����������, ��������������� �� �������� ���� ��������.
 SELECT *
 FROM Academiki
 order by HB DESC
--6.	������� ������ ����������, ��������������� � �������� ���������� ������� �������������, 
--�� �������� ���� ���������� ������, � � ���������� ������� ���.
SELECT * 
FROM Academiki
ORDER BY Years_Zvan DESC, Spec DESC, Name ASC
--7.	������� ������ ������ �� ������ ����������, ���������������� � �������� ��-�������� ������� ���.
SELECT TOP 1
*
FROM Academiki
ORDER BY Name DESC
--8.	������� ������� ���������, ������� ������ ���� ������� ������.
SELECT TOP 1
*
FROM Academiki
ORDER BY Years_Zvan DESC

--9.	������� ������ 10% ����� �� ������ ����������, ���������������� � ���������� ������� ���.
SELECT TOP 10 PERCENT
*
FROM Academiki
ORDER BY Name

--10.	������� �� ������� ����������, ��������������� �� ����������� ���� ������-���� ������,
--������ ����������, � ������� ��� ���������� ������ � ���� �� ������ ���� � ��������������� �������.
SELECT TOP 5 WITH TIES
*
FROM Academiki
ORDER BY Years_Zvan

--11.	�������, ������� � ��������, ������ ����������, ��������������� �� ��������-��� ���� ��������.
SELECT 
*
FROM Academiki
ORDER BY Name OFFSET 9 ROWS

--12.	������� ������� � ������� ������ �� ������ ����������, ���������������� � ��-�������� ������� ���.
SELECT 
*
FROM Academiki
ORDER BY NAME OFFSET 8 ROWS FETCH NEXT 2 ROWS ONLY

--����� 3 
CREATE TABLE Country (
	ID_Country int PRIMARY KEY, 
  Name NVARCHAR(100),
  Capital NVARCHAR(100),
  Square INT,
  Population INT,
  Continent NVARCHAR(50)
);

INSERT INTO Country (ID_Country, Name, Capital, Square, Population,  Continent) VALUES
  (1, '�������', '����', 83858, 8741753, '������'),
  (2, '�����������', '����', 86600, 9705600, '����'),
  (3, '�������', '������', 28748, 2866026, '������'),
  (4, '�����', '�����', 2381740, 39813722, '������'),
  (5, '������', '������', 1246700, 25831000, '������'),
  (6, '���������', '������-�����', 2766890, 43847000, '����� �������'),
  (7, '����������', '�����', 647500, 29822848, '����'),
  (8, '���������', '�����', 144000, 160221000, '����'),
  (9,  '�������', '������', 701, 1397000, '����'),
  (10,'�����', '���������', 22966, 377968, '�������� �������'),
  ( 11, '����������', '�����', 207595, 9498400, '������'),
  (12, '�������', '��������', 30528, 11250585, '������'),
  (13, '�����', '�����-����', 112620, 11167000, '������'),
  (14, '��������', '�����', 110910, 7153784, '������'),
  (15, '�������', '�����', 1098580, 10985059, '����� �������'),
  (16,'��������', '��������', 600370, 2209208, '������'),
  ( 17, '��������', '��������', 8511965, 206081432, '����� �������'),
  (18,'�������-����', '��������', 274200, 19034397, '������'),
  (19, '�����', '�������', 47000, 784000, '����'),
  (20, '��������������', '������', 244820, 65341183, '������'),
  (21, '�������', '��������', 93030, 9830485, '������'),
  (22, '���������', '�������', 912050, 31028637, '����� �������'),
  (23, '��������� �����', '����', 14874, 1167242, '����'),
  (24, '�������', '�����', 329560, 91713300, '����');
--1.	������� �������� � ������� ���� ���������� ����� �� �������.
SELECT TOP 5  Name, Capital
FROM Country
ORDER BY Square

--2.	������� ������ ����������� �����, ��������� ������� �� ��������� 1 ���. ���.
SELECT *
FROM Country
WHERE
 (Continent ='������') AND (Population!>1000000)

--3.	������� ������ �����, ��������� ������� ������ 5 ���. ���., � ������� ������

--100	���. ��. ��, � ��� ����������� �� � ������.
SELECT *
FROM Country
WHERE (Population>5000000) AND (Square !> 100000) AND (Continent='������')

--4.	������� ������ ����� �������� � ����� �������, ��������� ������� ������

--20	���. ���., ��� ����� ������, � ������� ��������� ������ 30 ���. ���.
SELECT*
FROM Country
WHERE (Continent='�������� �������' ) AND (Continent='����� �������') AND (Population!>20000000)
OR
(Continent='������') AND (Population!>30000000)

--5.	������� ������ �����, ��������� ������� ���������� �� 10 �� 100 ���. ���.,
--� ���-���� �� ������ 500 ���. ��. ��.
SELECT *
FROM Country
WHERE 
(Population BETWEEN 10000000 AND 100000000)
AND
(Square !> 500000)
--6.	������� ������ �����, �������� ������� �� ���������� � ����� �ʻ.
SELECT*
FROM Country
WHERE Name NOT LIKE '�%'

--7.	������� ������ �����, � �������� ������� ������ ����� � ��, � ������������� �

--��.
SELECT *
FROM Country
WHERE Name LIKE '__�%�'

--8.	������� ������ �����, � �������� ������� ������ ����� � �������.
SELECT *
FROM Country
WHERE Name LIKE '_[�,�,�,�,�,�,�,�,�,�]%'

--9.	������� ������ �����, �������� ������� ���������� � ���� �� �ʻ �� �ϻ.
SELECT *
FROM Country
WHERE Name LIKE '[�-�]%'

--10.	������� ������ �����, �������� ������� ���������� � ���� �� ��� �� �û, �� �� � ����� ���.
SELECT *
FROM Country
WHERE Name LIKE '[�-�]%' AND Name  LIKE '[^�]%'

--11.	������� ������ �����, ������� ������� ���� � ����.
SELECT *
FROM Country 
WHERE capital IS NOT NULL

--12.	������� ������ ����� ������, �������� � ����� �������.
SELECT *
FROM Country
WHERE Continent IN ('������','�������� �������','����� �������')

--����� 4
-- 1.	������� ������ ����������, ��������������� �� ���������� �������� � ���.
SELECT *
FROM Academiki
ORDER BY LEN (Name) 
--2.	������� ������ ����������, ������ ������ ������� � ���.
SELECT 
	TRIM (Name) AS ���, HB, Spec, Years_Zvan
FROM Academiki
--3.	����� ������� ��� � ��� ������� ���������. ������� ��� � ����� �������.
SELECT Name, CHARINDEX ('��',Name) AS �������_��
FROM Academiki
--4.	������� ��� � ��������� ��� ����� ������������� ��� ������� ���������.
SELECT Name, RIGHT(Spec, 2) AS ����_2
FROM Academiki
--5.	������� ������ ����������, ��� � ������� ������� � ��������.
 SELECT CONCAT (SUBSTRING(Name, CHARINDEX('', Name) + 1, LEN(Name)), ',', LEFT (Name, 1) + '.')
 FROM Academiki
--6.	������� ������ ������������� � ���������� � �������� ����. ������ ���������.
SELECT DISTINCT Spec, REVERSE (Spec) AS ����_���
FROM Academiki
--7.	������� ���� ������� � ����� ������ ������� ���, ������� ��� ���.
SELECT REPLICATE ('�������.��������', 18)
--9.	������� ���������� ���� �� ����� ��������.
SELECT DATEDIFF(DAY,'20231110','20231229')

--10.	������� ���������� ������� �� ������ ��������.
SELECT DATEDIFF(MONTH,  '20231110','20240403')
--11.	������� ��� � ������������ ���� �������� ������� ���������.
SELECT Name, HB, 
CASE WHEN YEAR(HB) % 4 = 0 AND (YEAR(HB) % 100 <> 0 OR YEAR(HB) % 400 = 0) 
THEN '����������' ELSE '���' 
END AS Leap_Year
FROM Academiki
--12.	������� ������ ������������� ��� ����������. ��� ������ ������������� ����-��� �������� ��� ���������, 
--� ����������� �� ���������� ��������.
SELECT DISTINCT Spec,
	CASE
	WHEN LEN(Spec)>6 THEN '�������'
	WHEN LEN(Spec)<7 THEN '��������'
	END
FROM Academiki


-- ����� 5

--1.	������� ����������� ������� �����.
SELECT MIN (Square) AS ���_�������
FROM Country
--2.	������� ���������� �� ��������� ������ � �������� � ����� �������.
SELECT MAX(Population) AS ����_���
FROM Country
WHERE Continent BETWEEN '�������� �������' AND '����� �������'
--3.	������� ������� ��������� �����. ��������� ��������� �� ������ �����.
SELECT 
	ROUND(AVG(CAST (Population AS FLOAT)), 1) AS �������_���������
FROM Country
--4.	������� ���������� �����, � ������� �������� ������������� �� ���, ����� �����, 
--� ������� �������� ������������� �� �����.
SELECT 
	COUNT(*) AS ����������
FROM Country
WHERE Name LIKE '%��' AND Name NOT LIKE '%����'
--5.	������� ���������� �����������, ��� ���� ������, �������� ������� ���������� �
--����� �л.
SELECT 
	COUNT(*) AS ����������
FROM Country
WHERE LEFT(Name, 1) = '�' 
--6.	������� ��� ������ � ���������� �������� ������, ��� ������ � ���������� ��������?
SELECT 
	MAX(Square) - MIN (Square) AS �������
FROM Country
--7.	������� ���������� ����� � ���������� ������, ��� 100 ���. ���. �� ������ ���-�������. 
--��������� ������������� �� ���������� ����� �� �����������.
SELECT Continent,
	COUNT (*) AS ����������
FROM Country
WHERE Population> 100000000
GROUP BY Continent
ORDER BY ���������� 
--8.	������� ���������� ����� �� ���������� ���� � ��������. ��������� ������������� �� ��������.
SELECT 
	LEN(Name) AS  ����������_����,
	COUNT (Name) AS ����������_�����
FROM Country
GROUP BY LEN(Name)
ORDER BY ����������_���� DESC
--9.	���������, ��� ����� 20 ��� ��������� ���� �������� �� 10%.
--������� ������ ����������� � �������������� ����������:
SELECT Continent, (SUM(Population *1.1)) AS FLOAT
FROM Country
GROUP BY Continent

--10.	������� ������ �����������, ��� ������� �� ������� ����� ����������� � ����������� �������� �� ����� � 10000 ���:
SELECT Continent
FROM Country
GROUP BY Continent
HAVING MAX(CAST(Population AS DECIMAL)) <= 1000 * MIN(CAST(Population AS DECIMAL ))
--11.	������� ������� ����� �������� ����������� �����.
SELECT AVG(CAST(LEN (Name)AS FLOAT)) AS ������_�����
FROM Country
WHERE Continent = '������'
--12.	������� ������ �����������, � ������� ������� ��������� ����� ����� � ������-���� ����� 1 ���. ���. 
--������, ��� 30 ���. �� ��. ��.
SELECT Continent, AVG (CAST(Population as float)/ Square) as ���������
FROM Country
WHERE Square > 1000000
GROUP BY Continent
HAVING AVG (CAST(Population as float)/ Square)> 30

--����� 6
-- ���������
CREATE TABLE Faculty (
    Abbreviation VARCHAR(2) PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Faculty (Abbreviation, Name)
VALUES ('��', '������������ �����'),
       ('��', '������������ �����'),
       ('��', '�������������� ����������'),
       ('��', '������-��������������');

--�������
CREATE TABLE Department (
    Code VARCHAR(2) PRIMARY KEY,
    Name VARCHAR(50),
    FacultyAbbreviation VARCHAR(2),
    FOREIGN KEY (FacultyAbbreviation) REFERENCES Faculty (Abbreviation)
);
INSERT INTO Department (Code, Name, FacultyAbbreviation)
VALUES ('��', '������ ����������', '��'),
       ('��', '�������������� �������', '��'),
       ('��', '�������������� �������������', '��'),
       ('��', '����� ������', '��'),
       ('��', '���������� �����������', '��'),
       ('��', '����������������� ������', '��');

--  ���������
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
VALUES (101, '��', '�������� �.�.', '���. ��������', 35000.00, 101),
       (102, '��', '������� �.�.', '�������������', 25000.00, 101),
       (105, '��', '������ �.�.', '�������������', 25000.00, 101),
       (153, '��', '�������� �.�.', '�������', 15000.00, 102),
       (201, '��', '������� �.�.', '���. ��������', 35000.00, 201),
       (202, '��', '������� �.�.', '�������������', 25000.00, 201),
       (241, '��', '������ �.�.', '�������', 20000.00, 201),
       (242, '��', '������ �.�.', '�������', 15000.00, 202),
       (301, '��', '����� �.�.', '���. ��������', 35000.00, 301),
       (302, '��', '�������� �.�.', '�������������', 25000.00, 301),
       (401, '��', '������ �.�.', '���. ��������', 35000.00, 401),
       (402, '��', '������ �.�.', '�������������', 25000.00, 401),
       (403, '��', '������� �.�.', '�������������', 15000.00, 401),
       (435, '��', '����� �.�.', '�������', 20000.00, 402),
       (501, '��', '�������� �.�.', '���. ��������', 35000.00, 501),
       (502, '��', '�������� �.�.', '�������������', 25000.00, 501),
       (503, '��', '�������� �.�.', '�������������', 25000.00, 501),
       (601, '��', '������ �.�.', '���. ��������', 35000.00, 601),
       (602, '��', '�������� �.�.', '�������������', 25000.00, 601),
       (614, '��', '��������� �.�.', '�������', 20000.00, 602);


-- �������������
CREATE TABLE Specialization (
    Number VARCHAR(10) NOT NULL PRIMARY KEY,
    Direction VARCHAR(50) NOT NULL,
    Code VARCHAR(10) NOT NULL
);
INSERT INTO Specialization (Number, Direction, Code)
VALUES
    ('01.03.04', '���������� ����������', '��'),
    ('09.03.02', '�������������� ������� � ����������', '��'),
    ('09.03.03', '���������� �����������', '��'),
    ('14.03.02', '������� ������ � ����������', '��'),
    ('38.03.05', '������-�����������', '��');


-- ����������
CREATE TABLE Discipline (
    Code INT NOT NULL PRIMARY KEY,
    Volume INT NOT NULL,
    Title VARCHAR(50) NOT NULL,
    Executor VARCHAR(50) NOT NULL
);
INSERT INTO Discipline (Code, Volume, Title, Executor)
VALUES
    (101, 320, '����������', '��'),
    (102, 160, '�����������', '��'),
    (103, 160, '������', '��'),
    (202, 120, '���� ������', '��'),
    (204, 160, '�����������', '��'),
    (205, 80, '����������������', '��'),
    (209, 80, '�������������', '��');


-- ������
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

--���_��������
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

-- �������
CREATE TABLE Engineer (
    Tab_Number INT NOT NULL,
    Specialization VARCHAR(50) NOT NULL
);

INSERT INTO Engineer (Tab_Number, Specialization)
VALUES
    (153, '����������'),
    (241, '����������'),
    (242, '�����������'),
    (435, '����������'),
    (614, '�����������');


-- �������������
CREATE TABLE Teacher (
    Tab_Number INT NOT NULL PRIMARY KEY,
    Rang VARCHAR(50) NOT NULL,
    Degree VARCHAR(50) NOT NULL
);

INSERT INTO Teacher (Tab_Number, Rang, Degree)
VALUES
    (101, '���������', '�. �.�.'),
    (102, '������', '�. �.-�. �.'),
    (105, '������', '�. �.�.'),
    (201, '���������', '�. �.-�. �.'),
    (202, '������', '�. �.-�. �.'),
    (301, '���������', '�. �.�.'),
    (302, '������', '�. �.�.'),
    (401, '���������', '�. �.�.'),
    (402, '������', '�. �.�.'),
    (403, '���������', '-'),
    (501, '���������', '�. �.-�. �.'),
    (502, '���������', '�. �.-�. �.'),
    (503, '������', '�. �.-�. �.'),
    (601, '���������', '�. �.-�. �.')

-- �������
CREATE TABLE Student (
    Reg_Number INT NOT NULL PRIMARY KEY,
    Number VARCHAR(10) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL
);
INSERT INTO Student (Reg_Number, Number, Last_Name)
VALUES
    (10101, '09.03.03', '��������� �. �.'),
    (10102, '09.03.03', '������ �. �.'),
    (10103, '09.03.03', '������ �. �.'),
    (20101, '09.03.02', '������� �. �.'),
    (20102, '09.03.02', '������� �. �.'),
    (30101, '14.03.02', '���������� �. �.'),
    (30102, '14.03.02', '������� �. �.'),
    (30103, '14.03.02', '������ �. �.'),
    (50101, '01.03.04', '������� �. �.'),
    (50102, '01.03.04', '��������� �. �.'),
    (80101, '38.03.05', '������� �. �.'),
    (80102, '38.03.05', '������� �. �.');

-- �������
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
    ('2015-06-05', 102, 10101, 102, '�505', 4),
    ('2015-06-05', 102, 10102, 102, '�505', 4),
    ('2015-06-05', 202, 20101, 202, '�506', 4),
    ('2015-06-05', 202, 20102, 202, '�506', 3),
    ('2015-06-07', 102, 30101, 105, '�419', 3),
    ('2015-06-07', 102, 30102, 101, '�506', 4),
    ('2015-06-07', 102, 80101, 102, '�425', 5),
    ('2015-06-09', 205, 80102, 402, '�424', 4),
    ('2015-06-09', 209, 20101, 302, '�333', 3),
    ('2015-06-10', 101, 10101, 501, '�506', 4),
    ('2015-06-10', 101, 10102, 501, '�506', 4),
    ('2015-06-10', 204, 30102, 601, '�349', 5),
    ('2015-06-10', 209, 80101, 301, '�105', 5),
    ('2015-06-10', 209, 80102, 301, '�105', 4),
    ('2015-06-12', 101, 80101, 502, '�324', 4),
    ('2015-06-15', 101, 30101, 503, '�417', 4),
    ('2015-06-15', 101, 50101, 501, '�201', 5),
    ('2015-06-15', 101, 50102, 501, '�201', 3),
    ('2015-06-15', 103, 10101, 403, '�414', 4),
    ('2015-06-17', 102, 10101, 102, '�505', 5);
--	1.	������� �� ������ ��������, ��������������� � �������� ������ � ���������, ������� ��������� �� ������ ���������� (��������, ���).
SELECT 
s.Last_Name AS ������� , s2.Direction AS �����������, d.Name AS �������
FROM Student s
INNER JOIN Specialization s2 ON s.Number = s2.Number 
INNER JOIN Department d ON s2.Code=d.Code
WHERE d.FacultyAbbreviation='��'
--2.������� �� ������ ��������, ��������������� � ���������� ������ � �����-������ �������� (���������, ����, ��������, ������� �����������). ����������� �����-���� �� �������, �� ������� ���� ������ � ������� ���������������.
SELECT f.Name AS Faculty, d.Code, d.Name AS Department, e.LastName AS ChiefLastName
FROM Department d
JOIN Faculty f ON d.FacultyAbbreviation = f.Abbreviation
JOIN Employee e ON d.Code = e.DepartmentCode
WHERE e.Position = '���. ��������';
--3.������� � ������� ��� ������� ���������� ����� � ������� ��� �������������-���� ������������. ��� ���������� ��������� ���� ������������ �������� ������.
SELECT e1.TabNumber, e1.LastName, e2.LastName AS ChiefLastName
FROM Employee e1
LEFT JOIN Employee e2 ON e1.ChiefTabNumber = e2.TabNumber;
--4.������� ������ ���������, ������� ������� ��� ��������.
SELECT s.Last_Name, COUNT(e.Reg_Number) AS ExamsCount
FROM Student s
JOIN Exam e ON s.Reg_Number = e.Reg_Number
GROUP BY s.Last_Name
HAVING COUNT(e.Reg_Number) >= 2;
--5.������� ������ ��������� � ���������, ������� 20000 ���.
SELECT e.LastName
FROM Employee e
JOIN Engineer eng ON e.TabNumber = eng.Tab_Number
WHERE e.Salary < 20000;
--6.������� ������ ���������, ������� �������� � �������� ���������.
SELECT s.Last_Name
FROM Student s
JOIN Exam e ON s.Reg_Number = e.Reg_Number
WHERE e.Room = '�505';
--7.������� �� ������ �������� � �������� ������� ������ � ������� ���������, � ����� ���������� ������� ��������� � ������� ���� ��� ������� �������� ������ ��� ��� ���������, � ������� ������� ���� �� ������ ��������� (��������, 4).
SELECT s.Reg_Number, s.Last_Name, COUNT(e.Reg_Number) AS ExamsCount, AVG(e.Grade) AS AverageGrade
FROM Student s
JOIN Exam e ON s.Reg_Number = e.Reg_Number
GROUP BY s.Reg_Number, s.Last_Name
HAVING AVG(e.Grade) >= 4;
--8.������� ������ ���������� ��������� � �� ��������, � �������.
SELECT e.LastName, e.Salary, t.Degree
FROM Employee e
JOIN Teacher t ON e.TabNumber = t.Tab_Number
WHERE e.Position = '���. ��������';
---9.������� ������ �����������.
SELECT e.LastName
FROM Employee e
JOIN Teacher t ON e.TabNumber = t.Tab_Number
WHERE t.Rang = '���������';
--10.������� �������� ����������, �������, ��������� � ������� �������������, ���� � ����� ���������� ��������� � ��������������� ������� � �������� ��������� ����.
SELECT d.Title, e.LastName, e.Position, t.Degree, ex.Date, ex.Room
FROM Exam ex
JOIN Discipline d ON ex.Code = d.Code
JOIN Employee e ON ex.Tab_Number = e.TabNumber
JOIN Teacher t ON e.TabNumber = t.Tab_Number
WHERE ex.Date BETWEEN '2015-06-05' AND '2015-06-17';
--11.������� ������� ��������������, ��������� ����� ���� ���������.
SELECT e.LastName, COUNT(ex.Tab_Number) AS ExamsCount
FROM Employee e
JOIN Exam ex ON e.TabNumber = ex.Tab_Number
GROUP BY e.LastName
HAVING COUNT(ex.Tab_Number) > 3;
--12.������� ������ ���������, �� ������� �� ������ �������� � ��������� ����.
SELECT s.Last_Name
FROM Student s
LEFT JOIN Exam e ON s.Reg_Number = e.Reg_Number AND e.Date = '2023-05-15'
WHERE e.Reg_Number IS NULL;

-- ����� 7 

--1.	������� ������������ ��������� ���������� ��������, ������� �������� ������ � �������� ������ 500 ��. �� � � �������� ������ 5 ���. ��. ��:
SELECT *
FROM Country
WHERE Square < 500
UNION
SELECT * 
FROM Country
WHERE Square> 5000000
--2.	������� ������ ����� � �������� ������ 1 ���. ��. ��, ��������� ������ � ����-������ ������ 100 ���. ���.:
SELECT * 
FROM Country 
WHERE Square > 1000000
EXCEPT 
SELECT * 
FROM Country 
WHERE Population < 100000000
--3.	������� ������ ����� � �������� ������ 500 ��. �� � � ���������� ������ 100	���. ���.
SELECT * 
FROM Country
WHERE Square < 500
INTERSECT 
SELECT *
FROM Country
WHERE Population < 100000

-- ����� 8 
--1.	������� ������ ����� � ���������� ����������� ������� ������ �� ��� � ����� ������� ���� ����� ����.
SELECT *,
ROUND (CAST(Square AS FLOAT) * 100 /(SELECT SUM(SQUARE) FROM Country), 3) AS �������
FROM Country 
ORDER BY ������� DESC

--2.	������� ������ ����� ����, ��������� ��������� ������� ������, ��� ������� ��������� ��������� ���� ����� ����.
SELECT * 
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country)
--3.	� ������� ���������� ������� ������ ����������� �����, ��������� ������� ������ 5 ���. ���.
SELECT *
FROM ( SELECT * FROM Country WHERE Continent = '������') A
WHERE Population > 50000000

--4.	������� ������ ����� � ���������� ����������� �� ������� � ��������� ���-���� ��� ����� ����, ��� ��� ���������.
SELECT *,
ROUND(CAST(Square AS FLOAT) * 100 /
(SELECT SUM(Square) FROM Country �
WHERE �.Continent = �.Continent), 3) AS �������
 
FROM
Country �

ORDER BY
������� DESC

--5.	������� ������ ����� ����, ������� ������� ������, ��� ������� ������� ����� ��� ����� �����, ��� ��� ���������.
 SELECT *
FROM
Country  �
WHERE
Population> (
SELECT
AVG(Population)
FROM
Country �
WHERE
�.Continent = �.Continent
)

--6.	������� ������ ����� ����, ������� ��������� � ��� ������ �����, ������� ����-����� ��������� ������� ��������� �����������.
SELECT *
FROM
Country �
WHERE
Population > (
SELECT
AVG(Population)
FROM
Country �
WHERE
�.Continent = �.Continent
)
--7.	������� ������ ���������������� �����, � ������� ����� ������ �����, ��� � ����� ����������� ������.
SELECT *
FROM Country
WHERE
Continent = '����� �������'
AND
Population> ALL (
SELECT
Population
FROM
Country
WHERE
Continent = '������'
)
--8.	������� ������ ����������� �����, � ������� ����� ������ �����, ��� ���� �� � ����� ���������������� ������.
SELECT *
FROM
Country
WHERE
Continent = '������'
AND
Population > ANY (
SELECT
Population
FROM
Country
WHERE
Continent = '����� �������'
)
--9.	���� � ������ ���� ���� �� ���� ������, ������� ������� ������ 2 ���. ��. ��, ������� ������ ���� ����������� �����.
SELECT *
FROM
Country
WHERE
Continent = '������'
AND
EXISTS (
SELECT *
FROM
Country
WHERE
Continent = '������'
AND
Square> 2000000
)
--10.	������� ������ ����� ��� ����� �����, ��� ��������� ������ ������.
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
Name= '�����'
)
--11.	������� ������ �����, ��������� ������� �� ��������� ��������� ������ ������.
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
Name = '�����'
)
--12.	������� �������� ������ � ���������� ���������� ����� ����� � ���������� �������� �� ������ ����������.
SELECT *
FROM
Country
WHERE
Population = (
SELECT
MAX(���_���)
FROM
(
SELECT
MIN(Population) AS ���_���
FROM
Country
GROUP BY
Continent
) A
)

--����� 9 

--1.	������� ������� �����������_������������. ���������� �������� ����, ����-���������, �������� �� ���������
CREATE TABLE Management_SHK
( ID_Management_SHK INT PRIMARY KEY,
Name_Mn NVARCHAR (50), 
SName_Mn NVARCHAR (50) NOT NULL,
Generated_Mn INT DEFAULT (1)
);

--2.	������� ������� �������_������������. ���������� �������� ����, �������-��� / ������ �� NULL, ������� �� �������� ��������.
CREATE TABLE Countries_SHK
(ID_Countries_SHK INT PRIMARY KEY,
    Name_Countries_SHK NVARCHAR(50) NOT NULL, 
    Population_Countries_SHK INT CHECK (Population_Countries_SHK >= 0)
	)
--3.	������� ������� ������_������������. ���������� �������� ����, �������� ������� �ID� ������� �����������, ��� ������� ������ ���������� �������� �� ��������� �����������.
CREATE TABLE Flowers_SHK
(
ID_Flowers_SHK INT PRIMARY KEY ,
Name_Fl NVARCHAR(50) NOT NULL,
Class_Fl NVARCHAR (50) DEFAULT '����������'
UNIQUE(ID_Flowers_SHK)
)
--4.	������� ������� ���������_������������. ���������� �������� ����, �����-��� ������� �ID� ������� �����������, ��� ������� ������ ���������� �������� �� ����-����� �������.
CREATE TABLE Animals_SHK
( ID_Animals_SHK INT PRIMARY KEY IDENTITY,
Name_An NVARCHAR(50) NOT NULL,
Otriad_An NVARCHAR(50) DEFAULT '������'
UNIQUE(ID_Animals_SHK)
)

--����� 10
CREATE TABLE �������
(	
	ID_������� INT PRIMARY KEY IDENTITY (1,1),
	SName NVARCHAR (50) NOT NULL,
	Predmet NVARCHAR (50) NOT NULL,
	School NVARCHAR (50) NOT NULL,
	Ball FLOAT CHECK ((Ball>=0)AND (Ball<=100)) NULL
)	
INSERT INTO ������� ( SName, Predmet, School, Ball )
VALUES
(	'�������','����������',	'�����', 98.5),					
('������', '������', '�����',99),					
( '�������', '����������', '�����', 	88),					
(	 '��������', '������', '��������',	78),
(	'��������', '�����', '�����', 	92),
(	'�������', '�����', '��������',	68),
(	'�������',	'����������', '��������',	81),
(	'������', '������',	'�����',	87),
(	 '��������', '�����', '�����', 	94),
( '��������', '�����', '�����',	88)

--1.	� ������� �������� ������ ����� ������ ��� ������� ����� � 18 ��������, ������ �������� �� ����� ����������.
INSERT INTO ������� ( SName, Predmet, School, Ball )
VALUES ('��������', '�����', '����� �18', NULL)
--2.	� ������� �������� ������ ��� ������.
INSERT INTO ������� ( SName, Predmet, School, Ball )
VALUES 
('��������', '�����', '����� �18', 95),
('������', '��������', '����� �18', 80),
('�������', '����������', '����� �18', 85)
--3.	� ������� �������� �������� ������ ��������, ����� ��������� �� � 21, ����-��� �� ����������, � ������ �� 56.
UPDATE �������
SET  School = '����� �21',
 Predmet = '����������',
 Ball = 56
WHERE SName = '��������'
--4.	� ������� �������� �������� ������ ���� �������� �� �����, ������ ��������� �� 10%, ���� ��� ���� 60 ������.
UPDATE �������
SET Ball = Ball * 1.1
WHERE Predmet = '�����' AND Ball < 60
--5.	� ������� �������� ������� ������ ���� �������� �� ����� �21.
DELETE FROM �������
WHERE School='����� �21'
--6.	������� ������� ������������ � ����������� ���� ������ ���� �����������, ����� ���, ������� ������� ������ 60 ������.
SELECT *
INTO ����������
FROM �������
WHERE Ball<60
--7.	�������� ������� ������������.
 TRUNCATE TABLE ����������

 --����� 11
-- 1.	���� ����� A � B. ����� � ������� �� ������������.
   DECLARE @A INT , @B INT, @C INT 
   SET @A = 5
   SET @B = 5 
   SET @C = @A * @B
   PRINT @C

--2.	� ������� �������� ����� ������� ����� �������� ������� ��������� � �����������.
DECLARE @LICEY FLOAT, @GIMN FLOAT, @DUFF FLOAT 
SET @LICEY = 
(SELECT AVG(Ball) FROM ������� WHERE School = '�����')
SET @GIMN= 
(SELECT AVG(Ball) FROM ������� WHERE School = '��������')
SET @DUFF = ABS(@LICEY- @GIMN)
PRINT @DUFF

--3.	� ������� �������� ��������� �� �������� ���������� �����.
DECLARE @col_str int
set @col_str = (Select COUNT(ID_������� from �������)
if (@col_str%2 = 0)
print '������ = ' + CAST(@col_str AS VARCHAR(4))
else 
print '�������� = ' + CAST(@col_str AS VARCHAR(4))
--4.	���� �������������� �����. ������� ����� ��� ����.
   DECLARE @A INT , @B INT, @C INT 
   SET @A = 1254
   SET @B = 3214
   SET @C = @A + @B
   PRINT @C
--5.	���� ��������� ����� ����� a, b � c. ����� ���������� �� ���.
DECLARE @a INT = RAND() * 100, @b INT = RAND() * 100
IF @a<@b
PRINT '@a=' + CAST (@a AS VARCHAR(3))
ELSE 
PRINT '@b= ' + CAST (@b AS VARCHAR(3))
--6.	���� ��������� ����� ����� a. ���������, ������� �� ������ ����� �� 11.
DECLARE @U INT = RAND() * 100
IF @U % 11 =  0 
PRINT CAST (@U AS VARCHAR(3)) + '������� �� 11'
ELSE 
PRINT CAST (@U AS VARCHAR(3)) + ' �� ������� �� 11'
--7.	���� ��������� ����� ����� N (N < 1000). ���� ��� �������� �������� ����� 3, �� ������� ���, ���� �� �������� � ������� ����.
DECLARE @K INT = RAND() * 1000
WHILE @K%3 = 0
SET @K= @K/3
IF @K=1
PRINT '��'
ELSE 
PRINT '���'
--8.	���� ��������� ����� ����� a � b. ����� ���������� ����� ������� (���).
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
PRINT '��K = ' + CAST(@a AS VARCHAR(4))
--9.	���� ��� ����� ����� A � B (A<B). ����� ����� ��������� ���� ����� ����� �� A �� B ������������.
DECLARE @A INT = 5, @B INT = 10, @S INT = 0
WHILE @A <=@B
BEGIN 
SET @S = SQUARE (@S+@A)
SET @A = SQUARE(@A +1)
END
PRINT '�����='+ CAST (@S AS VARCHAR (5))
--10.	����� ������ ����������� �����, ������� ��� ������� �� 2, 3, 4, 5, � 6 ���� ������� 1, �� ������� �� 7.
DECLARE @A10 INT = 1
WHILE @A10 < 500
BEGIN
IF(@A10 % 2 = 1) AND (@A10 % 3 = 1) AND (@A10 % 4 = 1) AND (@A10 % 5 = 1) AND (@A10 % 6 = 1) AND (@A10 % 7 = 0)
PRINT @A10
SET @A10 = @A10 + 1
END
--11.	������� ���� ������� �� ����� ������� ���, ������� � ��� ����.
DECLARE @V INT,  @C CHAR(7) = '�������'
SET  @V = LEN(@C)
WHILE @V>0
BEGIN 
PRINT @C
SET @V=@V-1
END
--12.	�������� ��� ��� ������ �� ����� � ������� �����:
--�
--���
--�����
--�������
--���������
--�����������
--�������������
--���������������
--�����������������
--�������������������
--���������������������
--�����������������������
--�������������������������
DECLARE @text NVARCHAR(MAX)
SET @text = '�������������'
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

--����� 12
--1.	�������� ������� ��� ������ �������� ������ � �������� ��������, � �������� ��.
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
SELECT dbo.Zad_1('����')


--2.	�������� ������� ��� �������� ��������� � ���. ���. � �������� ��.
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
dbo.Zad_2(Population) AS [���. ���]
FROM
Country

--3.	�������� ������� ��� ���������� ��������� ��������� �������� ����� ����� � �������� ��.
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
 
--4.	�������� ������� ��� ������ ������, ������� �� ��������� � �������� ��.
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
dbo.Zad_4() AS [������ �� ������� ������]

--5.	�������� ������� ��� ������ ������ � ������������ ���������� � �������� ��-��� ����� � �������� ��. ���� ����� ����� �� �������, ������� ����.
CREATE FUNCTION Zad_5
(
@Continent AS VARCHAR(50) = '����'
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
dbo.Zad_5(DEFAULT) AS [���������� �� ��������� ������ � ����]

--6.	�������� ������� ��� ������ ���� � �������� ����� �� ������� �� ����������-��� �� ����� � ��������� �� ��� ������� ������.
CREATE FUNCTION Zad_66
(
@A AS VARCHAR(50)
)
RETURNS VARCHAR(50)
AS
BEGIN
RETURN LEFT(@A, 1) + REPLICATE('����', LEN(@A) - 3) + RIGHT(@A, 1)
END
SELECT Name,
dbo.Zad_66(Capital) as �������
,Continent
,Square
,Population
FROM
Country

--7.	�������� �������, ������� ���������� ���������� �����, �� ���������� � �����-��� �������� �����.
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
dbo.Zad_7('�')
--8.	�������� ������� ��� �������� ������ ����� � �������� ������ ��������� ����� � �������� ��.
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

--9.	�������� ������� ��� �������� ������ ����� � ���������� � ��������� �������� �������� � �������� ��.
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
--10.	�������� ������� ��� �������� ������� � ��������� ���������� � ��������� ���������� � �������� ��.
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
--11.	�������� ������� IsPalindrom(P) ������ ����, ������������ 1, ���� ����� ��-������ P (P > 0) �������� �����������, � 0 � ��������� ������.
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

--����� 13
--1.	�������� �������������, ���������� ������ ����������� �����, ��������� ������� ������ 10 ���. ���., � ������� ������ 500 ���. ��. ��, � ����������� ���.
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
--2.	�������� �������������, ���������� ������ �����������, ������� ������� �����, ������� ��������� �� ���, ������� ��������� ���������, � ����������� ���.
CREATE VIEW Zad_2_13
AS
SELECT
 Continent,
AVG(Square) AS ����_�������,
AVG(Population * 1.0 / Square) AS ����_���������_���������
FROM
Country
GROUP BY
Continent;

SELECT
    Continent,
    ����_�������,
    ����_���������_���������
FROM
    Zad_2_13
--3.	�������� �������������, ���������� ������� ��������������, �� ���������, ���-���, �������, ����� ������, ���������� �� ���������, � ����������� ���.
CREATE VIEW Zad_3_13
AS
SELECT e.LastName, e.Position, t.Rang, t.Degree, e.DepartmentCode, COUNT(emp.Code) '���������� ���������' 
FROM dbo.Teacher t Join dbo.Employee e ON t.Tab_Number = e.TabNumber
JOIN dbo.Exam emp ON t.Tab_Number = emp.Tab_Number 
JOIN dbo.Department d ON e.DepartmentCode = d.Code
GROUP BY  e.LastName, e.Position, t.Rang, t.Degree, e.DepartmentCode
SELECT *
FROM Zad_3_13
--4.	�������� ��������� ����������, ���������� ��� ������� (������ ������, ��������� ������, ����������� ����), ��������� �� ��� �������� ����, � ����������� ��.
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
--5.	�������� ��������� ����������, ���������� ������ �����, ������� ������� � 100	��� ������, ��� ������� ������� ����� �� ����������, ��� ��� ���������, � ����������� ��.
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

--6.	�������� ��������� ��������� �������, ������� ��� ������� (������ ������, ����������� ���������, ����������� ���������), ��������� � ����������� ��.
SELECT
DATEPART(WEEK, Date) AS [����� ������], 
COUNT(DISTINCT e.Code) AS [���������� ���������], 
COUNT(DISTINCT e.Reg_Number) AS [���������� ���������]
INTO Zad_6
FROM dbo.Exam e
GROUP BY DATEPART(WEEK, Date)
SELECT * 
FROM Zad_6
--7.	�������� ���������� ��������� �������, ���������� �������� �����������, ���������� � ���������� ������� ����� �� ���, ��������� � ����������� ��.
CREATE TABLE Zad_7
(
    Continent VARCHAR(50),
    BigSquare FLOAT,
    SmallSquare FLOAT
);
INSERT INTO Zad_7 (Continent, BigSquare, SmallSquare)
SELECT
    Continent,
    MAX(Square) AS �����������������,
    MIN(Square) AS �����������������
FROM
    Country
GROUP BY
    Continent;
SELECT *
FROM
 Zad_7;
--8.	� ������� ���������� ��������� ��������� �������� ������ ��� ������ ������ �����������, ��� �������� ������, ��� ������� �������� �� ����������, �� �������� � �����-��� ����������.
WITH ��� AS
(
SELECT d.Name AS �������, d.Code, AVG(Salary) AS [������� �������� �� �������]
FROM dbo.Employee emp
INNER JOIN dbo.Department d ON d.Code = emp.DepartmentCode
GROUP BY d.Name, d.Code
)
SELECT emp.LastName, emp.Salary, a.�������, a.[������� �������� �� �������]
FROM dbo.Employee emp
INNER JOIN ��� a ON a.Code = emp.DepartmentCode
WHERE emp.Salary < a.[������� �������� �� �������]
SELECT * 
FROM dbo.Employee emp
--9.	�������� ������� ��� �������� ���� ��������� ���� �������������.
DROP VIEW Zad_1_13
DROP VIEW Zad_2_13
DROP VIEW Zad_3_13
--����� 14
--1.	�������� ������, ���������� ��������������� �� ������ ������� � ����� ���-�����, �������� ���, �������� ������ ������, �������� � ���������� ������.
DECLARE Zad_1 CURSOR
FOR
SELECT
SNAme,
Ball
FROM
�������
ORDER BY
Ball 
OPEN Zad_1
FETCH Zad_1
CLOSE Zad_1
DEALLOCATE Zad_1

--2.	�������� ������ � ����������, ���������� ������ ��������, �������� ���,
--����-���� �����, ����������, � ����� ���������, ���������, ������ ������, �������� � ������-���� ������.
DECLARE Zad_2 CURSOR SCROLL
FOR
SELECT *
FROM
�������
OPEN Zad_2
FETCH ABSOLUTE 5 FROM Zad_2
FETCH PRIOR FROM Zad_2
FETCH ABSOLUTE -4 FROM Zad_2
FETCH NEXT FROM Zad_2
FETCH FIRST FROM Zad_2
CLOSE Zad_2
DEALLOCATE Zad_2
--3.	�������� ������ � ����������, ���������� ������ ��������,
--�������� ���, ����-���� ���������, ����� ������� ����� �����������,
--������ ������� ������ ����������� ������, �������� � ���������� ������.
DECLARE Zad_3 CURSOR SCROLL
FOR
SELECT *
FROM
�������
OPEN Zad_3
FETCH LAST FROM Zad_3
FETCH RELATIVE -6 FROM Zad_3
FETCH RELATIVE 4 FROM Zad_3
CLOSE Zad_3
DEALLOCATE Zad_3
--4.	� ������� �������, ��������� ����� ������ � �������� � ���������� � ���������� ������.
DECLARE Zad_4 CURSOR SCROLL
FOR
SELECT
Ball
FROM
�������
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

--5.	� ������� �������, ������������ ������ ����
--�������� <������ ������� � �������� ���������, ����������� ��������> ����������� � ���������.
DECLARE Zad_5 CURSOR SCROLL FOR
SELECT
SName,Predmet
FROM
�������
DECLARE @Student VARCHAR(100), @SNAme VARCHAR(50), @Predmet VARCHAR(50)
OPEN Zad_5
--SET @S = '�������'
FETCH NEXT FROM Zad_5 INTO @SName, @Predmet
WHILE @@FETCH_STATUS = 0
BEGIN
SET @Student='�������'+','+@Sname+'�� �������� "'+@Predmet+'"'
FETCH NEXT FROM Zad_5 INTO @Sname, @Predmet
END
SET @Student = @Student + ' ����������� �� ���������.'
PRINT @Student
CLOSE Zad_5
DEALLOCATE Zad_5
--6.	�������� ������, ���������� ������ ��������,
--� ��� ������� �������� �������� � �������� ��������.
DECLARE Zad_6 CURSOR FOR
SELECT SName
FROM �������;
OPEN Zad_6;
DECLARE @Name NVARCHAR(MAX);
DECLARE @Position INT;
SET @Position = 1;
FETCH NEXT FROM Zad_6 INTO @Name;
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @Position % 2 = 1
    BEGIN
        PRINT '������ � �������� ��������: ' + @Name;
    END
    SET @Position = @Position + 1;
    FETCH NEXT FROM Zad_6 INTO @Name;
END;
CLOSE Zad_6;
DEALLOCATE Zad_6;

--7.	�������� ������, ���������� ��������������� �� �������� ������ ������ ���-�����, 
--�������� ���, ��� ������� ������� �������� �������, �������, 
--�����, ����� � ���-������� ����������� ������ � ���������� ��������.
DECLARE Zad_7 CURSOR FOR
SELECT SName, Predmet, School, Ball
FROM �������
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
    PRINT '�������: ' + @S_Name;
    PRINT '�������: ' + @Predmett;
    PRINT '�����: ' + @School;
    PRINT '�����: ' + CAST(@Ball AS NVARCHAR(MAX));
    PRINT '���������� ����������� � ���������� ��������: ' + CAST(@Procent AS NVARCHAR(MAX)) + '%';
    SET @LastBall = @Ball;
    FETCH NEXT FROM Zad_7 INTO @S_Name, @Predmett, @School, @Ball;
END;
CLOSE Zad_7;
DEALLOCATE Zad_7;
--����� 15
--1.	������� ������ �������� � ������� ����� ������� ������� � ������������ ���-��� � ������ ������.
SELECT *,
Ball- MAX(Ball) OVER() AS �������_C_����_������
FROM
�������

--2.	������� ������ �������� � ���������� ����������� � �������� ����� � ������ ������.
SELECT * ,
Ball * 100 / AVG(Ball) OVER() AS �������_�������
FROM
�������
--3.	������� ������ �������� � ����������� ���� � ����� � ������ ������.
SELECT *,
MIN(Ball) OVER(PARTITION BY School) AS ����_��
FROM
�������
--4.	������� ������ �������� � ��������� ���� � ����� � ������ ������, ���������-���� �� ������ � ������� �������.
SELECT *,
SUM(Ball) OVER(PARTITION BY School ORDER BY School) AS ����_����
FROM �������
--5.	������� ������ �������� � ����� ������ ��� ���������� �� �������� � �������� ���������� �������.
SELECT
ROW_NUMBER() OVER(ORDER BY SName DESC) AS �����_������,
*
FROM
�������
--6.	������� ������ ��������, ����� ������ ������ ����� � ���������� �������� � ����� ��� ���������� �� ������ �� ��������.
SELECT
ROW_NUMBER() OVER(PARTITION BY School ORDER BY Ball DESC) AS �����_������,
*
FROM
�������

--7.	������� ������ �������� � ���� �� ������.
SELECT
RANK() OVER( ORDER BY Ball DESC) AS ����,
*
FROM
�������
--8.	������� ������ �������� � ������ ���� �� ������. ��������� ������������� �� ������� � ���������� �������.
SELECT
DENSE_RANK() OVER( ORDER BY Ball DESC) AS ����,
*
FROM
�������
ORDER BY
SName
--9.	������� ������ ��������, �������������� �� ���� ������� �� �������.
SELECT
NTILE(5) OVER(ORDER BY SName) AS ��_���,
*
FROM
�������
--10.	������� ������ ��������, �������������� �� ���� ������� �� ������ ������ �����.
SELECT
NTILE(3) OVER(PARTITION BY School ORDER BY Ball DESC) AS ��_����,
*
FROM
�������
--11.	������� ������ �������� � ������� � ������� �������, ������������ ���� �� ��� ������� ��� ���������� �� ����������� ������.
SELECT 
*,
Ball, Ball - LAG(Ball, 3) OVER (ORDER BY Ball ASC) AS �������
FROM 
�������
ORDER BY Ball
--12.	������� ������ �������� � ������� � ������� ���������� ������� ��� �����-����� �� �������� ������, �������� �� ��������� ������������ 0.
SELECT 
* , COALESCE(�.Ball - �.Ball, 0) AS �������
FROM 
������� �
LEFT JOIN ������� �1 ON �.ID_�������= �1.ID_������� + 1
ORDER BY �.Ball DESC;

--����� 16

--1.	�������� ������, ������� ������� ������������ ���� �������� �� ������, �� ������� �������� �� ������ ����� � ������������� �����.
SELECT SName, School, Predmet, MAX(Ball) AS ������������_���� 
FROM �������
GROUP BY SName, School, Predmet WITH ROLLUP
--2.	�������� ������, ������� ������� ����������� ���� �������� �� ������ � �� ���������, � ������������� �����.
SELECT SName, School, Predmet, MIN(Ball) AS ���_���� 
FROM �������
GROUP BY SName, School, Predmet WITH CUBE
--3.	�������� ������, ������� ������� ������� ���� �������� �� ������ � �� ���������.
SELECT Predmet,School,AVG(Ball) AS �������_���� 
FROM �������
GROUP BY GROUPING SETS(Predmet, School) 
--4.	�������� ������, ������� ������� ���������� �������� �� ������ ����� �� ����-����� � ������������� �����. NULL �������� �������� �� ��������������� �����.
SELECT
COALESCE(Predmet, '�����') AS �������,
COALESCE(School, '�����') AS �����,
COUNT(SName) AS ����������
FROM �������
GROUP BY
ROLLUP(Predmet, School)
--5.	�������� ������, ������� ������� ��������� ���� �������� �� ������ � �� ����-�����, � ������������� �����. � �������� ������� NULL �������� �������� �� �����������-���� ����� � ����������� �� �����������.
SELECT 
IIF(GROUPING(Predmet)=1, '�����', Predmet) AS �������, 
IIF(GROUPING(School)=1, '�����', School) AS ����� , 
SUM(Ball) AS ���_����
FROM ������� 
GROUP BY CUBE(Predmet,School)
--6.	�������� ������, ������� ������� ������������ ���� �������� �� ������ � �� ���������. � �������� ������� NULL �������� �������� �� ��������������� ����� � ����-������� �� ������� �����������.
SELECT CASE GROUPING_ID(Predmet, School) 
WHEN 1 THEN '����� �� ���������' 
WHEN 3 THEN '�����' 
ELSE ''END AS ����� ,
ISNULL(Predmet, '') AS �������,
ISNULL(School, '') AS ����� ,
MAX(Ball) AS ������������_����
FROM �������
GROUP BY ROLLUP(Predmet, School)
--7.	�������� ������, ������� ������� ������� ���� �������� �� ������ � �������.
SELECT School, AVG(Ball) AS PIVOT_TABLE
FROM �������
GROUP BY School   
--8.	�������� ������, ������� ������� ������� ���� �������� �� ������ � ������� � �� ��������� � ������.
SELECT Predmet, AVG(CASE WHEN School = '��������' THEN Ball END) AS '��������', 
AVG(CASE WHEN School = '�����' THEN Ball END) AS '�����'FROM �������
GROUP BY Predmet;
--9.	�������� ������, ������� ������� �������� ���������, ������� �������� � ����� � ���� �������.
 SELECT
SName,
[������� ��� �����]
FROM �������
UNPIVOT (
[������� ��� �����] FOR �������� IN (Predmet, School)) unpvt

--����� 17
--1.	�������� � ��������� ������������ SQL-������, ���������� ������ N ����� �� �������� �������.
DECLARE @DSQL VARCHAR(100)
DECLARE @TN VARCHAR(50)
SET @TN = '�������'
SET @DSQL = 'SELECT TOP 3 * FROM ������� ' + @TN
EXECUTE (@DSQL)
--2.	�������� � ��������� ������������ SQL-������, ���������� ��� ������ �� ������� ��������, ��������� ����� �������� ������� ����������� � �������� ���������.
DECLARE @L1 CHAR (1)
DECLARE @L2 CHAR (1)
SET @L1 = '�'
SET @L2 = '�'
EXECUTE ('SELECT * FROM COUNTRY WHERE Name LIKE ''%[' + @L1 + '-' + @L2 +']''')
--3.	�������� ��������� ������� #Temp � �������� � ��� �������� �������� ������� ��������. �������� ������, �������, ��������� ����� ������� #Temp, 
--�������� ������ ��� ��������������� ������� �� ������� ��������.
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
--4.	�������� ���������, ������� ��������� ��� �������� ������ ��������, �������� ������� � �������� �������� ������� �� �������� �������.
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
--5.	�������� ���������, ����������� ��� �������� ������ ��������, �������� ���-����, �������� ������������ �������, ���� ���������, �������� �������� � ���������� ��-������ ������� �� �������� ������� � �������� ��������.
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
--6.	�������� ������ ����������� ����� �� ������� �������� � ������������� � RAW ������� XML.
SELECT *
FROM Country
WHERE Continent = '������'
FOR XML RAW
--7.	�������� ������ ����� � ���������� ������ 100 ���. ���. �� ������� �������� � ������������� � PATH ������� XML.
SELECT * 
FROM Country
WHERE Population >100000000
FOR XML PATH
--8.	�������� ������ �������� �� ����� ������ �� ������� �������� � ��������-����� � PATH ������� JSON
 SELECT * 
 FROM �������
 WHERE School = '�����'
 FOR JSON PATH


