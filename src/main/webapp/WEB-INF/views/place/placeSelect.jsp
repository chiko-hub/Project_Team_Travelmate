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
            <input type="button" value="Best장소" onclick="location.href='selectBest?first=true'"/>
            <input type="button" value="Hot장소" onclick="location.href='selectHot?first=true'"/>
        </div>

        <form method="get" name="frm" action="placeSearch">
            <input type="text" name="key" placeholder="장소명을 입력하세요"  value="${key != null ? key : ''}"/>
            <button type="button">검색</button>
            <button type="button" onclick="location.href='placeSelect?first=true'">초기화</button>
        </form>



        <div class="place">
            <!-- placeList 출력 -->
                    <c:forEach var="place" items="${placeList}">
                        <div class="item" onclick="location.href='placeDetail?place_seq=${place.place_seq}'">
                            <img src="/place_images/${place.savefilename}" alt="${place.place_name}"/>
                            <div class="place-info">
                                <h4>${place.place_name}</h4>
                                <p>${place.place_description}</p>
                            </div>
                        </div>
                    </c:forEach>
        </div>

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
<%@ include file="../footer.jsp" %>
</body>
</html>
