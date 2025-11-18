--CREATE TABLE demo.dbo.pragrammer (
--	[name] nvarchar not null,
--	dob DATE not null, 
--	doj DATE NOT NULL,
--	gender nvarchar(1) not null,
--	prof1 nvarchar(8),
--	prof2 nvarchar(8),
--	salary decimal 
--);

--DROP TABLE pragrammer

--exec sp_rename 'pragrammer', 'programmer'

--alter table demo.[dbo].[programmer] 
--ALTER COLUMN [NAME] NVARCHAR(10);

--INSERT INTO demo.[dbo].[programmer] VALUES
--('Ramesh', '1990-01-15', '2022-01-01', 'M', 'Pascal', 'C', 3500),
--('Mary',   '1992-06-30', '2023-06-15', 'F', 'BASIC',  'COBOL', 4000),
--('Suresh', '1991-12-08', '2021-12-01', 'M', 'COBOL',  'Pascal', 3000),
--('Anita',  '1995-01-25', '2024-10-01', 'F', 'C',      'Pascal', 4500),
--('John',   '1993-09-30', '2023-01-01', 'M', 'dbase',  'COBOL', 2500),
--('Divya',  '1996-02-25', '2023-01-01', 'F', 'Pascal', 'C', 5000);

--DELETE FROM PROGRAMMER WHERE  

--CREATE TABLE demo.[dbo].Software (
--    name NVARCHAR(8) NOT NULL,
--    title NVARCHAR(20) NOT NULL, 
--    dev_in NVARCHAR(8) NOT NULL, 
--    scost DECIMAL(7,2),
--    dcost DECIMAL(7,2),
--    sold DECIMAL(7,2) 
--);

--INSERT INTO demo.[dbo].Software (name, title, dev_in, scost, dcost, sold) VALUES
--('Ramesh', 'Inventory Manager', 'Pascal', 15000, 10000, 30000),
--('Mary',   'Payroll System',    'BASIC',  20000, 18000, 0),
--('Suresh', 'School ERP',        'COBOL',  25000, 20000, 15000),
--('Anita',  'Billing Software',  'C',      30000, 25000, 40000),
--('John',   'HR Management',     'dbase',  18000, 17000, 22000),
--('Priya',  'CRM Tool',          'Pascal', 22000, 21000, 19000);

--CREATE TABLE demo.[dbo].Studies (
--    name    nvarchar(8) NOT NULL,
--    splace  nvarchar(9) NOT NULL,
--    course  nvarchar(5) NOT NULL,
--    ccost   NUMERIC NOT NULL -- Assuming ccost is numeric, but the sample uses nvarchar(5)
--    -- A better design would be: ccost INT NOT NULL
--);

--INSERT INTO demo.[dbo].Studies (name, splace, course, ccost) VALUES ('Ramesh', 'SABHARI', 'DCS', '5000'),
--('Suresh', 'PARAGATHI', 'PGDCA', '8000'),
--('Mary', 'SABHARI', 'DCS', '6000'),
--('Anita', 'SABHARI', 'PGDCA', '10000'),
--('John', 'PARAGATHI', 'DCS', '7000'),
--('Priya', 'SABHARI', 'DCS', '5500');

--SELECT * FROM demo.[dbo].[programmer]
--SELECT * FROM demo.[dbo].[Software]
--SELECT * FROM demo.[dbo].STUDIES

--------------------------------------------- (50 QUERYS) ----------------------------------------------------
----1
--SELECT AVG(scost) FROM SOFTWARE 
--WHERE dev_in = 'PASCAL';

----2
--SELECT NAME, DATEdiff(YEAR, DOB, getdate())
--FROM programmer

----3
--SELECT S.NAME, DATEDIFF(YEAR, P.DOB, GETDATE()) 
--FROM PROGRAMMER P RIGHT JOIN Studies S 
--ON P.NAME = S.name 
--WHERE COURSE = 'DCS'

----4
--select (scost*sold) from Software 

----5
--SELECT NAME, DATEDIFF(YEAR, DOB, GETDATE()) as Age
--FROM programmer 
--WHERE MONTH(dob) = 01

----6
--select top 1 course, min(ccost) from studies group by course, ccost

----7
--SELECT P.NAME, S.COURSE 
--FROM PROGRAMMER P JOIN Studies S 
--ON P.NAME = S.course
--WHERE S.course = 'PGDCA' 
--GROUP BY P.name, S.course

----8
--SELECT (scost*sold) FROM software WHERE dev_in = 'c';

----9
--SELECT * FROM Software WHERE name = 'Ramesh';

----10
--SELECT distinct s.name, splace FROM Studies S left join programmer P  ON p.name = s.name WHERE S.splace = 'SABHARI'
--SELECT * FROM demo.[dbo].[programmer]
--SELECT * FROM demo.[dbo].[STUDIES]

----11
--SELECT * FROM Software WHERE sold > 20000;

----12
--SELECT name,title, (scost * sold - dcost) as profect from software; -- it will profit
--SELECT name, title, CEILING(dcost / scost) AS copies_to_recover FROM Software 

----13
--SELECT Title, MAX(dev_in) from Software WHERE dev_in = 'basic' group by Title, dev_in ;

----14
--SELECT title, scost * sold  - dcost as profit from Software WHERE scost * sold  - dcost > 0

----15
--SELECT COUNT(*) AS dbase_total_count FROM Software WHERE dev_in = 'DBASE' 

----16
--SELECT COUNT(*) count_of_paragathi 
--FROM programmer P JOIN Studies S 
--ON P.name = S.name 
--WHERE S.splace = 'PARAGATHI'

----17
--SELECT COUNT(*)
--FROM programmer P JOIN Studies s 
--ON P.name = S.name 
--WHERE S.ccost BETWEEN 5000 AND 10000;

----18
--SELECT CEILING(AVG(ccost)) FROM Studies

----19
--SELECT * FROM programmer 
--WHERE prof1 = 'C' 
--   OR PROF2 = 'C'

----20
--SELECT COUNT(*) FROM programmer 
--WHERE prof1 in('COBAL', 'PAScal') 
--   OR prof2 in('COBAL', 'PAScal');

----21
--SELECT COUNT(*) FROM programmer 
--WHERE prof1 NOT IN('PASCAL','C')
--  AND prof2 NOT IN('PASCAL','C');

----22
--	SELECT MAX(DATEDIFF(YEAR, DOB, GETDATE())) oldest_programmer 
--	FROM programmer 
--	WHERE gender = 'M'; 

----23
--	SELECT AVG(DATEDIFF(YEAR, DOB, GETDATE())) 
--	FROM programmer 
--	WHERE gender = 'F';

----24
--	SELECT NAME, DATEDIFF(YEAR, DOJ, GETDATE()) 
--	AS Experience 
--	FROM PROGRAMMER 
--	ORDER BY NAME DESC

----25
--	SELECT * FROM programmer WHERE MONTH(DOB) = MONTH(GETDATE());

----26
--	SELECT COUNT(*) FROM programmer WHERE GENDER ='F'

----27
--	SELECT PROF1, PROF2 FROM programmer WHERE gender = 'M'

----28
--	SELECT CEILING(AVG(SALARY)) FROM programmer

----29
--    SELECT COUNT(*) FROM programmer WHERE salary >= 4000 AND SALARY <=10000;

----30
--	SELECT *
--	FROM Programmer
--	WHERE prof1 NOT IN ('CLIPPER', 'COBOL', 'PASCAL')
--	  AND prof2 NOT IN ('CLIPPER', 'COBOL', 'PASCAL');
--	                     -- or
--	SELECT *
--	FROM Programmer
--	WHERE (prof1 NOT IN ('CLIPPER', 'COBOL') or prof1 = 'PASCAL')
--	  AND (prof2 NOT IN ('CLIPPER', 'COBOL') or prof2 = 'PASCAL');

----31
--    SELECT COUNT(*) FROM Programmer
--	WHERE gender = 'Female'
--	 AND (prof1 = 'C' OR prof2 = 'C')
--	 AND (
--		  DATEDIFF(year, DOB, GETDATE()) - CASE
--			WHEN (MONTH(DOB) > MONTH(GETDATE()) OR 
--              (MONTH(DOB) = MONTH(GETDATE()) AND DAY(DOB) > DAY(GETDATE())))
--			THEN 1
--			ELSE 0
--		 END )> 24;

----32
--		SELECT name, dob
--		FROM Programmer
--		WHERE DATEFROMPARTS(YEAR(GETDATE()), MONTH(dob), DAY(dob)) 
--			  BETWEEN GETDATE()
--			  AND DATEADD(day, 300, GETDATE())

----33
--	select name, [dob]
--      ,[doj]
--      ,[gender]
--      ,[prof1]
--      ,[prof2]
--      ,[salary], DATEDIFF(year, doj, getdate()) as experience from programmer where DATEDIFF(year, doj, getdate()) > 1

----34
--    select * from programmer where year(doj) =  year(getdate()) - 2
--	select * from programmer where year(doj) = 2025 -2

----35
--	select scost * sold from Software 
--		select 1200000000.0000 - 30000.00
--			select * from Software  where scost * sold < dcost
		
----36
--     select * from Software where sold = 0

----37
--	 select title,scost from Software where name = 'mary'

----38
--	select distinct splace from Studies 

----39
--	select count(distinct course) as total_Course_names  from Studies

----40
--    select * from programmer where name like 'AA%'

----41
--	select * from programmer where  len(name) = 5 --like '%_____%'

----42
--    SELECT COUNT(*) FROM programmer 
--	WHERE gender = 'F' 
--	AND (prof1 = 'COBOL' OR prof2 = 'COBOL') 
--	AND DATEDIFF(YEAR, DOJ, GETDATE()) >= 2

--	SELECT *, DATEDIFF(YEAR, DOJ, GETDATE()) EXPERIENCE FROM programmer WHERE DOJ > 1

----43
--	SELECT MIN(LEN(NAME)) FROM programmer

----44
--	SELECT AVG(DCOST) FROM Software WHERE DEV_IN = 'COBOL'

----45
--	 SELECT name, gender , dob , doj FROM programmer

--	 SELECT DOB,CONVERT(varchar, dob, 103),FORMAT(dob, 'dd/MM/yy') [DATE_FORMAT] FROM programmer

----46
--	 SELECT * FROM programmer WHERE DAY(DOB) IN(25,30,31)
--	 SELECT * FROM programmer WHERE DAY(DOB) = DAY(EOMONTH(dob));

----47
--     SELECT SALARY FROM programmer WHERE GENDER = 'M' AND prof1 NOT IN('COBOL') AND PROF2 NOT IN ('COBOL')

----48 
--    SELECT TITLE, DCOST, SCOST, (SCOST - dcost) [DIFFERENCE] FROM Software 

----49
--    SELECT name, dob, doj FROM programmer WHERE MONTH(DOB) = MONTH(DOJ)

----50
--	SELECT TITLE FROM Software WHERE NAME LIKE '%_%'
--	SELECT NAME FROM programmer WHERE LEN(NAME) > 1

--sp_help software



--/*
--SELECT * FROM demo.[dbo].[programmer]
--SELECT * FROM demo.[dbo].[Software]
--SELECT * FROM demo.[dbo].[STUDIES]

--*/


--WITH CTE AS (
--    SELECT 
--        *, 
--        ROW_NUMBER() OVER (PARTITION BY name ORDER BY name) AS rn
--    FROM Programmer
--)
--DELETE FROM CTE WHERE rn > 1;




---------------------------------  SP_INPUT_PARAMETER SP joins with 3_tables --------------------------------

--CREATE OR ALTER PROC view_Detail_from3tables_SP 
--				@name1 nvarchar(10)
--with encryption			
--AS 
--BEGIN
--	 DECLARE @DNAME1 NVARCHAR(20)
--	 DECLARE @DNAME2 NVARCHAR(20)
--     SET @DNAME1 = @name1
	 

--	 select P.name, sw.title, s.ccost  from PROGRAMMER P join software SW ON P.NAME = SW.NAME JOIN STUDIES S ON sw.NAME = S.NAME WHERE P.name like @DNAME1 + '%' 
--end;

--view_Detail_from3tables_SP '[r,s]'

--sp_helptext SP_view_Detail_from3tables -- it will show code what inside the store procedure


---------------------------------------------  SP_INPUT_PARAMETER ----------------------------------------------

--CREATE OR ALTER PROC SP_view_Detail_from3tables 
--				@name1 nvarchar(10)
--with encryption			
--AS 
--BEGIN
--	 DECLARE @DNAME1 NVARCHAR(20)
--	 DECLARE @DNAME2 NVARCHAR(20)
--     SET @DNAME1 = @name1
	 

--	 select P.name, sw.title, s.ccost 
--	 from PROGRAMMER P join software SW 
--	 ON P.NAME = SW.NAME JOIN STUDIES S 
--	 ON sw.NAME = S.NAME 
--	 WHERE P.name like @DNAME1 + '%' 
--end;

--SP_view_Detail_from3tables '[r,s]'

--sp_helptext SP_view_Detail_from3tables -- it will show code what inside the store procedure

------------------------------------ End SP joins with 3_tables ---------------------------------------------

------------------------------------ SP_OUTPUT_parameter --------------------------------------------

CREATE or ALTER PROC SP_GetProgrammerDetailsByLanguage
	@Lang nvarchar(20),
	@programmerName nvarchar(20) output,
	@programmerName1 nvarchar(20) output
	with en
AS
	DECLARE @Language nvarchar(20) 
	set @language = @Lang

BEGIN
	  SELECT @programmerName = NAME, @programmerName1 = salary FROM programmer WHERE prof1 = @Language OR prof2 = @Language
END;



	DECLARE 
	@name nvarchar(20), 
	@salary decimal(19,3);
	exec [dbo].[SP_GetProgrammerDetailsByLanguage] @lang = 'c',
	@programmerName = @name output,
	@programmerName1 = @salary output;
	print @name;
	print @salary

	DECLARE @name nvarchar(20), 
			@salary decimal(19,3);
	exec SP_GetProgrammerDetailsByLanguage @lang ='c',
	@programmerName = @name output,
	@programmerName1 = @salary output
	select @name as programmerName, @salary as salary;


	sp_helptext SP_GetProgrammerDetailsByLanguage
	sp_help SP_GetProgrammerDetailsByLanguage -- about 
--	--------------------------------------------------------------------------------------
	
--CREATE or ALTER PROC GetProgrammerDetailsByLanguage_SP
--	@Lang nvarchar(20),
--	@programmerName nvarchar(20) output,
--	@programmerName1 nvarchar(20) output
--AS
--	DECLARE @Language nvarchar(20) 
--	set @language = @Lang

--BEGIN
--	  SELECT @programmerName = NAME, @programmerName1 = salary FROM programmer WHERE prof1 = @Language OR prof2 = @Language
--END;

--	DECLARE 
--	@name nvarchar(20), 
--	@salary decimal(19,3);
--	exec [dbo].GetProgrammerDetailsByLanguage_SP @lang = 'c',
--	@programmerName = @name output,
--	@programmerName1 = @salary output;
--	print @name;
--	print @salary

--	DECLARE @name nvarchar(20), 
--			@salary decimal(19,3);
--	exec GetProgrammerDetailsByLanguage_SP @lang ='c',
--	@programmerName = @name output,
--	@programmerName1 = @salary output
--	select @name as programmerName, @salary as salary;

--	declare @Oname1 nvarchar(20), @Osalary decimal(19,8)
--	exec GetProgrammerDetailsByLanguage_SP 'c', @Oname1 out , @Osalary out
--	select @Oname1 as programmer ,ceiling(@Osalary) as salary


--	sp_helptext GetProgrammerDetailsByLanguage_SP
--	sp_help GetProgrammerDetailsByLanguage_SP -- about

--------------------------------------------- RETURN ONLY OUTPUT with output parameter ------------------------------------------------

--	CREATE or alter PROCEDURE SP_GetGenMaleCount
--	@gender int out

--	as 
--	begin
--		 select @gender = count(gender) from programmer where gender = 'M' 
--	end;

--	declare @holdoutput int
--    exec SP_GetGenMaleCount @holdoutput out
--	select @holdoutput

--	------------------------------ RETURN ONLY OUTPUT without output parameter--------------------  


--	create or alter procedure SP_GetreturnFemCount
--	as
--	begin
--		declare @count int;
--		select @count = count(gender) from programmer where gender = 'f';
--		return @count;
--	end;

--	declare @holdSP_GetGenMaleCountoutput int
--	exec @holdSP_GetGenMaleCountoutput = SP_GetreturnFemCount
--	select @holdSP_GetGenMaleCountoutput

--	--------------------------------------------------------------------


----Create a stored procedure that takes a department name as input and returns all employees in that department.
--create OR ALTER proc GetEmpDetailsByDept_sp
-- @dept_name nvarchar(20)
--AS
--BEGIN
--	SELECT 
--		e.EMP_ID,
--        e.EMP_NAME,
--        e.SALARY,
--        e.DOJ,
--        e.STATUS,
--        d.DEP_NAME
-- FROM EMPLOYEE E JOIN DEPARTMENT D ON  E.DEP_ID = D.DEP_ID WHERE DEP_NAME =  @dept_name
--END;

--EXEC GetEmpDetailsByDept_sp 'IT'
---------------------------------------------------------------------------------------------------------------------------------

----Write a stored procedure to insert a new performance record for an employee. Input parameters: EMP_ID, RATING, MONTH, YEAR.
--create OR ALTER proc Insert_Newperformerrecord_sp
-- @Emp_ID int,
-- @RATING int,
-- @MONTH nvarchar(3),
-- @YEAR int
--AS
--BEGIN 
    
--  if not exists (select 1 from EMPLOYEE where emp_id = @Emp_ID)
--         begin
--			print 'error: employee not found';
--			return;
--		 end

--  if @RATING not between 1 and 5
--      begin
--			print 'error: rating must be between 1 and 5.'
--			return;
--	  end

--  if exists(select 1 from performance where emp_id = @Emp_ID and [month] = @month and [year] = @year)
--      begin 
--	       print 'performace records already exists';
--		   return;
--	  end
  
--  insert into performance (emp_id,rating,month,year)
--                  values  ( @Emp_ID,@RATING,@MONTH,@YEAR);

--	  print 'success: performance records inserted successfully'
--end;


----select 1 from EMPLOYEE where emp_id = 8

----declare @emp_ID int set @Emp_ID = 

----if not exists(select 1 from EMPLOYEE where emp_id = @Emp_ID)
----	print 'yes'
----else 
----	print 'no'
     

--exec Insert_Newperformerrecord_sp @Emp_ID = 5 ,@RATING = 5, @MONTH = 'sep' ,@YEAR =2025
--________________________________________________________________________________________
  

----Create a stored procedure that updates the status of an employee. Input: EMP_ID, New_Status.

--  Create proc UP_NewStatusByEmpID_Sp @emp_id int, @new_status nvarchar(10)
--  AS
--  BEGIN
--	   UPDATE EMPLOYEE
--	   SET STATUS = @new_status
--	   WHERE EMP_ID = @emp_id
--  END;


-- EXEC UP_NewStatusByEmpID_Sp @emp_id = 4, @new_status = 'INACTIVE'
----________________________________________________________________________________________

----Write a stored procedure that takes a number N and returns the top N employees based on performance rating.

-- Create or alter proc GetEmpByTopN_Rating_Sp @TopN int
--    AS    
--	BEGIN
--	    SET NOCOUNT ON;
--	    SELECT TOP(@TopN) EMP_NAME, DEP_NAME, RATING, month, year FROM EMPLOYEE E JOIN PERFORMANCE P ON E.EMP_ID = P.EMP_ID JOIN DEPARTMENT D ON E.DEP_ID = D.DEP_ID ORDER BY RATING DESC, Doj desc
--    END

--EXEC GetEmpByTopN_Rating_Sp 1 

--	    SELECT TOP(1) EMP_NAME, DEP_NAME, RATING, doj, month, year FROM EMPLOYEE E JOIN PERFORMANCE P ON E.EMP_ID = P.EMP_ID JOIN DEPARTMENT D ON E.DEP_ID = D.DEP_ID ORDER BY RATING DESC, doj desc  
--_________________________________________________________________________________________________________________________


  
--------------------------------------------get salary and empname by salary-------------------------------------------------------------
--create OR ALTER proc GetEmpDetailsByEmpid_sp
--@Isalary decimal(10,2),
--@empname nvarchar(40) out,
--@salary decimal(10,2) out 
--AS
--BEGIN 
--     select @empname = EMP_NAME, @salary = SALARY from EMPLOYEE where SALARY >= @Isalary order by salary desc
--end;

--declare @Dempname nvarchar(40), @Dsalary decimal(10,2)
--exec GetEmpDetailsByEmpid_sp @Isalary = 67000,
--@empname = @Dempname out,
--@salary = @Dsalary out
--select @Dempname, @Dsalary

--select * from EMPLOYEE where salary >= 66000
--SELECT * FROM EMPLOYEE
--SELECT * FROM PERFORMANCE
--SELECT * FROM DEPARTMENT

--INSERT INTO EMPLOYEE (EMP_NAME,DEP_ID,SALARY,DOJ) VALUES ('GIRI','1',45000,'2023-10-26')


-- /*THIS IS RESET THE SEED */  --TABLE_NAME       START SEED NO.
--               DBCC CHECKIDENT ('PERFORMANCE', RESEED,  4) -- SEED IS SUDDENLY BECIMES CHANGE IT MEANS YOUR IDENTITY SEED WAS CHANGED ---  THIS IS MANUALLY RESET THE IDENTITY VALUE 

--DELETE FROM PERFORMANCE WHERE EMP_ID IN(5)
--_______________________________________________________________________________________________________________


--Create a stored procedure that returns all employees who don’t have any performance records.

 Create proc GetEmpWithoutPerformanceRecord_SP
 As
 BEGIN
	  SELECT
        e.EMP_ID, 
        e.EMP_NAME, 
        e.DEP_ID, 
        e.SALARY, 
        e.DOJ, 
        e.STATUS
FROM EMPLOYEE E LEFT JOIN PERFORMANCE P ON E.EMP_ID = P.EMP_ID where p.EMP_ID is null
 END

 exec GetEmpWithoutPerformanceRecord_SP

SELECT * 
FROM EMPLOYEE E left JOIN PERFORMANCE P ON E.EMP_ID = P.EMP_ID 
where p.EMP_ID is null -- find null value in the table 

 --_______________________________________________________________________________________________________________

 --Write a stored procedure that returns the average salary for each department.

 create OR ALTER proc GetAvgSalaryEachdept_SP
 As 
 BEGIN 
	  SELECT  dep_name, avg(salary) as Avg_Salary FROM DEPARTMENT D join EMPLOYEE E ON d.DEP_ID = E.DEP_ID group by d.dep_name
 END

 exec GetAvgSalaryEachdept_SP

--_______________________________________________________________________________________________________________


-- Create a stored procedure that takes a PAN number and returns the corresponding bank details.

create or alter proc GetBankDetailsByPan_SP
  @IPan_number NVARCHAR(10)
AS 
BEGIN
     select b.Bank_ID,
     b.User_Name,Bank1_Name,
     Bank1_Account_No,Bank2_Name,
     Bank2_Account_No,IFSC_Code  
     from Bank_Details b 
     join Aadhar_Details a
     on b.Link_Aadhar_Number = a.Aadhar_Number 
     join PAN_Details p 
     on a.Aadhar_Number = p.Aadhar_Number 
     where p.PAN_Number = @IPan_number
end;

EXEC GetBankDetailsByPan_SP 'OPQRS1020T'
--_______________________________________________________________________________________________________________

alter table pan_Details add constraint FK_Pan_Aadhar foreign key (aadhar_number) references Aadhar_Details(Aadhar_Number)

alter table Aadhar_Details alter column pan_number nvarchar(10) 
exec sp_rename 'Aadhar_Details.Pan_number', 'Pan_Number', 'column'
 
ALTER TABLE Aadhar_Details
ADD CONSTRAINT PK_Aadhar PRIMARY KEY (Aadhar_Number);

select * from Aadhar_Details 
select * from PAN_Details
select * from Bank_Details

update A
set A.Pan_Number = P.pan_number 
from PAN_Details p join Aadhar_Details A on p.User_Name = a.User_Name

--_______________________________________________________________________________________________________________

--Write a stored procedure that returns employees who joined in the last X months. Input: Months.

create or alter proc GetEmpDetailsByMonth_SP @month int
AS
begin
	select * from employee where doj >= DATEADD(month, -@month, GETDATE())
end;

exec GetEmpDetailsByMonth_SP 12


                        -- 2025-01-10   >   2024-10-30 
select * from EMPLOYEE where doj >= DATEADD(month, -12, GETDATE())

SELECT * FROM EMPLOYEE
SELECT * FROM PERFORMANCE
SELECT * FROM DEPARTMENT




-- find the table details it will show datatype char length
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Aadhar_Details';
 
-- Check columns in PAN_Details
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'PAN_Details';

--"Write a stored procedure that calculates a bonus for an employee based on their salary. The procedure should:

--Take EMP_ID as input.
--Fetch the employee's SALARY from the EMPLOYEE table.
--Apply a fixed bonus rate (e.g., 10%) to calculate the BonusAmount.
--Return the employee name, salary, and calculated bonus."


create OR ALTER proc CalEmpBonus_SP @IEMP_ID INT, @I_INCREMENT DECIMAL(10,2), @OEMP_NAME NVARCHAR(40) OUT, @OSALARY DECIMAL(10,2) OUT , @OBONUS DECIMAL(10,2) OUT
AS
BEGIN
	 SELECT @OEMP_NAME = EMP_NAME, @OSALARY = SALARY, @OBONUS = (SALARY * @I_INCREMENT) FROM EMPLOYEE WHERE EMP_ID = @IEMP_ID

END;

DECLARE @DEMP_NAME NVARCHAR(40), @DSALARY DECIMAL(10,2), @DBONUS DECIMAL(10,2) 
EXEC CalEmpBonus_SP @IEMP_ID = 1, @I_INCREMENT = 1.20,
@OEMP_NAME = @DEMP_NAME OUT, 
@OSALARY = @DSALARY OUT, 
@OBONUS = @DBONUS OUT
SELECT @DEMP_NAME, @DSALARY, @DBONUS


--SELECT 10000 *1.10

--__________________________________________________________________________________________________________________________________________________________________________





	                                /*________________ */ FUNCTION-S /*____________________*/
-------------------------------------------------------------scalar function ----------------------------------------------------------------
--------------A Scalar Function is a user-defined function that returns a single value (not a table). You can use it in SELECT, WHERE, ORDER BY, etc.

----syntax
-- --CREATE FUNCTION FN_Demo_1 (@PARAMETER) INSIDE THIS BRAKETS
-- --Returns int
-- --AS
-- --BEGIN
           
-- --END;
_________________________________________________________________________________________________________


--	CREATE FUNCTION GetBounsAmount(@salary decimal(10,2), @Rate decimal(10,2))
--	RETURNS DECIMAL(10,2)
--	AS 
--	BEGIN
--	     RETURN (@salary * @Rate)
--	END;

--/*exec function */   
--	SELECT EMP_NAME,salary, dbo.GetBounsAmount(salary, 0.10) as Bonus from employee;

----_________________________________________________________________________________________________________
--      --Create a function that returns 10% bonus of a given salary.


--  CREATE or alter FUNCTION FN_Get10PctBonus_1
--  (
--  @salary decimal(10,2)
--  )
--  returns decimal(10,2)
--  AS
--  BEGIN 
--		declare @bouns decimal(10,2)
--		set @bouns = (@salary * 0.10)
--        return @bouns
--  end
      
-- select 
-- EMP_ID,
--EMP_NAME,
--SALARY, dbo.FN_Get10PctBonus_1(salary) as bouns from EMPLOYEE

----_________________________________________________________________________________________________________

----Create a function that returns full name (first + last) from two input strings.

--  CREATE or alter FUNCTION FN_GetFullName2
--  (
--     @firstName nvarchar(20),
--	 @lastName Nvarchar(20)
--  )
--  returns nvarchar(40)
--  AS
--  BEGIN
--       return (@firstName +' '+ @lastName);
--  END;

--  select emp_id, dbo.FN_GetFullName2(emp_name,'M') as FullName from EMPLOYEE where EMP_ID = 5
----_________________________________________________________________________________________________________
-- -- Create a function that returns the number of years an employee has worked (based on DOJ).

--  CREATE FUNCTION FN_GetEmpExperience 
--  (
--	@DOJ DATE
--  )
--  RETURNS INT
--  AS 
--  BEGIN
--	    RETURN DATEDIFF(YEAR, @DOJ, GETDATE())
--  END;

--  SELECT EMP_ID, EMP_NAME, DBO.FN_GetEmpExperience(DOJ) FROM EMPLOYEE
--_________________________________________________________________________________________________________

--Create a function that returns a performance grade based on rating:

--5 → 'Excellent'
--4 → 'Good'
--3 → 'Average'
--2 → 'Below Average'
--1 → 'Poor'


--CREATE or alter function FN_GetEmpGradeByrating  
--(
--@rating int
--)
--Returns nvarchar(20)
--as 
--Begin
--    declare @grade nvarchar(20)
--	set @grade = case 
--					@rating when 5 then'Excellent'
--							when 4 then 'Good'
--						   	when 3 then 'Average'
--						   	when 2 then 'Below Average'
--						   	when 1 then 'Poor'
--							else 'invalid rating'
--				end
--				return @grade
--end;

-- SELECT e.EMP_ID, e.EMP_NAME, rating, DBO.FN_GetEmpGradeByrating(p.rating) FROM EMPLOYEE e  join PERFORMANCE p on e.EMP_ID = p.EMP_ID
 
--_________________________________________________________________________________________________________

--Create a function that returns whether an employee is eligible for promotion (e.g., rating ≥ 4 and salary < 60000).

--create function FN_EmpWhoEligibleForPromotion 
--(
--   @rating int,
--   @salary decimal(10,2)
--)
--Returns Nvarchar(20)
--As
--begin
--     declare @status nvarchar(20)

--	 If (@rating >=4 and @salary <60000)  
--		 set @status = 'Eligible'
--    else 
--	     set @status = 'Not Eligible'

--   return @status
--end;

--select e.Emp_id, e.Emp_name, 
--dbo.FN_EmpWhoEligibleForPromotion(p.rating, e.salary) as Promotion -- Calling function
--From employee e join performance p 
--ON e.emp_id = p.emp_id

--_________________________________________________________________________________________________________

--select * from employee
--select * from performance

--_________________________________________________________________________________________________________

--CREATE or alter FUNCTION FN_PerformanceByRating
--(
--   @rating nvarchar(20)
--)
--returns nvarchar(20)
--as
--begin 
--    declare @DGrade nvarchar(20)
--	set @DGrade = case  
--	 				when   @rating >= 190 then 'Excellent'
--				    when   @rating >= 175 then 'Good'
--					when   @rating >= 150 then 'Average'
--					when   @rating >= 120 then 'Below Average'
--					when   @rating <= 100 then 'Poor'
--					else 'fail'
--				 end
--   return @DGrade
--End;

--select *, dbo.FN_CalStudentsMark(marks,mark2) as Total, dbo.FN_PerformanceByRating(dbo.FN_CalStudentsMark(marks,mark2)) as Grade  from Students



--CREATE or alter FUNCTION FN_CalStudentsMark
--(
--   @mark int,
--   @mark2 int
--)
--returns int
--as
--begin 
--    declare @DTotal nvarchar(20)
--	set @DTotal = (@mark+@mark2)

--   return @DTotal
--End;


--select dbo.FN_calStudentsMark(25,25)

--_________________________________________________________________________________________________________

--  Create a function that returns formatted employee info like: 'John - IT - ₹50000'.
    
--	Create or alter function FN_ReturnConcatVAlue 
--	(
--	  @Iname nvarchar(25),
--	  @Idept nvarchar(20),
--	  @Isalary decimal(10,2)
--	)
--	Returns nvarchar(50)
--	AS
--	begin
--		 return @Iname+ ' - ' + @Idept + ' - ₹'+ convert(nvarchar(20),@Isalary)
--	end;


--select dbo.FN_ReturnConcatVAlue('Arunraj M', 'Software Engineer', 15000)
--_________________________________________________________________________________________________________


-- Create a function that calculates tax on salary based on slabs:

-- <₹50,000 → 5%
-- ₹50,000–₹70,000 → 10%
-- ₹70,000 → 15%

--CREATE FUNCTION FN_CalTaxAmountForSalary
--    (
--	  @salary decimal(10,2)
--	)
--	RETURNS DECIMAL(10,2)
--AS
--BEGIN
--        Declare @DtaxAmount decimal(10,2)

--	     IF(@salary < 50000)
--             set @DtaxAmount = @salary * 0.05
--     else IF(@salary BETWEEN 50000 AND 70000)
--             set @DtaxAmount =  @salary * 0.10
--     else IF(@salary > 70000)
--             set @DtaxAmount  = @salary * 0.15

--	return @DtaxAmount

--END;

--select *, dbo.FN_CalTaxAmountForSalary(salary) as TaxAmount from EMPLOYEE
--_________________________________________________________________________________________________________

-- Create a function that returns the age of a person based on DOB (if you use Aadhar table).

	--CREATE OR ALTER FUNCTION FN_GetAgeByDOJ 
	--(
	--   @dateofbirth date
	--)
	--returns int
	--AS BEGIN

 --        DECLARE @AGE INT 
	--	 SET @AGE = DATEDIFF(year, @dateofbirth, GETDATE())

	--        IF DATEADD(YEAR, @Age, @dateofbirth) > GETDATE()     
	--		SET @AGE = @AGE - 1

	--	 RETURN @AGE
	   
	--END;

	--SELECT DBO.FN_GetAgeByDOJ('2000-11-04')

	--SELECT DATEADD(YEAR, -25, '03-11-2025') 02-11-2025
	--	SELECT DATEDIFF(YEAR, '02-11-2000', '03-11-2025')

-- Create a function that returns the last performance rating of an employee (if multiple ratings exist).

                                    PENDING


-- CREATE or alter FUNCTION CalculateAge(@DOB Date) 
-- Returns int
-- AS
-- BEGIN
--		declare @age int
--		set @age = DATEDIFF(year, @DOB, GETDATE()) -
--		    CASE
--				 WHEN	
--				 (MONTH(@DOB) > MONTH(GETDATE())) OR 
--						 (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
--			     THEN 1 ELSE 0
--		    END
--		RETURN @AGE
-- END;

-- SELECT DBO.CalculateAge('2024-01-21') AS Age   select DATEDIFF(year, '2025-10-22', GETDATE())

--						   2024-01-21 - 2025-10-22
						   
						   
--						--SELECT CONVERT(VARCHAR(8), GETDATE(),108)'hh:mi:ss' 


--select * from programmer

--delete p1 from programmer p1, programmer p2 where p1.doj = p2.doj and p1.name > p2.name -- this one is removing duilpcate records


--------------------------------- FUNCTION TO CAL YEARLY BONUS (10% OF SALARY) -----------------------------------------
 
--CREATE OR ALTER FUNCTION FN_EMP_BONUS(@SAL DECIMAL(10,2))
--RETURNS DECIMAL(10,2)
--AS
--BEGIN
--DECLARE @BONUS DECIMAL(10,2)
--SELECT @BONUS=(SALARY*0.10)FROM EMPLOYEE WHERE SALARY=@SAL
--RETURN @BONUS
--END
 
--SELECT EMP_NAME,salary,DBO.FN_EMP_BONUS(SALARY)AS BONUS FROM EMPLOYEE

-------------------------------------------
--CREATE OR ALTER FUNCTION CalculateBonus
--(
--    @Salary DECIMAL(10, 2)
--)
--RETURNS DECIMAL(10, 2)
--AS
--BEGIN
--    RETURN @Salary * 0.10;
--END;

--SELECT Emp_ID, EMP_Name, DEP_ID, Salary, dbo.CalculateBonus(Salary) AS Bonus
--FROM Employee;


 -------------------------------------------- FUNCTION QUESTION -----------------------------------------------------------------
				--Write a scalar function that takes a salary and returns the tax amount based on the following rules:
				
				--If salary < 2,50,000 → tax = 0
				--If salary between 2,50,000 and 5,00,000 → tax = 5%
				--If salary between 5,00,000 and 10,00,000 → tax = 20%
				--If salary > 10,00,000 → tax = 30%

--CREATE OR ALTER FUNCTION Fn_CalSalTaxAmount
--(
--@salary decimal(19,8)
--)
--RETURNS DECIMAL(19,8)
--AS
--BEGIN
--	  DECLARE @TaxAmount decimal(19,8)

--	  IF(@SALARY < 250000.00)
--	    	  Set @TaxAmount = (@salary*0.00)

--	  ELSE IF(@SALARY BETWEEN 250000.00 AND 500000.00)
--	    	  Set @TaxAmount = (@salary*0.05)

--	  ELSE IF(@SALARY BETWEEN 500000.01 AND 1000000.00)
--	          Set @TaxAmount = (@salary*0.20)
--	  ELSE
--		  SET @TaxAmount = @salary*0.30

--	RETURN @TaxAmount
--END;

--SELECT dbo.Fn_CalSalTaxAmount(500000.00)

 
---------------------------------------------- CALCULATE AGE BASED ON THE DOB --------------------------------------------
 
-- CREATE or alter FUNCTION Fn_calculate_Age ( @DOB date)
--RETURNS INT
--AS 
--BEGIN 
--     DECLARE @AGE INT 

--	  SET @AGE = DATEDIFF(year, @DOB, GETDATE())
	  
--			IF DATEADD(YEAR, @Age, @DOB) > GETDATE()     
--			SET @AGE = @AGE - 1
--			                     --  or 
--			 --IF (MONTH(GETDATE()) < MONTH(@DOB)) OR 
--             --(MONTH(GETDATE()) = MONTH(@DOB) AND DAY(GETDATE()) < DAY(@DOB))
--	                             --  or
--	        --IF DATEADD(month, abs(month(getdate()) - month(@DOB)),(DATEADD(month, @month, @DOB))) > month(GETDATE())
--			--SET @AGE = @AGE - 1

--	  RETURN @AGE

--END;

--SELECT dbo.Fn_calculate_Age('2000/11/15') --input

--SELECT DATEDIFF(month, '2000/12/15', GETDATE());

--select DATEADD(month, 298, '2000-11-15') --+ month(+ 1) 
 
--select DATEADD(month, abs(month(getdate()) - month('2000/11/15')),(DATEADD(month, 299, '2000-11-15')))
 
--SELECT DATEADD(YEAR, 25,'2000/11/15') 

--select abs(month(getdate()) - month('2000/10/15'))



_____________________________________________________________ TABLE VALUE FUNCTION ____________________________________________________________________
                                         ------------------- Inline Value Function---------------
CREATE or alter FUNCTION FN_GetStatusDetails
Returns Table 
as
    return (select StudentID,FirstName+' '+LastName as FullName,Class,DateOfBirth,Gender,Marks+mark2 as Total, dbo.FN_PerformanceByRating(Marks+mark2) from Students  

select * from dbo.FN_GetStatusDetails()

select * from Students 
----_________________________________________________________________________________________________________

CREATE or alter FUNCTION FN_GetTopStudents(@mark int)
RETURNS TABLE
AS 
RETURN( SELECT * FROM STUDENTS WHERE Marks > @mark and mark2>@mark)

SELECT * FROM FN_GetTopStudents(85)

----_________________________________________________________________________________________________________

CREATE or alter FUNCTION FN_PerformanceByRating
(
   @rating nvarchar(20)
)
returns nvarchar(20)
as
begin 
    declare @DGrade nvarchar(20)
	set @DGrade = case  
					when   @rating >= 90 then 'Excellent'
				    when   @rating >= 85 then 'Good'
					when   @rating >= 65 then 'Average'
					when   @rating >= 50 then 'Below Average'
					when   @rating >= 35 then 'Poor'
					else 'fail'
				 end
   return @DGrade
End;

--Create a function that returns all employees who joined after 2020 and have status 'ACTIVE'.

	CREATE or alter FUNCTION FNGetEmpStatus (@status nvarchar(20), @YEAR INT)
	RETURNS TABLe AS
	       RETURN (SELECT * FROM EMPLOYEE WHERE YEAR(DOJ) > @YEAR AND [STATUS] = @status)

     SELECT * FROM dbo.FNGetEmpStatus('active', 2020)   
	 select * from performance

--scalar
--Q3: Create a function that returns the latest rating of an employee based on their EMP_ID.

----Q4: Write a query to get employee name, department name, and latest performance rating.
--Q5: Create a function that returns the average rating of an employee across all months.


	 
	 	                      /*________________ */ Multi-Statement Table Valued Function /*____________________*/
-------------------------------------------------------------------------------------------------------------------------------------------
				
----Create a function that returns students with performance categories based on marks:

CREATE OR ALTER FUNCTION dbo.GetStudentPerformance()
RETURNS @Result TABLE (
    StudentID INT,
    FullName NVARCHAR(100),
    Marks INT,
    Performance NVARCHAR(20)
)
AS
BEGIN
    INSERT INTO @Result
    SELECT 
        StudentID,
		FirstName + ' ' + LastName AS FullName,
		Marks, CASE WHEN Marks >= 90 THEN 'Excellent'
                    WHEN Marks >= 75 THEN 'Good'                                
                    WHEN Marks >= 50 THEN 'Average'                                
                    ELSE 'Poor'                                
               END AS Performance                                
            FROM Students;                                
    RETURN;
END;

select * from GetStudentPerformance()
----_________________________________________________________________________________________________________

--Q2: Create a function that returns employees along with their performance category:	
       --Rating = 5 → 'Outstanding'
       --Rating = 4 → 'Excellent'
       --Rating = 3 → 'Good'
       --Rating = 2 → 'Average'
       --Rating = 1 → 'Poor'


	CREATE FUNCTION FN_GetEmpPerformance()
	Returns @Result table (
	         Emp_id int,
			 Rating int,
			 Performance nvarchar(20)
			 )
	          
	as 
	 begin
	       insert into @Result 
		   select emp_id, rating, case
										when rating = 5 then 'Outstanding'
										when rating = 4 then 'Excellent'
										when rating = 3 then 'Good'
										when rating = 2 then 'Average'
										when rating = 1 then 'Poor'
										else 'Null'
								  end as Performace
		                      from PERFORMANCE;
	       return;
	 end;

--EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

------------------------------------------------------ TRIGGER ------------------------------------------------------------------
--use demo;

--create table software_temp 
--	(
--	name nvarchar(8), 
--	title nvarchar(20),
--	dev_in nvarchar(8), 
--	scost decimal(7,2), 
--	dcost decimal(7,2), 
--	sold decimal(7,2)
--	);

--		insert into Software_temp
--		select * from Software 

--CREATE TABLE SOFTWARE_AUDIT (NAME NVARCHAR(10), AUDITDATA NVARCHAR(50)) ;

--alter table SOFTWARE_TEMP alter column name nvarchar(16);



---------------------------------------------- TRIGGER (DML COMMENTS) ---------------------------------------------------


create or Alter TRIGGER TR_Programmer_ForInsert  
ON SOFTWARE_TEMP 
FOR INSERT 
AS
BEGIN 
     DECLARE @NAME NVARCHAR(20)
	 SELECT @NAME = [NAME] FROM inserted


	 INSERT INTO SOFTWARE_AUDIT
	 VALUES (@NAME,'New Employee with Name = ' + @NAME + ' is added at ' + convert(NVARCHAR(100), GETDATE()))
End;

INSERT INTO SOFTWARE_TEMP VALUES ('suresh','bank APPLICATION','c++',12000,9000,2000 )

select * from software_temp
select * from SOFTWARE_AUDIT



----------------------------------------------------- Trigger --------------------------------------------------------------
 
 CREATE TABLE Programmer_log (
 logID int identity(1,1),
 action nvarchar(20),
 name nvarchar(20),
 ActionTime Date
 )


 CREATE OR ALTER TRIGGER TR_ProgrammerInt
 ON [programmer]
 AFTER INSERT
 AS 
 BEGIN
       INSERT INTO Programmer_log (action, name, actionTime)
	   SELECT 'inserted', name, CONVERT(VARCHAR(8), (),108)'hh:mi:ss'
	   from inserted;
 END;

INSERT INTO demo.[dbo].[programmer] VALUES
('janen', '1990-05-15', '2024-05-01', 'M', 'Pascal', 'C', 3500)


*/
alter table TEMP alter column [TIME] date(7)

creATE TABLE TEMP( ID INT, [TIME] TIME );

select cast(actionTime as date),name from Programmer_log
select * from Programmer_log
select * from software_temp

------------------------------------------------- DELETE -----------------------------------------------------
-
CREATE or alter TRIGGER TR_Programmer_ForDelete 
ON SOFTWARE_TEMP 
FOR Delete 
AS
BEGIN 
     DECLARE @NAME NVARCHAR(20)
	 SELECT @NAME = [NAME] FROM deleted


	 INSERT INTO SOFTWARE_AUDIT
	 VALUES (@NAME,'New Employee with Name = ' + @NAME + ' is Delete at ' + convert(NVARCHAR(20), GETDATE()))
End;

delete from software_temp where sold = 15000

------------------------------------------------- TR_UPDATE ------------------------------------------------------

CREATE or alter TRIGGER TR_Software_Temp_ForUpdate
ON SOFTWARE_TEMP 
FOR UPDATE
AS 
BEGIN
     SELECT * FROM deleted
	 SELECT * FROM inserted
END;

UPDATE SOFTWARE_TEMP SET title = 'crm tools', SOLD = 30000 WHERE dev_in = 'PASCAL';
select * from SOFTWARE_TEMP
                      ------------------------------------------------------------

CREATE TRIGGER TR_Software_Temp_ForUpdate
ON SOFTWARE_TEMP 
FOR UPDATE
AS 
BEGIN
     DECLARE @NAME nvarchar(20)
	 DECLARE @Oldtitle nvarchar(20), @NewTitle nvarchar(20)
	 DECLARE @Olddev_in nvarchar(20), @Newdev_in nvarchar(20)
	 	 DECLARE @Oldccost nvarchar(20), [@ccost] nvarchar(20)

	 DECLARE @Oldsold decimal(7,2), @Newsold decimal(7,2)

	 declare @auditstring nvarchar(1000)

	 SELECT * INTO @TempTable FROM inserted 

	 WHILE (EXISTS(SELECT @NAME from @TempTable))
	 BEGIN
	      SET @auditstring = ' '

		  select top 1 @NAME = @Oldtitle, @title= name, @Olddev_in = dev_in, from 

END;

truncate table programmer_log
select * from programmer_log
SELECT * FROM [programmer]
SELECT * FROM [Software]
SELECT * FROM [Studies]



--	----------------------------------------16/10/2025 ---------------------------------------------------------
	
----0 to 255

--select ASCii('a')
--select char(67)


--declare @start int
--set @start = 90
--while (@start <91)

--     begin
--		  print char(@start) 
--		  set @start = @start +1
--	 end

--	 select left('ABCDEF', 3)
--	 select right('ABCDEF', 3)
--	 select CHARINDEX('@', '82222@2222') --how count of the letter before expression
--	 select SUBSTRING('arunrajmars@gmail.com',1,12)  --arunrajmars@
--	 select SUBSTRING(prof1,1,2) from programmer 

--	 select len(('dam@nnn.com') - CHARINDEX('@','dam@nnn.com'))

--	 select SUBSTRING('Email',  CHARINDEX('@','Email' )+1,
--	 len('Email') - CHARINDEX('@','Email')) as domain, 
--	 count(Email) as total
--	 from substringCustomersemailid
--	 group by SUBSTRING('Email',  CHARINDEX('@','Email' )+1, len('Email') - CHARINDEX('@','Email'))

--	 select * from substringCustomersemailid


----	 -- Create the table
----CREATE TABLE substringCustomersemailid (
----    ID INT PRIMARY KEY not null identity(1,1) ,
----    Email VARCHAR(255) NOT NULL
----);

------ Insert sample data
----INSERT INTO substringCustomersemailid (Email)
----VALUES 
----('john.doe@example.com'),
----('jane.smith@domain.org'),
----('info@company.net'),
----('support@service.io'),
----('admin@website.com');

--select * from substringCustomersemailid

--WITH CTE AS (
--    SELECT 
--        *, 
--        ROW_NUMBER() OVER (PARTITION BY name ORDER BY name) AS rn
--    FROM Programmer
--)
--DELETE FROM CTE WHERE rn > 1;



------------------------------------- 18/10/2025 ---------------------------------------------------  
--login page backend code 
--CREATE TABLE LOGIN_Pw_DATA
--(
--  PW_ID INT IDENTITY(1,1) NOT NULL,
--  [User_Name] nvarchar(15),
--  PW_Random VARBINARY(16) not null,
--  Hashed_password VARBINARY(64) not null,
--);
 
--sp_help LOGIN_Pw_DATA 

--SP_RENAME 'LOGIN_Pw_DATA.PW_ID', 'UserId', 'column'

alter table LOGIN_Pw_DATA 
alter column [user_name] varchar(50) not null;



CREATE or alter PROC Check_PW_Vaildate_SP
 @User_name nvarchar(50),
 @Password nvarchar(50)
AS
BEGIN

    DECLARE @Random VARBINARY(16);
	SET @Random = CRYPT_GEN_RANDOM(16);
	DECLARE @hashedPassword VARBINARY(64);
	--SET @hashedPassword = @Password;

	SET @hashedPassword = HASHBYTES('SHA2_512', @password + CONVERT(NVARCHAR(MAX), @Random));

	IF NOT EXISTS (SELECT 1 FROM LOGIN_Pw_DATA WHERE User_Name = @User_Name)
	--IF (select * from LOGIN_Pw_DATA where [User_Name] != @User_Name)
		BEGIN
			INSERT INTO LOGIN_Pw_DATA ([User_Name], PW_Random, Hashed_password)
								VALUES (@User_Name, @Random, @HashedPassword);
		END
	ELSE
		BEGIN
			 PRINT 'This UserName Already Exists';
		END
END;

SELECT 1 FROM LOGIN_Pw_DATA WHERE User_Name = @User_Name

EXEC Check_PW_Vaildate_SP 'GIRIDHARAN', 'SECURE@123' 

alter table login_pw_data add column 

CREATE or alter PROC Check_PW_ValidOrNot_SP
     @User_name nvarchar(50),
	 @inputPassword nvarchar(50)
AS
BEGIN
	  DECLARE @storedRandom VARBINARY(16);
	  DECLARE @storedHash VARBINARY(64);
	  SElect @storedRandom = PW_Random from LOGIN_Pw_DATA
	  SElect @storedHash = Hashed_password from LOGIN_Pw_DATA

	  DECLARE @inputHash VARBINARY(64);
		SET @inputHash = HASHBYTES('SHA2_512', @inputPassword + CONVERT(NVARCHAR(MAX), @storedRandom));

-- Compare hashes
		IF @inputHash = @storedHash
			 PRINT 'Password is valid';
		ELSE
			 PRINT 'Invalid password';
	 
END;

exec Check_PW_ValidOrNot_SP 'GIRIDHARAN', 'SECURbE@123'

selecT * from LOGIN_Pw_DATA










---- Hashing a password with a Random (conceptual)
--DECLARE @password NVARCHAR(128) = 'MyStrongPassword';
--DECLARE @Random VARBINARY(16) = CRYPT_GEN_RANDOM(16); -- Generate a random Random
--DECLARE @hashedPassword VARBINARY(64);

--SET @hashedPassword = HASHBYTES('SHA2_512', @password + CONVERT(NVARCHAR(MAX), @Random));

--select @hashedPassword,@Random

--select HASHBYTES('SHA2_512', 'MyStrongPassword' + CONVERT(NVARCHAR(MAX), 0x840C7E8EBF25171F92778CFA7AF3DDB4))

----0x1527F124E36D81F81E199035E08898D1232BFB8F8765B39FCD174D9E7A7D2B8A5CB4B3D99F10F6492823FC114415E4A62E3927EDB188F617DC2BBEC02D000E7F
----0x1527F124E36D81F81E199035E08898D1232BFB8F8765B39FCD174D9E7A7D2B8A5CB4B3D99F10F6492823FC114415E4A62E3927EDB188F617DC2BBEC02D000E7F
------ Store @hashedPassword and @Random in your Users table

------ Verifying a password (conceptual)
----DECLARE @enteredPassword NVARCHAR(128) = 'MyStrongPassword';
----DECLARE @storedRandom VARBINARY(16) = <retrieve_Random_from_database>;
----DECLARE @storedHashedPassword VARBINARY(64) = <retrieve_hashed_password_from_database>;

----IF HASHBYTES('SHA2_512', @enteredPassword + CONVERT(NVARCHAR(MAX), @storedRandom)) = @storedHashedPassword
----BEGIN
----    PRINT 'Password is correct.';
----END
----ELSE
----BEGIN
----    PRINT 'Incorrect password.';
----END

-- Registration phase
DECLARE @password NVARCHAR(128) = 'MyStrongPassword';
DECLARE @Random VARBINARY(16) = CRYPT_GEN_RANDOM(16);
DECLARE @hashedPassword VARBINARY(64);

SET @hashedPassword = HASHBYTES('SHA2_512', @password + CONVERT(NVARCHAR(MAX), @Random));

SELECT @hashedPassword , @Random-- to the database


-- Assume these are retrieved from the database
DECLARE @storedRandom VARBINARY(16) = 0xD7EFB14C5F963BFC93C0D53059A4454F;
DECLARE @storedHash VARBINARY(64) = 0xE5E70E118408C217A95BD010016DDA9D7695CFDA6140FA9EF38A52B91C15C7670AB6AF814E2FDBEA9E78D3E54D01B9806F40940EA3C385382E9C0E8C9BB46B91; -- actual stored hash

-- User input
DECLARE @inputPassword NVARCHAR(128) = 'SECURE@123';

-- Recompute hash using stored Random
DECLARE @inputHash VARBINARY(64);
SET @inputHash = HASHBYTES('SHA2_512', @inputPassword + CONVERT(NVARCHAR(MAX), @storedRandom));

-- Compare hashes
IF @inputHash = @storedHash
    PRINT 'Password is valid';
ELSE
    PRINT 'Invalid password';






---------------------------------------------------- INDEX, NON ----------------------------------------
CREATE INDEX INDEX1
ON Aadhar_Details (Aadhar_Number)

CREATE UNIQUE INDEX UI_INDEX2
ON Aadhar_Details (Aadhar_Number)

CREATE NONCLUSTERED INDEX NONC_INDEX3
ON Aadhar_Details (Aadhar_Number)



------------------------------------------------------------- Akshay ---------------------------------------------------------

--CREATE TABLE DEPARTMENT(
--DEP_ID INT IDENTITY(1,1),
--DEP_NAME NVARCHAR(20) 
--)
 
--CREATETABLEEMPLOYEE(
--EMP_ID INT IDENTITY(1,1),
--EMP_NAME NVARCHAR(20),
--DEP_ID INT,
--SALARY DECIMAL(10,2),
--DOJ DATE,
--STATUS NVARCHAR(10)DEFAULT'ACTIVE')
 
--CREATE TABLE PERFORMANCE
--(
--PERF_ID INT IDENTITY(1,1),
--EMP_ID INT,
--RATINGINT CHECK(RATING BETWEEN 1 AND 5),
--MONTH NVARCHAR(20),
--YEAR INT
--)
 
 
--INSERT INTO DEPARTMENT VALUES('IT'),('HR'),('FINANCE')
--SELECT * FROM DEPARTMENT
 
 
--INSERT INTO EMPLOYEE (EMP_NAME,DEP_ID,SALARY,DOJ) VALUES(' ',1,58000,'2022-01-10'),
--														('SARA',1,60000,'2021-03-12'),
--														('DAVID',2,40000,'2020-05-20'),
--														('EMMA',3,70000,'2023-07-15')
 
--select * from EMPLOYEE
 
 
--INSERT INTO PERFORMANCE(EMP_ID,RATING,MONTH,YEAR)VALUES(1,5,'SEP',2025),
--														(2,4,'SEP',2025),
--														(3,3,'SEP',2025),
--														(4,5,'SEP',2025)
							
 
--select* from EMPLOYEE													
--SELECT* FROM PERFORMANCE
--SELECT* FROM DEPARTMENT
 
 
----FIND AVG RATING PER DEP AND LIST ONLY DEP WITH AVG > 3.5
--SELECT D.DEP_NAME, AVG(P.RATING) AS AVG_RATING FROM EMPLOYEE E JOIN DEPARTMENT D ON E.DEP_ID = D.DEP_ID
--JOIN PERFORMANCE P ON E.EMP_ID = P.EMP_ID GROUP BY D.DEP_NAME HAVING AVG(P.RATING) >3.5 ORDER BY AVG_RATING DESC
 
----GIVE 10% SALARY HIKE TO EMPWHOSE RATING >= 4
--UPDATE EMPLOYEE SET SALARY = (E.SALARY*1.10) FROM EMPLOYEE E  JOIN PERFORMANCE P ON E.EMP_ID = P.EMP_ID
--WHERE P.RATING >= 4
 
----USE TEMP TABLE TO STORE TOP 3 PERFROMANCE
 
SELECT TOP 3 E.EMP_NAME,P.RATING INTO #TEMP_EMP FROM EMPLOYEE E
JOIN PERFORMANCE P ON E.EMP_ID=P.EMP_ID ORDER BY RATING DESC
SELECT * FROM #TEMP_EMP
drop table #TEMP_EMP
 
----TRIGGER TO AUDIT SALARY
 
--CREATE TABLE AUDIT_SALARY(
--AUDIT_ID INTIDENTITY(1,1),
--EMP_ID INT,
--EMP_NAME NVARCHAR(20),
--ACTION_TAKEN NVARCHAR(20))
 
 
--CREATE OR ALTER TRIGGERTR_SALARY_UP
--ON EMPLOYEE
--AFTER UPDATE
--AS
--BEGIN
 
--INSERT INTO AUDIT_SALARY(EMP_ID,EMP_NAME,ACTION_TAKEN)
--SELECT EMP_ID,EMP_NAME,'UPDATE'FROM INSERTED
--END
 
--UPDATE EMPLOYEE SET SALARY = SALARY+1000 WHERE EMP_ID =2
 
--SELECT*FROM AUDIT_SALARY
--SELECT*FROM EMPLOYEE
 
----------------- ITERATE EMPLOYEES AND PRINT BONUS -------------------------------
 
--DECLARE  @NAME NVARCHAR(20),@SALDECIMAL(10,2),@BONUS INT
 
--DECLARE BONUS_CURSOR CURSOR FOR
--SELECT EMP_NAME ,SALARY FROM EMPLOYEE
 
--OPEN BONUS_CURSOR
--FETCH NEXT FROM BONUS_CURSOR INTO @NAME,@SAL
 
--WHILE(@@FETCH_STATUS=0)
--BEGIN
--SET @BONUS=DBO.FN_EMP_BONUS(@SAL)
--PRINT'EMPLOYEE NAME: '+@NAME +'| BONUS AMOUNT : '+CAST(@BONUSASNVARCHAR(20))
 
--FETCH NEXT FROM BONUS_CURSOR INTO @NAME,@SAL
--END
 
--CLOSE BONUS_CURSOR
--DEALLOCATE BONUS_CURSOR
 ----------------------------------------------------------------------------------
 
----ADD OR UPDATE EMP PERFORMANCE

SELECT*FROM EMPLOYEE
SELECT*FROM PERFORMANCE
 
      CREATE OR ALTER PROCADDORUPDATE_PERF_SP
            @ID INT,
            @RATING INT,
            @MONTH NVARCHAR(20),
            @YEAR INT
      AS
      BEGIN
          IF EXISTS(SELECT 1 FROM PERFORMANCE WHERE EMP_ID = @ID AND MONTH=@MONTH)
		  UPDATE PERFORMANCE SET RATING=@RATING WHERE EMP_ID= @IDAND MONTH=@MONTH AND YEAR=@YEAR
       ELSE
          INSERT INTO PERFORMANCE(EMP_ID,RATING,MONTH,YEAR)
          VALUES(@ID,@RATING,@MONTH,@YEAR)
       END
       
      EXEC ADDORUPDATE_PERF_SP @ID=6, @RATING=2, @MONTH='SEP', @YEAR=2025
       
      SELECT * FROM PERFORMANCE
      

--						   01 
-- SELECT DBO.CalculateAge(CAST('20-09-2024' AS DATE)) AS age;

-- ------------------------------------------------------------------------------------------------

 

      SELECT * FROM EMPLOYEE
      SELECT * FROM PERFORMANCE
	  select * from DEPARTMENT


---------------------------------------------------------------------------------------------------
	  if exists (select * from employee where year(doj) between 2025 and 2026)
		 print 'this records in the table'
	  else
	     print 'this record not in the table'


------------DISPLAY THE HOW MANY EMP JOINED IN BETWEEN 2020 AND 2021 THOSE EMP DETAILS STORE IN THE TEMP TABLE-------------

 --   ALTER TABLE #temp ALTER COLUMN ViewedTime dateTIME;


	--CREATE TABLE #TEMP
	--(
	--EMP_ID INT IDENTITY(1,1),
	--EMP_NAME NVARCHAR(40),
	--DEP_ID INT,
	--SALARY DECIMAL(10,2),
	--DOJ DATE,
	--STATUS NVARCHAR(20)
	--)

	--DECLARE @StartDate1 int;
	--DECLARE @EndDate2 INT;
	--SET  @StartDate1 = 2020
	--set  @EndDate2 = 2021
	
	--IF EXISTS(SELECT * FROM EMPLOYEE WHERE YEAR(DOJ) BETWEEN @StartDate1 AND @EndDate2)
	--   BEGIN
	--	  INSERT INTO #TEMP(EMP_NAME,DEP_ID,SALARY,DOJ,STATUS,ViewedTime)
	--	  SELECT EMP_NAME,DEP_ID,SALARY,DOJ,STATUS,CURRENT_TIMESTAMP FROM EMPLOYEE WHERE YEAR(DOJ) BETWEEN @StartDate1 AND @EndDate2
	--   END
	--ELSE
	--   BEGIN
	--      PRINT ' No Record Found'
	--   END

	   ----------------------------------- ITS REMOVE TEMP TABLE WHEN REACH 15 RECORDS AUTOMATICALLY DELETE OLD RECORDS----------------------------------

-- Step 1: Create the temp table (if not exists)

  IF OBJECT_ID('tempdb..#TEMP') IS NOT NULL
    DROP TABLE #TEMP;

CREATE TABLE #TEMP
(
    ID INT IDENTITY(1,1),
    EMP_NAME NVARCHAR(50),
    DEP_ID INT,
    SALARY DECIMAL(10,2),
    DOJ DATE,
    STATUS NVARCHAR(20),
    ViewedTime DATETIME
);

-- Step 2: Declare variables
DECLARE @StartDate1 INT = 2020;
DECLARE @EndDate2 INT = 2021;

-- Step 3: Insert only if matching records exist
IF EXISTS (SELECT * FROM EMPLOYEE WHERE YEAR(DOJ) BETWEEN @StartDate1 AND @EndDate2)
BEGIN
    INSERT INTO #TEMP (EMP_NAME, DEP_ID, SALARY, DOJ, STATUS, ViewedTime)
    SELECT EMP_NAME, DEP_ID, SALARY, DOJ, STATUS, CURRENT_TIMESTAMP
    FROM EMPLOYEE
    WHERE YEAR(DOJ) BETWEEN @StartDate1 AND @EndDate2;

    -- Step 4: Delete oldest records only if count exceeds 15
    ;WITH CTE AS (
        SELECT ID, ROW_NUMBER() OVER (ORDER BY ID DESC) AS RowNum
        FROM #TEMP
    )
    DELETE FROM #TEMP
    WHERE ID IN (
        SELECT ID FROM CTE WHERE RowNum > 15
    );
END
ELSE
BEGIN
    PRINT 'No Record Found';
END;

-- Step 5: View the remaining records
SELECT * FROM #TEMP ORDER BY ID DESC;


	      select * from #TEMP
	      --drop table #temp

           SELECT*FROM EMPLOYEE
           SELECT*FROM PERFORMANCE
	       select*from DEPARTMENT

--------------------------------------------------------------------------------------------------------------

-- 1. PAN Details Table
CREATE TABLE PAN_Details (
    PAN_Number VARCHAR(10) PRIMARY KEY,
    User_Name VARCHAR(100) NOT NULL,
    Date_Of_Issue DATE,
    City_Address VARCHAR(50),
	Aadhar_number int
);

-- 2. Aadhar Details Table
CREATE TABLE Aadhar_Details (
    Aadhar_Number VARCHAR(12) PRIMARY KEY,
    User_Name VARCHAR(100) NOT NULL,
    DOB DATE,
    Gender CHAR(1),
    Mobile_Number VARCHAR(10)
);

-- 3. Bank Details Table (Includes multiple bank accounts and a Foreign Key to PAN)
CREATE TABLE Bank_Details (
    Bank_ID INT IDENTITY(1,1) PRIMARY KEY, -- Auto-incrementing ID for each account record
    User_Name VARCHAR(100) NOT NULL,
    Bank1_Name VARCHAR(50) NOT NULL,
    Bank1_Account_No VARCHAR(20) NOT NULL,
    Bank2_Name VARCHAR(50) NULL, -- Optional second bank
    Bank2_Account_No VARCHAR(20) NULL, -- Optional second account number
    IFSC_Code VARCHAR(11),
    Link_Aadhar_Number VARCHAR(12) NOT NULL, -- Foreign Key to link back to PAN details

    -- Define Foreign Key Constraint (OPTIONAL but RECOMMENDED for integrity)
    FOREIGN KEY (Link_Aadhar_Number) REFERENCES AADHAR_DETAILS(AADHAR_Number)
);

    

-- 🚀 MS SQL INSERT Statements for Bank_Details Table

INSERT INTO Bank_Details 
    (User_Name, Bank1_Name, Bank1_Account_No, Bank2_Name, Bank2_Account_No, IFSC_Code, Link_Aadhar_Number)
VALUES
('Aarav Sharma', 'HDFC Bank', '50100100100101', 'ICICI Bank', '60200200200201', 'HDFC0000001', 'ABCDE1001A'),
('Priya Singh', 'Axis Bank', '91900190019002', 'SBI', '10000100010002', 'UTIB0000002', 'FGHJI1002B'),
('Rohan Gupta', 'ICICI Bank', '60200200200303', 'HDFC Bank', '50100100100303', 'ICIC0000003', 'KLMNO1003C'),
('Sneha Reddy', 'SBI', '10000100010004', 'Standard C.', '70300300300404', 'SBIN0000004', 'PQRST1004D'),
('Vishal Patel', 'PNB', '20000200020005', NULL, NULL, 'PUNB0000005', 'UVWXY1005E'),
('Neha Verma', 'HDFC Bank', '50100100100606', 'Yes Bank', '80400400400606', 'HDFC0000006', 'ZAXBY1006F'),
('Rahul Jain', 'ICICI Bank', '60200200200707', NULL, NULL, 'ICIC0000007', 'CEDFV1007G'),
('Anjali Menon', 'Axis Bank', '91900190019008', 'Kotak Bank', '30500500500808', 'UTIB0000008', 'GHIJK1008H'),
('Vivek Kumar', 'SBI', '10000100010009', 'HDFC Bank', '50100100100909', 'SBIN0000009', 'MNOPQ1009I'),
('Tanya Aggarwal', 'Kotak Bank', '30500500501010', NULL, NULL, 'KKBK0000010', 'RSTUV1010J'),
('Alok Yadav', 'Yes Bank', '80400400401111', 'Axis Bank', '91900190019111', 'YESB0000011', 'WXAYZ1011K'),
('Divya Mishra', 'PNB', '20000200020012', NULL, NULL, 'PUNB0000012', 'ZBCDA1012L'),
('Kunal Das', 'HDFC Bank', '50100100101313', 'SBI', '10000100010131', 'HDFC0000013', 'EFGHJ1013M'),
('Ritu Nanda', 'ICICI Bank', '60200200201414', NULL, NULL, 'ICIC0000014', 'IJKLM1014N'),
('Sarthak Bose', 'SBI', '10000100010015', 'Axis Bank', '91900190019015', 'SBIN0000015', 'NOPQR1015O'),
('Esha Chawla', 'Standard C.', '70300300301616', 'HDFC Bank', '50100100101616', 'SCBL0000016', 'STUVX1016P'),
('Harish Dutt', 'Axis Bank', '91900190019017', 'PNB', '20000200020017', 'UTIB0000017', 'YZABC1017Q'),
('Leena Iyer', 'Kotak Bank', '30500500501818', NULL, NULL, 'KKBK0000018', 'DEFGH1018R'),
('Mohit Garg', 'Yes Bank', '80400400401919', 'ICICI Bank', '60200200201919', 'YESB0000019', 'IJKMN1019S'),
('Kavita Rao', 'PNB', '20000200020020', NULL, NULL, 'PUNB0000020', 'OPQRS1020T'),
('Akash Nair', 'HDFC Bank', '50100100102121', 'SBI', '10000100010212', 'HDFC0000021', 'TUVWX1021U'),
('Pooja Shah', 'ICICI Bank', '60200200202222', NULL, NULL, 'ICIC0000022', 'YZADE1022V'),
('Sameer Lalla', 'Axis Bank', '91900190019023', 'HDFC Bank', '50100100102323', 'UTIB0000023', 'FGHJI1023W'),
('Geeta Pande', 'SBI', '10000100010024', 'Kotak Bank', '30500500502424', 'SBIN0000024', 'KLMNO1024X'),
('Rohit Saxena', 'Standard C.', '70300300302525', 'PNB', '20000200020025', 'SCBL0000025', 'PQRST1025Y'),
('Shreya Dubey', 'Yes Bank', '80400400402626', NULL, NULL, 'YESB0000026', 'UVWXY1026Z'),
('Karan Tandon', 'PNB', '20000200020027', 'HDFC Bank', '50100100102727', 'PUNB0000027', 'ZAXBY1027A'),
('Meera Joshi', 'HDFC Bank', '50100100102828', 'ICICI Bank', '60200200202828', 'HDFC0000028', 'CEDFV1028B'),
('Nitin Bhasin', 'SBI', '10000100010029', 'Axis Bank', '91900190019029', 'SBIN0000029', 'GHIJK1029C'),
('Deepa Singh', 'ICICI Bank', '60200200203030', NULL, NULL, 'ICIC0000030', 'MNOPQ1030D');

-- 🚀 MS SQL INSERT Statements for Aadhar_Details Table

INSERT INTO Aadhar_Details 
    (Aadhar_Number, User_Name, DOB, Gender, Mobile_Number)
VALUES
('123456780001', 'Aarav Sharma', '1990-03-01', 'M', '9876543210'),
('123456780002', 'Priya Singh', '1992-06-17', 'F', '9876543211'),
('123456780003', 'Rohan Gupta', '1988-11-25', 'M', '9876543212'),
('123456780004', 'Sneha Reddy', '1995-09-08', 'F', '9876543213'),
('123456780005', 'Vishal Patel', '1989-02-14', 'M', '9876543214'),
('123456780006', 'Neha Verma', '1998-12-05', 'F', '9876543215'),
('123456780007', 'Rahul Jain', '1991-05-30', 'M', '9876543216'),
('123456780008', 'Anjali Menon', '1993-08-11', 'F', '9876543217'),
('123456780009', 'Vivek Kumar', '1996-01-09', 'M', '9876543218'),
('123456780010', 'Tanya Aggarwal', '1994-10-21', 'F', '9876543219'),
('123456780011', 'Alok Yadav', '1987-04-02', 'M', '9876543220'),
('123456780012', 'Divya Mishra', '1999-07-28', 'F', '9876543221'),
('123456780013', 'Kunal Das', '1997-02-15', 'M', '9876543222'),
('123456780014', 'Ritu Nanda', '1990-12-07', 'F', '9876543223'),
('123456780015', 'Sarthak Bose', '1992-03-23', 'M', '9876543224'),
('123456780016', 'Esha Chawla', '1995-06-19', 'F', '9876543225'),
('123456780017', 'Harish Dutt', '1989-08-04', 'M', '9876543226'),
('123456780018', 'Leena Iyer', '1998-05-13', 'F', '9876543227'),
('123456780019', 'Mohit Garg', '1991-11-09', 'M', '9876543228'),
('123456780020', 'Kavita Rao', '1993-04-20', 'F', '9876543229'),
('123456780021', 'Akash Nair', '1996-07-26', 'M', '9876543230'),
('123456780022', 'Pooja Shah', '1990-10-06', 'F', '9876543231'),
('123456780023', 'Sameer Lalla', '1988-01-29', 'M', '9876543232'),
('123456780024', 'Geeta Pande', '1995-04-12', 'F', '9876543233'),
('123456780025', 'Rohit Saxena', '1989-09-03', 'M', '9876543234'),
('123456780026', 'Shreya Dubey', '1998-07-15', 'F', '9876543235'),
('123456780027', 'Karan Tandon', '1991-05-22', 'M', '9876543236'),
('123456780028', 'Meera Joshi', '1993-08-18', 'F', '9876543237'),
('123456780029', 'Nitin Bhasin', '1996-01-27', 'M', '9876543238'),
('123456780030', 'Deepa Singh', '1994-11-04', 'F', '9876543239');


-- 🚀 MS SQL INSERT Statements for PAN_Details Table

INSERT INTO PAN_Details 
    (PAN_Number, User_Name, Date_Of_Issue, City_Address,Aadhar_Number)
VALUES
('ABCDE1001A', 'Aarav Sharma', '2010-05-15', 'Mumbai'),
('FGHJI1002B', 'Priya Singh', '2012-08-22', 'Delhi'),
('KLMNO1003C', 'Rohan Gupta', '2008-02-10', 'Bengaluru'),
('PQRST1004D', 'Sneha Reddy', '2015-11-28', 'Hyderabad'),
('UVWXY1005E', 'Vishal Patel', '2009-07-01', 'Ahmedabad'),
('ZAXBY1006F', 'Neha Verma', '2018-04-03', 'Pune'),
('CEDFV1007G', 'Rahul Jain', '2011-09-19', 'Chennai'),
('GHIJK1008H', 'Anjali Menon', '2013-01-25', 'Kochi'),
('MNOPQ1009I', 'Vivek Kumar', '2016-06-14', 'Jaipur'),
('RSTUV1010J', 'Tanya Aggarwal', '2014-03-05', 'Kolkata'),
('WXAYZ1011K', 'Alok Yadav', '2007-12-12', 'Lucknow'),
('ZBCDA1012L', 'Divya Mishra', '2019-10-10', 'Bhopal'),
('EFGHJ1013M', 'Kunal Das', '2017-01-20', 'Patna'),
('IJKLM1014N', 'Ritu Nanda', '2010-04-04', 'Chandigarh'),
('NOPQR1015O', 'Sarthak Bose', '2012-09-09', 'Noida'),
('STUVX1016P', 'Esha Chawla', '2015-05-18', 'Gurgaon'),
('YZABC1017Q', 'Harish Dutt', '2009-06-27', 'Surat'),
('DEFGH1018R', 'Leena Iyer', '2018-08-01', 'Vadodara'),
('IJKMN1019S', 'Mohit Garg', '2011-02-11', 'Nagpur'),
('OPQRS1020T', 'Kavita Rao', '2013-11-07', 'Indore'),
('TUVWX1021U', 'Akash Nair', '2016-12-30', 'Coimbatore'),
('YZADE1022V', 'Pooja Shah', '2010-03-17', 'Visakhapatnam'),
('FGHJI1023W', 'Sameer Lalla', '2008-10-08', 'Madurai'),
('KLMNO1024X', 'Geeta Pande', '2015-07-29', 'Ranchi'),
('PQRST1025Y', 'Rohit Saxena', '2009-01-05', 'Kanpur'),
('UVWXY1026Z', 'Shreya Dubey', '2018-03-24', 'Ludhiana'),
('ZAXBY1027A', 'Karan Tandon', '2011-07-16', 'Nashik'),
('CEDFV1028B', 'Meera Joshi', '2013-05-21', 'Thrissur'),
('GHIJK1029C', 'Nitin Bhasin', '2016-09-02', 'Gwalior'),
('MNOPQ1030D', 'Deepa Singh', '2014-01-14', 'Rajkot');



select * from Aadhar_Details
select * from Bank_Details
select * from PAN_Details

--this is for create existing table stucture
SELECT Bank_ID into Aadhar_details from Bank_Details where 1 = 0;

alter table Aadhar_details add Bank_ID nvarchar(12) null

--insert records one table some another copy of the table
insert into Aadhar_details (Aadhar_Number,User_Name,DOB,Gender,Mobile_Number)
select Aadhar_Number,User_Name,DOB,Gender,Mobile_Number 
from Aadhar_details1

UPDATE a
SET a.Bank_ID = b.bank_id
from Bank_Details B JOIN Aadhar_details A ON A.USER_NAME = B.User_Name

--------------------------------------------------------------- #Temp ------------------------------------------------------------------------
--top 3 employees based on performance rating.
Select top 3 e.EMP_ID, e.EMP_NAME, e.DEP_ID, p.RATING into #temp1 
from EMPLOYEE e 
join PERFORMANCE p 
on e.EMP_ID = p.EMP_ID 
order by p.RATING desc
      
	  SELECT * FROM EMPLOYEE
      SELECT * FROM PERFORMANCE
	  select * from DEPARTMENT

--Create a temp table that stores the top 2 employees based on performance rating.
select top 2 e.EMP_ID,
e.EMP_NAME,
DEP_ID,
SALARY,
STATUS into #TopPerformers from EMPLOYEE e join PERFORMANCE p on e.EMP_ID = p.EMP_ID order by RATING desc
select * from #TopPerformers

--Store the average salary per department in a temp table.
select dep_name, 
avg(SALARY) AS AVG_SALARY 
into #AvgSalDept 
from DEPARTMENT d join EMPLOYEE e 
on d.DEP_ID = e.DEP_ID 
group by DEP_NAME 
SELECT * FROM #AvgSalDept

--Create a temp table with employees who joined in the last 12 months.
SELECT * INTO #EMPLOYEE FROM EMPLOYEE WHERE DOJ >= DATEADD(MONTH, -50, GETDATE())

--Create a temp table that joins EMPLOYEE and DEPARTMENT to show employee name, department name, and salary.
SELECT E.EMP_NAME,D.DEP_NAME,SALARY INTO #EmpWithDept FROM EMPLOYEE E JOIN DEPARTMENT D ON E.DEP_ID = D.DEP_ID
select * from #EmpWithDept

--Create a temp table with employees earning more than ₹60,000.
select * into #temp from EMPLOYEE where salary > 60000
select * from #temp

--Top Performer per Department
--Create a temp table that stores the highest-rated employee from each department. 
select distinct(d.DEP_NAME), RATING from PERFORMANCE p join EMPLOYEE e on e.EMP_ID = p.EMP_ID join DEPARTMENT d on e.DEP_ID = d.DEP_ID group by DEP_NAME, RATING order by RATING desc




--Inactive Employees
--Create a temp table with employees whose STATUS is not 'ACTIVE'.


--Employees Without Performance Records
--Store employees who don’t have any entry in the PERFORMANCE table.



--CREATE TABLE #TEMP (ID INT, eMP_NAME nvarchar(20))

--insert into #TEMP values (1, 'vyshak')
--select * from #temp1


--select ID, eMP_NAME 
--into #temp1 from #TEMP 

declare @variableTN table (ID INT, eMP_NAME nvarchar(20))
insert

select *from programmer

declare @variable table(id int, name nvarchar(20))
insert into @variable values (1, 'name1')
select * from @variable


--function

--scalar return one value

create or alter function Fn_GetTotal(@a int, @b int)
returns int 
as
 begin
     return  @a + @b
 end;

 select dbo.Fn_GetTotal(2,4)

 --inline functions
     -- return a single select result 

 create function FnGetEmp(@dept varchar(50))
 returns table
 as
 return (select * from studies where course = @dept)

SELECT *FROM dbo.FnGetEmp('dcs');

--return a table after muiltple operation 

create or ALTER function FN_GetHighSalary()
returns @programmer table (name varchar(20), salary decimal(10,2))
as 
begin
	insert into @programmer 
	select name ,salary from programmer where salary > 4000
	return;
end

select * from dbo.FN_GetHighSalary()


--INPUT PARAMETER
CREATE PROC Get_progSalBy_SP @salary decimal(10,2)
AS
BEGIN
	  SELECT * FROM programmer WHERE salary = @salary
END;

EXEC Get_progSalBy_SP 4000

--output input

CREATE or alter PROC GetSalary_sp @NAME NVARCHAR(20), 
						          @salary int out
AS
BEGIN
		SELECT @salary = SALARY FROM programmer WHERE [NAME] = @NAME
END;
 
DECLARE @DOSalary int
exec GetSalary_sp RAMESH, 
@DOSalary out
select @salary

select * from programmer


USE [DEMO]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GetEmpExperience]    Script Date: 11-11-2025 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create FUNCTION [dbo].[FN_GetEmpExperience] 
  (
	@DOJ DATE
  )
  RETURNS INT
  AS 
  BEGIN
	    RETURN DATEDIFF(YEAR, @DOJ, GETDATE())
  END;

CREATE OR ALTER VIEW vw_progDetail
AS
SELECT name,dbo.FN_GetEmpExperience(DOJ) AS Experience,SALARY
FROM PROGRAMMER;

select * from programmer

create or alter trigger TR_InsertNewRow1
on programmer
after insert 
as
begin
     print 'new record inserted'
end;

insert into programmer values ('rrrr','1990-01-15','2022-03-01','m','','',5000)


create or alter trigger TR_PreventSalaryabove13000
on programmer 
instead of insert 
as
begin
	if exists (select * from inserted where salary < 13000)
	begin
	    print 'you should below 13000.00'
		return;
	end

	insert into programmer (name,dob,doj,gender,prof1,prof2,salary)
	select name,dob,doj,gender,prof1,prof2,salary from inserted;

end
	insert into programmer (name,dob,doj,gender,prof1,prof2,salary) 
	values ('','','','','','',14000)

	CREATE TRIGGER trg_SalaryUpdateLimit
ON programmer
INSTEAD OF UPDATE
AS
BEGIN
    -- If the new salary is greater than 13000
    IF EXISTS (SELECT * FROM inserted WHERE Salary > 13000)
    BEGIN
        PRINT 'You should give salary below 13000.';
        RETURN;  -- stop the update
    END
 
    -- Otherwise, perform the update
    UPDATE E
    SET E.name = I.name,
        E.Salary = I.Salary
    FROM programmer E
    INNER JOIN inserted I ON E.EmpID = I.EmpID;
 
    PRINT 'Salary updated successfully!';
END;

DECLARE @EmpName NVARCHAR(50), @Salary DECIMAL(10,2);

-- Step 1: Declare the cursor
DECLARE EmpCursor CURSOR FOR
SELECT EMP_NAME, SALARY FROM EMPLOYEE;

-- Step 2: Open the cursor
OPEN EmpCursor;

-- Step 3: Fetch the first row
FETCH NEXT FROM EmpCursor INTO @EmpName, @Salary;

-- Step 4: Loop through rows
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Employee: ' + @EmpName + ' | Salary: ' + CAST(@Salary AS NVARCHAR);
    
    -- Fetch next row
    FETCH NEXT FROM EmpCursor INTO @EmpName, @Salary;
END;

-- Step 5: Close and deallocate
CLOSE EmpCursor;
DEALLOCATE EmpCursor;






-- Drop existing tables if needed
DROP TABLE IF EXISTS Users, Audit_Table, Employees, Orders, Products, ProductHistory,
Orders_Audit, CustomersBackup, LoginAudit, OrderDetails;

-- 1. Users Table
CREATE TABLE Users (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(50),
    Email VARCHAR(100),
    Role VARCHAR(20)
);

INSERT INTO Users VALUES
(101, 'Alice', 'alice@example.com', 'Admin'),
(102, 'Bob', 'bob@example.com', 'Manager'),
(103, 'Charlie', 'charlie@example.com', 'Staff');

-- 2. Audit Table
CREATE TABLE Audit_Table (
    EMP_ID INT,
    EMP_NAME VARCHAR(50),
    ACTION_TAKEN VARCHAR(20),
    ActionDate DATETIME DEFAULT GETDATE()
);

-- 3. Employees Table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10,2),
    Role VARCHAR(20)
);

INSERT INTO Employees VALUES
(201, 'David', 50000, 'Developer'),
(202, 'Eva', 120000, 'Manager'),
(203, 'Frank', 80000, 'Tester');

-- 4. Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    CustomerName VARCHAR(50),
    Status VARCHAR(20),
    LastModified DATETIME
);

INSERT INTO Orders VALUES
(301, 101, 'Alice', 'Pending', GETDATE()),
(302, 102, 'Bob', 'Shipped', GETDATE());

-- 5. Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(401, 'Laptop', 75000),
(402, 'Mouse', 500),
(403, 'Keyboard', 1500);

-- 6. ProductHistory Table
CREATE TABLE ProductHistory (
    ProductID INT,
    OldPrice DECIMAL(10,2),
    ChangeDate DATETIME
);

-- 7. Orders_Audit Table
CREATE TABLE Orders_Audit (
    OrderID INT,
    OldStatus VARCHAR(20),
    NewStatus VARCHAR(20),
    ChangeDate DATETIME DEFAULT GETDATE()
);

-- 8. CustomersBackup Table
CREATE TABLE CustomersBackup (
    CustomerID INT,
    Name VARCHAR(50)
);

-- 9. LoginAudit Table
CREATE TABLE LoginAudit (
    UserID INT,
    AttemptTime DATETIME
);

-- 10. OrderDetails Table
CREATE TABLE OrderDetails (
    ID INT PRIMARY KEY,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    TotalPrice DECIMAL(10,2)
);

INSERT INTO OrderDetails VALUES
(501, 2, 500, NULL),
(502, 1, 75000, NULL);


CREATE TABLE Customers (
    CustomerID INT,
    Name VARCHAR(50)
);

INSERT INTO Customers VALUES
(101, 'Laptop'),
(102, 'Mouse'),
(103, 'Keyboard'),
(101, 'Mouse'),
(102, 'Mouse'),
(101, 'Keyboard');

CREATE TABLE Logins (
    LoginID INT IDENTITY PRIMARY KEY,
    UserID INT,
    Status VARCHAR(20)  -- 'Success' or 'Failed'
);

CREATE TABLE LoginUsers (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50),
    AccountStatus VARCHAR(20) DEFAULT 'Active'  -- 'Active' or 'Locked'
);
select * from LoginUsers
INSERT INTO LoginUsers VALUES (103, 'Alice1', 'Active'), (104, 'Bob1', 'Active');


-- Create tables
CREATE TABLE Logins1 (
    LoginID INT IDENTITY PRIMARY KEY,
    UserID INT,
    Status VARCHAR(20),
    AttemptTime DATETIME DEFAULT GETDATE()
);

-- Insert failed attempts
INSERT INTO Logins1(UserID, Status) VALUES(105, 'Failed');
INSERT INTO Logins1(UserID, Status) VALUES(105, 'Failed');
INSERT INTO Logins1(UserID, Status) VALUES(105, 'Failed');
INSERT INTO Logins1(UserID, Status) VALUES(105, 'Failed'); -- This should fail


   -- Simulate failed attempts
INSERT INTO Logins(UserID, Status) VALUES (102, 'Failed');
INSERT INTO Logins(UserID, Status) VALUES (102, 'Failed');
INSERT INTO Logins(UserID, Status) VALUES (102, 'Failed');

-- Check user status
SELECT * FROM Logins1 WHERE UserID = 103;



--Track every insert/update/delete in a table.
--truncate table orders


CREATE TRIGGER TR_ForAuditTBLDetails
on orders
for update
as
insert into Orders_Audit(OrderID,OldStatus,NewStatus)
select d.orderid,d.status,i.status from deleted d join inserted i on d.orderid = i.orderid

INSERT INTO Orders VALUES																		--( 1 )
(301, 101, 'Alice', 'Pending', GETDATE()),
(302, 102, 'Bob', 'Shipped', GETDATE());

update orders set status = 'shipped' where orderid = 301

select * from orders 
select * from orders_Audit

----------------------------------------------------------------------------------------------------------
--Prevent salary updates beyond a limit.

CREATE TRIGGER TR_SalaryLimit
on Employees
for update 
AS 
	 IF EXISTS(SELECT * FROM inserted WHERE SALARY > 100000)
BEGIN
	ROLLBACK;
	PRINT 'SALARY CANNOT EXCEED 100000LAKHS'
END;

--OR																				    --( 2 )

CREATE OR ALTER TRIGGER TR_SalaryLimit
ON Employees
FOR UPDATE
AS
BEGIN
    UPDATE Employees
    SET Salary = 100000
    FROM Employees e
    JOIN inserted i ON e.EmpID = i.EmpID
    WHERE i.Salary > 100000;
END;

UPDATE EMPLOYEES SET SALARY = 1000
WHERE EMPID = 201

select * from EMPLOYEES
-------------------------------------------------------------------------------------------------------

--Update related tables automatically.

CREATE TRIGGER trg_UpdateCustomerName
ON EMPLOYEES
FOR UPDATE
AS																									 --( 3 )
UPDATE Customers
SET Name = I.NAME
FROM Customers O JOIN inserted I ON O.CustomerID = I.EmpID

UPDATE EMPLOYEES SET NAME = 'Alicia' WHERE EMPID = 201;
SELECT * FROM Customers;  -- See the log

-------------------------------------------------------------------------------------------------------
--Stop deletion of critical records.

CREATE TRIGGER TR_ForPreventDelAdmin
on employees
after delete
as
if exists(select * from deleted where role = 'manager')
begin
	rollback;																				--	( 4 )
	print 'cannot delete the manager role'
end

delete from employees where role = 'manager'

select * from products 

----------------------------------------TR_THE LOGIN Attempt--------------------------------------------------------------

--Track failed login attempts.

 CREATE TRIGGER TR_CountUserAttempt
 on logins
 after insert 
AS
BEGIN
        insert into loginAudit(userid, Attempttime)
		select userid,getdate() from inserted

   IF EXISTS(SELECT * FROM inserted WHERE STATUS = 'FAILED')
   BEGIN
         DECLARE @USERID INT
		 SELECT @USERID = USERID FROM inserted

		 IF (SELECT COUNT(*) FROM LOGINS WHERE STATUS = 'FAILED') >= 3
		 BEGIN
		      UPDATE LOGINS SET STATUS = 'Locked' where userid = @USERID
			  print 'your account locked after 3 failed attempts'
		 END;

   END
   end;
----------------------------------------------- OR------------------------------------------------------

CREATE OR ALTER TRIGGER TR_CountUserAttempt
ON Logins
AFTER INSERT
AS
BEGIN
    -- Log every login attempt
    INSERT INTO LoginAudit(UserID, AttemptTime)
    SELECT UserID, GETDATE() FROM INSERTED;
    -- For each failed attempt, check count
    DECLARE @USERID INT;
    SELECT @USERID = USERID FROM INSERTED WHERE STATUS = 'FAILED';
    IF @USERID IS NOT NULL
    BEGIN
        IF (SELECT COUNT(*) FROM Logins WHERE STATUS = 'FAILED' AND USERID = @USERID) >= 3
        BEGIN
           -- Lock the user account (better to update Users table)
            UPDATE loginusers SET AccountStatus = 'Locked' WHERE UserID = @USERID;
            PRINT 'Your account locked after 3 failed attempts';
        END;
    END;
END;
---------------------------------------------or----------------------------------------------------





CREATE OR ALTER TRIGGER TR_LimitDailyFailedAttempts
ON Logins1
AFTER INSERT
AS
BEGIN
    -- Log every attempt
    INSERT INTO LoginAudit(UserID, AttemptTime)
    SELECT UserID, GETDATE() FROM INSERTED;

    DECLARE @UserID INT;

    -- Get UserID from inserted row where status is Failed
    SELECT @UserID = UserID FROM INSERTED WHERE Status = 'Failed';

    -- Check if user exists in UsersLoginStatus
    IF EXISTS (SELECT 1 FROM UsersLoginAccountStatus WHERE UserID = @UserID)
    BEGIN
        -- Count today's failed attempts for this user
        IF (
            SELECT COUNT(*) 
            FROM Logins1 
            WHERE UserID = @UserID AND Status = 'Failed' AND CAST(AttemptTime AS DATE) = CAST(GETDATE() AS DATE)) > 3
                BEGIN
                    -- Lock the account
                    UPDATE UsersLoginAccountStatus 
                    SET AccountStatus = 'Locked' 
                    WHERE UserID = @UserID;
	           
                    -- Block the insert
                    ROLLBACK;
                    PRINT 'You have exceeded 3 failed attempts today. Account locked.';
                END
	  END
	       ELSE 		PRINT 'THIS USERID NOT IN THE REGISTER' 
END;


   SELECT * FROM LOGINS1
   SELECT * FROM LOGINAUDIT
   select * from [dbo].UsersLoginAccountStatus


   INSERT INTO LOGINS1 VALUES ()

----------------------------------------------------------------------------------------------------------------------------
--Keep old versions of data.

   SELECT * FROM products
   SELECT * FROM producthistory


   CREATE OR ALTER TRIGGER TR_ForPriceUpdateTBLHistory
   ON products
   AFTER  update
   AS																									--( 6 )
      INSERT INTO ProductHistory (productid,oldprice,changedate)
	  SELECT d.productid,d.price,getdate() FROM deleted d;

update products set price = 400 where name = 'mouse'

----------------------------------------------------------------------------------------------------------------

--Ensure email format is correct.

CREATE or alter TRIGGER TR_ForEmailcharacter
on users
for insert,update 
as 
if exists(select * from inserted where email not like '%@%')
begin
      rollback;
	  print 'invalid email format'
end

insert into users values(104,'john','john@gmail.com','staff')

SELECT * FROM USERS
--------------------------------------------------------------------------------------------------------------------

--Add last modified date automatically.

-------------------------------------------------------------------------------------------
--Mirror changes to another table.

create or alter trigger TR_sync_data
on customers
for insert
as 
insert into customersbackup select * from inserted;


select * from customersbackup
select * from customers

--------------------------------------------------------------------------------------------------------
--Auto-calculate total price.

CREATE TRIGGER trg_CalcTotal
ON OrderDetails
FOR INSERT, UPDATE
AS
UPDATE od
SET od.TotalPrice = i.Quantity * i.UnitPrice
FROM OrderDetails od JOIN INSERTED i ON od.ID = i.ID;

select * from orderdetails
SELECT * FROM ORDERS

-------------------------------------------------------- INSTEAD OF  ---------------------------------------------------
											      --INSERT,UPDATE,DELETE
--Fires instead of the actual DML operation.
--Commonly used on views (because views cannot directly handle inserts/updates/deletes).
--Can also be used on tables to enforce custom rules.

--Normally, you cannot insert directly into a view if the view is based on multiple tables or has computed columns.

ALTER VIEW VW_Orders 
AS
SELECT O.ORDERID,O.CUSTOMERNAME,O.STATUS,oa.oldstatus FROM ORDERS O JOIN Orders_Audit OA ON O.ORDERID = OA.ORDERID 

SELECT * FROM VW_Orders
select * from orders
SELECT * FROM [dbo].[Orders_Audit] 

INSERT INTO VW_Orders VALUES(305,'ben10','Omnitrix','shipped')

create OR ALTER trigger TR_ForUpdateViewTBLinOrder
on VW_Orders
instead of insert
as 
BEGIN
      INSERT INTO ORDERS (ORDERID,CUSTOMERNAME,STATUS)
	  SELECT ORDERID,CUSTOMERNAME,STATUS FROM inserted
END 
----------------------------------------------------------------------------------------------------------------------------
--When you try to INSERT into vw_Orders, SQL Server will not insert into the view 
--(because views don’t store data).
--Instead, the trigger will insert into the Orders table.


CREATE or alter TRIGGER TR_ForInst_Del_UpdtLog
on Employees
after insert,update,delete 
AS
BEGIN
   SET NOCOUNT ON;
	 IF EXISTS(SELECT * FROM inserted WHERE EmpID NOT IN (SELECT EmpID  FROM deleted))
		BEGIN
		   INSERT INTO AUDIT_TABLE(EMP_ID,EMP_NAME,aCTION_TAKEN,ACTIONDATE)
		   SELECT EmpID,Name,'INSERTED',GETDATE() FROM inserted WHERE EmpID NOT IN (SELECT EmpID FROM deleted)
		END
	 IF EXISTS(SELECT * FROM inserted WHERE EMPID IN(SELECT EmpID FROM deleted))
	    BEGIN
	       INSERT INTO AUDIT_TABLE(EMP_ID,EMP_NAME,aCTION_TAKEN,ACTIONDATE)
		   SELECT EmpID,Name,'UPDATED',GETDATE() FROM inserted WHERE EMPID IN(SELECT EmpID FROM deleted)
        END
	 IF EXISTS(SELECT * FROM deleted WHERE EMPID NOT IN(SELECT EmpID FROM inserted))
	    BEGIN
		   INSERT INTO AUDIT_TABLE(EMP_ID,EMP_NAME,aCTION_TAKEN,ACTIONDATE)
		   SELECT EmpID,Name,'DELETED',GETDATE() FROM deleted WHERE EMPID NOT IN(SELECT EmpID FROM inserted)
	    END
 END

 ins

select * from #tempforCheckconditon from Employees where EmpID = 201 

select * from #temp1

create table #temp1 (EmpID int,Name nvarchar(20),Salary decimal(10,2),Role nvarchar(20))

if exists (select empid from #tempforCheckconditon where empid in (select empid from #temp1))
begin
		print 'yes' 
end
else print 'no'

insert into Employees values (20,'Daniel',120000,'Manager&Developer')

----------------------------------------------------------( or )-------------------------------------------------------------------------

drop trigger trg_InstUpdt_dele_Employee
CREATE or alter TRIGGER trg_InstUpdt_dele_Employee
ON Employees
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    -- Handle INSERT
    IF EXISTS (SELECT 1 FROM inserted) AND NOT EXISTS (SELECT 1 FROM deleted)
    BEGIN
        PRINT 'INSERT operation detected';
        SELECT * FROM inserted; -- New rows
    END
    -- Handle DELETE
    IF EXISTS (SELECT 1 FROM deleted) AND NOT EXISTS (SELECT 1 FROM inserted)
    BEGIN
        PRINT 'DELETE operation detected';
        SELECT * FROM deleted; -- Old rows
    END
    -- Handle UPDATE
    IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
    BEGIN
        PRINT 'UPDATE operation detected';
        SELECT * FROM deleted;  -- Old values
        SELECT * FROM inserted; -- New values
    END
END;

insert into Employees values (205,'Daniel',120000,'Manager&Developer')
select * from Employees
delete from Employees where name = 'dinesh'
update Employees set name = 'Dinesh' where EmpID = 205




declare @price decimal(10,2)
    declare CursorForUPPrice cursor for 
    select Price from Products 
open CursorForUPPrice 
	fetch next from CursorForUPPrice into @price
while @@FETCH_STATUS = 0
begin
    update Products set price = price * 0.90 where price = @price
	fetch next from CursorForUPPrice into @price
	print convert(nvarchar(200),'oldPrice :' + convert(nvarchar(20),price) + 'NewPrice :' + convert(nvarchar(20),@price))
end
close CursorForUPPrice
deallocate CursorForUPPrice  


	select  convert(nvarchar(200),'oldPrice :' + convert(nvarchar(20),price) + 'NewPrice :' + convert(nvarchar(20),700)) from Products

select * from ProductHistory
select * from Products






DECLARE @oldPrice DECIMAL(10,2)
DECLARE @newPrice DECIMAL(10,2)

DECLARE CursorForUPPrice CURSOR FOR 
SELECT Price FROM Products

OPEN CursorForUPPrice
FETCH NEXT FROM CursorForUPPrice INTO @oldPrice
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @newPrice = @oldPrice * 0.50

    UPDATE Products 
    SET Price = @newPrice 
    WHERE Price = @oldPrice

    PRINT 'Old Price: ' + CAST(@oldPrice AS NVARCHAR(20)) + ' | New Price: ' + CAST(@newPrice AS NVARCHAR(20))
    FETCH NEXT FROM CursorForUPPrice INTO @oldPrice
END

CLOSE CursorForUPPrice
DEALLOCATE CursorForUPPrice




select distinct salary from Employees order by Salary desc
offset 1 rows
fetch next 1 row only

select distinct top 1 salary from Employees where salary = (select max(salary) from Employees) order by salary desc

select top 1 salary from (select distinct top 1 Salary from Employees order by salary desc) order by salary asc


update employee





----------------------------------------------------use pavi
UPDATE E
SET E.Salary =  10000
FROM Employee E
JOIN Department D ON E.EMP_ID = D.Dep_ID
WHERE D.Dep_Name = 'IT' AND DATEDIFF(YEAR, E.DOJ, GETDATE()) > 3;
 

SELECT * FROM DEPARTMENT
SELECT * FROM Employees WHERE DATEDIFF(YEAR, E.DOJ, GETDATE()) >= 3;
 
 SELECT * from CUSTOMERS 
 select * from [dbo].[Orders]

select o.customername,count(o.orderid)
from orders o
join customers c
on o.customerid=c.customerid
group by o.customerid,o.cu
stomername having count(c.customerid)>2

insert into 

 SELECT * FROM Programmer 

 SELECT COUNT(O.CustomerID), C.CUSTOMERS,C.CUSTOMERNAME FROM Customers S JOIN ORDERS O ON C. 

 select * from 
 create or alter proc details
 @doj date out
 as
 begin
 select name, @doj=doj from programmer where datediff(year,'                                    ',getdate())>2
 end

 

 declare @variable table (id int primary key identity(1,1), Username nvarchar(20), Password nvarchar(20))
insert into @variable (Username)
select username+' '+password from Users
select * from @variable v inner join Users u on  v.id = u.Id
 
insert into @variable values ('Username1','password1')

select  from @variable v inner join Users u on  v.id = u.Id



create table #temp(id int primary key identity(1,1), Username nvarchar(20))
insert into #temp values ('Username1')

select Username,Password
into #temp from Users  where concat(+) -----method
select * from #temp

drop table #temp

create or alter trigger TR_ForCheckThePassLen5
on users
after insert
as
BEGIN

	 if not exists(SELECT * FROM users where len(password) = 10)
	    begin 
			print 'your password length is 10'
		end
	else 
	     print 'below 10' 

END;

insert into Users values('aakash1','aakash@123','aakash@gmail.com',7894568569,getdate())

update Users set Password = 'dinesh123' where username = 'dinesh2'

select * from Users

CREATE TABLE User (
    Id INT IDENTITY(1,1) PRIMARY KEY,    -- Auto-increment unique ID
    Username NVARCHAR(100) NOT NULL,     -- Username of the user
    Password NVARCHAR(256) NOT NULL,     -- Store hashed password (never plain text)
    Mobile NVARCHAR(15) NULL             -- Mobile number
);

delete from Users where  id between 10 and 27

select * from UserLoginAudit

exec SP_RENAME 'UserLoginAudit.USERNAME', 'UserLoginDetails_changes', 'column'

CREATE or alter TRIGGER TR_UsersLoginDetails_Log
ON users 
for insert,delete,update
as
BEGIN
	  DECLARE @ID INT
	  declare @OLDUsername NVARCHAR(20), @NEWUsername NVARCHAR(20)
	  DECLARE @OLDPassword NVARCHAR(20), @NEWPassword NVARCHAR(20)
	  DECLARE @OLDMobile NVARCHAR(20), @NEWMobile NVARCHAR(20)

	  DECLARE @AuditString nvarchar(500)

	  select * into #temptable from inserted

	  if exists (select * from #temptable where id not in (select id from deleted))
			     begin
						set @AuditString = @NEWUsername + 'inserted new record'
				 end

	  while (exists(select id from #temptable))
	  begin
			set @AuditString =''

			select top 1 @ID = id, @NEWUsername= username ,@NEWPassword = password ,@NEWMobile = mobile from  #temptable

			select top 1  @OLDUsername = username, @OLDPassword = password, @OLDMobile = Mobile from deleted where id = @ID

			set @AuditString = ' Employee with id = ' + CAST(@ID as nvarchar(4)) + ' changed '
			  if (@OLDUsername != @NEWUsername)
				 set @AuditString = @AuditString + ' Name From ' + @OLDUsername +' To ' + @NEWUsername
			  if (@OLDPassword != @NEWPassword)
				 set @AuditString = @AuditString + ' Name From ' + convert(nvarchar(20), @OLDPassword) +' To ' + convert(nvarchar(20),@NEWPassword)
		      if (@OLDMobile != @NEWMobile)
				 set @AuditString = @AuditString + ' Name From ' + cast(@OLDMobile as nvarchar(20)) +' To ' + cast(@NEWMobile as nvarchar(20))

			  insert into UserLoginAudit values(@AuditString)
			  Delete from #temptable where id = @ID
			  			  select * from deleted

	  end
END

--FOR INSERT/UPDATE/DELETE TOGETHER    

CREATE OR ALTER TRIGGER TR_EMP_DETAILS_FR_IN_UPP_DEL2
ON users
FOR INSERT,UPDATE,delete
AS
BEGIN
      IF EXISTS(SELECT * FROM INSERTED WHERE id NOT IN (SELECT id FROM DELETED))
	     BEGIN
	         INSERT INTO (EMP_ID,EMP_NAME,ACTION_TAKEN)
	         SELECT EMP_ID,EMP_NAME,'INSERT' FROM INSERTED WHERE EMP_ID NOT IN (SELECT EMP_ID FROM DELETED)
	     END  

	  IF EXISTS (SELECT * FROM INSERTED WHERE EMP_ID IN (SELECT EMP_ID FROM deleted))
	     BEGIN
	        INSERT INTO AUDIT_TABLE(EMP_ID,EMP_NAME,ACTION_TAKEN)
	        SELECT EMP_ID,EMP_NAME,'UPDATE' FROM INSERTED WHERE EMP_ID IN (SELECT EMP_ID FROM DELETED)
	     END

	  IF EXISTS (SELECT * FROM DELETED WHERE EMP_ID NOT IN(SELECT EMP_ID FROM INSERTED))
	     BEGIN
	         INSERT INTO AUDIT_TABLE(EMP_ID,EMP_NAME,ACTION_TAKEN )
	         SELECT EMP_ID,EMP_NAME,'DELETE'  FROM DELETED WHERE EMP_ID NOT IN(SELECT EMP_ID FROM INSERTED)
         END
END
 


 CREATE TRIGGER trg_InstUpdt_dele_Employee
ON Employees
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Handle INSERT
    IF EXISTS (SELECT 1 FROM inserted) AND NOT EXISTS (SELECT 1 FROM deleted)
    BEGIN
        PRINT 'INSERT operation detected';
        SELECT * FROM inserted; -- New rows
    END

    -- Handle DELETE
    IF EXISTS (SELECT 1 FROM deleted) AND NOT EXISTS (SELECT 1 FROM inserted)
    BEGIN
        PRINT 'DELETE operation detected';
        SELECT * FROM deleted; -- Old rows
    END

    -- Handle UPDATE
    IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
    BEGIN
        PRINT 'UPDATE operation detected';
        SELECT * FROM deleted;  -- Old values
        SELECT * FROM inserted; -- New values
    END
END;

----------------------------------------------2nd review questions-----------------------------------------
select * from DEPARTMENT
select * from EMPLOYEE

-- update the salary BY dept finance and exp more than 3years 
UPDATE e SET salary = SALARY + 10000 
FROM EMPLOYEE e INNER HOIN  DEPARTMENT d ON e.DEP_ID = d.DEP_ID                                --( 1 )
WHERE d.DEP_NAME = 'FINANCE' AND DATEdiff(year,doj,getdate()) >=3

select * from orders
select * from [dbo].[Customers]

--Get the coustomer details who more than 100 products prachased in the order table            --( 2 )
SELECT o.CustomerID,COUNT(o.Customerid) 
FROM Customers c join Orders o ON c.CustomerID = o.CustomerID                                  
GROUP BY o.Customerid,o.Customerid HAVING(COUNT(o.Customerid)) >1

--Get the last 4-digit mobile number
SELECT RIGHT(Mobile_Number,4) lastfourdigits FROM Aadhar_details                               --( 3 )





--FOREIGN KEY FOR CREATE BOTH TABLES
ALTER TABLE EMPLOYEE
ADD FOREIGN KEY (DEP_ID) REFERENCES DEPARTMENT(DEP_ID);
--PRIMARY KEY (clustered)
ALTER TABLE DEPARTMENT
ADD PRIMARY KEY (DEP_ID);