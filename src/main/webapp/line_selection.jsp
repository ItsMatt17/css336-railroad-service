<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
  

<%	
	String sql = "SELECT lname FROM Line";
	try (
		Connection conn = ApplicationDB.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet resp = stmt.executeQuery();
	){ 
		
		out.print("<select>");
		while(resp.next()){ 
			String line = resp.getString("lname");
			out.print("<option value=" + "'" + line + "'" + ">" + resp.getString("lname") +  "</option>");

		}
		out.print("</select>");
			
			
	}catch (Exception ex){ 
      application.log("Database error while logging in.", ex);
      out.print("<p> An error occurred: " + ex);
      
	}
%>

