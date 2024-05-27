<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>

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
            out.print("exists");

        } else {

             String insertQuery = "INSERT INTO users (username, password) VALUES (?, ?)";
             PreparedStatement insertStmt = con.prepareStatement(insertQuery);
             insertStmt.setString(1, username);
             insertStmt.setString(2, userPassword);
             insertStmt.executeUpdate();

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
