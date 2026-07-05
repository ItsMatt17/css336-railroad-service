<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>	



<% 
	// So users don't access w/o logging in 
	if (session.getAttribute("user") == null){ 
		response.sendRedirect("index.jsp");
	}
%>

<p>Welcome!<p/>
<form method="post" action="logout.jsp">
	<button type="submit">Log out</button>
</form>


</body>
</html>