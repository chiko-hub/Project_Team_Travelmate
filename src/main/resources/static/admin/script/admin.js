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
    location.href="adminHotelWriteForm";
}

// 이미지 업로드
function uploadImage() {
    var formData = new FormData();
    var fileInput = document.getElementById('place_image'); // 이미지 input ID
    formData.append("fileimage", fileInput.files[0]);

    return $.ajax({
        url: "/fileup",  // 서버의 업로드 엔드포인트
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            if (response.error) {
                alert("이미지 업로드 실패: " + response.error);
                console.error(response);  // 디버깅을 위한 로그 출력
                return null;
            }
            console.log("파일 업로드 성공:", response);  // 성공 시 로그 출력
            return response.savefilename;
        },
        error: function(xhr, status, error) {
            alert("AJAX Error: " + xhr.status + " " + xhr.statusText + "\n" + error);
            console.error("AJAX 오류: ", xhr.responseText);  // 오류 본문 출력
            console.error("상태 코드: ", xhr.status);
            console.error("상태 텍스트: ", xhr.statusText);
        }
    });
}



function go_save(){
    var theForm = document.placeWriteFrm;
    if (theForm.place_name.value == "") {
        alert('장소명을 입력하세요.'); 				theForm.place_name.focus();
    } else if (theForm.place_location.value == "") {
        alert('장소 주소를 입력하세요.'); 				theForm.place_location.focus();
    } else if (theForm.place_description.value == "") {
        alert('장소 설명을 입력하세요.'); 			theForm.place_description.focus();
    } else if (theForm.place_image.value == "") {
        alert('장소 이미지를 입력하세요.');		theForm.place_image.focus();
    } else{
        theForm.action = "adminPlaceWrite";
        theForm.submit();
    }
}



function go_mod_P(place_seq){
    location.href="adminPlaceUpdateForm?place_seq=" + place_seq;
}

function go_mod_H(hotel_seq){
    location.href="adminHotelUpdateForm?hotel_seq=" + hotel_seq;
}



function go_update(){
    var theForm = document.placeWriteFrm;
    if( theForm.category.value==""){
        alert('상품분류를 선택하세요');
        theForm.category.focus();
    }else if (theForm.name.value == "") {
        alert('상품명을 입력하세요.'); 				theForm.name.focus();
    } else if (theForm.price1.value == "") {
        alert('원가를 입력하세요.'); 				theForm.price1.focus();
    } else if (theForm.price2.value == "") {
        alert('판매가를 입력하세요.'); 			theForm.price2.focus();
    } else if (theForm.content.value == "") {
        alert('상품상세를 입력하세요.'); 		theForm.content.focus();
    } else{
        theForm.action = "adminPlaceUpdate";
        theForm.submit();
    }

}



function deletePlace(place_seq) {
    var ans = confirm("정말로 삭제할까요?");
    if (ans) {
        location.href = "deletePlace?place_seq=" + place_seq;
    }

function deleteHotel(hotel_seq) {
    var ans = confirm("정말로 삭제할까요?");
    if (ans) {
        location.href = "deleteHotel?hotel_seq=" + hotel_seq;
    }


    }


    function go_rep() {
        if (document.frm.reply.value == "") {
            alert("답변내용을 입력하세요");
            document.frm.reply.focus();
        } else {
            document.frm.action = "adminQnaReplyUpdate";
            document.frm.submit();
        }
    }
}
















