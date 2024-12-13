<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>
<article>
<form method="get" name="frm">
	<div class="tb">
		<div class="row">

				<div class="col" style="display: flex; align-items: center; gap: 10px;">
				<!-- 검색어 입력 영역 -->
				<label for="search-key" style="font-weight: bold; margin-right: 10px;">회원 성명</label>
				<div class="search-wrapper">
					<input id="search-key" type="text" name="key" value="${key}" class="search-input" placeholder="Search..." onkeydown="if(event.key === 'Enter') go_search('adminMemberList')">
					<span class="search-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="search-svg">
                <circle cx="11" cy="11" r="8"></circle>
                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
            </svg>
        </span>
				</div>


			</div>
		</div>
		<div class="row">
			<div class="coltitle" style="flex:1">아이디</div>
			<div class="coltitle" style="flex:1">이름</div>
			<div class="coltitle" style="flex:3">이메일</div>
			<div class="coltitle" style="flex:2">우편번호</div>
			<div class="coltitle" style="flex:4">주소</div>
			<div class="coltitle" style="flex:1">전화</div>
			<div class="coltitle" style="flex:1">가입일</div>
		</div>
		<c:forEach items="${memberList}" var="memberVO">
			<div class="row">
				<div class="col" style="flex:1; display: flex; justify-content: center; align-items: center">${memberVO.userid}</div>
				<div class="col" style="flex:1; display: flex;justify-content: center; align-items: center">${memberVO.name}</div>
				<div class="col" style="flex:3; display: flex;justify-content: center; align-items: center">${memberVO.email}</div>
				<div class="col" style="flex:2; display: flex;justify-content: center; align-items: center">${memberVO.zip_num}</div>
				<div class="col" style="flex:4; display: flex; justify-content: flex-start; align-items: center">${memberVO.address_main} ${memberVO.address_detail}</div>
				<div class="col" style="flex:1">${memberVO.phone} </div>
				<div class="col" style="flex:1"><fmt:formatDate value="${memberVO.indate}" /></div>
			</div>
		</c:forEach>


        <div class="row">  <!-- 페이지의 시작 -->
			<div class="col" style="font-size:120%; font-weight:bold;">
				<c:if test="${paging.prev}" >
					<a href="adminMemberList&page=${paging.beginPage-1}">◀</a>&nbsp;
				</c:if>


				<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
					<c:if test="${index!=paging.page}">
						<a href="adminMemberList&page=${index}">${index}</a>&nbsp;
					</c:if>
					<c:if test="${index==paging.page}">
						<span style="color:red">${index}&nbsp;</span>
					</c:if>
				</c:forEach>


				<c:if test="${paging.next}" >
					<a href="adminMemberList&page=${paging.endPage+1}">▶</a>&nbsp;
				</c:if>
			</div>
		</div><!-- 페이지의 끝 -->

	</div>
</form>
</article>


