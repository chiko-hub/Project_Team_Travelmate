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


<!-- 좌측 STEP 메뉴 -->
<div class="sidebar">
    <button class="step-button" onclick="location.href='placeSelect'">STEP 1<br>장소 선택</button>
    <button class="step-button" onclick="location.href='hotelSelect'">STEP 2<br>숙소 선택</button>
    <button class="step-button" onclick="showContent('step4')">STEP 3<br>찜꽁</button>
    <button class="step-button" onclick="showContent('step5')">STEP 4<br>일정</button>
</div>


<div id="main-content">
    <div id="BestPlace">
        <h3>Hotel List</h3>

        <form method="get" name="frm" action="hotelList">
            <select name="searchType">
                <option value="hotel_name" ${searchType == 'hotel_name' ? 'selected' : ''}>호텔명</option>
                <option value="hotel_location" ${searchType == 'hotel_location' ? 'selected' : ''}>호텔주소</option>
            </select>
            <input type="text" name="key" placeholder="검색어를 입력하세요"  value="${key != null ? key : ''}"/>
            <button type="button">검색</button>
            <button type="button" onclick="location.href='hotelList?first=true'">초기화</button>
        </form>


        <div class="places">
            <c:forEach items="${hotelList}" var="hotel">
                <div class="item">
                    <img src="/hotel_images/${hotel.hotel_savefilename}" alt="${hotel.hotel_name}"
                         onclick="location.href='hotelDetail?hotel_seq=${hotel.hotel_seq}'">
                    <div class="place-info">
                        <h4>${hotel.hotel_name}</h4>
                        <p>${hotel.hotel_description}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="paging">
        <!--  prev 버튼의 표시 여부 -->
        <c:if test="${paging.prev}">
            <a href="hotelList?page=${paging.beginPage-1}">◀</a>&nbsp;
        </c:if>
        <!--  beginPage 부터 endPage 까지 일렬로 페이지를 표시 -->
        <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
            <a href="hotelList?page=${index}">
                &nbsp;${index}&nbsp;
            </a>
        </c:forEach>

        <!--  next 버튼의 표시 여부 -->
        <c:if test="${paging.next}">
            <a href="hotelList?page=${paging.endPage+1}">▶</a>&nbsp;
        </c:if>

    </div>

</div>
