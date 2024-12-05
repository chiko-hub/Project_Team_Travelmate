<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>header</title>
    <link rel="stylesheet" href="/css/index.css" />

</head>
<body>
<div class="header">
    <div class="logo">MYRO</div>
    <nav>
        <a href="#">여행지</a>
        <a href="#">고객지원</a>
        <a href="#">이용방법</a>
        <c:choose>
            <c:when test="${empty loginUser}">
                <a href="loginForm">로그인</a>
            </c:when>
            <c:otherwise>
                <a href="#">${loginUser.name}(${loginUser.userid})</a>
                <a href="logout">로그아웃</a>
            </c:otherwise>
        </c:choose>
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
    <div id="map">
        <img src="" alt="지도 이미지"/>
    </div>
</div>
<div class="statistics">
    <div class="statItem">
        <span> AI로 생성된 일정 수&nbsp; </span> 214,975&nbsp;
        <span>  여행지 수&nbsp; </span> 96
    </div>
</div>
</body>
</html>
