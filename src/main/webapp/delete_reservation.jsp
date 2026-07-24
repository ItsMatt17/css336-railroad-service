<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!

  // Username is there to make sure other ppl don't delete random reservations
  String sql = "DELETE FROM Reservation " +
          "WHERE id = ? AND username = ?";
%>

<a href="dashboard.jsp">Dashboard</a>

<%
  String user = (String) session.getAttribute("user");
  if(user == null){
    response.sendRedirect("index.jsp");
    return;
  }

  String id = request.getParameter("id");
  if (id == null){
    out.print("<p> No id was passed </p>");
    return;
  }

  int ok = ApplicationDB.update(sql, Integer.parseInt(id), user);

  if (ok == 0 ){
    out.print("<p> Seems we couldn't delete your reservation </p>");
    return;
  }

  out.print("<p> We deleted your reservation! </p>");



%>