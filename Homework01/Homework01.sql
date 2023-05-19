create database Homework01
use Homework01

--Tabele Students--
create table Students
(
	Id int identity(1,1),
	FirstName nvarchar(100) not null,
	LastName nvarchar(100) not null,
	DateOfBirth datetime2,
	 EnrolledDate datetime2,
	Gender nchar(1),
	NationalIdNumber char(15),
	StudentCardNumber char(10),
)
--Tabele Students--


--Table Teacher--
create table Teacher
(
	Id int identity(1,1),
	FirstName nvarchar(100) not null,
	LastName nvarchar(100) not null,
	DateOfBirth datetime2,
	AcademicRank nvarchar(100) not null,
	HireDate datetime2,
)
--Table Teacher--

--Table Grades--
create table Grades
(
	Id int identity(1,1),
	StudentId int not null,
	CourseId int not null,
	TeacherId int not null,
	Grade int,
	Comment nvarchar(MAX),
	CreatedDate datetime2
	
)
--Table Grades--

--Table Courses--
create table Courses
(
	Id int identity(1,1),
	[Name] nvarchar(255) not null,
	Credit decimal(18,2),
	AcademicYear int,
	Semester varchar(20)
)
--Table Courses--

--Table GradeDetails--
create table GradeDetails
(
	Id int identity(1,1),
	GradeId int not null,
	AchievementTypeId int not null,
	AchievementPoints decimal(18,2),
	AchievementMax decimal(18,2),
	AchievementDate datetime2
)
--Table GradeDetails--

--Table AchievementTypes--
create table AchievementTypes
(
Id int identity(1,1),
[Name] nvarchar(255) not null,
[Description] nvarchar(MAX),
ParticipationRate decimal(18,2)
)
--Table AchievementTypes--
