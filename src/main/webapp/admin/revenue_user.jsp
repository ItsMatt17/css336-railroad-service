<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
  String sql = "SELECT sum(R.paid) revenue, count(*) n FROM Reservation R  " +
          "WHERE R.username = ? " +
          "HAVING count(*) > 0";
%>
<html>
<head>
    <title>User's Revenue</title>
</head>
<body>
  <a href="../dashboard.jsp">Dashboard</a>
  <a href="../admin.jsp">Admin Panel</a>
  <%
    String username = request.getParameter("username");
    if(username == null){
      out.print("<p> No user was passed</p>");
      return;
    }

    List<Map<String, Object>> resp = ApplicationDB.query(sql, username);
    if(resp.isEmpty() || resp.getFirst().isEmpty()){
      out.print("<p> No user `" + username + "` was found or they have no purchases!</p>");
      return;
    }

    Map<String, Object> res = resp.getFirst();
    float revenue = (float) res.get("revenue");
    long reservations =  (long) res.get("n");
  %>

  <div style="width:fit-content; background-color:oklch(70.4% 0.04 256.788);">
    <p>Total Revenue: $<%= revenue %></p>
    <p>Reservations: <%= reservations %></p>
  </div>


</body>
</html>
