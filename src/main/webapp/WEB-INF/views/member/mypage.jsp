<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Member</title>
</head>
<body>

<form style="margin-top: 230px; margin-left: 780px; width:400px;" method="post" action="mypage">
    <h3>기본 정보</h3>
<div class="field" style="margin-bottom:5px; display:flex; margin-right:5px" >
    <label>User ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <input type="text"  name="userid" size="20" value="${dto.userid}" readonly>
</div>
<div class="field" style="margin-bottom:5px">
    <label>Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <input type="password" name="pwd" ></div>
<div class="field" style="margin-bottom:5px">
    <label>Retype Password&nbsp;&nbsp;&nbsp;</label>
    <input type="password" name="pwdCheck" style="width:135px"></div>
<div class="field" style="margin-bottom:5px">
    <label>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <input type="text"  name="name" value="${dto.name}"></div>
<div class="field" style="margin-bottom:5px">
    <label>Phone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <input type="text"  name="phone" value="${dto.phone}" /></div>
<div class="field">
    <label>E-Mail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <input type="text"  name="email" value="${dto.email}" /></div>
<br />

<h3>선택 정보</h3>
<div class="field" style="margin-bottom:5px; display:flex; margin-right:5px" >
    <label>Zip Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
          <div>
            <input type="text"  style="width:80px" id="postcode" name="zip_num"   value="${dto.zip_num}" readonly>
            <input type="button" style="width:93px"; value="우편번호 찾기"  onclick="sample6_execDaumPostcode()">
        </div>
   </div>
<div class="field" style="margin-bottom:5px">
    <label>Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text"   id="member_address"   name="address_main"   value="${dto.address_main}" readonly />
</div>
<div class="field" style="margin-bottom:5px">
    <label>Detail Address&nbsp;&nbsp;</label><input type="text"  size="19"  id="member_detailAddress"   name="address_detail"  value="${dto.address_detail}"/>
</div>
<div class="field" style="margin-bottom:9px">
    <label>Extra Address&nbsp;&nbsp;&nbsp;</label><input type="text" size="19" id="member_extraAddress" name="address_extra"  value="${dto.address_extra}"/>
</div>

<div class="btn" style="width:285px; display:flex; justify-content:space-around">
    <input type="button" style=width:140px; value="정보 수정" onclick="location.href=' '">
    <input type="button" style=width:140px; value="메인으로" onClick="location.href='index'">
</div>

<div class="field" style="margin-bottom:5px">${message}</div>
</form>

</body>
</html>
