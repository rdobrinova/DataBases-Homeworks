use Homeworks

--Declare scalar variable for storing FirstName values
 --• Assign value ‘Antonio’ to the FirstName variable
 --• Find all Students having FirstName same as the variable
 declare @firstName nvarchar(255)
 set @firstName = 'Antonio'

 select * from Student s
 where s.FirstName = @firstName

 --Declare table variable that will contain StudentId, StudentName and DateOfBirth
 --• Fill the table variable with all Female students
 declare @studentInfo table(StudentId int, StudentName nvarchar(100), DateOfBirth datetime2)
 insert into @studentInfo
 select Id, FirstName, DateOfBirth from Student s
  where s.Gender = 'F'

  select * from @studentInfo

 --Declare temp table that will contain LastName and EnrolledDate columns
  --• Fill the temp table with all Male students having First Name starting with ‘A’
  --• Retrieve the students from the table which last name is with 7 characters

  create table #maleStudents(LastName nvarchar(100), EnrolledDate datetime2)
  insert into #maleStudents

  select LastName, EnrolledDate from Student s
  where s.Gender = 'M' and s.FirstName like 'A%'

  select * from #maleStudents
  where LEN(LastName) = 7

--Find all teachers whose FirstName length is less than 5 and
 --• the first 3 characters of their FirstName and LastName are the same
 select * from Teacher
 where LEN(FirstName) < 5 and SUBSTRING(FirstName, 1, 3) = SUBSTRING(LastName, 1, 3)