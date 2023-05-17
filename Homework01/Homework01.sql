create database Homework01
use Homework01

--Tabele Students--
create table Students
(
	Id int identity(1,1),
	FirstName nvarchar(100) not null,
	LastName nvarchar(100) not null,
	DateOfBirth datetime2 not null default '',
	 EnrolledDate datetime2 not null default '',
	Gender nchar(1),
	NationalIdNumber char(15) not null,
	StudentCardNumber char(10) not null,
)
INSERT INTO Students(FirstName, LastName, Gender, NationalIdNumber,StudentCardNumber)
VALUES('Roze', 'Dobrinova', 'F', '123456789', '54321678')

INSERT INTO Students(FirstName, LastName, Gender, NationalIdNumber,StudentCardNumber)
VALUES('Blagica', 'Mihajlovska', 'F', '6754525289', '7807394')

select * from Students
--Tabele Students--

--Table Teacher--
create table Teacher
(
	Id int identity(1,1),
	FirstName nvarchar(100) not null,
	LastName nvarchar(100) not null,
	DateOfBirth datetime2 not null default '',
	AcademicRank nvarchar(100) not null,
	HireDate datetime2 not null default '',
)
Insert into Teacher(FirstName, LastName, AcademicRank)
Values('Aneta', 'Hristova', 'Professor');

Insert into Teacher(FirstName, LastName, AcademicRank)
Values('Marko', 'Boskov', 'Associate Professor');

select * from Teacher
--Table Teacher--

--Table Grades--
create table Grades
(
	Id int not null,
	StudentId int not null,
	CourseId int not null,
	TeacherId int not null,
	Grade int not null,
	Comment nvarchar(MAX) not null default '',
	CreatedDate datetime2 not null default GetDate()
	
)
Insert into Grades(Id, StudentId, CourseId, TeacherId, Grade, Comment)
Values(5, 7,8,2,5, 'Well done!')

select * from Grades
--Table Grades--

--Table Courses--
create table Courses
(
	Id int not null,
	[Name] nvarchar(255) not null,
	Credit decimal not null,
	AcademicYear int not null,
	Semester varchar(20) not null
)
Insert into Courses(Id, [Name], Credit, AcademicYear, Semester)
Values(10, 'Viktorija', 34.54, 2023, 'second');

Alter table Courses
drop column Credit;

Alter table Courses
add Credit decimal(18,2);

select * from Courses
--Table Courses--

--Table GradeDetails--
create table GradeDetails
(
	Id int not null,
	GradeId int not null,
	AchievementTypeId int not null,
	AchievementPoints decimal not null,
	AchievementMax decimal not null,
	AchievementDate datetime2 not null default GetDate()
)
Insert into GradeDetails(Id, GradeId, AchievementTypeId, AchievementPoints, AchievementMax)
Values(3, 5, 25, 83.34, 97.12);

Alter table GradeDetails
drop column AchievementPoints;

Alter table GradeDetails
add AchievementPoints decimal(18,2);

Alter table GradeDetails
drop column AchievementMax;

Alter table GradeDetails
add AchievementMax decimal(18,2);

select * from GradeDetails
--Table GradeDetails--


--Table AchievementTypes--
create table AchievementTypes
(
Id int not null,
[Name] nvarchar(255) not null,
[Description] nvarchar(MAX) not null,
ParticipationRate decimal(18,2) not null
)
Insert into AchievementTypes(Id, [Name], [Description], ParticipationRate)
Values(17, 'Bob', 'Developed or implemented new procedures or systems.', 76.32);

select * from AchievementTypes
--Table AchievementTypes--