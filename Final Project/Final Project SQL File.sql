--drop tables--
drop type if exists Severity CASCADE;
drop type if exists GenderMFO CASCADE;
drop table if exists childrenemergencycontacts CASCADE;
drop table if exists employeesingroups CASCADE;
drop table if exists groupsinactivities CASCADE;
drop table if exists employeesinactivities CASCADE;
drop table if exists employees CASCADE;
drop table if exists parentsofchildren CASCADE;
drop table if exists childreningroups CASCADE;
drop table if exists activities CASCADE;
drop table if exists allergies CASCADE;
drop table if exists specialneeds CASCADE;
drop table if exists emergencycontact CASCADE;
drop table if exists children CASCADE;
drop table if exists parents CASCADE;
drop table if exists people CASCADE;
drop table if exists groups CASCADE;

--create type Gender--
CREATE TYPE GenderMFO as ENUM('M', 'F', 'O');

--create type Severity--
CREATE TYPE Severity as ENUM('Low', 'Medium', 'High', 'Extreme');

--create People--
CREATE TABLE People(
PersonID 	integer not null,
FirstName	varchar(50) not null,
LastName	varchar(50) not null,
Gender		GenderMFO not null,
StreetNum	integer not null,
StreetName	varchar(50) not null,
StreetType	varchar(50) not null,
AddressType	varchar(50) not null,
Town		varchar(50) not null,
PostalArea	integer not null,
PRIMARY KEY(PersonID)
);

--create children--
CREATE TABLE Children(
PersonID	    integer not null references People(PersonID) ON DELETE CASCADE,
OutgoingGradeLevel  varchar(4) not null,
BirthDate	    date not null,
PRIMARY KEY(PersonID)
);

--create Allergies--
CREATE TABLE Allergies(
AllergyName	varchar(20),
PersonID	integer not null references Children(PersonID) ON DELETE CASCADE,
Severity	severity,
PRIMARY KEY(AllergyName, PersonID)
);

--create table specialneeds--
CREATE TABLE SpecialNeeds(
NeedsName	varchar(20),
PersonID	integer not null references Children(PersonID) ON DELETE CASCADE,
Severity	severity,
PRIMARY KEY(NeedsName, PersonID)
);

--create table emergencycontact--
CREATE TABLE EmergencyContact(
PersonID		integer not null references People(PersonID) ON DELETE CASCADE,
PrimaryPhoneNumber	varchar(12),
RelationToChild		varchar(20),
PRIMARY KEY(PersonID)
);

--create Parents--
CREATE TABLE Parents(
PersonID	   integer not null references People(PersonID) ON DELETE CASCADE,
PrimaryPhoneNumber varchar(12),
PRIMARY KEY(PersonID)
); 

--create Employees--
CREATE TABLE Employees(
PersonID		integer not null references People(PersonID) ON DELETE CASCADE,
SSN			integer not null,
SalaryYearlyUSD 	integer not null,
PrimaryPhoneNumber	varchar(12),
BirthDate		date not null,
PRIMARY KEY(PersonID)
);

--create Groups--
CREATE TABLE Groups(
GroupName	    varchar(20) not null,
OutGoingGradeLevel  varchar(4),
PRIMARY KEY(GroupName)
);

--create Activities--
CREATE TABLE Activities(
ActivityName	varchar(20) not null,
Location	varchar(20),
BudgetYearlyUSD	integer,
PRIMARY KEY(ActivityName)
);

--create EmployeesInGroups--
CREATE TABLE EmployeesInGroups(
PersonID	integer not null references Employees(PersonID) ON DELETE CASCADE,
GroupName	varchar(20) not null references Groups(GroupName) ON DELETE CASCADE,
JobTitle	varchar(30),
PRIMARY KEY(PersonID, GroupName)
);

--create EmployessInActivities--
CREATE TABLE EmployeesInActivities(
PersonID	integer not null references Employees(PersonID) ON DELETE CASCADE,
ActivityName	varchar(20) not null references Activities(ActivityName) ON DELETE CASCADE,
JobTitle	varchar(30),
PRIMARY KEY(PersonID, ActivityName)
);

--create GroupsInActivities--
CREATE TABLE GroupsInActivities(
GroupName	varchar(20) not null references Groups(GroupName) ON DELETE CASCADE,
ActivityName	varchar(20) not null references Activities(ActivityName) ON DELETE CASCADE,
TimeInActivity	time not null,
PRIMARY KEY(GroupName, ActivityName, TimeInActivity)
);

--create ChildrenInGroups--
CREATE TABLE ChildrenInGroups(
PersonID	integer not null references Children(PersonID) ON DELETE CASCADE,
GroupName	varchar(20) not null references Groups(GroupName) ON DELETE CASCADE,
PRIMARY KEY(PersonID, GroupName)
);

--create ParentsOfChildren--
CREATE TABLE ParentsofChildren(
ParentID	integer not null references Parents(PersonID) ON DELETE CASCADE,
ChildID		integer not null references Children(PersonID) ON DELETE CASCADE,
PRIMARY KEY(ParentID, ChildID)
);

--create ChildrenEmergencyContact--
CREATE TABLE ChildrenEmergencyContacts(
ContactID	integer not null references EmergencyContact(PersonID) ON DELETE CASCADE,
ChildID		integer not null references Children(PersonID) ON DELETE CASCADE,
PRIMARY KEY(ContactID, ChildID)
);

--insert into People--
INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(1, 'Christopher', 'Belmonte', 'M', 147, 'Rolling Hill', 'Drive', 'Home', 'Morganville', 07751);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(2, 'Ralph', 'Macchio', 'M', 2, 'Karate Kid', 'Street', 'Office', 'Old Bridge', 08857);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(3, 'Justin', 'Bieber', 'F', 80, 'Purple', 'Lane', 'Aparment', 'Freehold', 07728);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(4, 'Thad', 'Castle', 'M', 1, 'Blue Mountain State', 'Avenue', 'Home', 'Freehold', 07728);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(5, 'Pusha', 'T', 'M', 10, 'Rapper', 'Lane', 'Home', 'Morganville', 07751);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(6, 'Killer', 'Mike', 'M', 3, 'Run The Jewels', 'Way', 'Home', 'Old Bridge', 08857);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(7, 'El', 'P', 'M', 4, 'Run The Jewels', 'Way', 'Home', 'Old Bridge', 08857);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(8, 'Hot', 'Rod', 'O', 999, 'Main', 'Street', 'Home', 'Morganville', 07751);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(9, 'Geddy', 'Lee', 'M', 2112, 'Rush', 'Avenue', 'Home', 'Marlboro', 07746);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(10, 'Sonny', 'Moore', 'M', 2, 'OWSLA', 'Lane', 'Home', 'Marlboro', 07746);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(11, 'Joel', 'Zimmerman', 'M', 80, 'Mau5', 'Lane', 'Home', 'Morganville', 07751);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(12, 'Thomas', 'Bangalter', 'M', 10, 'Daft Punk', 'Road', 'Office', 'Old Bridge', 08857);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(13, 'Guy', 'De Homem-Christo', 'M', 11, 'Daft Punk', 'Road', 'Office', 'Old Bridge', 08857);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(14, 'Abraham', 'Lincoln', 'M', 44, 'White House', 'Way', 'Home', 'Freehold', 07728);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(15, 'Ulysses', 'Grant', 'M', 10, 'Union', 'Lane', 'Home', 'Freehold', 07728);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(16, 'CharDee', 'MacDennis', 'M', 10, 'Philadelphia', 'Street', 'Office', 'Freehold', 07728);
  
INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(17, 'Frank', 'Reynolds', 'M', 10, 'Philadelphia', 'Street', 'Office', 'Freehold', 07728);

INSERT INTO People(PersonID, FirstName, LastName, Gender, StreetNum, StreetName, StreetType,
			AddressType, Town, PostalArea)
  VALUES(18, 'Julie', 'Flabbergasted', 'F', 29, 'Whole Foods', 'Avenue', 'Office', 'Freehold', 07728);
  
   
--insert into children--
INSERT INTO Children(PersonID, OutgoingGradeLevel, BirthDate)
  VALUES (8, 4, '2004-1-1');

INSERT INTO Children(PersonID, OutgoingGradeLevel, BirthDate)
  VALUES (9, 4, '2004-8-8');
  
INSERT INTO Children(PersonID, OutgoingGradeLevel, BirthDate)
  VALUES (10, 2, '2006-12-1');

--insert into allergies--
INSERT INTO Allergies(AllergyName, PersonID, Severity)
  VALUES ('Peanuts', 8, 'Extreme');

INSERT INTO Allergies(AllergyName, PersonID, Severity)
  VALUES ('Penicillin', 10, 'Low');


--insert into specialneeds--
INSERT INTO SpecialNeeds(NeedsName, PersonID, Severity)
  VALUES ('ADHD', 9, 'Medium');

--insert into emergencycontact--
INSERT INTO EmergencyContact(PersonID, PrimaryPhoneNumber, RelationToChild)
  VALUES (18, 5557778888, 'Aunt');

INSERT INTO EmergencyContact(PersonID, PrimaryPhoneNumber, RelationToChild)
  VALUES (17, 8459321801, 'Uncle');

INSERT INTO EmergencyContact(PersonID, PrimaryPhoneNumber, RelationToChild)
  VALUES (16, 3247850191, 'Cousin');

--insert into parents--
INSERT INTO Parents(PersonID, PrimaryPhoneNumber)
  VALUES (5, 1112223333);

INSERT INTO Parents(PersonID, PrimaryPhoneNumber)
  VALUES (6, 4848484848);

INSERT INTO Parents(PersonID, PrimaryPhoneNumber)
  VALUES (7, 8008675309);


--insert into employees--
INSERT INTO Employees(PersonID, SSN, SalaryYearlyUSD, PrimaryPhoneNumber, BirthDate)
  VALUES (1, 125327219, 1100, 7328891010, '1994-8-8');

INSERT INTO Employees(PersonID, SSN, SalaryYearlyUSD, PrimaryPhoneNumber, BirthDate)
  VALUES (2, 801378539, 890, 7321938102, '1992-2-13');

INSERT INTO Employees(PersonID, SSN, SalaryYearlyUSD, PrimaryPhoneNumber, BirthDate)
  VALUES (3, 123456789, 950, 9086121001, '1997-5-21');

INSERT INTO Employees(PersonID, SSN, SalaryYearlyUSD, PrimaryPhoneNumber, BirthDate)
  VALUES (4, 654938223, 1400, 9087432012, '1996-2-29');

INSERT INTO Employees(PersonID, SSN, SalaryYearlyUSD, PrimaryPhoneNumber, BirthDate)
  VALUES (11, 845678901, 2100, 9083190291, '1948-6-12');

INSERT INTO Employees(PersonID, SSN, SalaryYearlyUSD, PrimaryPhoneNumber, BirthDate)
  VALUES (12, 101010101, 8000, 8910391313, '1976-4-10');

INSERT INTO Employees(PersonID, SSN, SalaryYearlyUSD, PrimaryPhoneNumber, BirthDate)
  VALUES (13, 010101010, 8001, 9129029494, '1976-4-11');

INSERT INTO Employees(PersonID, SSN, SalaryYearlyUSD, PrimaryPhoneNumber, BirthDate)
  VALUES (14, 21122112, 4000, 6757381910, '1980-7-28');

INSERT INTO Employees(PersonID, SSN, SalaryYearlyUSD, PrimaryPhoneNumber, BirthDate)
  VALUES (15, 419012764, 3673, 1057381129, '1990-11-30');

--insert into Groups--
INSERT INTO Groups(GroupName, OutgoingGradeLevel)
  VALUES ('Toy Story', '4');

INSERT INTO Groups(GroupName, OutgoingGradeLevel)
  VALUES ('Kung Fu Panda', '2');

INSERT INTO Groups(GroupName, OutgoingGradeLevel)
  VALUES ('High School Musical', 'PreK');


--insert into Activities--
INSERT INTO Activities(ActivityName, Location, BudgetYearlyUSD)
  VALUES ('Art', 'Pavillion', 2000);

INSERT INTO Activities(ActivityName, Location, BudgetYearlyUSD)
  VALUES ('Karate/Dance', 'Pavillion', 5000);

INSERT INTO Activities(ActivityName, Location, BudgetYearlyUSD)
  VALUES ('Music', 'Tree', 1000);

INSERT INTO Activities(ActivityName, Location, BudgetYearlyUSD)
  VALUES ('Playground', 'Playground', 500);

INSERT INTO Activities(ActivityName, Location, BudgetYearlyUSD)
  VALUES ('Swim', 'Pools', 500);

INSERT INTO Activities(ActivityName, Location, BudgetYearlyUSD)
  VALUES ('Snack', 'Tents', 800);

INSERT INTO Activities(ActivityName, Location, BudgetYearlyUSD)
  VALUES ('Sports', 'Grassy Knoll', 1000);

INSERT INTO Activities(ActivityName, Location, BudgetYearlyUSD)
  VALUES ('Lunch', 'Tents', 0);

--insert into EmployeesInGroups--
INSERT INTO EmployeesInGroups(PersonID, GroupName, JobTitle)
  VALUES (1, 'Toy Story', 'Supervisor');

INSERT INTO EmployeesInGroups(PersonID, GroupName, JobTitle)
  VALUES (2, 'Toy Story', 'Counselor');

INSERT INTO EmployeesInGroups(PersonID, GroupName, JobTitle)
  VALUES (3, 'Kung Fu Panda', 'Assistant Supervisor');

INSERT INTO EmployeesInGroups(PersonID, GroupName, JobTitle)
  VALUES (4, 'Kung Fu Panda', 'Counselor');

--insert into EmployeesInActivities--
INSERT INTO EmployeesInActivities(PersonID, ActivityName, JobTitle)
  VALUES (11, 'Art', 'Supervisor');

INSERT INTO EmployeesInActivities(PersonID, ActivityName, JobTitle)
  VALUES (12, 'Karate/Dance', 'Supervisor');

INSERT INTO EmployeesInActivities(PersonID, ActivityName, JobTitle)
  VALUES (13, 'Music', 'Supervisor');

INSERT INTO EmployeesInActivities(PersonID, ActivityName, JobTitle)
  VALUES (14, 'Sports', 'Assistant Supervisor');

INSERT INTO EmployeesInActivities(PersonID, ActivityName, JobTitle)
  VALUES (15, 'Sports', 'Supervisor');

--insert into groupsinactivities--
INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Toy Story', 'Playground', '11:00:00');

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Toy Story', 'Swim', '11:30:00');

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Toy Story', 'Music', '11:30:00');

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Toy Story', 'Lunch', '12:00:00');

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Toy Story', 'Music', '12:30:00');

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Toy Story', 'Sports', '13:00:00');

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Toy Story', 'Art', '13:30:00');

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Toy Story', 'Karate/Dance', '14:00:00');  

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Toy Story', 'Snack', '14:30:00');  

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Toy Story', 'Swim', '15:00:00');  

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Kung Fu Panda', 'Playground', '11:00:00');  

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Kung Fu Panda', 'Swim', '11:30:00');  

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Kung Fu Panda', 'Lunch', '12:00:00'); 

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Kung Fu Panda', 'Sports', '12:30:00');  

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Kung Fu Panda', 'Art', '13:00:00');  

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Kung Fu Panda', 'Karate/Dance', '13:30:00');  

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Kung Fu Panda', 'Snack', '14:00:00');  

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Kung Fu Panda', 'Swim', '14:30:00'); 

INSERT INTO GroupsInActivities(GroupName, ActivityName, TimeInActivity)
  VALUES ('Kung Fu Panda', 'Music', '15:00:00'); 

--insert into childreningroups--
INSERT INTO ChildrenInGroups(PersonID, GroupName)
  VALUES (8, 'Toy Story');

INSERT INTO ChildrenInGroups(PersonID, GroupName)
  VALUES (9, 'Toy Story');

INSERT INTO ChildrenInGroups(PersonID, GroupName)
  VALUES (10, 'Kung Fu Panda');


--insert into parentsofchildren--
INSERT INTO ParentsOfChildren(ParentID, ChildID)
  VALUES (5, 8);

INSERT INTO ParentsOfChildren(ParentID, ChildID)
  VALUES (6, 9);

INSERT INTO ParentsOfChildren(ParentID, ChildID)
  VALUES (7, 10);

--insert into childrenemergencycontacts--
INSERT INTO ChildrenEmergencyContacts(ContactID, ChildID)
  VALUES (16, 8);

INSERT INTO ChildrenEmergencyContacts(ContactID, ChildID)
  VALUES (17, 9);

INSERT INTO ChildrenEmergencyContacts(ContactID, ChildID)
  VALUES (18, 10);


--create views--
CREATE OR REPLACE VIEW ToyStorySchedule AS
SELECT GroupName, ActivityName, TimeInActivity
FROM GroupsInActivities
WHERE GroupName = 'Toy Story'
ORDER BY TimeInActivity;

CREATE OR REPLACE VIEW EmployeesNamesInGroups AS 
SELECT DISTINCT p.FirstName, p.LastName, ge.GroupName
FROM People p,
     EmployeesInGroups ge
WHERE p.PersonID = ge.PersonID
ORDER BY ge.GroupName; 

CREATE OR REPLACE VIEW EmployeesOfSpecialNeeds AS
SELECT p.FirstName, p.LastName
FROM People p
WHERE PersonID in (SELECT PersonID
		   FROM Employees
		   WHERE PersonID in (SELECT PersonID
				      FROM EmployeesInGroups
				      WHERE GroupName in (SELECT GroupName
						          FROM ChildrenInGroups
						          WHERE PersonID in (SELECT PersonID
									     FROM Children
									     WHERE PersonID in (SELECT PersonID
												FROM SpecialNeeds)
									     )
							  )
				      )
);
												
							  
--Reports / Queries--

--Emergency Contacts--
--with his ID--
SELECT distinct p.FirstName, p.LastName, ec.PrimaryPhoneNumber
FROM People p, EmergencyContact ec
WHERE p.PersonID in (SELECT PersonID
		     FROM EmergencyContact
		     WHERE PersonID in (SELECT ContactID
					FROM ChildrenEmergencyContacts
					WHERE ChildID = '9'))
AND p.PersonID = ec.PersonID;

--with his name--
SELECT p.FirstName, p.LastName, ec.PrimaryPhoneNumber
FROM People p, EmergencyContact ec
WHERE p.PersonID in (SELECT PersonID
		     FROM EmergencyContact
		     WHERE PersonID in (SELECT ContactID
					FROM ChildrenEmergencyContacts
					WHERE ChildID in (SELECT PersonID
							  FROM Children
							  WHERE PersonID in (SELECT PersonID
									     FROM People
									     WHERE FirstName = 'Geddy'
									     AND LastName = 'Lee'))))
AND p.PersonID = ec.PersonID;
							  

--Parents of a Specific Child--
SELECT distinct p.FirstName, p.LastName
FROM People p, Parents pa
WHERE p.PersonID in (SELECT PersonID
		     FROM Parents
		     WHERE PersonID in (SELECT ParentID
					FROM ParentsOfChildren
					WHERE ChildID in (SELECT PersonID
							  FROM Children
							  WHERE PersonID = 9)
					)
		   );
							  
SELECT p.FirstName, p.LastName
FROM People p
WHERE p.PersonID in (SELECT PersonID
		     FROM Parents
		     WHERE PersonID in (SELECT ParentID
					FROM ParentsOfChildren
					WHERE ChildID in (SELECT PersonID
							  FROM Children
							  WHERE PersonID in (SELECT PersonID
									     FROM People p
									     WHERE p.FirstName = 'Geddy'
									     AND p.LastName = 'Lee')
							  )
					)
		    );

--salary of an employee of a specific activity who makes over $1000--									     
SELECT p.FirstName, p.LastName, e.SalaryYearlyUSD
FROM People p, Employees e, EmployeesInActivities ea
WHERE p.PersonID = e.PersonID
AND ea.PersonID = e.PersonID
AND e.SalaryYearlyUSD > 1000
AND ea.ActivityName = 'Art';


									    
--Stored Procedures--

--Find what groups are where--
CREATE OR REPLACE FUNCTION FindGroupsAtTime(time, REFCURSOR)
RETURNS REFCURSOR AS $$
declare
   input_time        time	:= $1;
   current_activity  REFCURSOR  := $2;
BEGIN
   open current_activity for
      SELECT GroupName, ActivityName
      FROM GroupsInActivities
      WHERE timeinactivity = input_time;
   RETURN current_activity;
END; 
$$
LANGUAGE PLPGSQL;

select FindGroupsAtTime('13:00:00', 'results');
fetch all from results;

--Creates a trigger to set beginner salary--
CREATE OR REPLACE FUNCTION SetBeginnerSalary()
RETURNS TRIGGER AS $$
BEGIN
   IF (SalaryYearlyUSD < 850)
   FROM Employees
   WHERE SalaryYearlyUSD < 850
   THEN
   UPDATE Employees 
   SET SalaryYearlyUSD = 850
   WHERE SalaryYearlyUSD < 850;
   End if;
   Return new;
END
$$
LANGUAGE PLPGSQL; 


--Triggers--

--Trigger for Stored Procedure SetBeginnerSalary()--
CREATE TRIGGER SalaryFix
AFTER INSERT OR UPDATE
ON Employees
FOR EACH ROW EXECUTE
PROCEDURE SetBeginnerSalary();


--Create Security Measures--
drop role admin;
CREATE ROLE admin;
GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA PUBLIC
TO admin;

drop role manager;
CREATE ROLE manager;
GRANT SELECT, INSERT, UPDATE
ON ALL TABLES IN SCHEMA PUBLIC
TO manager;

drop role employee;
CREATE ROLE employee;
GRANT SELECT
ON ALL TABLES IN SCHEMA PUBLIC
TO employee;