<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article>
  <form>
    <h2> Hotel Detail </h2>
    <div class="field" style="border-top:1px dotted darkseagreen;">
      <label>숙소명</label><div>${hotelVO.hotel_name}</div>
    </div>
    <div class="field" style="border-top:1px dotted darkseagreen;">
      <label>주소</label><div>${hotelVO.hotel_location}</div>
    </div>
    <div class="field" style="border-top:1px dotted darkseagreen;">
      <label>상세설명</label><div><pre>${hotelVO.hotel_description}</pre></div>
    </div>
    <div class="field" style="border-top:1px dotted darkseagreen; border-bottom:2px solid darkseagreen;">
      <label>숙소 이미지</label>
      <div><img src="hotel_images/${hotelVO.hotel_savefilename}" width="300"></div>
    </div>
    <div class="btn">
      <input  type="button" value="수정" onClick="go_mod_H('${hotelVO.hotel_seq}')">
      <input  type="button" value="삭제" onClick="deleteHotel('${hotelVO.hotel_seq}')">
      <input type="button" value="목록"
             onClick="location.href='adminHotelList'">
    </div>

  </form>
</article>

