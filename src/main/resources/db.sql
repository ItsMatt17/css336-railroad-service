create database Project;
use Project;

CREATE TABLE User (
  username varchar(16) NOT NULL,
  pass varchar(25) NOT NULL,
  fname varchar(30) NOT NULL,
  lname varchar(30) NOT NULL,
  PRIMARY KEY (username)
) 

CREATE TABLE Employee (
	username varchar(16), 
	ssn char(10) NOT NULL,  
	PRIMARY KEY (username),
	FOREIGN KEY (username) REFERENCES User(username) CASCADE
)

CREATE TABLE Customer (
	username varchar(16), 
	email varchar(50) NOT NULL,
	PRIMARY KEY (username),
	FOREIGN KEY (username) REFERENCES User(username) CASCADE
)


