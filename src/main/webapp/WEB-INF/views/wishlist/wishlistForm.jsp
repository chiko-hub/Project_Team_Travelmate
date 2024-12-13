<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="mainContainer">
    <!-- 찜 목록 -->
    <div class="wishContainer">
        <h2>찜 목록</h2>
        <div class="wishlistList" style="border: 1px solid blue">
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
            <div class="wishAddButton">
                <button type="button" onclick="togglePanel('wishlistAddPanel')">+</button>
            </div>
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
        </div>
    </div>
    <!-- 상세 보기 -->
    <div class="wishDetailContainer" style="border: 1px solid red">
        <div class="wishDetailList" style="border: 1px solid blue">
            <div class="noWishDetailItem">
                <div class="noWishText">찜 목록을 선택해주세요.</div>
            </div>
            <!-- 장소 아이템 1 -->
            <div class="wishDetailItem">
                <div class="wishImage" style="border: 1px solid yellow">
                    <img src="" alt="다빈장 이미지" />
                </div>
                <div class="wishText">
                    <div class="wishTitle">이벤트 다빈장</div>
                    <div class="wishLocation">제주 애월 늦게까지 하는 현지인 맛집 다빈장제주 애월 늦게까지 하는 현지인 맛집 다빈장</div>
                </div>
                <button class="deleteBtn" onclick="deleteLocation()">×</button>
            </div>
            <!-- 장소 아이템 2 -->
            <div class="wishDetailItem">
                <div class="wishImage" style="border: 1px solid yellow">
                    <img src="" alt="손흥해장국 이미지" />
                </div>
                <div class="wishText">
                    <div class="wishTitle">이벤트 손흥해장국</div>
                    <div class="wishLocation">13년 전통, 함덕해변 근처 해장국 맛집</div>
                </div>
                <button class="deleteBtn" onclick="deleteLocation()">×</button>
            </div>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>