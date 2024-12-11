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
    <link rel="stylesheet" href="/css/hotel.css">
    <script defer src="/script/hotel.js"></script>

</head>
<body>
    <!-- 오른쪽 메인 콘텐츠 -->
    <div class="main">
        <div id="selects">
            <input type="button" value="Best호텔" onclick="location.href='selectBestHotel?first=true'"/>
            <input type="button" value="Hot호텔" onclick="location.href='selectHotHotel?first=true'"/>
        </div>

        <div class="hotel">
            <!-- 호텔 bestList 출력 -->
                    <c:forEach var="hotel" items="${bestList}">
                        <div class="item" >
                            <img src="/hotel_images/${hotel.hotel_savefilename}" alt="${hotel.hotel_name}" data-hotel-seq="${hotel.hotel_seq}"/>
                            <div class="hotel-info">
                                <h4>${hotel.hotel_name}</h4>
                                <p>${hotel.hotel_description}</p>
                            </div>
                            <button class="toggle-button" data-place-id="${place.place_seq}">
                                <span class="icon-plus">+</span>
                                <span class="icon-check" style="display: none;">✔</span>
                            </button>
                        </div>
                    </c:forEach>
        </div>
        <!-- 상세 내용 표시 -->
        <div id="hotelDetailContainer"></div>

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

    <!-- 모달 구조 -->
    <div id="customModal" class="modal">
        <div class="modal-content">
            <span id="closeModal" class="close">&times;</span>
            <div id="modalContent">
                <!-- AJAX로 받은 내용이 여기에 삽입됩니다 -->
            </div>
        </div>
    </div>

<%@ include file="../footer.jsp" %>
</body>
</html>
