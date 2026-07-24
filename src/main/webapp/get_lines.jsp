<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs336.pkg.Station" %>

<%!
    String sql = "SELECT lname FROM Line";
%>


<%
    List<Map<String, Object>> resp = ApplicationDB.query(sql);
    for(Map<String, Object> res : resp) {
        String line = (String) res.get("lname");
        out.print("<option name='"+ line +"'>" + line + "</option required>");
    }
%>

