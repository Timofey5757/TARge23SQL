--Loome Db
create database TARge23SQL

-- db valimine
use TARge23SQL

--db kustutamine
drop database TARge23SQL

-- tabeli loomine
create table Gender
(
Id int not null primary key,
Gender nvarchar(10) not null
)

--andmete sisestamine
insert into Gender (Id, Gender)
values (1, 'Male'),
(2, 'Female'),
(3, 'Unknown')

--vaadata taveli sisu
select * from Gender

-- loome uue tabeli
create table Person
(
Id int not null primary key,
Name nvarchar(30),
Email nvarchar(30),
GenderId int,
)

--andmete sisestamine
insert into Person (Id, Name, Email, GenderId) values
(1, 'Superman', 's@s.com', 1),
(2, 'Wonderwoman', 'w@w.com', 2),
(3, 'Batman', 'b@b.com', 1),
(4, 'Aquaman', 'a@a.com', 1),
(5, 'Catwoman', 'c@c.com', 2),
(6, 'Antman', 'ant"ant.com',1),
(7, NULL, NULL, 3)

-- vaadake person tabeli
select * from Person

-- voorvotme uhenduse loomine kahe tabel vahel
alter table Person add constraint tblPerson_GenderId_FK
foreign key (GenderId) references Gender(Id)

-- kui sisestame uue rea andmeid ja ei ole saisestanud GenderId-d
--alla vaartust, siis see automaatselt sisestab selle reale
--vaartuse 3 e unknown
alter table Person
add constraint DF_person_GenderId
default 3 for GenderId

--sisestame andmed
insert into Person (Id, Name, Email, GenderId)
values (8, 'Pokemon', 'p@p.com', 3)

select * from Person

--lisame uue veeru
alter table Person
add Age nvarchar(10)

--lisame nr piirangu vanuse sisestamisel
alter table Person
add constraint CK_Person_Ahe check (Age > 0 and Age < 155)

--sisestame uue rea andmeid
insert into Person (Id, Name, Email, GenderId, Age)
values (10, 'Kalevipoeg', 'k@k.com', 1, 30)


-- muudame koodiga andmeid
update Person
set Age = 50
where Id = 3

select * from Person

--sisestame muutuja City nvarchar(50)
alter table Person
add City nvarchar(50)

--sisesetame City veergu andmeid
update Person
set City = 'Atlantis'
where Id = 

select * from Person

--koik kes elavad Gothami Linnas
select * from Person where City = 'Gotham'
--koik kes ei ela Gothamis
select * from Person where City <> 'Gotham'
--voi
select * from Person where City != 'Gotham'

--naitab teatud vanusega inimesi
select * from Person where Age = 16 or Age = 50 or Age = 18
select * from Person where Age in (50, 18, 16)

--naitab teatud vahemikus olevaid inimesi kaasa arvatud 50 ja 5
select * from Person where Age between 5 and 50


--wildcard e naitab koik g-tahed linnad, eimese tahega algavad linnad
select * from Person where City like 'g%'

--koik emailid kus on @-mark sees
select * from Person where Email like '%@%'

--naitam Emaile kus ei ole @-marki sees
select * from Person where Email not like '%@%'

--naitab kellel on emailis ees ja peale @-marki ainult uks taht
select * from Person where Email like '_@_.com'

--koik kellel nimes ei ole esimene taht w, a, c
select * from Person where name like '[^WAC]%'

--kes elavad gothamin ja NewYorkis
select * from Person where (City = 'Gotham' or City = 'NewYork')

-- koik kes elavad valja toodud linnades ja on vanemad kui 40
select * from Person where (City = 'Gotham' or City = 'NewYork')
and age >= 50

-- kuvab tahestikulise jarjekorras inimesi ja kuvab
select * from Person order by Name
-- kuvab vastupidises jarjestuses
select * from Person order by Name desc

--votab kolm esimest rida
select top 3 * from Person

-- kolm esimest aga tabeli jarjestus on Age ja siis Name
select * from Person 
select top 3 Age, Name from Person

-- naita esimesed 50% tabeli sisust
select top 50 percent * from Person

-- jarjesta vanuse jargi isikut
select * from Person order by cast(Age as int)