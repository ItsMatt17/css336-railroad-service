<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
  
<%!


	String sql = "SELECT O.lname  " +  
				 "FROM LineStop O, LineStop D " + 
				 "WHERE " +
				 	"O.lname = D.lname AND " + 
					"O.station = ? AND "  + 
				    "D.station = ? AND " +
				    "O.stop_num < D.stop_num";

%>


<% 
	Object loggedInUser = session.getAttribute("user");
	
	 if (loggedInUser == null) {
	     response.sendRedirect("index.jsp");
	     return;
	 }
	 
	 if (!request.getMethod().equals("GET")){ 
	     response.sendRedirect("dashboard.jsp/error=invalid_method");
	     return;
	 }
%>


<%
	try
		(	
		Connection conn = ApplicationDB.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);

		){ 
			int origin_id = Integer.valueOf(request.getParameter("origin"));
			int dest_id = Integer.valueOf(request.getParameter("dest"));
			
			stmt.setInt(1, origin_id);
			stmt.setInt(2, dest_id);
			ResultSet res = stmt.executeQuery();
			if(res.next() == false){
				out.print("<p> There's no route that can get you there :( </p>");
				return;
			}else { 
				
				String line = res.getString("lname");
				out.print("<p> There's a route that can bring you there:  " + line + "</p>");
				
			}
		
		
	}catch(Exception ex) {
		out.print("<p/> Whoops there was an error :( | " + ex + "</p>");
		
	}




%>





