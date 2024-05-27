<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>添加留言</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .add-message-form {
            margin: 20px;
            width: 50%;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
        }
        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .submit-button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 10px;
            cursor: pointer;
            border-radius: 5px;
        }
        .submit-button:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        function on_submit(){
            var subject = document.getElementById("subject").value;
            var email = document.getElementById("email").value;
            var content = document.getElementById("content").value;

            // 使用 AJAX 将用户名发送到服务器端
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                window.location.href = "message.jsp"
                alert("添加成功！")

                if (xhr.readyState == 4 && xhr.status == 200) {
                    var parser = new DOMParser();
                    var htmlDoc = parser.parseFromString(xhr.responseText, 'text/html');
                    var response = htmlDoc.body.textContent.trim();
                    if (response == "success") {
                        alert("成功！");
                    } else {
                        alert("！");
                        // 可以跳转到登录页面或其他操作
                        window.location.href = ""
                    }
                }
            };
            xhr.open("POST", "insertMessage.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("subject=" + subject + "&email=" + email + "&content=" + content);
        }
    </script>
</head>
<body>
<h1>添加留言</h1>

<div class="add-message-form">
    <form method="post">
        <div class="form-group">
            <label for="subject">主题:</label>
            <input type="text" id="subject" name="subject" required>
        </div>
        <div class="form-group">
            <label for="email">邮箱:</label>
            <input type="text" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="content">内容:</label>
            <textarea id="content" name="content" rows="5" required></textarea>
        </div>
        <button type="submit" class="submit-button" onclick="return on_submit()">提交留言</button>
    </form>
</div>

</body>
</html>