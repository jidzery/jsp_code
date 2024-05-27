<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
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
  String subject = request.getParameter("subject");
  String email = request.getParameter("email");
  String content = request.getParameter("content");
  String username = (String) session.getAttribute("username");


  String url = "jdbc:mysql://localhost:3306/message_board";
  String user = "root";
  String password = "123456";
  Date currentTime = new Date();

  try {

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, user, password);

    String sql = "INSERT INTO messages (subject,writer,email,time,content) VALUES (?,?,?,?,?)";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1,subject);
    pstmt.setString(2,username);
    pstmt.setString(3,email);
    pstmt.setTimestamp(4, new Timestamp(currentTime.getTime()));
    pstmt.setString(5,content);

    pstmt.executeUpdate();
    out.print("success");
    pstmt.close();
    con.close();
  } catch (Exception e) {
    out.print("error");
    e.printStackTrace();
  }
%>
</body>
</html>
