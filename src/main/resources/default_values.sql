-- DROP DATABASE Project;
use Project;


/* --- Login Data --- */
INSERT INTO User(username, pass, fname, lname, permission)
VALUES 
	("admin", "1234", "test1", "test", "Admin"), 
    ("cust", "1234", "test2", "test", "None"), 
    ("emp", "1234", "test3", "test", "Rep");

INSERT INTO Customer(username, email)
VALUES 
	("cust", "test@gmail.com");
    
INSERT INTO Employee(username, ssn)
VALUES 
	("admin", "123456789"),
	("emp", "123456789");


INSERT INTO Station(sname, city, state) 
VALUES 
	("Trenton", "Trenton", "NJ"), 
	("Hamltion", "Hamilton", "NY"),
    ("Princeton Junction", "Princeton", "NJ"),
    ("New Brunswick Station", "New Brunswick", "NJ"), 
    ("Edison Station", "Edison", "NJ"), 
    ("Metuchen Station", "Metuchen", "NJ"),
	("Metropark Station", "Woodbridge", "NJ"),
	("Rahway Station", "Rahway", "NJ"),
	("Linden Station", "Linden", "NJ"),
	("Elizabeth Station", "Elizabeth", "NJ"),
	("N. Elizabeth Station", "Elizabeth", "NJ"),
	("Newark Libery Airport", "Newark", "NJ"),
	("Newark Penn", "Newark", "NJ"),
	("Secaucus Junciton", "Secacus", "NJ"),
	("Penn Station", "New York City", "NY");
    
INSERT INTO Train(id, capacity)
VALUES
    (2, 200), 
    (3, 100);
    
INSERT INTO Line(lname, fare, duration_mins, origin, dest)
VALUES
	("NE Corridor-NB", 50.25, 93, 1, 14);
    
    
INSERT INTO LineStop(lname, stop_num, station, arr_offset_mins, dept_offset_mins) 
VALUES
	("NE Corridor-NB", 0, 1, 0, 0), 
	("NE Corridor-NB", 1, 2, 5, 5),
	("NE Corridor-NB", 2, 3, 13, 13),
	("NE Corridor-NB", 3, 4, 25, 25),
	("NE Corridor-NB", 4, 5, 30, 30),
	("NE Corridor-NB", 5, 6, 35, 35),
	("NE Corridor-NB", 6, 7, 45, 45),
	("NE Corridor-NB", 7, 8, 50, 50),
	("NE Corridor-NB", 8, 9, 65, 65),
	("NE Corridor-NB", 9, 10, 70, 70),
	("NE Corridor-NB", 10, 11, 73, 73),
	("NE Corridor-NB", 11, 12, 75, 75),
	("NE Corridor-NB", 12, 13, 78, 78),
	("NE Corridor-NB", 13, 14, 93, 93);



INSERT INTO TrainSchedule(start_time, train_id, lname)
VALUES 
	("6:30:00", 2, "NE Corridor-NB")


    