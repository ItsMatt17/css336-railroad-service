<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isErrorPage="true"
%>
<html>
<head>
    <title>Error Page </title>
</head>
<body>

    <h1>Whoops! There's been an error!</h1>
    <p>Error: <%= exception.getMessage()%></p>
    <div>
        Stacktrace
        <p> <%= exception.fillInStackTrace()%></p>

    </div>
</body>
</html>
