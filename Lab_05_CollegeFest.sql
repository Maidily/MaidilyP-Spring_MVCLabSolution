-- Create database
CREATE DATABASE IF NOT EXISTS CollegeFest;
USE CollegeFest;

-- Create table
CREATE TABLE IF NOT EXISTS STUDENT (
STUDENT_ID int primary key auto_increment, 
NAME varchar(100), 
DEPARTMENT varchar(50), 
COUNTRY varchar(50)
);

-- Insert into tables
insert into STUDENT (STUDENT_ID, NAME, DEPARTMENT, COUNTRY) values(1, 'Suresh', 'B.Tech', 'India'); 
insert into STUDENT (STUDENT_ID, NAME, DEPARTMENT, COUNTRY) values(2, 'Muri', 'B.Arch', 'Canada'); 
insert into STUDENT (STUDENT_ID, NAME, DEPARTMENT, COUNTRY) values(3, 'Daniel', 'B.Tech', 'New Zealand'); 
insert into STUDENT (STUDENT_ID, NAME, DEPARTMENT, COUNTRY) values(4, 'Tanya', 'B.Com', 'USA'); 

-- select query :: testing
select * from STUDENT;
