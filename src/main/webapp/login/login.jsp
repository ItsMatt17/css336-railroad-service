<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.cs336.pkg.Permission" %>

<%
    // Only process login form submissions.
    if (!"POST".equalsIgnoreCase(request.getMethod())) {
        response.sendRedirect("../index.jsp");
        return;
    }

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username == null || password == null ||
        username.trim().isEmpty() || password.isEmpty()) {

        response.sendRedirect("../index.jsp");
        return;
    }

    String sql =
        "SELECT username, permission FROM `User` " +
        "WHERE username = ? AND pass = ?";

    try (
        Connection connection =
            ApplicationDB.getConnection();

        PreparedStatement statement =
            connection.prepareStatement(sql)
    ) {
        statement.setString(1, username.trim());
        statement.setString(2, password);

        try (ResultSet result = statement.executeQuery()) {
            if (result.next()) {
                System.out.println(result.getString("permission"));
                session.setAttribute(
                    "user",
                    result.getString("username")
                );
                System.out.println(Permission.valueOfOrDefault(result.getString("permission")).toString());
                session.setAttribute(
                        "permission",
                        Permission.valueOfOrDefault(result.getString("permission")).toString()
                );

                response.sendRedirect("../dashboard.jsp");
                return;
            }

            response.sendRedirect("../index.jsp");
            return;
        }

    } catch (Exception e) {
        application.log("Database error while logging in.", e);
        response.sendRedirect("../index.jsp");
        return;
    }
%>