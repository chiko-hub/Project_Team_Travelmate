<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article style="flex-direction: column">
	<form name="placeWriteFrm" method="post"   action="adminPlaceUpdate">
			<input type="hidden" name="place_seq" value="${placeVO.place_seq}">
			<h2> Place Update Form </h2>

			<div class="field" >
					<label>장소명</label>	<input type="text" name="place_name"  value="${placeVO.place_name}" />
			</div>

			<div class="field"  style="display:block">
					<label >Best Place</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<c:choose>
								<c:when test='${placeVO.bestyn=="Y"}' >
									<input type="radio" name="bestyn" value="Y" checked="checked">사용
							  		<input type="radio" name="bestyn" value="N">미사용
								</c:when>
								<c:otherwise>
									<input type="radio" name="bestyn" value="Y" >사용
							  		<input type="radio" name="bestyn" value="N" checked="checked">미사용
								</c:otherwise>
							</c:choose>

					<label style="margin-left:100px;">Hot Place</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<c:choose>
								<c:when test='${placeVO.hotyn=="Y"}' >
									<input type="radio" name="hotyn" value="Y" checked="checked">사용
								 	<input type="radio" name="hotyn" value="N">미사용
								</c:when>
								<c:otherwise>
									<input type="radio" name="hotyn" value="Y" >사용
							  		<input type="radio" name="hotyn" value="N" checked="checked">미사용
								</c:otherwise>
							</c:choose>
			</div>
			<div class="field" >
					<label>상세설명</label>
					<textarea name="place_description" rows="8" style="flex:4;">${placeVO.place_description}</textarea>
			</div>
			<div class="field" >
					<label>장소 이미지</label>
					<div style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start">
						<input type="hidden" name="place_image" id="image" value="${placeVO.place_image}"  >
						<input type="hidden" name="savefilename" id="savefilename" value="${placeVO.savefilename}" >
						<div id="filename">
							${placeVO.place_image}
							<img src="/place_images/${placeVO.savefilename}" width="150" />
						</div>

					</div>
			</div>
			<div class="btn" >
					<input type="submit" value="수정" >
					<input type="button" value="목록으로" onClick="location.href='adminPlaceList'">
			</div>
	</form>


	<div  style="position:relative;  border:1px solid black; width:500px; margin:0 auto; ">
		<form name="fromm" id="fileupForm" method="post" enctype="multipart/form-data">
			<input type="file" name="fileimage">
			<input type="button" id="imageAddBtn" value="추가">
		</form>
	</div>

</article>

