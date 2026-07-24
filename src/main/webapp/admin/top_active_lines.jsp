<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
    String sql = "SELECT lname, count(*) n, sum(paid) paid FROM Reservation " +
            "GROUP BY lname " +
            "ORDER BY count(*) DESC " +
            "LIMIT 5";
%>


<html>
<head>
    <title>Most Active Lines</title>
</head>
<body>
<a href="../dashboard.jsp">Dashboard</a>
<a href="../admin.jsp">Admin Panel</a>
<div style="border:solid">
    <h1>Top 5 Most Active Lines</h1>
    <%
        List<Map<String, Object>> resp = ApplicationDB.query(sql);

        if (resp.isEmpty()) {
            out.print("<p> There's seems to be no active lines </p>");
            return;
        }

        for (Map<String, Object> res : resp) {
            String line = (String) res.get("lname");
            long count = (long) res.get("n");
            float paid = (float) res.get("paid");
    %>
    <div style="width:fit-content; background-color:oklch(70.4% 0.04 256.788);">
        <p><u>Line</u>: <%= line %>
        </p>
        <p><u>Reservations</u>: <%= count %>
        </p>
        <p><u>Revenue</u>: $<%= paid %>
        </p>
    </div>

    <%}%>
</div>

</body>
</html>
