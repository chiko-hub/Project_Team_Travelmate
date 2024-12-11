<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="main">
    <!-- 장소 선택 버튼 -->
    <div class="selects">
        <input type="button" value="Best호텔" onclick="location.href='selectBestHotel?first=true'"/>
        <input type="button" value="Hot호텔" onclick="location.href='selectHotHotel?first=true'"/>
    </div>
    <!-- 검색 폼 -->
    <div class="searchForm">
        <form method="get" name="frm" action="hotelSearch">
            <input type="text" name="key" placeholder="호텔명을 입력하세요" value="${key != null ? key : ''}"/>
            <button type="button">검색</button>
            <button type="button" onclick="location.href='hotelSelect?first=true'">초기화</button>
        </form>
    </div>
    <!-- hotelList 출력 -->
    <div class="hotel">
        <c:forEach var="hotel" items="${hotelList}">
            <div class="item" >
                <img src="/hotel_images/${hotel.hotel_savefilename}" alt="${hotel.hotel_name}" data-hotel-seq="${hotel.hotel_seq}"/>
                <div class="hotelText">
                    <div class="hotelName">${hotel.hotel_name}</div>
                    <div class="hotelDescription">${hotel.hotel_description}</div>
                </div>
                <button class="toggle-button" data-place-id="${hotel.hotel_seq}">
                    <span class="icon-plus">+</span>
                    <span class="icon-check" style="display: none;">✔</span>
                </button>
            </div>
        </c:forEach>
    </div>
    <!-- 상세 내용 표시 -->
    <div id="hotelDetailContainer"></div>
    <!-- 페이징 처리 -->
    <div class="row"> <!-- 페이지의 시작 -->
        <div class="col" style="font-size:120%; font-weight:bold;">
            <c:if test="${paging.prev}">
                <a href="hotelSelect?page=${paging.beginPage-1}">◀</a>&nbsp;
            </c:if>
            <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
                <c:if test="${index!=paging.page}">
                    <a href="hotelSelect?page=${index}">${index}&nbsp;</a>
                </c:if>
                <c:if test="${index==paging.page}">
                    <span style="color:red">${index}&nbsp;</span>
                </c:if>
            </c:forEach>
            &nbsp;
            <c:if test="${paging.next}">
                <a href="hotelSelect?page=${paging.endPage+1}">▶</a>
            </c:if>
        </div>
    </div> <!-- 페이지의 끝 -->
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