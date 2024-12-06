<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Admin Login</title>
<link rel="stylesheet" type="text/css" href="/css/admin.css">
</head>
<html lang="ko">
<body>
<div class="container">
    <div class="loginbox">
        <div class="logo">
            <img src="images/logo2.png">
            <h2>Admin Login</h2>
            <form method="get" action="adminLogin" name="adminlogin" >
                <div class="field">
                    <label>아이디</label>
                    <input type="text" id="userid" name="adminid" size="22" >
                </div>
                <div class="field">
                    <label>비밀번호</label>
                    <input type="password" id="pwd" name="pwd" size="22" >
                </div>
                <button type="submit" class="btn">로그인</button>
            </form>

        </div>
    </div>
</div>
</body>
</html>