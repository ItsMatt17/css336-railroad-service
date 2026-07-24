<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
%>
<%--<%@ include file ="login/is_logged_in.jsp"%>--%>

<%!
    String reservations =
            "SELECT R.id, " +
                    "lname, " +
                    "creation, " +
                    "start_time, " +
                    "trip_type, " +
                    "discount, " +
                    "paid, " +
                    "O.sname org_station, " +
                    "D.sname dest_station " +
                    "FROM Reservation R " +
            "JOIN Station O ON R.origin = O.id " +
            "JOIN Station D ON R.dest = D.id " +
            "JOIN Line L USING(lname) " +
            "WHERE R.username = ?";

%>

<% List<Map<String, Object>> res = ApplicationDB.query(reservations, session.getAttribute("user")); %>

<%
    if (res.isEmpty()) {
        out.print("<p> You don't have any reservations in our system! </p>");
        return;
    }
%>

<div style="display:flex; flex: 1; gap:.5rem; ">
    <%
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:mm a MM/dd/yyyy");
        for (Map<String, Object> r : res) {
            r.keySet().forEach(k -> System.out.println(k));
            String line = (String) r.getOrDefault("lname", "None");
            int id = (int) r.getOrDefault("id", -1);
            String org_station_name = (String) r.getOrDefault("org_station", "Unknown");
            String dest_station_name = (String) r.get("dest_station");
            LocalDateTime creation = (LocalDateTime) r.get("creation");


    %>

    <div style="background-color:oklch(80.9% 0.105 251.813);">
        <p>id: <%= id  %></p>
        <p>created: <%= creation.format(formatter)  %></p>
        <p>Line: <%= line  %> </p>
        <p>Origin ID: <%= org_station_name %></p>
        <p>Dest ID: <%= dest_station_name %></p>
    </div>

    <%}%>

</div>

