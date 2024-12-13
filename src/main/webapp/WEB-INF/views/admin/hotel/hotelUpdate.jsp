<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article style="flex-direction: column">
	<form name="hotelWriteFrm" method="post"   action="adminHotelUpdate">
			<input type="hidden" name="hotel_seq" value="${hotelVO.hotel_seq}">
			<h2> Hotel Update Form </h2>

			<div class="field"  style="display:block">
					<label >Best Hotel</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<c:choose>
								<c:when test='${hotelVO.hotel_bestyn=="Y"}' >
									<input type="radio" name="hotel_bestyn" value="Y" checked="checked">사용
							  		<input type="radio" name="hotel_bestyn" value="N">미사용
								</c:when>
								<c:otherwise>
									<input type="radio" name="hotel_bestyn" value="Y" >사용
							  		<input type="radio" name="hotel_bestyn" value="N" checked="checked">미사용
								</c:otherwise>
							</c:choose>

					<label style="margin-left:100px;">Hot Hotel</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<c:choose>
								<c:when test='${hotelVO.hotel_hotyn=="Y"}' >
									<input type="radio" name="hotel_hotyn" value="Y" checked="checked">사용
								 	<input type="radio" name="hotel_hotyn" value="N">미사용
								</c:when>
								<c:otherwise>
									<input type="radio" name="hotel_hotyn" value="Y" >사용
							  		<input type="radio" name="hotel_hotyn" value="N" checked="checked">미사용
								</c:otherwise>
							</c:choose>
			</div>

			<div class="field" >
					<label>숙소명</label>	<input type="text" name="hotel_name"  value="${hotelVO.hotel_name}" />
			</div>

			<div class="field" >
					<label>위치</label>  <input type="text" name="hotel_location"  value="${hotelVO.hotel_location}"  />
			</div>


			<div class="field" >
					<label>상세설명</label>
					<textarea name="hotel_description" rows="8" style="flex:4;">${hotelVO.hotel_description}</textarea>
			</div>
			<div class="field" >
					<label>숙소 이미지</label>
					<div style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start">
						<input type="hidden" name="hotel_image" id="image" value="${hotelVO.hotel_image}"  >
						<input type="hidden" name="hotel_savefilename" id="savefilename" value="${hotelVO.hotel_savefilename}" >
						<div id="filename">
							${hotelVO.hotel_image}
							<img src="/hotel_images/${hotelVO.hotel_savefilename}" width="150" />
						</div>

					</div>
			</div>
			<div class="btn" >
					<input type="submit" value="수정" >
					<input type="button" value="목록으로" onClick="location.href='adminHotelList'">
			</div>
	</form>


	<div  style="position:relative;  border:1px solid black; width:500px; margin:0 auto; ">
		<form name="fromm" id="fileupHotelForm" method="post" enctype="multipart/form-data">
			<input type="file" name="fileimage">
			<input type="button" id="imageHotelAddBtn" value="추가">
		</form>
	</div>

</article>

