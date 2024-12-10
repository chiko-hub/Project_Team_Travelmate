/* 패널 열고 닫기 */
function go_search( url ){
    document.frm.action = url;
    document.frm.submit();
}

function resetSearch() {
    window.location.href = '/placeList?first=true'; // 초기화 URL로 이동
}

$(document).ready(function () {
    // 장소 아이템 클릭 이벤트
    $('.place .item').on('click', function () {
        const placeSeq = $(this).data('place-seq'); // 클릭한 항목의 place_seq 가져오기

        // AJAX 요청
        $.ajax({
            url: '/placeDetail',
            type: 'GET',
            data: { place_seq: placeSeq },
            headers: { 'X-Requested-With': 'XMLHttpRequest' },
            success: function (data) {
                $('#modalContent').html(data); // 받은 데이터를 모달에 삽입
                $('#customModal').fadeIn(); // 모달 열기
            },
            error: function () {
                alert('상세 정보를 불러오는 데 실패했습니다.');
            }
        });
    });

    // 모달 닫기 이벤트
    $('#closeModal').on('click', function () {
        $('#customModal').fadeOut();
    });

    // 모달 바깥 클릭 시 닫기
    $(window).on('click', function (e) {
        if ($(e.target).is('#customModal')) {
            $('#customModal').fadeOut();
        }
    });
});