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
    <link rel="stylesheet" href="/css/index.css" />
    <script defer src="/script/index.js" ></script>
</head>
<body style="width: 1920px; height:1080px">
<style>
    .header{flex:1}
    .main{flex:3}
    .statistics{flex:1}
</style>
<div class="header">
    <div class="logo" >
        <img src="/images/GetSetGonotext.png"/>
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
        <a href="#"></a>
        <a href="#"></a>

    </nav>
</div>

<div class="main">
    <div id="text">
        <div class="container1">
            <h1> 여행 계획을 한눈에! <br>함께 만드는 실시간 여행 플랫폼</h1>
            <p>고민만 하던 여행 계획을 <b>겟셋고</b>를 통해 몇 분 만에 스케줄링 해보세요.</p>
            <br>
            <div class="container2">
                <div class="startButton">
                    <input type="button" id="button" value="겟셋고 시작하기" onclick="location.href='travel-start'"/>
                </div>
            </div>
        </div>
    </div>
   <div id="image-container" style="position: relative;">
        <canvas></canvas>
        <a id="admin-link" href="admin"
           style="
           position: absolute;
           display: none;
           text-decoration: none;
           color: white;
           font-size: 16px;
           z-index: 1000;">
            admin
        </a>
    </div>

</div>
<div class="statistics">
    <div class="statItem">
        <br><a  style="text-decoration: none;" href="admin"></a>
    </div>
</div>
</body>
</html>

