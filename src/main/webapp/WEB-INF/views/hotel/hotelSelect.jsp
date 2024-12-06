<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Search</title>
    <link rel="stylesheet" href="/css/sider.css">
    <link rel="stylesheet" href="/css/place.css">
</head>
<body>
<!-- 좌측 STEP 메뉴 -->
<div class="sidebar">
    <button class="step-button" onclick="location.href='placeSelect'">STEP 1<br>장소 선택</button>
    <button class="step-button" onclick="location.href='hotelSelect'">STEP 2<br>숙소 선택</button>
    <button class="step-button" onclick="showContent('step4')">STEP 3<br>찜꽁</button>
    <button class="step-button" onclick="showContent('step5')">STEP 4<br>일정</button>
</div>

<div id="morePlace">
    <button class="placeList" onclick="location.href='hotelList'">더보기</button>
</div>
<!-- Best Hotels -->
<div id="main-content">
    <div id="BestPlace">
        <h3>Best Hotels</h3>
        <div class="places">
            <c:forEach items="${bestList}" var="hotel">
                <div class="item">
                    <img src="/hotel_images/${hotel.hotel_savefilename}" alt="${hotel.hotel_name}"
                         onclick="location.href='hotelDetail?hotel_seq=${hotel.hotel_seq}'">
                    <div class="place-info">
                        <h4>${hotel.hotel_name}</h4>
                        <h4>${hotel.hotel_price}</h4>
                        <p>${hotel.hotel_description}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Hot Hotels -->
    <div id="HotPlace">
        <h3>Hot Hotels</h3>
        <div class="places">
            <c:forEach items="${hotList}" var="hotel">
                <div class="item">
                    <img src="/hotel_images/${hotel.hotel_savefilename}" alt="${hotel.hotel_name}"
                         onclick="location.href='hotelDetail?hotel_seq=${hotel.hotel_seq}'">
                    <div class="place-info">
                        <h4>${hotel.hotel_name}</h4>
                        <h4>${hotel.hotel_price}</h4>
                        <p>${hotel.hotel_description}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>
