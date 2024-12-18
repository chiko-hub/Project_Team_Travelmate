<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TRAVEL Planner Main</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/matter-js/0.19.0/matter.min.js"></script>
    <link rel="stylesheet" href="/css/index.css"/>
    <script defer src="/script/index.js" ></script>
</head>
<body>
<div class="header">
    <div class="logo">
        <img src="/images/GetSetGonotext.png" alt="GetSetGo logo"/>
    </div>
    <nav>
        <a href="customerForm">고객지원</a>
        <a href="joinForm">회원가입</a>
        <c:choose>
            <c:when test="${empty loginUser}">
                <a href="loginForm">로그인</a>
            </c:when>
            <c:otherwise>
                <a href="updateMemberForm">${loginUser.name}(${loginUser.userid})</a>
                <a href="logout">로그아웃</a>
            </c:otherwise>
        </c:choose>
        <a style="text-decoration: none;" href="admin">▒</a>
    </nav>
</div>
<div class="indexMain">
    <div class="container1">
        <div class="indexTitle">
            <h1>함께 만들어 공유하는</h1>
            <h1>여행 계획 플랫폼</h1>
        </div>
        <div class="indexSub">
            <p>계획을 <b>GetSetGo</b>를 통해 빠르게 만들고 공유해보세요.</p>
        </div>
        <div class="container2">
            <div class="startButton">
                <input type="button" id="button" value="시작하기" onclick="location.href='travel-start'"/>
            </div>
        </div>
    </div>
   <div id="image-container">
        <canvas></canvas>
        <a id="admin-link" href="admin">admin</a>
    </div>
</div>
</body>
</html>

