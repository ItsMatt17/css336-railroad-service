<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>


<%
	String sql = "SELECT id, sname FROM Station";
	//TODO: Implement error pages instead of try catches
    List<Map<String, Object>> rows = ApplicationDB.query(sql);

	for(Map<String, Object> resp : rows){
		String sname = (String) resp.get("sname");
		int id = (int) resp.get("id");
		out.print("<option value=" + id + ">" + sname +  "</option>");
	}

%>
