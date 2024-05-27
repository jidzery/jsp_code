<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>delete</title>
</head>
<body>
<%
    String messageId = request.getParameter("messageId");

    String url = "jdbc:mysql://localhost:3306/message_board";
    String user = "root";
    String password = "123456";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        String query = "DELETE FROM messages WHERE id = ? AND writer = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        String username = (String) session.getAttribute("username");
        pstmt.setString(1, messageId);
        pstmt.setString(2, username);
        int i = pstmt.executeUpdate();
        if(i == 1){
            out.print("success");
        }
        else {
            out.print("error");
        }
        pstmt.close();
        con.close();
    } catch (Exception e) {
        out.print("error");
        e.printStackTrace();
    }
%>
</body>
</html>
