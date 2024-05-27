<%--
  Created by IntelliJ IDEA.
  User: jnd
  Date: 2024/5/8
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f0f0;
      padding: 20px;
    }
    .register-container {
      width: 300px;
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #f9f9f9;
    }
    .register-container h2 {
      text-align: center;
      color: #333;
    }
    .register-container input[type="text"],
    .register-container input[type="password"],
    .register-container input[type="button"] {
      width: 100%;
      margin-bottom: 10px;
      padding: 8px;
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 3px;
    }
    .register-container input[type="button"] {
      background-color: green;
      color: white;
      cursor: pointer;
    }
    .register-container input[type="button"]:hover {
      background-color: darkgreen;
    }
    #register-button {
      background-color: #36b0c9;
      color: white;
      cursor: pointer;
    }

    #register-button:hover {
      background-color: #2e8fa4;
    }
  </style>
  <script>
    function on_submit(){
      var username = document.getElementById("username").value;
      var password = document.getElementById("password").value;

      // 使用 AJAX 将用户名发送到服务器端
      var xhr = new XMLHttpRequest();
      xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
          var parser = new DOMParser();
          var htmlDoc = parser.parseFromString(xhr.responseText, 'text/html');
          var response = htmlDoc.body.textContent.trim();
          if (response == "success") {
            window.location.href = "message.jsp"
          } else if(response == "error_p"){
            alert("密码错误请重试！");
          }
            else {
            alert("用户名不存在，请先注册！");
          }
        }
      };
      xhr.open("POST", "checkUsernameAndPassword.jsp", true);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      xhr.send("username=" + username + "&password=" + password);
    }
  </script>
  <script>
    function to_register(){
      window.location.href = "register.jsp"
    }
  </script>
</head>
<body>
<div class="register-container">
  <h2>登录</h2>
  <form  method="post">
    <label for="username">用户名:</label>
    <input type="text" id="username" name="username" required>
    <label for="password">密码:</label>
    <input type="password" id="password" name="password" required>
    <input type="button" value="登录" onclick="return on_submit()">
    <input type="button" value="注册" onclick="return to_register()" id="register-button">
  </form>
</div>
</body>
</html>
