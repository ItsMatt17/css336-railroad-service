<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

	
	
	<%!
		enum LoginState { 
			INVALID_USERNAME, 
			INVALID_PASSWORD,
			SUCCESS, 
			ERROR
		}
		
		String query = "SELECT * FROM User WHERE username = ?";
		LoginState loginUser(String username, String password){
			LoginState loginState = null;
			try { 
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				PreparedStatement stmt = con.prepareStatement(query);
				stmt.setString(1, username);
				ResultSet res = stmt.executeQuery();
				
							
					
				// check if there's a user with given username
				if (!res.isBeforeFirst()) loginState = LoginState.INVALID_USERNAME;
				else if(res.next() && !password.equals(res.getNString("pass"))) loginState = LoginState.INVALID_PASSWORD;
				else loginState = LoginState.SUCCESS;
				
			
			
			}catch(Exception e){ 
				loginState = LoginState.ERROR;
			} 
			
			return loginState;
		} 
	%>
	
	
	<%
	
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		LoginState res = loginUser(username, password);
		
		switch (res){ 
			
			case INVALID_USERNAME:
				response.sendRedirect("index.jsp?error=invalid");
				break;
			
			case INVALID_PASSWORD:
				response.sendRedirect("index.jsp?error=invalid");
				break;
			
			case ERROR: 
				response.sendRedirect("index.jsp?error=server");
				break;
			
			case SUCCESS:
				session.setAttribute("user", username);
				response.sendRedirect("dashboard.jsp");
				break;
			
		
		}
		
	
	
	
	%>
	
	