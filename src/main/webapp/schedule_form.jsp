<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
  

	

<form method="get" action="route_query.jsp">
	Origin:
	<select name="origin" required>
		<jsp:include page = "station_options.jsp"  />
	</select>
	Destination:
	<select name="dest" required>
		<jsp:include page = "station_options.jsp" />
	</select>
	<input type="submit" value="Search">		
</form>	