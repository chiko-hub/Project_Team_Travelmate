<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="/css/wishlist.css">
<script defer src="/script/wishlist.js"></script>

<%--<2번>--%>
<%--<div class="mainContainer">--%>
<%--    <!-- 찜 목록 -->--%>
<%--    <div class="wcontainer">--%>
<%--        <h2>찜 목록</h2>--%>
<%--        <div class="wishlist">--%>
<%--            <div class="wishlistItem" onclick="showDetails('', '')"></div>--%>
<%--            <div class="wishlistItem" onclick="showDetails('', '')"></div>--%>
<%--            <div class="wishlistItem" onclick="showDetails('', '')"></div>--%>
<%--            <div class="wishlistItem" onclick="showDetails('', '')"></div>--%>
<%--            <div class="wishlistItem" onclick="showDetails('', '')"></div>--%>
<%--            <div class="wishlistItem" onclick="showDetails('', '')"></div>--%>
<%--            <div class="wishlistItem" onclick="showDetails('', '')"></div>--%>
<%--            <div class="wishlistItem" onclick="showDetails('', '')"></div>--%>
<%--            <div class="wishlistItem" onclick="showDetails('', '')"></div>--%>

<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- 상세 보기 -->--%>
<%--    <div class="detailsContainer">--%>
<%--        <h2>상세 보기</h2>--%>
<%--        <div id="detailsContent" class="detailsContentBox">--%>
<%--            <h3>항목을 선택하세요</h3>--%>
<%--            <p>상세 정보가 여기에 표시됩니다.</p>--%>
<%--        </div>--%>
<%--        --%>

<%--    </div>--%>
<%--</div>--%>
<%--<script>--%>
<%--    function showDetails(title, description) {--%>
<%--        const detailsContent = document.getElementById("detailsContent");--%>
<%--        detailsContent.innerHTML = `--%>
<%--            <h3>${title}</h3>--%>
<%--            <p>${description}</p>--%>
<%--        `;--%>
<%--    }--%>
<%--</script>--%>




<%--<1번>--%>
<%--<div class="wcontainer"  style=" width: 350px; display: flex;--%>
<%--    flex-direction:column">--%>
<%--        <h2>찜 목록</h2>--%>
<%--        <div class="wishlist" >--%>
<%--            <div class="wishlistItem" onclick="showDetails('Item 1', 'Item 1의 상세정보')">--%>
<%--                <div class="boxleft"><img src=""/></div>--%>
<%--                <div class="boxRight">--%>
<%--                    <div class="subBox1"></div>--%>
<%--                    <div class="subBox2"></div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="wishlistItem" onclick="showDetails('Item 2', 'Item 2의 상세정보')">--%>
<%--                <div class="boxleft"><img src=""/></div>--%>
<%--                <div class="boxRight">--%>
<%--                    <div class="subBox1"></div>--%>
<%--                    <div class="subBox2"></div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="wishlistItem" onclick="showDetails('Item 3', 'Item 3의 상세정보')">--%>
<%--                <div class="boxleft"><img src=""/></div>--%>
<%--                <div class="boxRight">--%>
<%--                    <div class="subBox1"></div>--%>
<%--                    <div class="subBox2"></div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="wishlistItem" onclick="showDetails('Item 4', 'Item 4의 상세정보')">--%>
<%--                <div class="boxleft"><img src=""/></div>--%>
<%--                <div class="boxRight">--%>
<%--                    <div class="subBox1"></div>--%>
<%--                    <div class="subBox2"></div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--</div>--%>


<%--<div class="detailsContainer" style="flex: 1; padding: 20px; border-left: 1px solid #ccc;">--%>
<%--    <h2>상세 보기</h2>--%>
<%--    <div id="detailsContent">--%>
<%--        <p>선택된 항목의 상세 정보가 여기에 표시됩니다.</p>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<3>--%>
<%--<div class="mainContainer">--%>
<%--    <!-- 찜 목록 -->--%>
<%--    <div class="wcontainer">--%>
<%--        <h2>찜 목록</h2>--%>
<%--        <div class="wishlist">--%>
<%--            <div class="wishlistItem" onclick="showDetails('Item 1', 'Item 1의 상세정보')">--%>
<%--                Item 1--%>
<%--            </div>--%>
<%--            <div class="wishlistItem" onclick="showDetails('Item 2', 'Item 2의 상세정보')">--%>
<%--                Item 2--%>
<%--            </div>--%>
<%--            <div class="wishlistItem" onclick="showDetails('Item 3', 'Item 3의 상세정보')">--%>
<%--                Item 3--%>
<%--            </div>--%>
<%--            <div class="wishlistItem" onclick="showDetails('Item 4', 'Item 4의 상세정보')">--%>
<%--                Item 4--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- 상세 보기 -->--%>
<%--    <div class="detailsContainer">--%>
<%--        <!-- 상세 보기 왼쪽 -->--%>
<%--        <div class="detailsLeft">--%>
<%--            <h3>요약</h3>--%>
<%--            <p>여기에 요약 정보를 표시합니다.</p>--%>
<%--        </div>--%>
<%--        <!-- 상세 보기 오른쪽 -->--%>
<%--        <div class="detailsRight">--%>
<%--            <div class="detailsContentBox">--%>
<%--                <h3>Item 1</h3>--%>
<%--                <p>Item 1의 상세정보</p>--%>
<%--            </--%>
<%--            html--%>
<%--            코드 복사--%>
<%--        </div>--%>
<%--        <div class="detailsContentBox">--%>
<%--            <h3>Item 1 추가 정보</h3>--%>
<%--            <p>추가 정보 1</p>--%>
<%--        </div>--%>
<%--        <div class="detailsContentBox">--%>
<%--            <h3>Item 1 기타 정보</h3>--%>
<%--            <p>기타 정보 1</p>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<script>--%>
<%--    function showDetails(title, description) {--%>
<%--        const detailsLeft = document.querySelector(".detailsLeft");--%>
<%--        const detailsRight = document.querySelector(".detailsRight");--%>

<%--        // Update Left Section--%>
<%--        detailsLeft.innerHTML = `--%>
<%--            <h3>${title} 요약</h3>--%>
<%--            <p>${title}의 요약 정보입니다.</p>--%>
<%--        `;--%>

<%--        // Update Right Section--%>
<%--        detailsRight.innerHTML = `--%>
<%--            <div class="detailsContentBox">--%>
<%--                <h3>${title}</h3>--%>
<%--                <p>${description}</p>--%>
<%--            </div>--%>
<%--            <div class="detailsContentBox">--%>
<%--                <h3>${title} 추가 정보</h3>--%>
<%--                <p>추가 정보 1</p>--%>
<%--            </div>--%>
<%--            <div class="detailsContentBox">--%>
<%--                <h3>${title} 기타 정보</h3>--%>
<%--                <p>기타 정보 1</p>--%>
<%--            </div>--%>
<%--        `;--%>
<%--    }--%>
<%--</script>--%>
<%------3--%>


<div class="mainContainer">
    <!-- 찜 목록 -->
    <div class="wcontainer">
        <h2>찜 목록</h2>
        <div class="wishlist">
            <div class="wishlistItem" onclick="showDetails('','')"></div>
            <div class="wishlistItem" onclick="showDetails('','')"></div>
            <div class="wishlistItem" onclick="showDetails('','')"></div>
            <div class="wishlistItem" onclick="showDetails('','')"></div>
            <div class="wishlistItem" onclick="showDetails('','')"></div>
            <div class="wishlistItem" onclick="showDetails('','')"></div>
            <div class="wishlistItem" onclick="showDetails('','')"></div>
            <div class="wishlistItem" onclick="showDetails('','')"></div>
        </div>
    </div>

    <!-- 상세 보기 -->
    <div class="detailsContainer">
        <h2>상세 보기</h2>
        <div class="detailsWrapper">
            <!-- 왼쪽 -->
            <div class="detailsLeft">
                <h3>이미지</h3>
                <p>항목을 선택하세요.</p>
            </div>
            <!-- 오른쪽 -->
            <div class="detailsRight">
                <div class="subBox">
                    <h3>이름</h3>
                    <p>항목을 선택하세요.</p>
                </div>
                <div class="subBox">
                    <h3>설명</h3>
                    <p>항목을 선택하세요.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function showDetails(title, mainDetail, additionalDetail, otherDetail) {
        // 왼쪽 영역 업데이트
        const detailsLeft = document.querySelector(".detailsLeft");
        detailsLeft.innerHTML = `
            <h3>${title} 요약</h3>
            <p>${mainDetail}</p>
        `;

        // 오른쪽 영역 업데이트
        const subBoxes = document.querySelectorAll(".detailsRight .subBox");
        subBoxes[0].innerHTML = `
            <h3>상세 정보</h3>
            <p>${mainDetail}</p>
        `;
        subBoxes[1].innerHTML = `
            <h3>추가 정보</h3>
            <p>${additionalDetail}</p>
        `;
    }
</script>


<%@ include file="../footer.jsp" %>