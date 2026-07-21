<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="login/is_logged_in.jsp" %>


<%!
    String route_times = "SELECT T.lname, " +
            "DATE_ADD(T.start_time, INTERVAL L.org_arr MINUTE)  org_arr, " +
            "DATE_ADD(T.start_time, INTERVAL L.dest_arr MINUTE) dest_arr " +
            "FROM (SELECT O.lname, O.arr_offset_mins org_arr, D.arr_offset_mins dest_arr " +
                    "FROM LineStop O, LineStop D " +
                    "WHERE O.lname = D.lname " +
                    "AND O.station = ? " +
                    "AND D.station = ? " +
                    "AND O.stop_num < D.stop_num) L " +
            "JOIN TrainSchedule T ON T.lname = L.lname";
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Route Times</title>
</head>
<body>
    <a href="dashboard.jsp">Return to Dashboard</a>

<%
    int origin_id = Integer.parseInt(request.getParameter("origin"));
    int dest_id = Integer.parseInt(request.getParameter("dest"));
    List<Map<String, Object>> res = ApplicationDB.query(route_times, origin_id, dest_id);



        if (res.isEmpty()) {
            out.print("<p> Seems that there is no line / schedule that can take you there</p>");
            application.log("Origin: " + origin_id + " Dest: " + dest_id);
            return;
        }

        out.print("<div>");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("H:mm MM/dd/yyyy");
        for(Map<String, Object> r : res){
            String line = (String) r.get("lname");
            LocalDateTime arr_time = (LocalDateTime) r.get("org_arr");
            LocalDateTime dest_time = (LocalDateTime) r.get("dest_arr");

%>
            <div style="background-color:green;">
                <h1>Line: <%= line %></h1>
                <p>Arr Time: <%= arr_time.format(formatter) %></p>
                <p>Dest Time: <%= dest_time.format(formatter) %></p>
                <input type="button" value="Register">
            </div>

<%
    }out.print("</div>");
%>


</body>
</html>