/* 선택된 category에 따라 데이터 가져오기 */
document.addEventListener("DOMContentLoaded", function () {
    const hotelCategoryButtons = document.querySelectorAll(".hotelCategoryButton");

    // 페이지 처음 로드 시 기본 선택된 버튼 확인
    const selectedButton = document.querySelector(".hotelCategoryButton.selected") || hotelCategoryButtons[0];
    if (selectedButton) {
        const initialCategory = selectedButton.value;
        fetchHotelList(initialCategory);
    }

    hotelCategoryButtons.forEach(button => {
        button.addEventListener("click", function () {
            // 모든 버튼에서 'selected' 클래스 제거
            hotelCategoryButtons.forEach(btn => btn.classList.remove("selected"));

            // 클릭된 버튼에 'selected' 클래스 추가
            this.classList.add("selected");

            // 선택된 카테고리 값 가져오기
            const selectedCategory = this.value;

            // 카테고리 클릭 시 검색어 초기화
            document.querySelector("input[name='key']").value = "";

            // 카테고리 클릭 시 'first' 파라미터를 true로 설정하여 AJAX 요청
            fetchHotelList(selectedCategory, 1, true);
        });
    });

    // 검색 버튼 클릭 시
    const searchButton = document.querySelector(".searchButton");
    searchButton.addEventListener("click", function() {
        const selectedCategory = document.querySelector(".hotelCategoryButton.selected") ? document.querySelector(".hotelCategoryButton.selected").value : 'all'; // 현재 선택된 카테고리 값
        fetchHotelList(selectedCategory, 1, true); // 검색어와 함께 페이지 1로 요청
    });
});

/* 카테고리와 검색어를 포함한 페이지 이동 및 페이징 처리 */
function fetchHotelList(hotelCategory, page = 1, isFirstRequest = false) {
    const key = document.querySelector("input[name='key']").value; // 현재 검색어 값

    // 카테고리 값과 검색어, 페이지를 URL에 포함하여 요청
    fetch(`/hotelSelect?hotelCategory=${hotelCategory}&page=${page}&key=${key}&first=${isFirstRequest}`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        },
    })
        .then(response => {
            if (!response.ok) throw new Error("Failed to fetch data");
            return response.text(); // 서버에서 JSP fragment를 반환하는 경우
        })
        .then(html => {
            const hotelContainer = document.querySelector(".hotel");
            hotelContainer.innerHTML = html; // 서버에서 받은 HTML로 갱신
            attachEventListeners(); // 동적으로 추가된 콘텐츠에 이벤트 핸들러 등록
        })
        .catch(error => console.error("Error fetching hotel list:", error));
}

/* hotel 의 상세 정보를 나타내는 함수 */
$(document).ready(function () {
    // hotelImage hotelText 클릭 이벤트
    $('.hotel').on('click', '.hotelImage, .hotelText', function () {
        const hotelSeq = $(this).data('hotel-seq'); // 클릭한 항목의 hotel_seq 가져오기

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