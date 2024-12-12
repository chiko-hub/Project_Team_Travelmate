/* 패널 열고 닫기 */
function go_search(url) {
    document.frm.action = url;
    document.frm.submit();
}

// 1. place 정보창(ajax)
$(document).ready(function () {
    // 장소 아이템 클릭 이벤트
    $('.place img').on('click', function () {
        const placeSeq = $(this).data('place-seq'); // 클릭한 항목의 place_seq 가져오기

        // AJAX 요청
        $.ajax({
            url: '/placeDetail',   // 서버에서 상세 정보를 처리하는 URL
            type: 'GET',
            data: { place_seq: placeSeq },
            headers: { 'X-Requested-With': 'XMLHttpRequest' }, // AJAX 요청임을 서버에 알림
            success: function (data) {
                // 받은 데이터를 모달에 삽입
                $('#modalContent').html(data);
                // 모달 열기
                $('#customModal').fadeIn();
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

    // 2. 좋아요(하트) 버튼 클릭 시 이미지 전환 및 AJAX 요청 통합
    $(document).on('click', '#likeImageButton', function () {
        const img = $(this); // 현재 클릭된 이미지
        const placeSeq = img.data('place_seq'); // data-place_seq 값 가져오기

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
            data: JSON.stringify({ place_seq: placeSeq }), // 'place_seq'를 데이터로 전송
            success: function (response) {
                if (response.success) {
                    alert('좋아요가 추가되었습니다!');
                } else {
                    alert('좋아요 추가에 실패했습니다.');
                }
            },
            error: function () {
                console.error('좋아요 요청 중 오류 발생');
            }
        });
    });
});

// 3. placeList 우측 버튼(+) 클릭 시 이미지 전환 및 AJAX 요청 통합
document.addEventListener("DOMContentLoaded", () => {
    const toggleButtons = document.querySelectorAll(".toggle-button");

    toggleButtons.forEach((button) => {
        button.addEventListener("click", () => {
            button.classList.toggle("checked");

            const iconPlus = button.querySelector(".icon-plus");
            const iconCheck = button.querySelector(".icon-check");

            if (button.classList.contains("checked")) {
                iconPlus.style.display = "none";
                iconCheck.style.display = "inline-block";
            } else {
                iconPlus.style.display = "inline-block";
                iconCheck.style.display = "none";
            }
        });
    });
});