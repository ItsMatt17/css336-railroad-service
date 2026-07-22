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

        <form method="POST" action="login/logout.jsp">
            <input type="submit" value="Log out">
        </form>

		<%@ include file = "schedule_form.jsp"  %>
        
        
    </main>
</body>
</html>