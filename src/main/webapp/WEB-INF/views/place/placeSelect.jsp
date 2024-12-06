<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Steps</title>
    <link rel="stylesheet" href="/css/sider.css">
    <link rel="stylesheet" href="/css/place.css">
    <script defer src="/script/start.js"></script>
    <script src="/script/place.js"></script>
</head>
<body>
    <!-- 좌측 STEP 메뉴 -->
    <div class="sidebar">
        <button class="step-button" onclick="location.href='placeSelect'">STEP 1<br>장소 선택</button>
        <button class="step-button" onclick="showContent('step3')">STEP 2<br>숙소 선택</button>
        <button class="step-button" onclick="showContent('step4')">STEP 3<br>찜꽁</button>
        <button class="step-button" onclick="showContent('step5')">STEP 4<br>일정</button>
    </div>

    <div id="morePlace">더보기</div>
    <!-- Best Places -->
    <div id="main-content">
        <div id="BestPlace">
            <h3>Best Places</h3>
            <div class="places">
                <c:forEach items="${bestList}" var="place">
                    <div class="item">
                        <img src="/place_images/${place.savefilename}" alt="${place.place_name}"
                             onclick="location.href='placeDetail?place_seq=${place.place_seq}'">
                        <div class="place-info">
                            <h4>${place.place_name}</h4>
                            <p>${place.place_description}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Hot Places -->
        <div id="HotPlace">
            <h3>Hot Places</h3>
            <div class="places">
                <c:forEach items="${hotList}" var="place">
                    <div class="item">
                        <img src="/place_images/${place.savefilename}" alt="${place.place_name}"
                             onclick="location.href='placeDetail?place_seq=${place.place_seq}'">
                        <div class="place-info">
                            <h4>${place.place_name}</h4>
                            <p>${place.place_description}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>


<%--<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a3ba5873499d60049e89465e5a52a688"></script>--%>
<%--<script>--%>
<%--    var container = document.getElementById('map');--%>
<%--    var options = {--%>
<%--        center: new kakao.maps.LatLng(33.450701, 126.570667),--%>
<%--        level: 3--%>
<%--    };--%>
<%--    var map = new kakao.maps.Map(container, options);--%>
<%--</script>--%>
</body>
</html>
