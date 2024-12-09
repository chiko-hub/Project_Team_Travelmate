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



function go_mod(pseq){
    location.href="adminProductUpdateForm?pseq=" + pseq;
}



function go_update(){
    var theForm = document.productWriteFrm;
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
        theForm.action = "adminProductUpdate";
        theForm.submit();
    }

}



function deleteProduct(pseq){
    var ans = confirm("정말로 삭제할까요?");
    if( ans ){
        location.href="deleteProduct?pseq=" + pseq;
    }








}





function go_rep(){
    if( document.frm.reply.value==""){
        alert("답변내용을 입력하세요");
        document.frm.reply.focus();
    }else{
        document.frm.action = "adminQnaReplyUpdate";
        document.frm.submit();
    }
}
















