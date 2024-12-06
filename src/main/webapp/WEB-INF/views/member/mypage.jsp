<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
 </head>
  <body>
  </body>
</html>

<form style="margin-top: 250px; margin-left: 800px; width:400px;">
<div class="field" style="margin-bottom:5px; display:flex; margin-right:5px" >
    <label>User ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <div><input type="text" name="userid" size="12" value="${mvo.userid}" readonly></div>
</div>
<div class="field" style="margin-bottom:5px">
    <label>Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <input type="password" name="pwd" ></div>
<div class="field" style="margin-bottom:5px">
    <label>Retype Password&nbsp;&nbsp;&nbsp;</label>
    <input type="password"  name="pwdCheck" style="width:135px"></div>
<div class="field" style="margin-bottom:5px">
    <label>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <input type="text"  name="name" value="${mvo.name}"></div>
<div class="field" style="margin-bottom:5px">
    <label>Phone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <input type="text"  name="phone" value="${mvo.phone}" /></div>
<div class="field">
    <label>E-Mail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <input type="text"  name="email" value="${mvo.email}" /></div>
<br />

<h3>Optional Info</h3>
<div class="field" style="margin-bottom:5px; display:flex; margin-right:5px" >
    <label>Zip Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
          <div>
            <input type="text"  style="width:80px" id="postcode" name="zip_num"   value="${dto.zip_num}" readonly>
            <input type="button" value="우편번호 찾기"  onclick="sample6_execDaumPostcode()">
        </div>
   </div>
<div class="field" style="margin-bottom:5px">
    <label>Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text"   id="member_address"   name="address1"   value="${dto.address1}" readonly />
</div>
<div class="field" style="margin-bottom:5px">
    <label>Detail Address&nbsp;&nbsp;</label><input type="text"    id="member_detailAddress"   name="address2"  value="${dto.address2}"/>
</div>
<div class="field" style="margin-bottom:5px">
    <label>Extra Address&nbsp;&nbsp;&nbsp;</label><input type="text" id="member_extraAddress" name="address3"  value="${dto.address3}"/>
</div>

<div class="btn" style="margin-bottom:5px">
    <input type="button" value="회원수정" onclick="go_update()">
    <input type="button" value="메인으로" onClick="/'">
</div>

<div class="field" style="margin-bottom:5px">${message}</div>
</form>


