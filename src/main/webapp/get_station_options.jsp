<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs336.pkg.Station" %>


<%
	//TODO: Implement error pages instead of try catches
	List<Station> stations = ApplicationDB.getStations();
	for(Station resp : stations){
		out.print("<option value=" + resp.id() + ">" + resp.name() +  "</option>");
	}

%>
