--Homework 02.1
--• Create new procedure called CreateGrade
--• Procedure should create only Grade header info (not Grade Details)
--• Procedure should return the total number of grades in the system for the Student on input
--(from the CreateGrade)
--• Procedure should return second resultset with the MAX Grade of all grades for the Student
--and Teacher on input (regardless the Course)

CREATE or alter PROCEDURE CreateGrade(
@studentId int, 
@courseId int,
@teacherId int,
@grade int,
@comment nvarchar(max),
@createdDate datetime2)
as
begin

	INSERT INTO Grade([StudentId], [CourseId], [TeacherId], [Grade], [Comment], [CreatedDate])
	VALUES(@studentId, @courseId, @teacherId, @grade, @comment, @createdDate)

	DECLARE @totalNumberOfGrades int
	SELECT @totalNumberOfGrades = COUNT(*) FROM Grade
	WHERE StudentId = @studentId

	DECLARE @maxGrade decimal(18,2)
	SELECT @maxGrade = MAX(Grade) From Grade
	WHERE StudentId = @studentId and TeacherId = @teacherId

	select  @totalNumberOfGrades as totalGrade
	select  @maxGrade as maxGrade


end
go

EXEC CreateGrade
@studentId = 1, 
@courseId = 1,
@teacherId = 2,
@grade = 5,
@comment = 'Good',
@createdDate = '06.06.2023'
	

--Homework 02.2
--Create new procedure called CreateGradeDetail
--• Procedure should add details for specific Grade (new record for new AchievementTypeID,
--Points, MaxPoints, Date for specific Grade)
--• Output from this procedure should be resultset with SUM of GradePoints calculated with
--formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade

CREATE PROCEDURE CreateGradeDetail(
@gradeId int,
@achievementTypeId int,
@achievementPoints decimal(18,2),
@achievementMaxPoints decimal(18,2),
@achievementDate datetime2)
as
begin

	INSERT INTO GradeDetails([GradeId], [AchievementTypeId], [AchievementPoints], [AchievementMaxPoints], [AchievementDate])
	VALUES(@gradeId, @achievementTypeId, @achievementPoints, @achievementMaxPoints, @achievementDate)

	DECLARE @sumOfGradePoints decimal(18,2)
	Select @sumOfGradePoints = SUM((gd.AchievementPoints / gd.AchievementMaxPoints) * ach.ParticipationRate) 
	FROM GradeDetails gd 
	INNER JOIN Grade g	ON gd.GradeID = g.Id
	INNER JOIN AchievementType ach on gd.AchievementTypeId = ach.Id
	WHERE gd.GradeId = @gradeId

	SELECT @sumOfGradePoints AS GradePoints

end
go

EXEC CreateGradeDetail
			@gradeId = 1,
			@achievementTypeId = 1, 
			@achievementPoints = 123, 
			@achievementMaxPoints = 234,
			@achievementDate = '06.06.2023'	

