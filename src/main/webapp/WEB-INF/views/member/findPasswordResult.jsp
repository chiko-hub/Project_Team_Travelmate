<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/login.css">
</head>
<body>
<div class="container">
    <div class="loginbox">
        <div class="logo" style="text-align: center">
            <img src="images/GetSetGOnotext.png">
        </div>
        <h2 style="font-weight: bold; text-align: center">귀하의 비밀번호는</h2>
        <input type="text" value="${findPassword}" size="44" style="height: 40px;
                        outline: none;border: 1px solid #cccccc; margin-bottom: 5px;" name="name" readonly/><br><br>
        <a href="loginForm" class="btn" style="display: flex;  width: 320px;
         justify-content: center;  align-items: center;text-decoration: none;" size=40>로그인하러 가기</a>
    </div>
</div>
</body>
</html>
