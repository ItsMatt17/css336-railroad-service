<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!

    String sql = "SELECT YEAR(creation) year, MONTH(creation) month, " +
            "sum(paid) revenue FROM Reservation " +
            "GROUP BY YEAR(creation), MONTH(creation) " +
            "ORDER BY year desc, month desc";
%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="../dashboard.jsp">Dashboard</a>
<a href="../admin.jsp">Admin Panel</a>

<div style="border: solid;">
    <h3>Monthly Sales Reports</h3>
    <%
        List<Map<String, Object>> res = ApplicationDB.query(sql);
        if (res.isEmpty()) {
            out.print("<p> There seems to be no sales at all </p>");
            return;
        }

        for (Map<String, Object> r : res) {
            float revenue = (float) r.getOrDefault("revenue", 0F);
            // This requires long bc of my query wrapper and I really don't want to fix it
            long year = (long) r.getOrDefault("year", 0);
            int month = (int) r.getOrDefault("month", 0);

    %>

    <div style="width:fit-content; background-color:oklch(70.4% 0.04 256.788);">
        <p><u>Month</u>: <%= month %>
        </p>
        <p><u>Year</u>: <%= year %>
        </p>
        <p><u>Revenue</u>: $<%= revenue %>
        </p>
    </div>

    <%}%>
</div>


</body>
</html>
