<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article>
	<form>
			<h2> Place Detail </h2>
			&nbsp;
			<div class="field" style="border-top:1px dotted darkseagreen;">
					<label>Name</label><div>${placeVO.place_name}</div>
			</div>
			<div class="field" style="border-top:1px dotted darkseagreen;">
					<label>Location</label><div>${placeVO.place_location}</div>
			</div>
			<div class="field" style="border-top:1px dotted darkseagreen;">
					<label>Info.</label><div>${placeVO.place_description}</div>
			</div>
			<div class="field" style="border-top:1px dotted darkseagreen; border-bottom:2px solid darkseagreen;">
					<label>Image</label>
					<div><img src="place_images/${placeVO.savefilename}" width="300"></div>
			</div>
			<div class="btn">
				<input  type="button" value="Edit" onClick="go_mod_P('${placeVO.place_seq}')">
				<input  type="button" value="Delete" onClick="deletePlace('${placeVO.place_seq}')">
				<input  type="button" value="Back"
					onClick="location.href='adminPlaceList'">
			</div>

	</form>
</article>

