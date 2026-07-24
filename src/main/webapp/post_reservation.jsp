<%@ page import="java.util.Map" %>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.cs336.pkg.Discount" %>
<%@ page import="com.cs336.pkg.TicketType" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="login/is_logged_in.jsp" %>

<%!
    String insertReservation = "INSERT INTO Reservation(username, start_time," +
                                "train_id, lname, origin, dest, trip_type, discount, paid) " +
                                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
%>

<a href="dashboard.jsp">Dashboard</a>

<%

    // TODO: I might be able to refactor this into an object and be able serialize / deserialize from json
    String line = request.getParameter("line");
    int trainId = Integer.parseInt(request.getParameter("train-id"));
    String schedDateTime = request.getParameter("line-start-dt");

    String username = (String) loggedInUser;

    int originId = Integer.parseInt(request.getParameter("origin"));
    int destId = Integer.parseInt(request.getParameter("dest"));
    TicketType tripType = TicketType.valueOfOrDefault(request.getParameter("ticket-type"));
    Discount discount = Discount.valueOfOrDefault(request.getParameter("discount"));

    float fare = Float.parseFloat(request.getParameter("fare"));

    fare = (fare * tripType.factor) * (1 - discount.percent);


    int updated = ApplicationDB.insert(insertReservation, username,
                                        schedDateTime, trainId, line,
                                        originId, destId,
                                        tripType.label, discount.label, fare);

    if(updated == 0) out.print("<p> We couldn't insert your data smh </p>");
    else out.print("<p> We actually saved your data! </p>");

%>

