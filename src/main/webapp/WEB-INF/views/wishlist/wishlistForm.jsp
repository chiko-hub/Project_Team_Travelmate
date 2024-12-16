<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="mainContainer">
    <div id="wishlistAddPanel" class="wishlistAddPanel">
        <h3>새로운 찜 목록 생성</h3>
        <form id="wishlistAddForm">
            <label for="wishlistTitle">이름</label>
            <input type="text" id="wishlistTitle" name="wishlist_title" required/><br/>
            <label for="wishlistCategory">종류</label>
            <select id="wishlistCategory" name="wishlist_category" required>
                <option value="place" selected>장소</option>
                <option value="hotel">숙소</option>
            </select>
            <div class="wishlistAddButton">
                <button type="button" onclick="addWishlist()">생성</button>
                <button type="button" onclick="togglePanel('wishlistAddPanel')">취소</button>
            </div>
        </form>
    </div>
    <!-- 찜 목록 -->
    <div class="wishContainer">
        <h2>찜 목록</h2>
        <div class="wishlistList">
            <c:choose>
                <c:when test="${not empty wishlist}">
                    <c:forEach var="wishlistItem" items="${wishlist}">
                        <div class="wishlistItem" onclick="loadWishDetail('${wishlistItem.wishlist_seq}')">
                            <div class="wishlistName" onclick="">${wishlistItem.wishlist_title}</div>
                            <button class="removeWishlistButton" data-wishlist-seq="${wishlistItem.wishlist_seq}">×</button>
                        </div>
                    </c:forEach>
                </c:when>
            </c:choose>
            <div class="wishAddButton">
                <button type="button" onclick="togglePanel('wishlistAddPanel')">+</button>
            </div>
        </div>
    </div>
    <!-- 상세 보기 -->
    <div class="wishDetailContainer">
        <div class="wishDetailList">
            <div class="noWishDetailItem">
                <div class="noWishText">찜 목록을 선택해주세요.</div>
            </div>
            <%-- wishlistDetail 표시 --%>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>