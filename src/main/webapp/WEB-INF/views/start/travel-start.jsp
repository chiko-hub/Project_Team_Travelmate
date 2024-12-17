<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="startContainer">
    <div class="startBox">
        <div class="center1">
            <h1> 당신만의 여행 일정을 만들어보세요</h1>
            <p>여행 계획을 더욱 효과적으로 세워 보세요. 모든 여행은 여기에서 시작됩니다.</p>
        </div>
    </div>
    <!-- stepBox -->
    <div class="stepBox">
        <div class="start-row">
            <form class="travel-point">
                <div class="step">
                    <h2>STEP 1</h2>
                    <img src="/images/step1.jpg"/>
                </div>
                <p>가고 싶은 Place를 선택하세요</p>
            </form>
        </div>
        <div class="start-row">
            <form class="travel-point" name="travel-checklist">
                <div class="step">
                    <h2>STEP 2</h2>
                    <img src="/images/step2.jpg"/>
                </div>
                <p>가고 싶은 Hotel을 선택하세요</p>
            </form>
        </div>
        <div class="start-row">
            <form class="travel-point" name="travel-checklist">
                <div class="step">
                    <h2>STEP 3</h2>
                    <img src="/images/step3.jpg"/>
                </div>
                <p>자신이 선택한 곳들을 확인할 수 있습니다</p>
            </form>
        </div>
        <div class="start-row">
            <form class="travel-point" name="travel-checklist">
                <div class="step">
                    <h2>STEP 4</h2>
                    <img src="/images/step4.jpg"/>
                </div>
                <p>자신만의 일정을 짜서 친구들과 공유하세요</p>
            </form>
        </div>
    </div>
    <!-- Bottom Row -->
    <div class="bottom-row">
        <div class="travel-suggest" >
            <h2>오늘의 인생샷 추천</h2>
            <p id="travel-point">"경복궁의 근정전 앞에서 사진을 찍어보세요!"</p>
            <button class="suggest-button" type="button" onclick="generatePhotoPoint()">새로운 추천 보기</button>
        </div>
        <div class="weather">
            <h2>날씨 정보</h2>
            <input type="text" id="city" placeholder="도시명(영문) 입력"/>
            <button class="suggest-button" type="button" onclick="getWeather()">날씨 검색</button>
        </div>
        <div id="weather-container"></div><!-- 날씨 데이터 출력 -->
    </div>
</div>
<%@ include file="../footer2.jsp" %>