<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
    session.invalidate();
    // SUPER WARNING: If I include this file within another jsp it is relative to the main file
    // So this works only if it's in the same directory, maybe I can do no relative path or smth
    response.sendRedirect("../index.jsp");
%>