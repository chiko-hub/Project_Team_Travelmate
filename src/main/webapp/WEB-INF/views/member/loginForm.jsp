<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>TRAVEL Planner Login</title>
    <link rel="stylesheet" href="/css/login.css">

</head>
<html lang="ko">
<body>
    <div class="container">
        <div class="loginbox">
            <div class="logo" style="text-align: center">
                <img src="images/logo2.png">
            </div>
                <h3 style="text-align: center">AI 여행 스케줄링 플래너, 마이로</h3>
                <form method="post" action="login" name="loginForm" >
                    <div class="field">
                        <label>아이디</label><br>
                        <input type="text" id="userid" name="userid" size="44" style="height: 40px;
                        outline: none;border: 1px solid #cccccc;margin-bottom: 5px; " >
                    </div>
                    <div class="field">
                        <label>비밀번호</label><br>
                        <input type="password" id="pwd" name="pwd" size="44" style="height: 40px; outline: none;border: 1px solid #cccccc; " >
                    </div>
                    <div style="display: flex; justify-content: space-around;">
                        <div class="message" style="flex: 1;">${message}</div>
                        <a href="#" class="forgot-password" style="flex: 1;">비밀번호를 잊으셨나요?</a>
                    </div>
                    <button type="submit" class="btn">로그인</button>

                    <div class="sns-login">
                        <input type="button" class="btn facebook" value="Facebook" />
                        <input type="button" class="btn twitter" value="Twitter" />
                        <input type="button" class="btn google" value="Google" />
                        <input type="button" class="btn kakao" value="Kakao" onclick="location.href='kakaostart'"/>
                    </div>

                </form>
                <form action="joinForm" method="get" name="joinForm">
                    <div class="signup">
                        아직 회원이 아니세요? <a href="joinForm" style="color:#2e8b57">회원가입</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>