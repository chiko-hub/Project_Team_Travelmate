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
    <script defer src="/script/index2.js" ></script>
</head>
<body style="width: 1920px; height:1080px">
<style>
    .header{flex:1}
    .main{flex:3}
    .statistics{flex:1}
</style>
<div class="header">
    <div class="logo">MYRO</div>
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
        <a href="#"></a>
        <a href="#"></a>
        <a href="#"></a>
        <a href="#"></a>
    </nav>
</div>

<div class="main">
    <div id="text">
        <div class="container1">
            <h1> 기존에 경험하지 못한<br>새로운 여행 플래너</h1>
            <p>고민만 하던 여행 계획을 <b>마이로</b>를 통해 몇 분 만에 스케줄링 해보세요.</p>
            <br>
            <div class="container2">
                <div class="startButton">
                    <input type="button" id="button" value="마이로 시작하기" onclick="location.href='travel-start'"/>
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

