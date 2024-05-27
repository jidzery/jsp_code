
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>logout</title>
</head>
<body>
<%
    session.removeAttribute("username");
    out.print("success");
%>
</body>
</html>
