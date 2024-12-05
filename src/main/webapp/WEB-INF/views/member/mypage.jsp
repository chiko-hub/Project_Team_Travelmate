<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
  </body>
</html>


<div class="field"><label>User ID</label>
    <div>
        <input type="text" name="userid" size="12" value="${dto.userid}" readonly>
    </div>
</div>
<div class="field"><label>Password</label><input type="password" name="pwd" ></div>
<div class="field">
    <label>Retype Password</label><input type="password"  name="pwdCheck" ></div>
<div class="field"><label>Name</label><input type="text"  name="name" value="${dto.name}"></div>
<div class="field"><label>Phone</label><input type="text"  name="phone" value="${dto.phone}" /></div>
<div class="field"><label>E-Mail</label><input type="text"  name="email" value="${dto.email}" /></div>
<br />

<h3>Optional Info</h3>
<div class="field">
    <label>Zip Code</label>
    <div>
        <input type="text"  id="postcode" name="zip_num"   value="${dto.zip_num}" readonly>
<%--        <input type="button" value="우편번호 찾기"  onclick="sample6_execDaumPostcode()">--%>
    </div>
</div>
<div class="field">
    <label>Address</label><input type="text"   id="member_address"   name="address1"   value="${dto.address1}" readonly />
</div>
<div class="field">
    <label>Detail Address</label><input type="text"    id="member_detailAddress"   name="address2"  value="${dto.address2}"/>
</div>
<div class="field">
    <label>Extra Address</label><input type="text" id="member_extraAddress" name="address3"  value="${dto.address3}"/>
</div>


