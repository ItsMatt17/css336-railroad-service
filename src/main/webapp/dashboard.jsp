
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.servlet.*" %>


<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>


<%@ include file = "login/is_logged_in.jsp"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
</head>

<body>
    <main>
        <p style="color: green;">
            You have been logged in successfully.
        </p>

        <h1>Welcome, <%= loggedInUser %>!</h1>

        <form method="post" action="login/logout.jsp">
            <button type="submit">Log out</button>
        </form>

		<%@ include file = "schedule_form.jsp"  %>
        
        
    </main>
</body>
</html>