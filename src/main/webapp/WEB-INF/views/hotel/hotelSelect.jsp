<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../header.jsp" %>
<c:choose>
    <c:when test="${not empty loginUser}">
        <div id="wishlistAddPanel" class="wishlistAddPanel" data-panel-group="panel">
            <h3>새로운 찜 목록 생성</h3>
            <form id="wishlistAddForm">
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
        <div id="wishAddPanel" class="wishlistAddPanel" data-panel-group="panel">
            <h3>추가할 찜 목록 선택</h3>
            <form id="wishAddForm" method="post">
                <input type="hidden" value="hotel" name="wish_category"/> <%-- wish 의 category 전달 --%>
                <label for="wishlistSeq">찜 목록</label>
                <select id="wishlistSeq" name="wishlist_seq" required>
                    <option value=""></option>
                    <c:choose>
                        <c:when test="${not empty wishlist}">
                            <c:forEach var="wishlistNum" begin="0" end="${fn:length(wishlist)-1}" varStatus="status">
                                <option value="${wishlist[wishlistNum].wishlist_seq}">${wishlist[wishlistNum].wishlist_title}</option>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </select>
                <div class="wishlistAddButton">
                    <button type="button" onclick="addWish()">추가</button>
                    <button type="button" onclick="togglePanel('wishAddPanel')">취소</button>
                </div>
            </form>
        </div>
    </c:when>
</c:choose>
<div class="main">
    <div class="searchContainer">
        <!-- 검색 폼 -->
        <div class="searchForm">
            <form method="get" name="frm">
                <div class="searchWrapper">
                    <input class="searchInput" type="text" name="key" placeholder="호텔명을 입력하세요" value="${key != null ? key : ''}"/>
                    <button class="searchButton" type="button">검색</button>
                </div>
            </form>
        </div>
        <!-- 장소 선택 버튼 -->
        <div class="selects">
            <button type="button" class="hotelCategoryButton selected" value="all">ALL</button>
            <button type="button" class="hotelCategoryButton" value="best">BEST</button>
            <button type="button" class="hotelCategoryButton" value="hot">HOT</button>
        </div>
        <!-- hotelList 출력 -->
        <div class="hotel" >
            <%-- category 별 호텔 정보 출력 --%>
        </div>
    </div>
    <!-- 찜 목록 -->
    <div class="wishContainer">
        <h2>찜 목록</h2>
        <div class="wishlistList">
            <c:choose>
                <c:when test="${not empty wishlist}">
                    <c:forEach var="wishlistItem" items="${wishlist}">
                        <div class="wishlistItem" id="hotelWishlist" onclick="showWishDetail('hotelWishDetailContainer', '${wishlistItem.wishlist_seq}')">
                            <div class="wishlistName">${wishlistItem.wishlist_title}</div>
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
        </div>
    </div>
</div>
<%-- 찜 내역 상세 보기 --%>
<div class="wishDetailContainer" id="hotelWishDetailContainer" data-wishlist-seq="" style="display: none;">
    <div class="wishDetailList">
        <%-- wishlistDetail 표시 --%>
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