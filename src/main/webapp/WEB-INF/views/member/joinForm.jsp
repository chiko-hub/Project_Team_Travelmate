<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko">
<head>
	<title>TRAVEL Planner Join</title>
	<link rel="stylesheet" href="/css/login.css">
</head>

<article>
	<div class="container">
		<div class="loginbox">
			<div class="logo">
				<img src="images/logo2.png"/>
				<h2>여행 스케줄링 플래너</h2>
			</div>
			<form aciton="join" method="post" name="joinForm" id="joinFrm">
				<h3>기본 정보</h3>
				<div class="field">
					<label>아이디</label>
					<div>
						<input type="text" name="userid" size="12" value="${dto.userid}">
						<input type="button" id="idcheckButton" value="중복 체크">
						<div id="idmessage"></div>
						<input type="hidden" name="reid" id="reid" value="${reid}">
					</div>
				</div>
				<div class="field"><label>패스워드</label><input type="password" name="pwd"></div>
				<div class="field">
					<label>패스워드 확인</label><input type="password" name="pwdCheck" ></div>
				<div class="field"><label>이름</label><input type="text" name="name"  value="${dto.name}"/></div>
				<div class="field"><label>전화번호</label><input type="text" name="phone" value="${dto.phone}" /></div>
				<div class="field"><label>이메일</label><input type="text" name="email" value="${dto.email}"/></div>
				<br />

				<h3>선택 정보</h3>
				<div class="field">
					<label>우편 번호</label>
					<div>
						<input type="text" id="sample6_postcode" name="zip_num" value="${dto.zip_num}" readonly>
						<input type="button" value="우편번호 찾기" onclick="sample6_execDaumPostcode()">
					</div>
				</div>
				<div class="field">
					<label>기본 주소</label><input type="text" id="sample6_address" name="address_main" value="${dto.address_main}" readonly>
				</div>
				<div class="field"><label>상세 주소</label><input type="text" id="sample6_detailAddress" name="address_detail" value="${dto.address_detail}"></div>
				<div class="field"><label>기타 주소</label><input type="text" id="sample6_extraAddress" name="address_extra" value="${dto.address_extra}"></div>
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
									document.getElementById("sample6_extraAddress").value = extraAddr;
								} else {
									document.getElementById("sample6_extraAddress").value = '';
								}
								document.getElementById('sample6_postcode').value = data.zonecode;
								document.getElementById("sample6_address").value = addr;
								document.getElementById("sample6_detailAddress").focus();
							}
						}).open();
					}
				</script>
				<div class="field"><div>${validmsg}</div></div>
				<button type="submit" class="btn" onClick="location.href='joinForm'">회원가입</button>
				<button type="button" class="btn" onClick="location.href='/'">메인으로</button>
			</form>
		</div>
	</div>
</article>
</html>