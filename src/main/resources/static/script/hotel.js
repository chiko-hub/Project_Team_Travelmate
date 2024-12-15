/* 패널 열고 닫기 */
function go_search( url ){
    document.frm.action = url;
    document.frm.submit();
}

// 1. hotel 정보창(ajax)
$(document).ready(function () {
    // 호텔 아이템 클릭 이벤트
    $('.hotel img').on('click', function () {
        const hotelSeq = $(this).data('hotel-seq'); // 클릭한 항목의 place_seq 가져오기

        // AJAX 요청
        $.ajax({
            url: '/hotelDetail',
            type: 'GET',
            data: { hotel_seq: hotelSeq },
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


// [[2. 좋아요 버튼 클릭 시 이미지 전환 및 AJAX 요청 통합 ]]
$(document).on('click', '#likeImageButton', function () {
    const img = $(this); // 현재 클릭된 이미지
    const hotel_seq = $(this).data('hotel_seq'); // data-hotel_seq 값 가져오기

    // 이미지 전환 로직
    if (img.attr('src').includes("heartbefore.png")) {
        img.attr('src', "/images/heartafter.png"); // heartafter 이미지로 변경
    } else {
        img.attr('src', "/images/heartbefore.png"); // heartbefore 이미지로 변경
    }
    // AJAX 요청
    $.ajax({
        url: '/like',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ hotel_seq: hotel_seq }), // 데이터베이스와 일치하는 'hotel_seq'로 전달
        success: function (response) {
            if (response.success) {
                alert('좋아요가 추가되었습니다!');
            } else {
                alert('좋아요 추가에 실패했습니다.');
            }
        },
        error: function () {
            console.error('오류 발생');
        }
    });
});