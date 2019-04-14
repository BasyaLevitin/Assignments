# Intro to Databases

Databases allow us to store data persistently in an organized manner. This way our apps won't lose all of their content when we restart the server!

This lesson will cover how databases work at a very general level

## Agenda
1. What is a relational database?
2. What is a database table?
3. Intro to SQL and SQLite
4. What is an ORM?
5. Using MiniRecord

create database testapp;

use testapp;

CREATE TABLE testapp.Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255) 
);

Create table Students (
    ID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

Insert into Students values (1, 'Smith', 'John', 22); 

UPDATE Students
SET FirstName = 'Alfred Schmidt' where ID = 1;

Select * from Students;

Delete From Students where ID=1;
Insert into Persons values (1,'John','Smith','sasdsvhd j','Toronto');

Select * from Persons;


Insert into Persons(PersonID, LastName, FirstName, City) values (2, 'JJ', 'Tom', 'Toronto');

Update Persons set FirstName = 'John' , LastName = 'Smith' where PersonID = 1;

UPDATE Persons
SET FirstName = 'Alfred Schmidt', City= 'Frankfurt';
