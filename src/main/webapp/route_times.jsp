<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.cs336.pkg.Discount"%>
<%@ page import="com.cs336.pkg.TicketType" %>
<%@ include file="login/is_logged_in.jsp" %>


<%!

    String routes =
            "SELECT O.lname, O.arr_offset_mins org_arr, D.arr_offset_mins dest_arr " +
                    "FROM LineStop O, LineStop D " +
                    "WHERE O.lname = D.lname " +
                        "AND O.station = ? " +
                        "AND D.station = ? " +
                        "AND O.stop_num < D.stop_num";

    String routeTimes = "SELECT T.lname, T.train_id, T.start_time, " +
            "DATE_ADD(T.start_time, INTERVAL L.org_arr MINUTE)  org_arr, " +
            "DATE_ADD(T.start_time, INTERVAL L.dest_arr MINUTE) dest_arr " +
            "FROM (" + routes + ") L " +
            "JOIN TrainSchedule T ON T.lname = L.lname ";

    String dateCondional = "WHERE DATE(T.start_time) = ?";

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
    List<Map<String, Object>> res;
    String date = request.getParameter("date");
    int originId = Integer.parseInt(request.getParameter("origin"));
    int destId = Integer.parseInt(request.getParameter("dest"));

    // There's gotta be a better way bro
    if (date != null && !date.isEmpty()) res = ApplicationDB.query(routeTimes.concat(dateCondional), originId, destId, date);
    else res = ApplicationDB.query(routeTimes, originId, destId);


    if (res.isEmpty()) {
        out.print("<p> Seems that there is no line / schedule that can take you there</p>");
        application.log("Origin: " + originId + " Dest: " + destId);
        return;
    }

        out.print("<div>");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("H:mm MM/dd/yyyy");
        for(Map<String, Object> r : res){
            // These all can uniquely identify a train schedule
            int trainId = (int) r.get("train_id");
            String line = (String) r.get("lname");
            LocalDateTime lineStartTime = (LocalDateTime) r.get("start_time");

            LocalDateTime arrTime = (LocalDateTime) r.get("org_arr");
            LocalDateTime destTime = (LocalDateTime) r.get("dest_arr");


%>
            <form method="post" action="post_reservation.jsp" style="background-color:oklch(80.9% 0.105 251.813);">
                <h1>Line: <%= line %></h1>
                <p>Arr Time: <%= arrTime.format(formatter) %></p>
                <p>Dest Time: <%= destTime.format(formatter) %></p>

                <input type="hidden" name="origin" value="<%= originId %>">
                <input type="hidden" name="dest" value="<%= destId %>">
                <input type="hidden" name="line" value="<%= line %>">
                <input type="hidden" name="train-id" value="<%= trainId %>">
                <input type="hidden" name="line-start-dt" value="<%= lineStartTime.toString() %>">

                <input type="reset" value="Clear">
                <fieldset>
                    <%-- TODO: Make this a drop down  --%>
                    <legend>Discount</legend>
                    <label for="disabled">Disability</label>
                    <input type="radio" name="discount" id="disabled" value="<%= Discount.DISABLED.label %>">

                    <label for="child">Child</label>
                    <input type="radio" name="discount" id="child" value="<%= Discount.CHILD.label %>">

                    <label for="elderly">Elderly</label>
                    <input type="radio" name="discount" id="elderly" value="<%= Discount.ELDERLY.label %>">
                </fieldset>
                <fieldset>
                    <legend>Trip Type</legend>
                    <label for="round">Round Trip</label>
                    <input type="radio" name="ticket-type" id="round" value="<%= TicketType.ROUND_TRIP.label %>" required>

                    <label for="one-way">One Way</label>
                    <input type="radio" name="ticket-type" id="one-way" value="<%= TicketType.ONE_WAY.label %>" required>
                </fieldset>
                <input type="submit" value="Register">
            </form>

<%
    }out.print("</div>");
%>


</body>
</html>