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
<body>
<div class="container" style="box-sizing: border-box; width:100vw; height:100vh;
             margin-left: 720px;justify-content: center; align-items: center;"  >
 <div class="loginbox" style="box-sizing: border-box;">
   <div class="logo">
     <img style="margin-left: 27px" src="images/logo2.png"/>
     <h2 style="margin-left: 65px; margin-top:5px">회원정보 수정</h2>
   </div>
     <form action="updateMember" method="post" style="
          margin-top: 20px; margin-left: 0px; width:400px;">
       <h3 style="margin-right:60px; margin-bottom: 20px">기본 정보</h3>
       <div class="field" style="margin-bottom:9px;margin-right:5px" >
          <label style="margin-left:11px;">아이디</label><br>
         <input type="text" style="border: 1px solid #cccccc; outline:none; margin-left:11px; width:270px; height:22px;" name="userid"value="${dto.userid}" readonly>
       </div>
       <div class="field" style="margin-bottom:9px">
         <label style="margin-left:10px;">비밀번호</label><br>
         <input type="password" style="outline: none;margin-left:11px;width:270px;height:22px;border: 1px solid #cccccc;" name="pwd" ></div>
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
         <input type="text" style="outline: none;height:22px;margin-left:11px;width:270px; border:1px solid #cccccc;" name="email" value="${dto.email}" /></div>
       <br />

       <h3 style="margin-right: 60px; margin-bottom: 20px;">선택 정보</h3>
       <div class="field" style="margin-bottom:9px; margin-right:5px" >
         <label style="margin-left:10px;">우편번호</label>
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

       <div class="field" style="margin-bottom:5px">${msg}</div>

       <div class="btn" style="width:295px; background:white">
          <input type="submit" style="width:280px; height:30px;cursor: pointer; background-color: #2e8b57;
          color: white; border: none;" value="정보수정">
         <input type="button" style="width:280px;height:30px; background-color:#2e8b57;cursor: pointer;
                color: white; border: none; margin-top: 8px" value="메인으로" onClick="location.href='index'">
         <input type="button" style="width:280px;height:30px;margin-top: 8px; cursor: pointer;
          background-color:#2e8b57; color: white; border: none;" value="회원탈퇴" onClick="location.href='deleteMember'">
       </div>
      </form>
     </div>
  </div>
 </body>
</html>