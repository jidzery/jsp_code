<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>留言板</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .message-container {
            margin: 20px;
        }
        .message {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
        }
        .message h3 {
            margin-top: 0;
        }
        .message p {
            margin-bottom: 5px;
        }
        .add-message-button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
        }
        /* 搜索表单样式 */
        .search-form {
            margin-bottom: 20px;
        }
        .search-input {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 5px;
            width: 200px;
        }
        .search-button {
            padding: 8px 16px;
            background-color: #4CAF50;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        .logout-button {

            background-color: #4CAF50;
            width: 70px;
            height: 45px;
            border: none;
            color: white;
            border-radius: 5px;
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .search-button:hover {
            background-color: #45a049;
        }
        .message button {
            background-color: #f44336;
            border: none;
            color: white;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin-top: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .message button:hover {
            background-color: #d32f2f;
        }
    </style>
    <script>
        function deleteMessage(messageId){

            // 使用 AJAX 将用户名发送到服务器端
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var parser = new DOMParser();
                    var htmlDoc = parser.parseFromString(xhr.responseText, 'text/html');
                    var response = htmlDoc.body.textContent.trim();
                    if (response == "success") {
                        alert("删除成功！");
                        location.reload();
                    } else {
                        alert("删除失败，您的权限不够！");
                    }
                }
            };
            xhr.open("POST", "deleteMessage.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("messageId=" + messageId);
        }
    </script>
    <script>
        function logout(){

            // 使用 AJAX 将用户名发送到服务器端
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var parser = new DOMParser();
                    var htmlDoc = parser.parseFromString(xhr.responseText, 'text/html');
                    var response = htmlDoc.body.textContent.trim();
                    if (response == "success") {
                        window.location.href = "login.jsp"
                    } else {
                        alert("error！");
                    }
                }
            };
            xhr.open("GET", "logout.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send();
        }
    </script>
</head>
<body>
<h1>留言板</h1>
<button class="logout-button" onclick="return logout()">退出</button>
<!-- 搜索表单 -->
<form class="search-form" method="get" action="">
    <input class="search-input" type="text" name="query" placeholder="搜索...">
    <button class="search-button" type="submit">搜索</button>
</form>


<div class="message-container">
    <%
        // 建立数据库连接
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/message_board", "root", "123456");

            String query = request.getParameter("query");
            String sqlQuery = "SELECT * FROM messages";
            if (query != null && !query.isEmpty()) {
                sqlQuery += " WHERE subject LIKE ? OR writer LIKE ? OR content LIKE ?";
            }
            sqlQuery += " ORDER BY time DESC";

            stmt = conn.prepareStatement(sqlQuery);
            if (query != null && !query.isEmpty()) {
                for (int i = 1; i <= 3; i++) {
                    stmt.setString(i, "%" + query + "%");
                }
            }

            rs = stmt.executeQuery();

            // 遍历结果集，显示留言
            while(rs.next()) {
                String subject = rs.getString("subject");
                String name = rs.getString("writer");
                String email = rs.getString("email");
                Timestamp time = rs.getTimestamp("time");
                String content = rs.getString("content");
                Integer messageId = rs.getInt("id");
    %>
    <div class="message">
        <input type="hidden" id="messageId" value="<%= messageId %>">
        <h3><%= subject %></h3>
        <p>留言人: <%= name %></p>
        <p>Email: <%= email %></p>
        <p>留言时间: <%= time %></p>
        <p>留言内容: <%= content %></p>
        <button onclick="deleteMessage('<%= messageId %>')">删除留言</button>
    </div>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</div>
<button class="add-message-button" onclick="window.location.href='addMessage.jsp'">添加留言</button>
</body>
</html>