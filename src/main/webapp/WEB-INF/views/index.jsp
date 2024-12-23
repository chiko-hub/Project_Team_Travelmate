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
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-straight/css/uicons-regular-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
</head>
<body>
<div class="header">
    <div class="logo">
        <img src="/images/GetSetGonotext.png" alt="GetSetGo logo"/>
    </div>
    <nav>
        <a href="customerForm"><i class="fi fi-rr-interrogation"></i></a>
        <c:choose>
            <c:when test="${empty loginUser}">
                <a href="loginForm"><i class="fi fi-rs-user-add"></i></a>
            </c:when>
            <c:otherwise>
                <a href="updateMemberForm"><i class="fi fi-rs-following"></i></a>
                <a href="logout"><i class="fi fi-rr-exit"></i></a>
            </c:otherwise>
        </c:choose>
        <a style="text-decoration: none;" href="admin"><i class="fi fi-rs-key"></i></a>
    </nav>
</div>
<div class="indexMain">
    <div class="container1">
        <div class="indexTitle">
            <h1>함께 만들어 공유하는</h1>
            <h1>여행 계획 플래너</h1>
        </div>
        <div class="indexSub">
            <p>고민만 하던 계획을 <b>GetSetGo</b>를 통해 빠르게 만들고 공유해보세요.</p>
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

