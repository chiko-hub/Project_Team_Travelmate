<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
 <%@ include file="../sub_menu.jsp"%>


<article>
	<form method="get" name="frm">
		<div class="tb">
		<div class="row">
			<div class="col" style="display: flex; align-items: center;">
				장소명 &nbsp; <input type="text" name="key" value="${key}"/>&nbsp;&nbsp;&nbsp;
				<input class="btn" type="button" name="btn_search" value="검색"
					onClick="go_search('adminPlaceList')"/>
				&nbsp;&nbsp;&nbsp;
				<input type="button"  style="margin-left:auto" value="장소등록"  onClick="go_write();"/>
			</div>
		</div>
		<div class="row">
			<div class="coltitle">번호</div>
			<div class="coltitle">장소명</div>
		</div>

		<c:forEach items="${placeList}" var="placeVO" >
			<div class="row">
				<div class="col">${placeVO.place_seq}</div>
				<div class="col" onClick="go_detail( '${placeVO.place_seq}' )">${placeVO.place_name}</div>
			</div>
		</c:forEach>

		<div class="row">  <!-- 페이지의 시작 -->
			<div class="col" style="font-size:120%; font-weight:bold;">
				<c:if test="${paging.prev}" >
					<a href="adminPlaceList?page=${paging.beginPage-1}">◀</a>&nbsp;
				</c:if>


				<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
					<c:if test="${index!=paging.page}">
						<a href="adminPlaceList?page=${index}">${index}</a>&nbsp;
					</c:if>
					<c:if test="${index==paging.page}">
						<span style="color:red">${index}&nbsp;</span>
					</c:if>
				</c:forEach>


				<c:if test="${paging.next}" >
					<a href="adminPlaceList?page=${paging.endPage+1}">▶</a>&nbsp;
				</c:if>
			</div>
		</div><!-- 페이지의 끝 -->
	</form>
</article>





