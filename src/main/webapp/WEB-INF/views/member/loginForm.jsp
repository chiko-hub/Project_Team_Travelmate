<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>TRAVEL Planner Login</title>
    <link rel="stylesheet" href="/css/login.css">

</head>
<html lang="ko">
<body>
    <div class="container">
        <div class="loginbox">
            <div class="logo" style="text-align: center; margin-bottom: 17px;">
                <img src="/images/GetSetGonotext.png"/>
            </div>
                <form method="post" action="login" name="loginForm" >
                    <div class="field">
                        <label>아이디</label><br>
                        <input type="text" id="userid" name="userid" size="44" style="height: 40px;
                        outline: none;border: 1px solid #cccccc;margin-bottom: 5px; " >
                    </div>
                    <div class="field">
                        <label>비밀번호</label><br>
                        <input type="password" id="pwd" name="pwd" size="44" style="height: 40px; outline: none; border: 1px solid #cccccc; " >
                    </div>
                    <div style="display: flex; justify-content: space-around;">
                        <div class="message" style="flex: 2;">${message}</div>
                        <a href="findId" id="forgot-id" style="flex: 1";>아이디 찾기</a>
                        <a href="findPassword" id="forgot-password" style="flex: 1;">비밀번호 찾기</a>
                    </div>
                    <button type="submit" class="btn">로그인</button>
                    <a href="/" class="btn" style="display: flex;  width: 335px;
                      justify-content: center;  align-items: center;text-decoration: none;" size=40>이전으로</a>
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