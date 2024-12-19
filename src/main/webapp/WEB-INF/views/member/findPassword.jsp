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
        <h1 style="font-weight: bold; text-align: center">비밀번호 찾기</h1>
        <form action="findPasswordProcess" method="post">
            <label>아이디</label><br>
            <input type="text" size="44" style="height: 40px;
                        outline: none;border: 1px solid #cccccc;margin-bottom: 5px; " name="userid" required><br><br>
            <label>이메일</label><br>
            <input type="text" size="44" style="height: 40px;
            outline: none;border: 1px solid #cccccc; margin-bottom: 5px;" name="email" required><br><br>
            <button class=btn type="submit" >비밀번호 찾기</button>
            <a href="loginForm" class="btn" style="display: flex;  width: 335px;
         justify-content: center;  align-items: center;text-decoration: none;" size=40>이전으로</a>
        </form>
    </div>
</div>
</body>
</html>

</body>
</html>
