﻿--drop tables--
drop table if exists addresses;
drop table if exists PartsInSystems;
drop table if exists systems;
drop table if exists Parts;
drop table if exists suppliers;
drop table if exists catalog;
drop table if exists astronautsonspacecraft;
drop table if exists engineers;
drop table if exists astronauts;
drop table if exists flightcontroloperators;
drop table if exists people;
drop table if exists spacecraft;


--create people--
CREATE TABLE People (
PID		integer not null,
FirstName	varchar(50),
LastName	varchar(50),
primary key(PID)
);

--create engineers--
CREATE TABLE Engineers(
PID		integer not null references People(PID),
EID		integer not null,
HighestDegree	varchar(50),
BirthDate	date,
FavoriteVideoGame varchar(50),
primary key(PID, EID)
);

--create astronauts--
CREATE TABLE Astronauts(
PID 		integer not null references People(PID),
AID		integer not null,
YearBeganFlying	date,
BirthDate	date,
GolfHandicap	integer,
primary key(PID, AID)
);

--create FlightControlOperators--
CREATE TABLE FlightControlOperators(
PID		integer not null references People(PID),
FCOID		integer not null,
ChairPreference varchar(50),
BirthDate	date,
PreferredDrink	varchar(50),
primary key(PID, FCOID)
); 

--create Spacecraft--
CREATE TABLE Spacecraft(
SpacecraftID	integer not null,
TailNum		integer,
WeightTonsLbs	integer,
FuelType	varchar(15),
CrewCapacity	integer,
primary key(SpacecraftID)
);

--create AstronautsonSpacecraft--
CREATE TABLE AstronautsOnSpacecraft(
PID		integer not null,
AID 		integer not null,
SpacecraftID	integer not null,
primary key(PID, AID, SpacecraftID),
foreign key(PID, AID) references Astronauts(PID, AID),
foreign key(SpacecraftID) references Spacecraft(SpacecraftID)
);

--create Addresses--
CREATE TABLE Addresses(
AddressID	integer not null,
Street		varchar(100),
City		varchar(100),
State		char(2),
Country		varchar(20),
ZipCode		integer,
primary key(AddressID)
);

--create Suppliers--
CREATE TABLE Suppliers(
SuppID		integer not null,
CompanyName	varchar(50),
AddressID	integer not null references Addresses(AddressID),
PaymentTermsUSD integer,
primary key(SuppID)
);

--create Catalog--
CREATE TABLE Catalog(
CatID		integer not null,
CompanyName	varchar(50),
AddressID	integer not null references Addresses(AddressID),
PaymentTermsUSD	integer,
primary key(CatID)
);

--create Systems--
CREATE TABLE Systems(
SysID		integer not null,
Type		varchar(50),
SuppID		integer not null references Suppliers(SuppID),
Description	varchar(200),
primary key(SysID)
);

--Create parts--
CREATE TABLE Parts(
PartID		integer not null,
Type		varchar(50),
CatID		integer not null references Catalog(CatID),
Description	varchar(200),
primary key(PartID)
);

--PartsInSystems--
CREATE TABLE PartsInSystems(
SysID		integer not null references Systems(SysID),
PartID		integer not null references Parts(PartID),
primary key(SysID, PartID)
);


--INSERT--

--Insert into People--
INSERT INTO People(PID, FirstName, LastName)
  VALUES(1, 'Christopher', 'Belmonte');

INSERT INTO People(PID, FirstName, LastName)
  VALUES(2, 'Leonardo', 'Dicaprio');

INSERT INTO People(PID, FirstName, LastName)
  VALUES(3, 'Norman', 'Bates');

INSERT INTO People(PID, FirstName, LastName)
  VALUES(4, 'Patrick', 'Bateman');

INSERT INTO People(PID, FirstName, LastName)
  VALUES(5, 'Jeffrey', 'Dahmer');

INSERT INTO People(PID, FirstName, LastName)
  VALUES(6, 'Theodore', 'Bundy');


--INSERT INTO Engineers--
INSERT INTO Engineers(PID, EID, HighestDegree, BirthDate, FavoriteVideoGame)
  VALUES(3, 1, 'Masters', '1934-4-12', 'Pong');

INSERT INTO Engineers(PID, EID, HighestDegree, BirthDate, FavoriteVideoGame)
  VALUES(4, 2, 'Doctorate', '1962-9-1', 'Portal');  

--INSERT INTO FlightControlOperators--
INSERT INTO FlightControlOperators(PID, FCOID, ChairPreference, BirthDate, PreferredDrink)
  VALUES(5, 1, 'Driver', '1960-6-21', 'Blood');

INSERT INTO FlightControlOperators(PID, FCOID, ChairPreference, BirthDate, PreferredDrink)
  VALUES(6, 2, 'Shotgun', '1946-11-24', 'Newcastle Brown Ale');
  
--INSERT INTO Astronauts--
INSERT INTO Astronauts(PID, AID, YearBeganFlying, BirthDate, GolfHandicap)
  VALUES(1, 1,'1984-1-1', '1994-8-8', 10000);

INSERT INTO Astronauts(PID, AID, YearBeganFlying, BirthDate, GolfHandicap)
  VALUES(2, 2,'2000-1-1', '1974-11-11', -24);

--INSERT INTO Spacecraft--
INSERT INTO Spacecraft(SpacecraftID, TailNum, WeightTonsLbs, FuelType, CrewCapacity)
  VALUES(1, 300, 10, 'Diesel', 2);

--INSERT INTO AstronautsOnSpacecraft--
INSERT INTO AstronautsOnSpacecraft(PID, AID, SpacecraftID)
  VALUES(1, 1, 1);

INSERT INTO AstronautsOnSpacecraft(PID, AID, SpacecraftID)
  VALUES(2, 2, 1);

--INSERT INTO Addresses--
INSERT INTO Addresses(AddressID, Street, City, State, Country, ZipCode)
  VALUES(1, '99 Nine Avenue', 'Hollywood', 'CA', 'United States', 90210);

INSERT INTO Addresses(AddressID, Street, City, State, Country, ZipCode)
  VALUES(2, '1 RichPeople Avenue', 'Hollywood', 'CA', 'United States', 90210);

INSERT INTO Addresses(AddressID, Street, City, State, Country, ZipCode)
  VALUES(3, '2 NorthWest Ave', 'Hollywood', 'CA', 'United States', 90210);

INSERT INTO Addresses(AddressID, Street, City, State, Country, ZipCode)
  VALUES(4, 'Road Runner Drive', 'Hollywood', 'CA', 'United States', 90210);

--INSERT INTO Suppliers--
INSERT INTO Suppliers(SuppID, CompanyName, AddressID, PaymentTermsUSD)
  VALUES(1, 'ChrisnCo.', 1, 1000);

INSERT INTO Suppliers(SuppID, CompanyName, AddressID, PaymentTermsUSD)
  VALUES(2, 'JayZ&Baby Blue', 2, 9696);

--INSERT INTO Catalog--
INSERT INTO Catalog(CatID, CompanyName, AddressID, PaymentTermsUSD)
  VALUES(1, 'KimYe Catalog Co.', 3, 40);

INSERT INTO Catalog(CatID, CompanyName, AddressID, PaymentTermsUSD)
  VALUES(2, 'ACME Co.', 4, 2);

--INSERT INTO Systems--
INSERT INTO Systems(SysID, Type, SuppID, Description)
  VALUES(1, 'Engine', 1, 'It does engine things');

INSERT INTO Systems(SysID, Type, SuppID, Description)
  VALUES(2, 'Navigation', 2, 'It''s gonna send us to Mars!');

--INSERT INTO Parts--
INSERT INTO Parts(PartID, Type, CatID, Description)
  VALUES(1, 'Lil Doohickey', 1, 'What''s this piece for again?');

INSERT INTO Parts(PartID, Type, CatID, Description)
  VALUES(2, 'Big Doohickey', 2, 'Not sure what this does either.');

--INSERT INTO PartsInSystems--
INSERT INTO PartsInSystems(SysID, PartID)
  VALUES(1, 1);

INSERT INTO PartsInSystems(SysID, PartID)
  VALUES(2, 2);
