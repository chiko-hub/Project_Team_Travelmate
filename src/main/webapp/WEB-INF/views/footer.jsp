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
            center: new kakao.maps.LatLng(37.5728, 126.9875), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
          };

  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
  var geocoder = new kakao.maps.services.Geocoder(); // 주소 검색 객체 생성
  var marker = new kakao.maps.Marker({ map: map }); // 마커 초기화

  // 메시지 이벤트 리스너
  window.addEventListener("message", function (event) {
    if (event.data.type === "updateMap") {
      const address = event.data.address;
      console.log("받은 주소:", address); // 주소 출력

      if (address) {
        geocoder.addressSearch(address, function (result, status) {
          if (status === kakao.maps.services.Status.OK) {
            const coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 마커 위치 업데이트
            marker.setPosition(coords);

            // Infowindow에 표시할 내용 설정
            const infowindow = new kakao.maps.InfoWindow({
              content: '<div style="padding:5px; font-size:12px;">여기야 바로 여기!</div>' // 문구 수정 가능
            });

            // Infowindow를 지도에 표시
            infowindow.open(map, marker);

            // 지도 중심 이동
            map.setCenter(coords);
          } else {
            console.error("주소 검색 실패:", address);
            alert("해당 주소를 찾을 수 없습니다.");
          }
        });
      } else {
        alert("전달된 주소가 비어 있습니다.");
      }
    }
  });

</script>
</body>
</html>