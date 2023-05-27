create database Homeworks
use Homeworks

--Tabele Student--
create table Student
(
	Id int identity(1,1),
	FirstName nvarchar(100) not null,
	LastName nvarchar(100) not null,
	DateOfBirth datetime2,
	 EnrolledDate datetime2,
	Gender nchar(1),
	NationalIDNumber char(15),
	StudentCardNumber char(10),
)
--Tabele Student--


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

--Table Grade--
create table Grade
(
	Id int identity(1,1),
	StudentId int not null,
	CourseId int not null,
	TeacherId int not null,
	Grade int,
	Comment nvarchar(MAX),
	CreatedDate datetime2
	
)
--Table Grade--

--Table Course--
create table Course
(
	Id int identity(1,1),
	[Name] nvarchar(255) not null,
	Credit decimal(18,2),
	AcademicYear int,
	Semester varchar(20)
)
--Table Course--

--Table GradeDetails--
create table GradeDetails
(
	Id int identity(1,1),
	GradeId int not null,
	AchievementTypeId int not null,
	AchievementPoints decimal(18,2),
	AchievementMaxPoints decimal(18,2),
	AchievementDate datetime2
)
--Table GradeDetails--

--Table AchievementType--
create table AchievementType
(
Id int identity(1,1),
[Name] nvarchar(255) not null,
[Description] nvarchar(MAX),
ParticipationRate decimal(18,2)
)
--Table AchievementType--