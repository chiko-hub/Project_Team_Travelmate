async function getWeather() {
    const city = document.getElementById('city').value || 'Seoul';
    const apiKey = '2e039e364c06a18d05a67212be842234'; // OpenWeatherMap API 키를 입력하세요
    const apiUrl = `https://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=${apiKey}&units=metric`;

    try {
        const response = await fetch(apiUrl);
        if (!response.ok) {
            throw new Error('City not found or API error');
        }
        const data = await response.json();

        // 오늘의 날씨 데이터 추출 (첫 번째 항목)
        const todayWeather = data.list[0];
        const tomorrowWeather = data.list[8]; // 3시간 간격 데이터 기준으로 내일 첫 데이터

        // HTML에 날씨 데이터 표시
        document.getElementById('weather-container').innerHTML = `
                    <div class="weather-card">
                        <h2>Today's Weather in ${data.city.name}</h2>
                        <p>기온: ${todayWeather.main.temp} °C</p>
                        <p>날씨: ${todayWeather.weather[0].description}</p>
                    </div>
                    <div class="weather-card">
                        <h2>Tomorrow's Weather in ${data.city.name}</h2>
                        <p>기온: ${tomorrowWeather.main.temp} °C</p>
                        <p>날씨: ${tomorrowWeather.weather[0].description}</p>
                    </div>
                `;
    } catch (error) {
        document.getElementById('weather-container').innerHTML = `
                    <p style="color: red;">Error: ${error.message}</p>
                `;
    }
}