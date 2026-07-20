<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
  

	

	<form>
		<input type="date">
		<select>
			<jsp:include page = "station_options.jsp"  />
		</select>
		<select>
			<jsp:include page = "station_options.jsp" />
		</select>
		<input type="submit" value="Search">		
	</form>