function go_search( url ){
    document.frm.action = url;
    document.frm.submit();
}

function go_detail_P( place_seq ){
    location.href="adminPlaceDetail?place_seq=" + place_seq;
}

function go_detail_H( hotel_seq ){
    location.href="adminHotelDetail?hotel_seq=" + hotel_seq;
}

function go_write_P(){
    location.href="adminPlaceWriteForm";
}

function go_write_H(){
    location.href="adminHotelWriteFormNew";
}

function go_mod_P(place_seq){
    location.href="adminPlaceUpdateForm?place_seq=" + place_seq;
}

function go_mod_H(hotel_seq){
    location.href="adminHotelUpdateForm?hotel_seq=" + hotel_seq;
}

function deletePlace(place_seq) {
    var ans = confirm("정말로 삭제할까요?");
    if (ans) {
        location.href = "/adminPlaceDelete?place_seq=" + place_seq;
    }
}

function deleteHotel(hotel_seq) {
    var ans = confirm("정말로 삭제할까요?");
    if (ans) {
        location.href = "/adminHotelDelete?hotel_seq=" + hotel_seq;
    }
}

function previewImage(event) {
    const fileInput = event.target;
    const preview = document.getElementById('image-preview');
    const file = fileInput.files[0];

    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            preview.src = e.target.result;
            preview.style.display = 'block'; // 미리보기 이미지 표시
        };
        reader.readAsDataURL(file);
    } else {
        preview.src = '#';
        preview.style.display = 'none'; // 파일이 없을 경우 숨김
    }
}

document.addEventListener("DOMContentLoaded", function () {
    const menuLinks = document.querySelectorAll("#sub_menu .menu-link");
    const currentPath = window.location.pathname; // 현재 URL 경로 가져오기

    // 현재 URL 경로에 따라 'selected' 클래스 추가
    menuLinks.forEach(link => {
        const linkPath = new URL(link.href).pathname; // 링크의 경로 가져오기
        if (currentPath === linkPath) {
            link.classList.add("selected");
        }
    });
});


