<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%--
  Created by IntelliJ IDEA.
  User: jnd
  Date: 2024/5/8
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>check</title>
</head>
<body>
<%
  String username = request.getParameter("username");
  String userPassword = request.getParameter("password");


  String url = "jdbc:mysql://localhost:3306/message_board";
  String user = "root";
  String password = "123456";

  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, user, password);

    String query = "SELECT * FROM users WHERE username = ?";
    PreparedStatement pstmt = con.prepareStatement(query);
    pstmt.setString(1, username);

    ResultSet rs = pstmt.executeQuery();

    if (rs.next()) {
      if(rs.getString("password").equals(userPassword)) {
        session.setAttribute("username", username);
        out.print("success");
      }
      else out.print("error_p");
    } else {
      // 用户名不存在，可以进行注册操作
      out.print("not_exists");
    }
    rs.close();
    pstmt.close();
    con.close();
  } catch (Exception e) {
    out.print("error");
    e.printStackTrace();
  }
%>
</body>
</html>
