<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- 우측 지도 -->
<aside class="map">
  <div id="map"></div>
</aside>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a3ba5873499d60049e89465e5a52a688&libraries=services"></script>
<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(37.5728, 126.9875), // 지도의 초기 중심좌표
            level: 3 // 지도의 확대 레벨
          };

  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
  var geocoder = new kakao.maps.services.Geocoder(); // 주소 검색 객체 생성
  var marker = new kakao.maps.Marker({ map: map }); // 마커 초기화
  var infowindow = new kakao.maps.InfoWindow(); // 말풍선 객체 전역 선언
  var customOverlay = null; // CustomOverlay 객체 선언

  // JSP 변수를 JavaScript 변수로 전달
  const jspPlaceName = '<c:out value="${place.place_name}" />'; // JSP에서 전달된 place_name
  const jspHotelName = '<c:out value="${hotel.hotel_name}" />'; // JSP에서 전달된 place_name

  // 메시지 이벤트 리스너
  window.addEventListener("message", function (event) {
    if (event.data.type === "updateMap") {
      const address = event.data.address;
      const placeName = event.data.placeName || jspPlaceName || jspHotelName; // 전달된 Place 명 또는 JSP 기본 값 사용
      console.log("받은 주소:", address); // 주소 출력
      console.log("받은 Place 데이터:", { address, placeName }); // 데이터 확인용 로그

      if (address && placeName) {
        // 주소 검색
        geocoder.addressSearch(address, function (result, status) {
          if (status === kakao.maps.services.Status.OK) {
            const coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 기존 말풍선 닫기
            infowindow.close();

            // 기존 CustomOverlay 제거
            if (customOverlay) {
              customOverlay.setMap(null);
            }

            // 마커 위치 업데이트
            marker.setPosition(coords);

            // // 새 Infowindow 표시(기존 말풍선)
            // infowindow.setContent('<div style="padding:8px; font-size:14px; font-weight:bold; ">' + placeName + '</div>');
            // infowindow.open(map, marker);

            // CustomOverlay 설정
            customOverlay = new kakao.maps.CustomOverlay({
              map: map,
              position: coords,
              content:
                      '<div style="padding: 8px; font-size: 14px; font-weight: bold; color: #333; ' +
                      'background-color: #fff; border: 1px solid #ccc; border-radius: 5px; ' +
                      'box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2); text-align: center; white-space: nowrap;' +
                      'transform: translateY(-55px);">' +
                      placeName +
                      '</div>'
            });
            // 지도 중심 이동
            map.setCenter(coords);
          } else {
            console.error("주소 검색 실패:", address);
            alert("해당 주소를 찾을 수 없습니다.");
          }
        });
      } else {
        console.error("전달된 데이터가 올바르지 않습니다:", event.data);
        alert("전달된 주소가 비어 있습니다.11");
      }
    }
  });
</script>
</body>
</html>