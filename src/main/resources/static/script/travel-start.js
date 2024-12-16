// 페이지 로드 시 자동으로 getWeather() 호출
window.onload = function () {
    getWeather(); // 서울 날씨를 첫 화면에 출력
};

async function getWeather() {
    const city = document.getElementById('city').value || 'seoul'; // 기본값: 서울
    const apiKey = '2e039e364c06a18d05a67212be842234'; // OpenWeatherMap API 키
    const apiUrl = `https://api.openweathermap.org/data/2.5/forecast?q=${encodeURIComponent(city)}&appid=${apiKey}&units=metric&lang=kr`;

    try {
        const response = await fetch(apiUrl);
        if (!response.ok) {
            throw new Error('City not found or API error');
        }
        const data = await response.json();

        // 현지 시간 계산
        const currentUtcTime = new Date().getTime(); // 현재 UTC 시간
        const timezoneOffset = data.city.timezone * 1000; // 도시 시간대 오프셋 (초 -> 밀리초)
        const localTime = new Date(currentUtcTime + timezoneOffset); // 도시의 현지 시간 계산
        const hour = localTime.getUTCHours(); // 도시 기준 현지 시간 (0~23)

        console.log('Current UTC Time:', new Date(currentUtcTime).toISOString());
        console.log('City Timezone Offset (seconds):', data.city.timezone);
        console.log('Local Time:', localTime.toString());
        console.log('Hour (Local Time):', hour);

        // 낮/밤 판단
        const isDaytime = hour >= 6 && hour < 18; // 낮: 6시 ~ 18시 (도시 기준)

        // 오늘의 날씨 데이터 추출
        const todayWeather = data.list[0];
        const tomorrowWeather = data.list[8]; // 내일 첫 데이터

        // 낮/밤에 따른 아이콘 설정
        const todayIconCode = todayWeather.weather[0].icon.replace(/[dn]/, isDaytime ? 'd' : 'n');
        const tomorrowIconCode = tomorrowWeather.weather[0].icon.replace(/[dn]/, isDaytime ? 'd' : 'n');

        const todayIcon = `https://openweathermap.org/img/wn/${todayIconCode}.png`;
        const tomorrowIcon = `https://openweathermap.org/img/wn/${tomorrowIconCode}.png`;

        // HTML에 날씨 데이터 표시
        document.getElementById('weather-container').innerHTML = `
            <div style="display: flex; gap: 10px;">
                <div class="weather-card">
                    <h3>오늘의 날씨 [${data.city.name}]</h3>
                    <img src="${todayIcon}" alt="Today's Weather Icon" class="weather-icon">
                    <p>기온: ${todayWeather.main.temp} °C</p>
                    <p>날씨: ${todayWeather.weather[0].description}</p>
                </div>
                <div class="weather-card">
                    <h3>내일의 날씨 [${data.city.name}]</h3>
                    <img src="${tomorrowIcon}" alt="Tomorrow's Weather Icon" class="weather-icon">
                    <p>기온: ${tomorrowWeather.main.temp} °C</p>
                    <p>날씨: ${tomorrowWeather.weather[0].description}</p>
                </div>
            </div>
        `;

        // 날씨 컨테이너 표시
        document.getElementById('weather-container').style.display = 'flex';

    } catch (error) {
        console.error('Error fetching weather data:', error.message);
        document.getElementById('weather-container').innerHTML = `
            <p style="color: red;">Error: ${error.message}</p>
        `;
    }
}

// Enter 키 이벤트 감지
document.getElementById('city').addEventListener('keypress', function(event) {
    if (event.key === 'Enter') {
        getWeather();
    }
});


// 오늘의 인생샷 추천
function generatePhotoPoint() {
    const points = [
        '"경복궁의 근정전 앞에서 사진을 찍어보세요!"',
        '"한강 야경을 배경으로 반포대교 무지개 분수쇼를 담아보세요!"',
        '"남산 서울타워 아래에서 야경을 찍어보세요!"',
        '"북촌 한옥마을 골목길에서 전통미 가득한 인생샷을 남겨보세요!"',
        '"덕수궁 돌담길을 따라 걸으며 고즈넉한 풍경을 느껴보세요!"',
        '"청계천 야경 속 빛나는 LED 조형물과 함께 추억을 남겨보세요!"',
        '"팔공산 케이블카에서 탁 트인 전경의 멋진 사진을 찍어보세요!"',
        '"이월드 83타워에서 대구 전경을 한눈에 담아보세요!"',
        '"동성로 카페거리를 배경으로 나만의 감성사진을 찍어보세요!"',
        '"해운대 해수욕장 일몰을 배경으로 로맨틱한 인생샷을 남겨보세요!"',
        '"제주도의 성산일출봉에서 멋진 풍경을 담아보세요!"',
        '"천지연 폭포의 웅장한 자연과 함께 감동적인 순간을 담아보세요!"',
        '"한라산 어리목에서 계절마다 다른 풍경을 감상하세요!"'
    ];
    const randomPoint = points[Math.floor(Math.random() * points.length)];
    document.getElementById('travel-point').textContent = randomPoint;
}
