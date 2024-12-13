<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="main">
    <div class="searchContainer">
        <!-- 검색 폼 -->
        <div class="searchForm">
            <form method="get" name="frm" action="hotelSearch">
                <div class="searchWrapper">
                    <input class="searchInput" type="text" name="key" placeholder="호텔명을 입력하세요" value="${key != null ? key : ''}"/>
                    <button class="searchButton" type="button" onclick="go_search('hotelSearch')">검색</button>
                </div>
            </form>
        </div>
        <!-- 장소 선택 버튼 -->
        <div class="selects">
            <button type="button" onclick="location.href='hotelSelect?first=true'">추천</button>
            <input type="button" value="Best" onclick="location.href='selectBestHotel?first=true'"/>
            <input type="button" value="Hot" onclick="location.href='selectHotHotel?first=true'"/>
        </div>
        <!-- hotelList 출력 -->
        <div class="hotel">
            <c:forEach var="hotel" items="${hotelList}">
                <div class="item">
                    <div class="hotelImage" style="border : 1px solid red">
                        <img src="/hotel_images/${hotel.hotel_savefilename}" alt="${hotel.hotel_name}" data-hotel-seq="${hotel.hotel_seq}"/>
                    </div>
                    <div class="hotelText">
                        <div class="hotelName">${hotel.hotel_name}</div>
                        <div class="hotelDescription">${hotel.hotel_description}</div>
                    </div>
                    <div class="hotelButton" style="border: 1px solid blue;">
                        <button class="toggle-button" data-place-id="${hotel.hotel_seq}">
                            <span class="icon-plus">+</span>
                            <span class="icon-check" style="display: none;">✔</span>
                        </button>
                    </div>
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
    <!-- 찜 목록 -->
    <div class="wishDetailContainer">
        <h2>찜 목록</h2>
        <div class="wishDetailList">
            <c:choose>
                <c:when test="${not empty wishlist}">
                    <c:forEach var="wishlistItem" items="${wishlist}">
                        <div class="wishlistItem">
                            <div class="wishlistName" onclick="">${wishlistItem.wishlist_title}</div>
                            <button class="removeWishlistButton" data-wishlist-seq="${wishlistItem.wishlist_seq}">×</button>
                        </div>
                    </c:forEach>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${empty loginUser}">
                    <div class="noWishDetailItem">
                        <div class="noWishText">로그인 후 이용 가능합니다.</div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="wishAddButton">
                        <button type="button" onclick="togglePanel('wishlistAddPanel')">+</button>
                    </div>
                </c:otherwise>
            </c:choose>
            <div id="wishlistAddPanel" class="wishlistAddPanel">
                <h3>새로운 찜 목록 생성</h3>
                <form id="wishlistAddForm" method="post" action="addWishlist">
                    <label for="wishlistTitle">이름</label>
                    <input type="text" id="wishlistTitle" name="wishlist_title" required/><br/>
                    <label for="wishlistCategory">종류</label>
                    <select id="wishlistCategory" name="wishlist_category" required>
                        <option value="hotel" selected>숙소</option>
                    </select>
                    <div class="wishlistAddButton">
                        <button type="button" onclick="addWishlist()">생성</button>
                        <button type="button" onclick="togglePanel('wishlistAddPanel')">취소</button>
                    </div>
                </form>
            </div>
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