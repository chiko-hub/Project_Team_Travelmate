<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Update Member</title>
  <link rel="stylesheet" href="/css/login.css">
  </head>
<body style="box-sizing:border-box;padding:2px">
<div class="container" style="box-sizing: border-box; width:100vw; height:100vh;
             margin-left: 720px;justify-content: center; align-items: center;padding:25px;margin-bottom: 5px"  >
 <div class="loginbox" style="box-sizing: border-box;margin-bottom: 5px">
   <div class="logo">
     <img style="margin-left: 27px; margin-top: 0" src="images/GetSetGOnotext.png"/>
     <h2 style="margin-left: 65px; margin-top:5px">회원정보 수정</h2>
   </div>
     <form action="updateMember" method="post" style="
          margin-top: 20px; margin-left: 0px; width:400px;">
       <div class="field" style="margin-bottom:9px;margin-right:5px" >
          <label style="margin-left:11px;">아이디</label><br>
         <input type="text" style="border: 1px solid #cccccc; outline:none; margin-left:11px; width:270px; height:22px;" name="userid"value="${dto.userid}" readonly>
       </div>
       <div class="field">
         <label style="margin-left:10px;">비밀번호</label><br>
         <input type="password" style="outline: none;margin-left:11px;width:270px;height:22px;border: 1px solid #cccccc;margin-bottom: 3px" name="pwd" ></div>
    <div class="idmessage" style="margin-top: 0"></div>
    <div class="field" style="margin-bottom:9px">
         <label style="margin-left:10px;">비밀번호 확인<br></label>
         <input type="password" name="pwdCheck" style="outline: none;margin-left:11px;width:270px;height:22px; border: 1px solid #cccccc;"></div>
       <div class="field" style="margin-bottom:9px">
         <label style="margin-left:10px;">이름<br></label>
         <input type="text" style="outline: none;margin-left:11px;width:270px; height:22px; border:1px solid #cccccc;" name="name" value="${dto.name}"></div>
       <div class="field" style="margin-bottom:9px">
         <label style="margin-left:10px;">전화번호<br></label>
         <input type="text" style="outline: none;margin-left:11px;width:270px;height:22px; border:1px solid #cccccc;" name="phone" value="${dto.phone}" /></div>
       <div class="field">
         <label style="margin-left:10px;">이메일<br></label>
         <input type="text" style="outline: none;height:22px;margin-left:11px;width:270px; border:1px solid #cccccc;margin-bottom: 0px" name="email" value="${dto.email}" /></div>
    <div class="idemessage"></div>
       <br />

       <div class="field" style="margin-bottom:9px; margin-right:5px" >
         <label style="margin-left:10px;margin-top: 20px">우편번호</label>
         <div>
           <input type="text"  style="margin-left:11px; outline: none;border: 1px solid #cccccc;width:170px;height:22px;"  id="sample6_postcode" name="zip_num"   value="${dto.zip_num}" readonly>
           <input type="button" style="outline: none;cursor:pointer; border: 1px solid #cccccc;width:95px;height:25px;background-color:#2e8b57;color:white" value="우편번호 찾기"  onclick="sample6_execDaumPostcode()">
         </div>
       </div>
       <div class="field" style="margin-bottom:9px">
         <label style="margin-left:10px;">기본 주소<br></label>
         <input type="text" id="member_address" style="margin-left:11px;width:270px;outline: none;border: 1px solid #cccccc;height:22px;" name="address_main" value="${dto.address_main}" readonly />
       </div>
       <div class="field" style="margin-bottom:9px">
         <label style="margin-left:10px;">상세 주소<br></label>
         <input type="text" style="outline: none;margin-left:11px;width:270px;border: 1px solid #cccccc;height:22px;" id="member_detailAddress" name="address_detail" value="${dto.address_detail}"/>
       </div>
       <div class="field" style="margin-bottom:9px">
         <label style="margin-left:10px;">기타 주소<br></label>
         <input type="text" id="member_extraAddress" style="margin-left:11px;width:270px;outline: none;height:22px;border: 1px solid #cccccc;" name="address_extra"  value="${dto.address_extra}"/>
       </div>
         <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
       <script>
         function sample6_execDaumPostcode() {
           new daum.Postcode({
             oncomplete: function (data) {
               var addr = '';
               var extraAddr = '';
               if (data.userSelectedType === 'R') {
                 addr = data.roadAddress;
               } else {
                 addr = data.jibunAddress;
               }
               if (data.userSelectedType === 'R') {
                 if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                   extraAddr += data.bname;
                 }
                 if (data.buildingName !== '' && data.apartment === 'Y') {
                   extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 if (extraAddr !== '') {
                   extraAddr = ' (' + extraAddr + ')';
                 }
                 document.getElementById("member_detailAddress").value = extraAddr;
               } else {
                 document.getElementById("member_detailAddress").value = '';
               }
               document.getElementById('sample6_postcode').value = data.zonecode;
               document.getElementById("member_address").value = addr;
               document.getElementById("member_detailAddress").focus();
             }
           }).open();
         }
       </script>

       <div class="field" style="margin-top:0;margin-left:11px;margin-bottom:5px; color: red; font-size: 13px">${msg}</div>

       <div class="btn" style="width:295px; background:white">
          <input type="submit" style="width:280px; height:30px;cursor: pointer; background-color: #2e8b57;
          color: white; border: none;" value="정보수정">
         <input type="button" style="width:280px;height:30px; background-color:#2e8b57;cursor: pointer;
                color: white; border: none; margin-top: 8px" value="메인으로" onClick="location.href='index'">
         <input type="button" style="width:280px;height:30px;margin-top: 8px; cursor: pointer;
          background-color:#2e8b57; color: white; border: none;" value="회원탈퇴" onClick="deleteMemberConfirm()">
       </div>
      </form>
     </div>
    <script>
        function deleteMemberConfirm() {
            var ans = confirm("정말로 탈퇴하시겠습니까?");
            if (ans) {
                location.href = "deleteMember";
            } else {
                location.href = "updateMemberForm";
            }
        }
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            // 비밀번호 유효성 검사
            $("input[name='pwd']").on("input", function () {
                var pwd = $(this).val();
                var pwdPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+]).{8,16}$/;

                if (!pwdPattern.test(pwd)) {
                    $(".idmessage").html("<div id=abmessage >비밀번호: 8~16자의 영문 대/소문자, 숫자,<br>특수문자를 사용해 주세요.</span>");
                } else {
                    $(".idmessage").html("<div id=amessage >사용 가능한 비밀번호입니다.</div>");
                }
            });
            $("input[name='email']").on("input", function () {
                var email = $(this).val();
                if (email.indexOf("@") === -1) {
                    $(".idemessage").html("<span style='color:red;margin-left: 11px; font-size:13px'>이메일 주소가 정확한지 확인해 주세요.</span>");
                } else {
                    $(".idemessage").html(""); // 조건 만족 시 메시지 삭제
                }
            });
        });
    </script>
  </div>
 </body>
</html>