/* 패널 열고 닫기 */
function go_search( url ){
    document.frm.action = url;
    document.frm.submit();
}

function resetSearch() {
    window.location.href = '/hotelList?first=true'; // 초기화 URL로 이동
}