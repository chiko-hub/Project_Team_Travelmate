<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article>
	<form>
			<h2> Place Detail </h2>
			<div class="field" style="border-top:1px dotted darkseagreen;">
					<label>Place name</label><div>${placeVO.place_name}</div>
			</div>
			<div class="field" style="border-top:1px dotted darkseagreen;">
					<label>Location</label><div>${placeVO.place_location}</div>
			</div>
			<div class="field" style="border-top:1px dotted darkseagreen;">
					<label>Info.</label><div><pre>${placeVO.place_description}</pre></div>
			</div>
			<div class="field" style="border-top:1px dotted darkseagreen; border-bottom:2px solid darkseagreen;">
					<label>Image</label>
					<div><img src="place_images/${placeVO.savefilename}" width="300"></div>
			</div>
			<div class="btn">
				<input  type="button" value="수정" onClick="go_mod_P('${placeVO.place_seq}')">
				<input  type="button" value="삭제" onClick="deletePlace('${placeVO.place_seq}')">
				<input  type="button" value="목록으로"
					onClick="location.href='adminPlaceList'">
			</div>
			
	</form>
</article>

