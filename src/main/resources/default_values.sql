use Project;

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


INSERT INTO Station(id, sname, city, state) 
VALUES 
	(1, "Red Bank Station", "Red Bank", "NJ"), 
	(2, "NY Penn", "New York City", "NY"),
    (3, "Rahway Station", "Rahway", "NJ"),
    (4, "Linden Station", "Linden", "NJ"), 
    (5, "Elizabeth Station", "Elizabeth", "NJ"), 
    (6, "Newark Airport", "Newark", "NJ");
    
    
INSERT INTO Train(id, capacity)
VALUES
    (2, 200), 
    (3, 100);
    
INSERT INTO Line(lname, fare, duration_mins, origin, dest)
VALUES
	("NE Corridor", 3.25, 50, 3, 2),
	("North Jersey Coast line", 3.25, 50, 3, 2);

    
    
    
INSERT INTO LineStop(line, stop_num, station) 
VALUES
	("NE Corridor", 0, 3), 
	("NE Corridor", 1, 4),
	("NE Corridor", 2, 5),
	("NE Corridor", 3, 6),
	("NE Corridor", 4, 2);

INSERT INTO TrainSchedule(start_time, train_id, line)
VALUES 
	("6:30:00", 1, "NE Corridor")


    