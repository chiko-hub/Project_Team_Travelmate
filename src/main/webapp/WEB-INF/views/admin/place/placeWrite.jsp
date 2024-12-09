<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article style="flex-direction: column">
	<form name="placeWriteFrm" method="post"  action="adminPlaceWrite">
			<h2> Add Place </h2>

			<div class="field" >
					<label>Place name</label>	<input type="text" name="name"  value="${placeVO.place_name}"  />
			</div>

			<div class="field" >
					<label>Location</label>	<input type="text" name="name"  value="${placeVO.place_location}"  />
			</div>

			<div class="field" >
					<label>Information</label><textarea name="content" rows="8" style="flex:4;">${placeVO.place_description}</textarea>
			</div>
			<div class="field" >
					<label>Image</label>
					<c:choose>
						<c:when test="${ empty placeVO.place_image }">
							<div style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start">
								<input type="hidden" name="place_image" id="place_image" > <!-- 전송될 파일이름 -->
								<input type="hidden" name="savefilename" id="savefilename" >
								<div id="filename"> </div>

							</div>
						</c:when>
						<c:otherwise>
							<div style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start">
								<input type="hidden" name="place_image" id="place_image" value="${placeVO.place_image}"  >
								<input type="hidden" name="savefilename" id="savefilename" value="${placeVO.savefilename}" >
								<div id="filename">${placeVO.savefilename}</div>
								<img src="/place_image/${placeVO.savefilename}" width="150" />
							</div>
						</c:otherwise>
					</c:choose>
			</div>
			<div class="btn" >
					<input type="submit" value="Register" >
					<input type="button" value="return to list"	onClick="location.href='adminPlaceList'">
			</div>

			<div class="field" >
				<label>${message}</label>
			</div>
	</form>

	<div  style="position:relative;  border:1px solid black; width:500px; margin:0 auto; ">
		<form name="formm" id="fileupForm" method="post" enctype="multipart/form-data">
			<input type="file" name="fileimage">
			<input type="button" id="imageAddBtn" value="추가">
		</form>
	</div>
</article>

