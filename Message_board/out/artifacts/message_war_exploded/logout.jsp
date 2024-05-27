<%--
  Created by IntelliJ IDEA.
  User: jnd
  Date: 2024/5/15
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
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
