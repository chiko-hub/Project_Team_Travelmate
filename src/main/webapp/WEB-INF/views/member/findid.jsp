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
        <h1 style="font-weight: bold; text-align: center">아이디 찾기</h1>
        <form action="findIdProcess" method="post">
            <label>이름</label><br>
            <input type="text" size="44" style="height: 40px;
                        outline: none;border: 1px solid #cccccc;margin-bottom: 5px; " name="name" required><br><br>

            <label>이메일</label><br>
            <input type="text" size="44" style="height: 40px;
                        outline: none;border: 1px solid #cccccc; margin-bottom: 5px;" name="email" required><br><br>

            <button class=btn type="submit" >아이디 찾기</button>
        </form>
    </div>
</div>
</body>
</html>
