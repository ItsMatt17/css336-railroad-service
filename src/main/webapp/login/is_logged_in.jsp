<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Object loggedInUser = session.getAttribute("user");
	 if (loggedInUser == null) {
	     response.sendRedirect("index.jsp");
	     return;
	 }
%>
 