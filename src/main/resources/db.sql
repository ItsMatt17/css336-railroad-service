-- DROP DATABASE Project;
CREATE DATABASE IF NOT EXISTS Project;
use Project;

CREATE TABLE User (
  username varchar(16) NOT NULL,
  pass varchar(25) NOT NULL,
  fname varchar(30) NOT NULL,
  lname varchar(30) NOT NULL,
  permission ENUM('None', 'Rep', 'Admin'),
  PRIMARY KEY(username)
);

CREATE TABLE Employee (
	username varchar(16), 
	ssn char(10) NOT NULL,  
	PRIMARY KEY (username),
	FOREIGN KEY (username) REFERENCES User(username) ON DELETE CASCADE
);

CREATE TABLE Customer (
	username varchar(16), 
	email varchar(50) NOT NULL,
	PRIMARY KEY (username),
	FOREIGN KEY (username) REFERENCES User(username) ON DELETE CASCADE
);


CREATE TABLE Station (
	id int AUTO_INCREMENT, 
	sname varchar(50) NOT NULL, 
	city varchar(50) NOT NULL, 
	state char(2) NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE Train (
	id int, 
    capacity int, 
    PRIMARY KEY (id)
);


/*TODO: 
	1. Station arrival times / dept times based on lines
    2. Customer reservations
    3. 
*/

CREATE TABLE Line (
	lname varchar(50), 
    fare float NOT NULL, 
    duration_mins int NOT NULL, 
    origin int NOT NULL, 
    dest int NOT NULL,
    PRIMARY KEY(lname), 
    FOREIGN KEY (origin) REFERENCES Station(id), 
    FOREIGN KEY (dest) REFERENCES Station(id)
);

CREATE TABLE LineStop(
	line varchar(50), 
    stop_num int, 
    station int NOT NULL, 
    arr_offset_mins int NOT NULL, 
    dept_offset_mins int NOT NULL,
    PRIMARY KEY(line, stop_num),
	FOREIGN KEY (station) REFERENCES Station(id)
);

CREATE TABLE TrainSchedule(
	start_time time, 
    train_id int, 
    line varchar(50), 
	PRIMARY KEY (start_time, train_id, line), 
    FOREIGN KEY (train_id) REFERENCES Train(id), 
    FOREIGN KEY (line) References Line(lname)
);


