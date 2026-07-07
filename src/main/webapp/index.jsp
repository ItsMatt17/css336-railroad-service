<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
    if (session.getAttribute("user") != null) {
        response.sendRedirect("dashboard.jsp");
        return;
    }

    String error = request.getParameter("error");
    String message = request.getParameter("message");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <style>
        *,
        *::before,
        *::after {
            box-sizing: border-box;
            padding: 0;
            margin: 0;
        }

        :root {
            --primary: oklch(86.9% 0.022 252.894);
            --secondary: oklch(98.4% 0.003 247.858);
            --border-rad: .5rem;
        }

        body {
            min-height: 100vh;
            line-height: 1.3;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: var(--primary);
        }

        .form {
            padding: 1rem;
            background-color: var(--secondary);
            border-radius: var(--border-rad);
            display: grid;
            gap: .825rem;
        }

        .field {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form__submit-container {
            display: flex;
            justify-content: center;
        }

        .error {
            text-align: center;
            padding: 1rem;
            color: oklch(39.6% 0.141 25.723);
            background-color: oklch(80.8% 0.114 19.571);
            border-radius: var(--border-rad);
        }

        .success {
            text-align: center;
            padding: 1rem;
            color: darkgreen;
        }
    </style>
</head>

<body>
    <form method="post" action="login.jsp" class="form">

        <% if ("invalid".equals(error)) { %>
            <div class="error">
                <p>Incorrect username or password.</p>
            </div>
        <% } %>

        <% if ("server".equals(error)) { %>
            <div class="error">
                <p>
                    The database connection failed.
                    Check MySQL and the connection settings.
                </p>
            </div>
        <% } %>

        <% if ("loggedout".equals(message)) { %>
            <div class="success">
                <p>You have been logged out successfully.</p>
            </div>
        <% } %>

        <div class="field">
            <label for="username">Username</label>

            <input
                type="text"
                name="username"
                id="username"
                maxlength="16"
                required>
        </div>

        <div class="field">
            <label for="password">Password</label>

            <input
                type="password"
                name="password"
                id="password"
                maxlength="25"
                required>
        </div>

        <div class="form__submit-container">
            <input type="submit" value="Log in">
        </div>
    </form>
</body>
</html>