<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko">
<head>
	<title>TRAVEL Planner Join</title>
	<link rel="stylesheet" href="/css/login.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#idcheckButton').click(function(){
				var formselect = $('#joinFrm')[0];
				var formdata = new FormData( formselect );
				$.ajax({
					url:"<%=request.getContextPath()%>/idcheck",
					type:"POST",
					// enctype:"multipart/form-data",
					async: false,
					data: formdata,
					timeout: 10000,
					contentType : false,
					processData : false,

					success:function(data){
						if( data.idmessage == '1'){
							$('#idmessage').html("&nbsp;&nbsp;<span style='color:blue' >사용 가능합니다</span>");
							$('#reid').val(data.userid);
						}else{
							$('#idmessage').html("&nbsp;&nbsp;<span style='color:red' >사용중인 아이디입니다</span>");
							$('#reid').val("");
						}
					},
					error:function(){
						alert("중복 조회 실패");
					},
				});
			});
		});
	</script>
</head>
<article>
	<div class="container">
		<div class="loginbox">
			<div class="logo">
				<h1>회원가입</h1>
				<h3 style="height:10px; ">회원가입을 위한 정보를 입력해주세요.</h3>
			</div>
			<form action="join" method="post" name="joinForm" id="joinFrm">
				<div class="field">
					<label>아이디</label><br>
						<input type="text" name="userid" size="28" style="height:40px; outline: none;border: 1px solid #cccccc; " value="${dto.userid}">
						<input type="button" class="idcheckButton" value="중복 체크">
						<div id="idmessage"></div>
						<input type="hidden" name="reid" id="reid" value="${reid}">
				</div>
				<div class="field"><label>패스워드</label><br><input type="password" size="44" style="height:40px;
				outline: none;border: 1px solid #cccccc;" name="pwd"></div>
				<div class="field">
					<label>패스워드 확인</label><input type="password" name="pwdCheck" size="44" style="height:40px; outline: none;border: 1px solid #cccccc;"></div>
				<div class="field"><label>이름<br></label><input type="text" name="name" size="44" style="height:40px;
                  outline: none;border: 1px solid #cccccc;" value="${dto.name}"/></div>
				<div class="field"><label>전화번호</label><br><input type="text" name="phone" size="44" style="height:40px; outline: none;
				border: 1px solid #cccccc;" value="${dto.phone}" /></div>
				<div class="field"><label>이메일</label><br><input type="text" name="email" size="44" style="height:40px;
				outline: none;border: 1px solid #cccccc;" value="${dto.email}"/></div>
				<br />

				<div class="field">
					<label>우편 번호</label><br>
						<input type="text" style="width: 205px; height: 44px;outline: none;border: 1px solid #cccccc;"
							   id="sample6_postcode" name="zip_num" value="${dto.zip_num}" readonly>
						<input type="button" class="idcheckButton" style="width: 120px;" value="우편번호 찾기" onclick="sample6_execDaumPostcode()">
				</div>
				<div class="field">
					<label>기본 주소</label><br><input type="text" id="sample6_address" name="address_main"  size="44"
				   style="height:40px; outline: none;border: 1px solid #cccccc;" value="${dto.address_main}" readonly>
				</div>
				<div class="field"><label>상세 주소<br></label><input type="text" id="sample6_detailAddress" name="address_detail" size="44"
				 style="height:40px; outline: none;border: 1px solid #cccccc;" value="${dto.address_detail}"></div>
				<div class="field"><label>기타 주소<br></label><input type="text" id="sample6_extraAddress" name="address_extra" size="44"
			     style="height:40px;margin-bottom:10px;outline: none;border: 1px solid #cccccc;" value="${dto.address_extra}"></div>
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
				<div class="field">${validmsg}</div>
				<button type="submit" style="margin-bottom: 10px; width: 155px;" class="idcheckButton" onClick="location.href='joinForm'">회원가입</button>
				<button type="button" style="width: 155px;" class="idcheckButton" onClick="location.href='/'">메인으로</button>
			</form>
		</div>
	</div>
</article>
</html>