<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
  
<%!
	// Fetches matching lines given an origin and destination
	String line_query = "SELECT O.lname  " +  
						 "FROM LineStop O, LineStop D " + 
						 "WHERE " +
						 	"O.lname = D.lname AND " + 
							"O.station = ? AND "  + 
						    "D.station = ? AND " +
						    "O.stop_num < D.stop_num";


%>



<%@ include file = "login/is_logged_in.jsp"  %>

<%
	try(	
		Connection conn = ApplicationDB.getConnection();
		PreparedStatement stmt = conn.prepareStatement(line_query);
	){
			int origin_id = Integer.parseInt(request.getParameter("origin"));
			int dest_id = Integer.parseInt(request.getParameter("dest"));
			
			stmt.setInt(1, origin_id);
			stmt.setInt(2, dest_id);
			ResultSet res = stmt.executeQuery();
			
			if(!res.next()) response.sendRedirect("dashboard.jsp?error=route_times");
			else {
				String line = res.getString("lname");
				response.sendRedirect("route_times.jsp?line=" + line + "&origin=" + origin_id + "&dest=" + dest_id);
		}
	}catch(Exception ex) {
     	application.log("Database error while logging in.", ex);
		response.sendRedirect("dashboard.jsp?error=route_times");

					
	}

%>





