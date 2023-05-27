use Homeworks

--Calculate the count of all grades per Teacher in the system
select g.TeacherId, t.FirstName + ' ' + t.LastName as Teacher, Count(g.TeacherId) as TotalGradesInSystem from Grade g
right join Teacher t
on g.TeacherId = t.Id
group by g.TeacherId, t.FirstName, t.LastName
order by g.TeacherId

GO
--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
select g.TeacherId, t.FirstName + ' ' + t.LastName as Teacher, Count(g.TeacherId) as TotalGradesInSystem from Grade g
right join Teacher t
on g.TeacherId = t.Id
where g.StudentId < 100
group by g.TeacherId, t.FirstName, t.LastName
order by g.TeacherId

GO
--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
select g.StudentId, s.FirstName + ' ' + s.LastName as Student, MAX(g.Grade) as MaxGrade, AVG(g.Grade) as AvgGrade from Grade g
inner join Student s on g.StudentId = s.Id
group by g.StudentId, s.FirstName, s.LastName
order by g.StudentId

GO
-- Calculate the count of all grades per Teacher 
-- in the system and filter only grade count greater then 200
select g.TeacherId, t.FirstName + ' ' + t.LastName as Teacher, Count(g.TeacherId) as TotalGradesInSystem from Grade g
right join Teacher t
on g.TeacherId = t.Id
group by g.TeacherId, t.FirstName, t.LastName
having Count(g.TeacherId) > 200
order by g.TeacherId

GO
-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. 
-- Filter only records where Maximal Grade is equal to Average Grade
-- List Student First Name and Last Name next to the other details from previous query
select s.FirstName + ' ' + s.LastName as Student, Count(g.Grade) as TotalGrades, MAX(g.Grade) as MaxGrade, AVG(g.Grade) as AvgGrade from Grade g
inner join Student s on g.StudentId = s.Id
group by g.StudentId, s.FirstName, s.LastName
having  MAX(g.Grade) = AVG(g.Grade)
order by g.StudentId

GO
-- Create new view (vw_StudentGrades) that will List all StudentIds and count of Grades per student
create view vw_StudentGrades 
as
select g.StudentId, count(g.Grade) as TotalGrades from Grade g
group by g.StudentId

GO
select * from vw_StudentGrades

GO
-- Change the view to show Student First and Last Names instead of StudentID
alter view vw_StudentGrades 
as
select s.FirstName + ' ' + s.LastName as Student, count(g.Grade) as TotalGrades from Grade g
inner join Student s on s.Id = g.StudentId
group by g.StudentId, s.FirstName, s.LastName

GO
-- List all rows from view ordered by biggest Grade Count
select * from vw_StudentGrades
order by TotalGrades desc