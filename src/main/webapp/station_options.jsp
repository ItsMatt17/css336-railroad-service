<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
  
  
 <% 
	String sql = "SELECT id, sname FROM Station";
	try (
		Connection conn = ApplicationDB.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet resp = stmt.executeQuery();
	){ 
	while(resp.next()){
		String sname = resp.getString("sname");
		int id  = resp.getInt("id");
		out.print("<option value=" + id + ">" + sname +  "</option>");
	}

	}catch (Exception ex){ 
	     application.log("Database error while logging in.", ex);
	     out.print("<p> An error occurred: " + ex);
}

%>
