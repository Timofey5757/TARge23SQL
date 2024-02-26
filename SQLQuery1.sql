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
(3, 'Batman', 'b@b.com', 3),
(4, 'Aquaman', 'a@a.com', 4),
(5, 'Catwoman', 'c@c.com', 5),
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