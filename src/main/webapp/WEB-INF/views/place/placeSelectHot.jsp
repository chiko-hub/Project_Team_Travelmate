<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 오른쪽 메인 콘텐츠 -->
<div class="main">
    <div class="selects">
        <input type="button" value="Best장소" onclick="location.href='selectBest?first=true'"/>
        <input type="button" value="Hot장소" onclick="location.href='selectHot?first=true'"/>
    </div>

    <div class="place">
        <!-- placeList 출력 -->
        <c:forEach var="place" items="${hotList}">
            <div class="item" data-place-seq="${place.place_seq}">
                <img src="/place_images/${place.savefilename}" alt="${place.place_name}" data-place-seq="${place.place_seq}" />
                <div class="placeText">
                    <div class="placeName">${place.place_name}</div>
                    <div class="placeDescription">${place.place_description}</div>
                </div>
                <button class="toggle-button" data-place-id="${place.place_seq}">
                    <span class="icon-plus">+</span>
                    <span class="icon-check" style="display: none;">✔</span>
                </button>
                <button class="toggle-button" data-place-id="${place.place_seq}">
                    <span class="icon-plus">+</span>
                    <span class="icon-check" style="display: none;">✔</span>
                </button>
            </div>
        </c:forEach>
    </div>
    <div class="row">
        <div class="col" style="font-size:120%; font-weight:bold;">
            <!-- 이전 버튼 -->
            <c:if test="${paging.prev}">
                <a href="selectHot?page=${paging.beginPage-1}">◀</a>&nbsp;
            </c:if>
            <!-- 페이지 번호 -->
            <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
                <c:if test="${index != paging.page}">
                    <a href="selectHot?page=${index}">${index}&nbsp;</a>
                </c:if>
                <c:if test="${index == paging.page}">
                    <span style="color:red">${index}&nbsp;</span>
                </c:if>
            </c:forEach>
            &nbsp;
            <!-- 다음 버튼 -->
            <c:if test="${paging.next}">
                <a href="selectHot?page=${paging.endPage+1}">▶</a>
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