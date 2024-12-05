<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Interactive Steps</title>
  <link rel="stylesheet" href="/css/start.css">
  <script defer src="/script/start.js"></script>
</head>
<body>
<div class="container">
  <!-- 좌측 STEP 메뉴 -->
  <div class="sidebar">
    <button class="step-button" onclick="showContent('step1')">STEP 1<br>날짜 확인</button>
    <button class="step-button" onclick="showContent('step2')">STEP 2<br>장소 선택</button>
    <button class="step-button" onclick="showContent('step3')">STEP 3<br>숙소 선택</button>
    <button class="step-button" onclick="showContent('step4')">STEP 4<br>찜꽁</button>
    <button class="step-button" onclick="showContent('step5')">STEP 5<br>일정</button>
  </div>

  <!-- 중앙 콘텐츠 -->
  <h2>STEP 2: 찜꽁</h2>
  <input type="text" placeholder="찜꽁을 확인하세요">
  <button>찜꽁 확인</button>

  <!-- 우측 지도 -->
  <aside class="map">
    <div id="map"></div>
  </aside>
</div>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a3ba5873499d60049e89465e5a52a688"></script>
<script>
  var container = document.getElementById('map');
  var options = {
    center: new kakao.maps.LatLng(33.450701, 126.570667),
    level: 3
  };
  var map = new kakao.maps.Map(container, options);
</script>
</body>
</html>
