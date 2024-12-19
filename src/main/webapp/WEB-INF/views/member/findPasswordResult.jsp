<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<link rel="stylesheet" href="/css/login.css">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            // 비밀번호 유효성 검사
            $("input[name='newPassword']").on("input", function () {
                var pwd = $(this).val();
                var pwdPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+]).{8,16}$/;

                if (!pwdPattern.test(newPassword)) {
                    $(".idqmessage").html("<div id=abmessage >비밀번호: 8~16자의 영문 대/소문자, 숫자,<br>특수문자를 사용해 주세요.</span>");
                } else {
                    $(".idqmessage").html("<div id=amessage >사용 가능한 비밀번호입니다.</div>");
                }
            });
        });
    </script>
    <title>Title</title>
</head>
<body>
<div class="container">
    <div class="loginbox">
        <div class="logo" style="text-align: center">
            <img src="images/GetSetGOnotext.png">
        </div>
  <c:choose>
      <c:when test="${findPassword == null || findPassword == ''}">
        <p style="text-align: center">가입된 비밀번호가 없습니다.<p>
        <a href="joinForm" class="btn" style="display: flex;  width: 320px;
         justify-content: center;  align-items: center;text-decoration: none;" size=40>회원가입하러 가기</a>
        <a href="findPassword" class="btn" style="display: flex;  width: 320px;
         justify-content: center;  align-items: center;text-decoration: none;" size=40>이전으로</a>

        </c:when>
    <c:otherwise>
        <h2 style="text-align: center">비밀번호 재설정</h2>
    <form action="uploadInfo" method="post">
        <div class="field">
            <label>새 비밀번호</label><br>
            <input type="password" id="newPassword" name="newPassword" size="44" style="margin-bottom:3px;height:40px; outline: none; border: 1px solid #cccccc;" >
        </div>
        <div class="idqmessage"  style="margin-left: 0"></div>
        <div class="field">
            <label>새 비밀번호 확인</label><br>
            <input type="password" id="confirmPassword" name="confirmPassword" size="44" style="margin-bottom: 10px; height:40px; outline: none; border: 1px solid #cccccc;" >
        </div>
            <input type="hidden" name="userid" value="${userid}">
          <button type="submit" class="btn"  style="display: flex;width: 334px;
         justify-content: center;  align-items: center;text-decoration: none;" size=40>비밀번호 변경</button>
     </form>
        <a href="loginForm" class="btn" style="display: flex;  width: 320px;
         justify-content: center;  align-items: center;text-decoration: none;" size=40>로그인하러 가기</a>
      </form>
        ${message}
    </c:otherwise>
 </c:choose>
    </div>
</div>
</body>
</html>
