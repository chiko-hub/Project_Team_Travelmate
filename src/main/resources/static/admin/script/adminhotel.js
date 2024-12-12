function go_write_H(){
    location.href="adminHotelWriteFormNew";
}

// $(function(){
//     $('#imageAddBtn').click( function(){
//         var formselect = $('#fileupForm')[0];   // 지목된 폼을 변수에 저장
//         var formData = new FormData( formselect );
//         $.ajax(
//             {
//                 url:"<%=request.getContextPath()%>/fileupload" ,
//                 type:"POST",
//                 enctype:"multipart/form-data",
//                 data: formData,
//                 timeout: 10000,
//                 contentType : false,
//                 processData : false,
//
//                 success: function( data ){
//                     $('#filename').html("<div>" + data.image + "</div>" );
//                     $("#filename").append("<img src='/hotel_images/" + data.savefilename + "' height='150'/>");
//                     $('#image').val( data.image );
//                     $('#savefilename').val( data.savefilename );
//                 },
//                 error:function(){  alert("실패"); },
//             }
//         );
//     });
// });