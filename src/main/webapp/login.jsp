<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		try { 
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			
			Statement stmt = con.createStatement();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			String query = "SELECT * FROM User WHERE username = '" + username + "'";
			ResultSet res = stmt.executeQuery(query);
		
			%>
			
		
		<div>
			<%
			// To check if there are any users with such username
			if (!res.isBeforeFirst()){ 
				out.println("No user with that user name could be found!");
		        response.sendRedirect("index.jsp");
		        return;
			}
			
			res.next();
			String expectedPassword = res.getNString("pass");
			if(!expectedPassword.equals(password)) out.println("Incorrect password :( Expected: " + expectedPassword );
			else out.println("YAY you're logged in as: " + username);	
			
		}catch(Exception e) {out.println(e);}
	
			%>
		
		
		</div>			
		
						
		

</body>
</html>