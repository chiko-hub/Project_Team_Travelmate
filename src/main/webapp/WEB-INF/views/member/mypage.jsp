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
<body style="margin-top: 100px;">
<div class="container" style="box-sizing: border-box; width:100vw; height:100vh;
             margin-left: 720px;justify-content: center; align-items: center;"  >
 <div class="loginbox" style="box-sizing: border-box;">
   <div class="logo">
     <img src="images/logo2.png"/>
     <h2>여행 스케줄링 플래너</h2>
   </div>
     <form action="updateMember" method="post" style="
          margin-top: 50px; margin-left: 0px; width:400px;">
       <h3 style="margin-right:60px; margin-bottom: 20px">기본 정보</h3>
       <div class="field" style="margin-bottom:5px; display:flex; margin-right:5px" >
         <label>아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
         <input type="text"  name="userid" size="23" value="${dto.userid}" readonly>
       </div>
       <div class="field" style="margin-bottom:6px">
         <label>비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
         <input type="password" size="23" name="pwd" ></div>
       <div class="field" style="margin-bottom:6px">
         <label>비밀번호 확인&nbsp;&nbsp;</label>
         <input type="password" name="pwdCheck" size="20"></div>
       <div class="field" style="margin-bottom:6px">
         <label>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
         <input type="text" size="23" name="name" value="${dto.name}"></div>
       <div class="field" style="margin-bottom:6px">
         <label>전화번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
         <input type="text" size="23"  name="phone" value="${dto.phone}" /></div>
       <div class="field">
         <label>이메일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
         <input type="text" size="23" name="email" value="${dto.email}" /></div>
       <br />

       <h3 style="margin-right: 60px; margin-bottom: 20px">선택 정보</h3>
       <div class="field" style="margin-bottom:6px; display:flex; margin-right:5px" >
         <label>우편번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
         <div>
           <input type="text"  style="width:90px" id="sample6_postcode" name="zip_num"   value="${dto.zip_num}" readonly>
           <input type="button" style="width:93px"; value="우편번호 찾기"  onclick="sample6_execDaumPostcode()">
         </div>
       </div>
       <div class="field" style="margin-bottom:6px">
         <label>기본 주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
         <input type="text" id="member_address" name="address_main" value="${dto.address_main}" size="23" readonly />
       </div>
       <div class="field" style="margin-bottom:6px">
         <label>상세 주소&nbsp;&nbsp;&nbsp;&nbsp;</label>
         <input type="text"  size="24"  id="member_detailAddress" name="address_detail" value="${dto.address_detail}"/>
       </div>
       <div class="field" style="margin-bottom:9px">
         <label>기타 주소&nbsp;&nbsp;&nbsp;&nbsp;</label>
         <input type="text" size="24" id="member_extraAddress" name="address_extra"  value="${dto.address_extra}"/>
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

       <div class="btn" style="width:295px; display:flex; justify-content:space-between; background:white">
          <input type="submit" style="width:143px; height:34px; background-color: #00bcd4;
          color: white; border: none;" value="정보 수정">
         <input type="button" style="width:143px; background-color:#00bcd4;
                color: white; border: none;" value="메인으로" onClick="location.href='index'">
       </div>
      </form>
     </div>
  </div>
 </body>
</html>