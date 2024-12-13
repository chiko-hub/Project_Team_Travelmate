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