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
            "SELECT O.lname, O.arr_offset_mins org_arr, " +
                    "D.arr_offset_mins dest_arr, " +
                    "(D.stop_num - O.stop_num) stops, " +
                    "L.per_stop_fare fare " +
                    "FROM LineStop O, LineStop D " +
                    "JOIN Line L USING(lname)  " +
                    "WHERE O.lname = D.lname " +
                        "AND O.station = ? " +
                        "AND D.station = ? " +
                        "AND O.stop_num < D.stop_num";

    String routeTimes = "SELECT T.lname, T.train_id, T.start_time, " +
            "DATE_ADD(T.start_time, INTERVAL L.org_arr MINUTE)  org_arr, " +
            "DATE_ADD(T.start_time, INTERVAL L.dest_arr MINUTE) dest_arr, " +
            "L.stops stops, L.fare " +
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
    for(int i = 0; i < res.size(); i++){
        Map<String, Object> r = res.get(i);
        // These all can uniquely identify a train schedule
        int trainId = (int) r.get("train_id");
        String line = (String) r.get("lname");
        long stops = (long) r.get("stops");
        float fare =  (float) r.get("fare");

        LocalDateTime lineStartTime = (LocalDateTime) r.get("start_time");
        LocalDateTime arrTime = (LocalDateTime) r.get("org_arr");
        LocalDateTime destTime = (LocalDateTime) r.get("dest_arr");
%>
    <form method="post" id=<%= i %> action="post_reservation.jsp" style="background-color:oklch(80.9% 0.105 251.813);">
        <h1>Line: <%= line %></h1>
        <p>Arr Time: <%= arrTime.format(formatter) %></p>
        <p>Dest Time: <%= destTime.format(formatter) %></p>
        <p>Stops From Org to Dest: <%= stops %></p>
        <p>Fare Per Stop: <%= fare %></p>
        <p >Cost: $<span id="cost-<%= i %>"><%= fare * stops %></span></p>

        <input type="hidden" name="origin" value="<%= originId %>">
        <input type="hidden" name="dest" value="<%= destId %>">
        <input type="hidden" name="line" value="<%= line %>">
        <input type="hidden" name="train-id" value="<%= trainId %>">
        <input type="hidden" name="line-start-dt" value="<%= lineStartTime.toString() %>">
        <input type="hidden" name="fare" value="<%= fare * stops %>">

        <input type="reset" value="Clear">
        <fieldset>
            <%-- TODO: Make this a drop down  --%>
            <legend>Discount</legend>
            <label>
                <input class="discount" type="radio" name="discount" value="<%= Discount.DISABLED.label %>">
                Disability (50%)
            </label>

            <label>
                <input class="discount" type="radio" name="discount" value="<%= Discount.CHILD.label %>">
                Child (25%)
            </label>

            <label for="elderly">
                <input class="discount" type="radio" name="discount" value="<%= Discount.ELDERLY.label %>">
                Elderly (35%)
            </label>
        </fieldset>
        <fieldset>
            <legend>Trip Type</legend>
            <input type="radio" name="ticket-type" id="round" value="<%= TicketType.ROUND_TRIP.label %>" >
            <label for="round">Round Trip</label>

            <input type="radio" name="ticket-type" id="one-way" value="<%= TicketType.ONE_WAY.label %>" checked>
            <label for="one-way">One Way</label>
        </fieldset>
        <input type="submit" value="Register">
    </form>

<%
    }out.print("</div>");
%>


</body>
<script>
    const forms = document.querySelectorAll("form");

    let discMap = {
        "DISABLED": 0.5,
        "CHILD": 0.25,
        "ELDERLY": 0.35,
        "NONE": 0
    }

    let tripTypeMap = {
        "ROUND_TRIP": 2,
        "ONE_WAY": 1
    }

    forms.forEach((form) => form.addEventListener("change", (_) => {
        const cost = form.querySelector("#cost-" + form.id)
        const costBaseField = form.querySelector("input[name=fare]")
        const costBase = parseFloat(costBaseField?.value  ?? 0)

        const activeDiscount = form.querySelector('input[name="discount"]:checked');
        const discountPercent = discMap[activeDiscount?.value ?? "none"] ?? 0;

        const activeTripType = form.querySelector('input[name="ticket-type"]:checked');
        const tripFactor = tripTypeMap[activeTripType?.value ?? "ONE_WAY"]

        let newCost = (costBase * tripFactor) * (1 - discountPercent);
        cost.textContent = String(newCost.toFixed(2))
    }))

    forms.forEach((form) => form.addEventListener("reset", (_) => {
        const cost = form.querySelector("#cost-" + form.id)
        const costBaseField = form.querySelector("input[name=fare]")
        cost.textContent = costBaseField?.value ?? "0.0"


    }))


</script>


</html>