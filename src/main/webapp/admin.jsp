<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Admin Panel</title>
</head>
<body style="display:flex; flex-direction: column; gap: 0.5rem;">
    <div style="border: solid 1px;">
        Links:
        <a href="dashboard.jsp">Dashboard</a>
        <a href="admin.jsp">Admin Panel</a>
    </div>
    <div style="border: solid 1px;">
        <a href="admin/monthly_sales.jsp">Monthly Sales</a>
    </div>
    <div style="border: solid 1px;">
        <a href="admin/best_customer.jsp">Best Customer</a>
    </div>
    <div style="border: solid 1px;">
        <a href="admin/top_active_lines.jsp">Top 5 Active Lines</a>
    </div>
    <form style="border: solid 1px;" method="GET" action="admin/revenue_line.jsp">
        <h3>Transit Line Listing</h3>
        <label for="line">Line: </label>
        <select name="line" id="line">
            <jsp:include page = "get_lines.jsp"/>
        </select>
        <input type="submit">
    </form>

    <form style="border: solid 1px;" method="GET" action="admin/revenue_user.jsp">
        <h3>Search Username</h3>
        <label for="username">Username</label>
        <input type="text" name="username" id="username" required>
    </form>

</body>
</html>
