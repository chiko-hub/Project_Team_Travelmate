<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>TRAVEL Planner Login</title>
    <link rel="stylesheet" href="/css/login.css">
</head>
<html lang="ko">
<body>
    <div class="container">
        <div class="loginbox">
            <div class="logo">
                <img src="images/logo2.png">
                <h2>여행 스케줄링 플래너</h2>
                <form method="post" action="login" name="loginForm" >
                    <div class="field">
                        <label>아이디</label>
                        <input type="text" id="userid" name="userid" size="22" >
                    </div>
                    <div class="field">
                        <label>비밀번호</label>
                        <input type="password" id="pwd" name="pwd" size="22" >
                    </div>
                    <div style="display: flex; justify-content: space-around;">
                        <div class="message" style="flex: 1;">${message}</div>
                        <a href="#" class="forgot-password" style="flex: 1;">비밀번호를 잊으셨나요?</a>
                    </div>
                    <button type="submit" class="btn">로그인</button>
                </form>
                <form action="joinForm" method="get" name="joinForm">
                    <div class="signup">
                        아직 회원이 아니세요? <a href="joinForm">회원가입</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>