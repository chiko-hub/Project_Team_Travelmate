<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="main">
    <!-- 장소 선택 버튼 -->
    <div class="selects" style="border : 1px solid red">
        <input type="button" value="Best장소" onclick="location.href='selectBest?first=true'"/>
        <input type="button" value="Hot장소" onclick="location.href='selectHot?first=true'"/>
    </div>
    <!-- 검색 폼 -->
    <div class="searchForm">
        <form method="get" name="frm" action="placeSearch" style="border : 1px solid blue">
            <input type="text" name="key" placeholder="장소명을 입력하세요" value="${key != null ? key : ''}"/>
            <button type="button">검색</button>
            <button type="button" onclick="location.href='placeSelect?first=true'">초기화</button>
        </form>
    </div>
    <!-- placeList 출력 -->
    <div class="place" style="border : 1px solid green">
        <c:forEach var="place" items="${placeList}">
            <div class="item">
                <img src="/place_images/${place.savefilename}" alt="${place.place_name}" data-place-seq="${place.place_seq}"/>
                <div class="placeText">
                    <div class="placeName">${place.place_name}</div>
                    <div class="placeDescription">${place.place_description}</div>
                </div>
                <button class="toggle-button" data-place-id="${place.place_seq}">
                    <span class="icon-plus">+</span>
                    <span class="icon-check" style="display: none;">✔</span>
                </button>
            </div>
        </c:forEach>
    </div>
    <!-- 상세 내용 표시 -->
    <div id="placeDetailContainer"></div>
    <!-- 페이징 처리 -->
    <div class="row"> <!-- 페이지의 시작 -->
        <div class="col" style="font-size:120%; font-weight:bold;">
            <c:if test="${paging.prev}">
                <a href="placeSelect?page=${paging.beginPage-1}">◀</a>&nbsp;
            </c:if>
            <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
                <c:if test="${index!=paging.page}">
                    <a href="placeSelect?page=${index}">${index}&nbsp;</a>
                </c:if>
                <c:if test="${index==paging.page}">
                    <span style="color:red">${index}&nbsp;</span>
                </c:if>
            </c:forEach>
            &nbsp;
            <c:if test="${paging.next}">
                <a href="placeSelect?page=${paging.endPage+1}">▶</a>
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
