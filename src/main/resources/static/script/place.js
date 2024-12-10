/* 패널 열고 닫기 */
function go_search( url ){
    document.frm.action = url;
    document.frm.submit();
}

function resetSearch() {
    window.location.href = '/placeList?first=true'; // 초기화 URL로 이동
}

function search_best(){


}