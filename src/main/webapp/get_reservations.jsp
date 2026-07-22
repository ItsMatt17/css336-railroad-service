<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
%>
<%--<%@ include file ="login/is_logged_in.jsp"%>--%>

<%!
    String reservations = "SELECT * FROM Reservation " +
                          "WHERE username = ? ";

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
    for (Map<String, Object> r : res) {
        String line = (String) r.getOrDefault("lname", "None");
        int trainId = (int) r.getOrDefault("train_id", -1);
        int originId = (int) r.getOrDefault("origin", -1);
        int destId = (int) r.getOrDefault("dest", -1);
        LocalDateTime creation = (LocalDateTime) r.get("creation");
%>

    <div style="background-color:oklch(80.9% 0.105 251.813);">
        <p>creation: <%= creation  %></p>
        <p>Line: <%= line  %></p>
        <p>Train ID: <%= trainId %></p>
        <p>Origin ID: <%= originId %></p>
        <p>Dest ID: <%= destId %></p>
    </div>

<%}%>

</div>

