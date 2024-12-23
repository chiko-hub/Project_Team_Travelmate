<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article style="flex-direction: column">
    <form name="hotelWriteFrm" method="post"  action="adminHotelWrite">
          <h2> Add Hotel </h2>
          &nbsp;
          <div class="field" >
                <label>Name</label> <input type="text" name="hotel_name"  value="${hotelVO.hotel_name}"  />
          </div>

          <div class="field" >
             <label>Location</label>  <input type="text" name="hotel_location"  value="${hotelVO.hotel_location}"  />
          </div>

          <div class="field" >
                <label>Info.</label><textarea name="hotel_description" rows="8" style="flex:4;">${hotelVO.hotel_description}</textarea>
          </div>
          <div class="field" >
                <label>Image</label>
                <c:choose>
                   <c:when test="${ empty hotelVO.hotel_image }">
                      <div style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start">
                         <input type="hidden" name="hotel_image" id="image" > <!-- 전송될 파일이름 -->
                         <input type="hidden" name="hotel_savefilename" id="savefilename" >
                         <div id="filename"> </div>

                      </div>
                   </c:when>
                   <c:otherwise>
                      <div style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start">
                         <input type="hidden" name="hotel_image" id="image" value="${hotelVO.hotel_image}"  >
                         <input type="hidden" name="hotel_savefilename" id="savefilename" value="${hotelVO.hotel_savefilename}" >
                         <div id="filename">${hotelVO.hotel_savefilename}</div>
                         <img src="/hotel_images/${hotelVO.hotel_savefilename}" width="150" />
                      </div>
                   </c:otherwise>
                </c:choose>
          </div>
          <div class="btn" >
                <input type="submit" value="Add" >
                <input type="button" value="Back"  onClick="location.href='adminHotelList'">
          </div>

          <div class="field" >
             <label>${message}</label>
          </div>
    </form>

    <div class="file-upload-container">
        <form name="fromm" id="fileupHotelForm" method="post" enctype="multipart/form-data">
            <div class="file-input-container">
                <label for="fileimage" class="file-label">
                    <span>Select Image</span>
                    <input type="file" name="fileimage" id="fileimage" class="file-input" accept="image/*" onchange="previewImage(event)">
                </label>
            </div>

            <div class="preview-container">
                <img id="image-preview" src="#" alt="미리보기 이미지 없음" class="image-preview">
            </div>

            <button type="button" id="imageHotelAddBtn" class="btn-upload">Add Image</button>
        </form>
    </div>
</article>