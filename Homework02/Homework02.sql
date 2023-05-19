select * from Student
select * from Teacher
select * from Grade
select * from GradeDetails
select * from Course
select * from AchievementType

--Find all Students with FirstName = Antonio
SELECT * FROM Student
WHERE FirstName = 'Antonio'

--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT * FROM Student
WHERE DateOfBirth > '01.01.1999'

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT * FROM Student
WHERE LastName like 'J%' 
and 
EnrolledDate >= '01.01.1998'  
and 
EnrolledDate <= '01.31.1998'

--List all Students ordered by FirstName
SELECT * FROM Student
ORDER BY FirstName

--List all Teacher Last Names and Student Last Names in single result set.Remove duplicates
SELECT LastName FROM Teacher
UNION
SELECT LastName FROM Student

--Create Foreign key constraints from diagram or with script

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Student
Foreign Key(StudentId) references [Student](Id)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Course
Foreign Key(CourseId) references [Course](Id)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Teacher
Foreign Key(TeacherId) references [Teacher](Id)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_Grade
Foreign Key(GradeId) references Grade(Id)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_AchievementType
Foreign Key(AchievementTypeId) references AchievementType(Id)




