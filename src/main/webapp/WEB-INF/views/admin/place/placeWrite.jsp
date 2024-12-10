<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article style="flex-direction: column">
	<form name="placeWriteFrm" method="post"  action="adminPlaceWrite">
			<h2> Place Write Form </h2>
			<div class="field" >
					<label>분류</label>
					<div>
						<select name="category" style="width:200px;height:25px;font-size:105%;">
								<option value="">선택하세요</option>
								<c:forEach items="${categoryList}" var="kind" varStatus="status">
						    			<c:choose >
						    				<c:when test="${dto.category == status.count}" >
						    					<option value="${status.count}" selected>${kind}</option>
											</c:when>
											<c:otherwise>
												<option value="${status.count}" >${kind}</option>
											</c:otherwise>
										</c:choose>
						   		</c:forEach>
						</select>
					</div>
			</div>
			<div class="field" >
					<label>장소명</label>	<input type="text" name="name"  value="${placeVO.place_name}"  />
			</div>

			<div class="field" >
				<label>위치</label>  <input type="text" name="name"  value="${placeVO.place_location}"  />
			</div>

			<div class="field" >
					<label>상세설명</label><textarea name="content" rows="8" style="flex:4;">${placeVO.place_description}</textarea>
			</div>
			<div class="field" >
					<label>장소 이미지</label>
					<c:choose>
						<c:when test="${ empty placeVO.place_image }">
							<div style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start">
								<input type="hidden" name="image" id="image" > <!-- 전송될 파일이름 -->
								<input type="hidden" name="savefilename" id="savefilename" >
								<div id="filename"> </div>

							</div>
						</c:when>
						<c:otherwise>
							<div style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start">
								<input type="hidden" name="image" id="image" value="${placeVO.place_image}"  >
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

