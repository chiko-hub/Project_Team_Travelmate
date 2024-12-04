<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <title>TRAVEL Planner Login</title>
    <link rel="stylesheet" href="/css/login.css">

</head>
<article>
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
                <div class="signup">
                    아직 회원이 아니세요? <a href="contract">회원가입</a>
                </div>
            </div>
        </div>
    </div>
</article>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <div class="login-box">--%>
<%--        <div class="logo">--%>
<%--            <img src="images/logo2.png" alt="logo2.png">--%>
<%--        <h2>AI 여행 스케줄링 플래너, 마이로</h2>--%>
<%--        <form action="/login" method="post">--%>
<%--            <div class="field">--%>
<%--                <label>아이디</label>--%>
<%--                <input type="text" id="userid" name="userid" >--%>
<%--            </div>--%>
<%--            <div class="field">--%>
<%--                <label>비밀번호</label>--%>
<%--                <input type="password" id="password" name="password" >--%>
<%--            </div>--%>
<%--            <a href="#" class="forgot-password">비밀번호를 잊으셨나요?</a>--%>
<%--            <button type="submit" class="btn">로그인</button>--%>
<%--        </form>--%>
<%--        <div class="signup">--%>
<%--            아직 회원이 아니세요? <a href="/signup">회원가입</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</body>--%>
</html>