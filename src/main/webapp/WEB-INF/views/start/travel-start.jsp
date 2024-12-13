<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Planner</title>
    <link rel="stylesheet" href="/css/travel-start.css">
    <script defer src="/script/travel-start.js"></script>
</head>
<body>
<div class="startcontainer">
    <div class="startbox">
        <div class="center1" style="margin-left:20px; text-align:center;">
            <h1> 당신만의 여행 일정을 만들어보세요 </h1>
            <p>여행 계획을 더욱 효과적으로 세워 보세요. 모든 여행은 여기에서 시작됩니다.</p>
        </div>
    </div>

    <div class="stepbox">
        <div id="start-row">
            <form class="travel-point" name="travel-checklist">
                <div class="step">
                    <h2>Step 1</h2>
                    <img src="/images/step1.jpg"/>
                    <p>가고 싶은 Place를 선택하세요</p>
                </div>
            </form>
        </div>
        <div id="start-row">
            <form class="travel-point" name="travel-checklist">
                <div class="step">
                    <h2>Step 2</h2>
                    <img src="/images/step2.jpg"/>
                    <p>가고 싶은 Hotel을 선택하세요</p>
                </div>
            </form>
        </div>
        <div id="start-row">
            <form class="travel-point" name="travel-checklist">
                <div class="step">
                    <h2>Step 3</h2>
                    <img src="/images/step3.jpg"/>
                    <p>자신이 선택한 곳들을 확인할 수 있습니다</p>
                </div>
            </form>
        </div>
        <div id="start-row">
            <form class="travel-point" name="travel-checklist">
                <div class="step">
                    <h2>Step 4</h2>
                    <img src="/images/step4.jpg"/>
                    <p>자신만의 일정을 짜서 친구들과 공유하세요</p>
                </div>
            </form>
        </div>
    </div>

    <div id="start-row">
        <form class="travel-suggest">
            <div class="suggest">
                <h2>오늘의 인생샷 추천 포인트</h2>
                <p id="photo-point" class="start-fixed-height">"경복궁의 근정전 앞에서 사진을 찍어보세요!"</p>
                <button class="button" type="button" onclick="generatePhotoPoint()">새로운 추천 보기</button>
            </div>
        </form>
    </div>
    <h1>Weather Information</h1>
    <input type="text" id="city" placeholder="Enter city name" />
    <button onclick="getWeather()">Get Weather</button>
    <div id="weather-container"></div>



</div>
<%@ include file="../footer2.jsp" %>





<script>
    // 12번: 랜덤 인생샷 추천 기능
    function generatePhotoPoint() {
        const points = [
            '"경복궁의 근정전 앞에서 사진을 찍어보세요!"',
            '"제주도의 성산일출봉에서 멋진 풍경을 담아보세요!"',
            '"남산 서울타워 아래에서 야경을 찍어보세요!"',
            '"부산 해운대 해변에서 일몰을 배경으로 찍어보세요!"'
        ];
        const randomPoint = points[Math.floor(Math.random() * points.length)];
        document.getElementById('photo-point').textContent = randomPoint;
    }
</script>



