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
    <button class="step-button" onclick="showContent('step3')">STEP 2<br>숙소 선택</button>
    <button class="step-button" onclick="showContent('step4')">STEP 3<br>찜꽁</button>
    <button class="step-button" onclick="showContent('step5')">STEP 4<br>일정</button>
</div>

<div id="main-content">
    <div id="BestPlace">
        <h3>Place List</h3>
        <div class="places">
            <c:forEach items="${placeList}" var="place">
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

    <div class="paging">
        <!--  prev 버튼의 표시 여부 -->
        <c:if test="${paging.prev}">
            <a href="placeList?page=${paging.beginPage-1}">◀</a>&nbsp;
        </c:if>
        <!--  beginPage 부터 endPage 까지 일렬로 페이지를 표시 -->
        <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
            <a href="placeList?page=${index}">
                &nbsp;${index}&nbsp;
            </a>
        </c:forEach>

        <!--  next 버튼의 표시 여부 -->
        <c:if test="${paging.next}">
            <a href="placeList?page=${paging.endPage+1}">▶</a>&nbsp;
        </c:if>

    </div>

</div>
