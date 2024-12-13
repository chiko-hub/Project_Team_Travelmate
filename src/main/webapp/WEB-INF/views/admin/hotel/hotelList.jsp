<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
 <%@ include file="../sub_menu.jsp"%>
<script src="admin/script/adminhotel.js"></script>

<article>
	<form method="get" name="frm">
		<div class="tb">
		<div class="row">

			<div class="col" style="display: flex; align-items: center; gap: 10px;">
				<!-- 검색어 입력 영역 -->
				<label for="search-key" style="font-weight: bold; margin-right: 10px;">숙소명</label>
				<div class="search-wrapper">
					<input id="search-key" type="text" name="key" value="${key}" class="search-input" placeholder="Search..." onkeydown="if(event.key === 'Enter') go_search('adminHotelList')">
					<span class="search-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="search-svg">
                <circle cx="11" cy="11" r="8"></circle>
                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
            </svg>
        </span>
				</div>

				<!-- 숙소 등록 버튼 -->
				<button class="btn btn-register" type="button" onclick="go_write_H()">
					숙소등록
				</button>

			</div>
		</div>
		<div class="row">
			<div class="coltitle">번호</div>
			<div class="coltitle">숙소명</div>
		</div>

		<c:forEach items="${hotelList}" var="hotelVO" >
			<div class="row">
				<div class="col">${hotelVO.hotel_seq}</div>
				<div class="col" onClick="go_detail_H( '${hotelVO.hotel_seq}' )">${hotelVO.hotel_name}</div>
			</div>
		</c:forEach>

		<div class="row">  <!-- 페이지의 시작 -->
			<div class="col" style="font-size:120%; font-weight:bold;">
				<c:if test="${paging.prev}" >
					<a href="adminHotelList?page=${paging.beginPage-1}">◀</a>&nbsp;
				</c:if>


				<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
					<c:if test="${index!=paging.page}">
						<a href="adminHotelList?page=${index}">${index}</a>&nbsp;
					</c:if>
					<c:if test="${index==paging.page}">
						<span style="color:red">${index}&nbsp;</span>
					</c:if>
				</c:forEach>


				<c:if test="${paging.next}" >
					<a href="adminHotelList?page=${paging.endPage+1}">▶</a>&nbsp;
				</c:if>
			</div>
		</div><!-- 페이지의 끝 -->
	</form>
</article>





