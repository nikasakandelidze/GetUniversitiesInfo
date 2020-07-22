create database if not exists projectK;

use projectK;
set foreign_key_checks = 0;
DROP TABLE IF exists University;
DROP TABLE IF exists University_Subject;
DROP TABLE IF exists Faculty;


create table University(
	id int primary key not null auto_increment,
    university_name varchar(100) not null unique,
    city varchar(100) not null,
    address varchar(100) not null,
	web_page_link varchar(100),
	descriptions varchar(255),
	username varchar(45) NOT NULL,
	foreign key(username)
    REFERENCES users (username)
);



create table Faculty (
    faculty_id integer primary key not null auto_increment,
    category varchar(100) not null,
    university_id INT NOT NULL,
    name varchar(255) not null,
    dean_info varchar(500) not null,
    price INT not null,
    description varchar(1000) not null,
    web_page_link varchar(100),
    foreign key(university_id)
    references University(id)
);

CREATE TABLE University_Subject (
	subject_id INT PRIMARY KEY not null auto_increment,
	faculty_id INT NOT NULL,
	subject_name VARCHAR (255) NOT NULL ,
	credits INT,
    descriptions varchar(1000),
    semester INT not null,
    foreign key(faculty_id)
    references Faculty(faculty_id)
);

CREATE  TABLE users (
        username VARCHAR(45) NOT NULL ,
        password VARCHAR(45) NOT NULL ,
        enabled TINYINT NOT NULL DEFAULT 1 ,
        PRIMARY KEY (username)
 );
insert into users values('testUser','password',1);
insert into university values(2,'TSU','Tbilisi','Melikishili','bla.com','good','testUser');
insert into faculty values (1, 'CS', 2, 'Mathematics and Computer science', 'Shota gv',10000,'magaria','axala.ge');
insert into university_subject values (1, 1, 'Calculus I', 6, 'sigua magari kacia', 2);