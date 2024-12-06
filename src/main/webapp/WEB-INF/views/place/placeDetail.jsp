<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Place Search</title>
  <link rel="stylesheet" href="/css/sider.css">
  <link rel="stylesheet" href="/css/place.css">
</head>


  <!-- 좌측 STEP 메뉴 -->
  <div class="sidebar">
    <button class="step-button" onclick="location.href='placeSelect'">STEP 1<br>장소 선택</button>
    <button class="step-button" onclick="showContent('step3')">STEP 2<br>숙소 선택</button>
    <button class="step-button" onclick="showContent('step4')">STEP 3<br>찜꽁</button>
    <button class="step-button" onclick="showContent('step5')">STEP 4<br>일정</button>
  </div>
<div id="detail-content">
  <div class="place_sub"><img src="images/place/place_detail_background.jpg" /></div>


  <form method="post" name="placeform">
    <div id="placedetail" style="display: flex; justify-content: center; align-items: center; gap: 20px; margin: 20px auto;">
      <div class="placedetail-img-title" style="flex: 1; max-width: 400px;">
        <div><img src="place_images/${place.savefilename}"
                  style="width: 100%; border-radius: 10px;" />
        </div>
      </div>

      <div class="itemdetail-content" style="flex: 1; max-width: 400px; padding: 20px; border-radius: 10px; font-size: 1.5em; font-weight: bold;">
          <label><h2>${place.place_name}</h2></label>
          <label><p>${place.place_location}</p></label>
           <label><h3 style="font-size:120%;">${place.place_description}</h3></label>
      </div>
    </div>

    <!-- 하단 가운데 버튼 -->
    <div class="btn-container" style="display: flex; justify-content: center; margin-top: 20px; gap: 20px;">
      <input type="button" value="찜콩" class="btn-style" onclick="go_wish()">
      <input type="button" value="메인으로" class="btn-style" onclick="location.href='/'">
    </div>
  </form>


</div>




