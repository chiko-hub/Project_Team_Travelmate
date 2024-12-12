<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article style="flex-direction: column">
	<form name="placeWriteFrm" method="post"  action="adminPlaceWrite">
			<h2> Place Write Form </h2>

			<div class="field" >
					<label>장소명</label>	<input type="text" name="place_name"  value="${placeVO.place_name}"  />
			</div>

			<div class="field" >
				<label>위치</label>  <input type="text" name="place_location"  value="${placeVO.place_location}"  />
			</div>

			<div class="field" >
					<label>상세설명</label><textarea name="place_description" rows="8" style="flex:4;">${placeVO.place_description}</textarea>
			</div>
			<div class="field" >
					<label>장소 이미지</label>
					<c:choose>
						<c:when test="${ empty placeVO.place_image }">
							<div style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start">
								<input type="hidden" name="place_image" id="image" > <!-- 전송될 파일이름 -->
								<input type="hidden" name="savefilename" id="savefilename" >
								<div id="filename"> </div>

							</div>
						</c:when>
						<c:otherwise>
							<div style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start">
								<input type="hidden" name="place_image" id="image" value="${placeVO.place_image}"  >
								<input type="hidden" name="savefilename" id="savefilename" value="${placeVO.savefilename}" >
								<div id="filename">${placeVO.savefilename}</div>
								<img src="/place_images/${placeVO.savefilename}" width="150" />
							</div>
						</c:otherwise>
					</c:choose>
			</div>
			<div class="btn" >
					<input type="submit" value="장소등록" >
					<input type="button" value="목록으로"	onClick="location.href='adminPlaceList'">
			</div>

			<div class="field" >
				<label>${message}</label>
			</div>
	</form>

	<div  style="position:relative;  border:1px solid black; width:500px; margin:0 auto; ">
		<form name="fromm" id="fileupForm" method="post" enctype="multipart/form-data">
			<input type="file" name="fileimage">
			<input type="button" id="imageAddBtn" value="추가">
		</form>
	</div>
</article>

