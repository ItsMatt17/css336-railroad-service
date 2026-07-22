#TODO: Implement query by date
/* Fetches all possible lines matching given route & gets the org/dest times  */


SELECT T.lname,
       DATE_ADD(T.start_time, INTERVAL L.org_arr MINUTE)  org_arr,
       DATE_ADD(T.start_time, INTERVAL L.dest_arr MINUTE) dest_arr
FROM (SELECT O.lname, O.arr_offset_mins org_arr, D.arr_offset_mins dest_arr
      FROM LineStop O,
           LineStop D
      WHERE O.lname = D.lname
        AND O.station = 4
        AND D.station = 13
        AND O.stop_num < D.stop_num) L
         JOIN TrainSchedule T
              ON T.lname = L.lname;

SELECT T.lname, T.train_id, T.start_time,
       DATE_ADD(T.start_time, INTERVAL L.org_arr MINUTE)  org_arr,
       DATE_ADD(T.start_time, INTERVAL L.dest_arr MINUTE) dest_arr
FROM (SELECT O.lname, O.arr_offset_mins org_arr, D.arr_offset_mins dest_arr
      FROM LineStop O,
           LineStop D
      WHERE O.lname = D.lname
        AND O.station = 4
        AND D.station = 13
        AND O.stop_num < D.stop_num) L
JOIN TrainSchedule T
    ON T.lname = L.lname
WHERE DATE(T.start_time) = '2026-07-22';



INSERT INTO Reservation(username, start_time, train_id, lname, origin, dest, trip_type, discount)
VALUES (?, ?, ?, ?, ?, ?, ?, ?)


