<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article style="flex-direction: column">
	<form name="placeWriteFrm" method="post"   action="adminPlaceUpdate">
			<input type="hidden" name="place_seq" value="${placeVO.place_seq}">
			<h2> Place Edit </h2>
			&nbsp;
			<div class="field"  style="display:block">
					<label style="margin-left: 100px">Best Place</label>
							<c:choose>
								<c:when test='${placeVO.bestyn=="Y"}' >
									<input type="radio" name="bestyn" value="Y" checked="checked">YES
							  		<input type="radio" name="bestyn" value="N">NO
								</c:when>
								<c:otherwise>
									<input type="radio" name="bestyn" value="Y" >YES
							  		<input type="radio" name="bestyn" value="N" checked="checked">NO
								</c:otherwise>
							</c:choose>

					<label style="margin-left:100px">Hot Place</label>
							<c:choose>
								<c:when test='${placeVO.hotyn=="Y"}' >
									<input type="radio" name="hotyn" value="Y" checked="checked">YES
								 	<input type="radio" name="hotyn" value="N">NO
								</c:when>
								<c:otherwise>
									<input type="radio" name="hotyn" value="Y" >YES
							  		<input type="radio" name="hotyn" value="N" checked="checked">NO
								</c:otherwise>
							</c:choose>
			</div>

			<div class="field" >
					<label>Name</label>	<input type="text" name="place_name"  value="${placeVO.place_name}" />
			</div>

			<div class="field" >
				<label>Location</label>  <input type="text" name="place_location"  value="${placeVO.place_location}"  />
			</div>

			<div class="field" >
					<label>Info.</label>
					<textarea name="place_description" rows="8" style="flex:4;">${placeVO.place_description}</textarea>
			</div>
			<div class="field" >
					<label>Image</label>
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
					<input type="submit" value="Edit" >
					<input type="button" value="Back" onClick="location.href='adminPlaceList'">
			</div>
	</form>


	<div class="file-upload-container">
		<form name="fromm" id="fileupForm" method="post" enctype="multipart/form-data">
			<div class="file-input-container">
				<label for="fileimage" class="file-label">
					<span>Select Image</span>
					<input type="file" name="fileimage" id="fileimage" class="file-input" accept="image/*" onchange="previewImage(event)">
				</label>
			</div>

			<div class="preview-container">
				<img id="image-preview" src="#" alt="미리보기 이미지 없음" class="image-preview">
			</div>

			<button type="button" id="imageAddBtn" class="btn-upload">Add Image</button>
		</form>
	</div>



</article>