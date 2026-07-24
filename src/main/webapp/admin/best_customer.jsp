<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!

  String sql = "SELECT U.username, SUM(R.paid) paid, count(*) reservations, U.fname, U.lname FROM Reservation R " +
          "JOIN User U USING(username) " +
          "GROUP BY username " +
          "ORDER BY paid DESC " +
          "LIMIT 1";
%>

<html>
<head>
    <title>Best Customer</title>
</head>
<body>
    <a href="../dashboard.jsp">Dashboard</a>
    <a href="../admin.jsp">Admin Panel</a>


    <div style="border: solid;">


        <%
            List<Map<String, Object>> resp = ApplicationDB.query(sql);
            if (resp.isEmpty()){
                out.print("<p> There seems to be no 'best customer</p>'");
                return;
            }

            Map<String, Object> res = resp.getFirst();

            String username = (String) res.get("username");
            float paid = (float) res.get("paid");
            long reservations = (long) res.get("reservations");
            String fname = (String) res.get("fname");
            String lname = (String) res.get("lname");
        %>
        <h1>Best Customer</h1>
        <div>
            <p><u>Username</u>: <%= username %></p>
            <p><u>Paid</u>: $<%= paid %></p>
            <p><u>Reservations</u>: <%= reservations %></p>
            <p><u>Name</u>: <%= fname + " " + lname %></p>
        </div>
    </div>

</body>
</html>
