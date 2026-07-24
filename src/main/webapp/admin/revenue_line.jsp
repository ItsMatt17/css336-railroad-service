<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
    String sql = "SELECT lname, sum(paid) revenue, count(*) n FROM Reservation " +
            "WHERE lname = ?";
%>

<html>
<head>
    <title>Revenue on Line</title>
</head>
<body>

    <a href="../dashboard.jsp">Dashboard</a>
    <a href="../admin.jsp">Admin Panel</a>

<%
    String line = request.getParameter("line");
    if (line == null) {
        out.print("<p>There was no line passed as an argument</p>");
        return;
    }

    List<Map<String, Object>> resp = ApplicationDB.query(sql, line);
    if (resp.isEmpty()){
        out.print("<p> There seems to be no line found with the name " + line + "</p>");
        return;
    }
    Map<String, Object> res = resp.getFirst();
    String lname = (String) res.get("lname");
    float revenue =  (float) res.get("revenue");
    long count = (long) res.get("n");

%>
    <div style="width:fit-content; background-color:oklch(70.4% 0.04 256.788);">
        <p><u>Line</u>: <%= lname %> </p>
        <p><u>Revenue</u>: $<%= revenue %> </p>
        <p><u>count</u>: <%= count %> </p>
    </div>


</body>
</html>
