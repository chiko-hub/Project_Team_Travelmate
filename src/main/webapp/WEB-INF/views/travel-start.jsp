<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>TravelMate</title>
  <!-- 외부 CSS 파일 연결 -->
  <link rel="stylesheet" href="/css/main.css">
  <!-- JavaScript 연결 -->
  <script defer src="scripts/script.js"></script>
</head>
<body>
<div class="container">
  <!-- 좌측 사이드바 -->
  <div class="sidebar">
    <div class="dropdown">
      <button class="dropdown-btn">STEP 1 날짜 확인</button>
      <div class="dropdown-content">
        <label for="start-date">출발 날짜:</label>
        <input type="date" id="start-date" name="startDate">
        <label for="end-date">도착 날짜:</label>
        <input type="date" id="end-date" name="endDate">
        <button>날짜 설정</button>
      </div>
    </div>
    <div class="dropdown">
      <button class="dropdown-btn">STEP 2 장소 선택</button>
      <div class="dropdown-content">
        <input type="text" placeholder="장소를 검색하세요">
        <button>장소 검색</button>
      </div>
    </div>
    <div class="dropdown">
      <button class="dropdown-btn">STEP 3 숙소 선택</button>
      <div class="dropdown-content">
        <input type="text" placeholder="숙소를 검색하세요">
        <button>숙소 검색</button>
      </div>
    </div>
    <div class="dropdown">
      <button class="dropdown-btn">STEP 4 찜</button>
      <div class="dropdown-content">
        <input type="text" placeholder="찜 목록을 확인하세요">
        <button>찜 검색</button>
      </div>
    </div>
    <div class="dropdown">
      <button class="dropdown-btn">STEP 5 일정</button>
      <div class="dropdown-content">
        <input type="text" placeholder="일정을 확인하세요">
        <button>일정 검색</button>
      </div>
    </div>
  </div>

  <!-- 중앙 진행 표시 -->
  <main class="main">
    <h1>진행 보기</h1>
    <div id="results">
      <p>STEP의 진행이 여기에 표시됩니다.</p>
    </div>
  </main>

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
