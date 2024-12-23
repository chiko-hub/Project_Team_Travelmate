<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article>
  <form>
    <h2> Hotel Detail </h2>
    &nbsp;
    <div class="field" style="border-top:1px dotted darkseagreen;">
      <label>Name</label><div>${hotelVO.hotel_name}</div>
    </div>
    <div class="field" style="border-top:1px dotted darkseagreen;">
      <label>Location</label><div>${hotelVO.hotel_location}</div>
    </div>
    <div class="field" style="border-top:1px dotted darkseagreen;">
      <label>Info.</label><div>${hotelVO.hotel_description}</div>
    </div>
    <div class="field" style="border-top:1px dotted darkseagreen; border-bottom:2px solid darkseagreen;">
      <label>Image</label>
      <div><img src="hotel_images/${hotelVO.hotel_savefilename}" width="300"></div>
    </div>
    <div class="btn">
      <input  type="button" value="Edit" onClick="go_mod_H('${hotelVO.hotel_seq}')">
      <input  type="button" value="Delete" onClick="deleteHotel('${hotelVO.hotel_seq}')">
      <input type="button" value="Back"
             onClick="location.href='adminHotelList'">
    </div>

  </form>
</article>

