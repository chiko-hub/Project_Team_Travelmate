<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Search</title>
    <link rel="stylesheet" href="/css/start.css">
    <link rel="stylesheet" href="/css/place.css">

</head>
<body>
    <!-- 오른쪽 메인 콘텐츠 -->
    <div class="main">
        <div id="selects">
            <input type="button" value="Best호텔" onclick="location.href='selectBestHotel?first=true'"/>
            <input type="button" value="Hot호텔" onclick="location.href='selectHotHotel?first=true'"/>
        </div>

        <div class="place">
            <!-- 호텔 bestList 출력 -->
                    <c:forEach var="hotel" items="${bestList}">
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

        <div class="row">
                <div class="col" style="font-size:120%; font-weight:bold;">
                    <c:if test="${paging.prev}">
                        <a href="selectBestHotel?page=${paging.beginPage-1}">◀</a>&nbsp;
                    </c:if>
                    <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
                        <c:if test="${index != paging.page}">
                            <a href="selectBestHotel?page=${index}">${index}&nbsp;</a>
                        </c:if>
                        <c:if test="${index == paging.page}">
                            <span style="color:red">${index}&nbsp;</span>
                        </c:if>
                    </c:forEach>
                    &nbsp;
                    <c:if test="${paging.next}">
                        <a href="selectBestHotel?page=${paging.endPage+1}">▶</a>
                    </c:if>
                </div>
        </div>
    </div>
<%@ include file="../footer.jsp" %>
</body>
</html>
