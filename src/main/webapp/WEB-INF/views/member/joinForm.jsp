<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko">
<head>
	<title>Travel Planner Join</title>
	<link rel="stylesheet" href="/css/login.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function () {
			// 아이디 중복 체크 버튼 클릭 이벤트
			$('.idcheckButton').click(function () {
				var userid = $("input[name='userid']").val();

				// 아이디 유효성 검사 (4글자 이상)
				if (userid.length < 4) {
					$("#idmessage").html("<span style='color:red; font-size:13px'>아이디는 4글자 이상이어야 합니다</span>");
					$("#reid").val("");
					return; // 조건을 만족하지 않으면 AJAX 요청 중단
				}

				var formselect = $('#joinFrm')[0];
				var formdata = new FormData(formselect);

				$.ajax({
					url: "<%=request.getContextPath()%>/idcheck",
					type: "POST",
					data: formdata,
					timeout: 10000,
					contentType: false,
					processData: false,
					success: function (data) {
						if (data.idmessage == '1') {
							$('#idmessage').html("<span style='color:blue; font-size:13px'>사용 가능합니다</span>");
							$('#reid').val(data.userid);
						} else {
							$('#idmessage').html("<span style='color:red; font-size:13px'>사용중인 아이디입니다</span>");
							$('#reid').val("");
						}
					},
					error: function () {
						alert("중복 조회 실패");
					}
				});
			});

			// 아이디 입력 실시간 유효성 검사
			$("input[name='userid']").on("input", function () {
				var userid = $(this).val();
				if (userid.length < 4) {
					$("#idmessage").html("<span style='color:red; font-size:13px'>아이디는 4글자 이상이어야 합니다</span>");
					$("#reid").val("");
				} else {
					$("#idmessage").html(""); // 조건 만족 시 메시지 삭제
				}
			});

			// 비밀번호 유효성 검사
			$("input[name='pwd']").on("input", function () {
				var pwd = $(this).val();
				var pwdPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+]).{8,16}$/;

				if (!pwdPattern.test(pwd)) {
					$("#pwdmessage").html("<span style='color:red; font-size:13px'>비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.</span>");
				} else {
					$("#pwdmessage").html("<span style='color:blue; font-size:13px'>사용 가능한 비밀번호입니다.</span>");
				}
			});

			$("input[name='email']").on("input", function () {
				var email = $(this).val();
				if (email.indexOf("@") === -1) {
					$("#emailMessage").html("<span style='color:red; font-size:13px'>이메일 주소가 정확한지 확인해 주세요.</span>");
				} else {
					$("#emailMessage").html(""); // 조건 만족 시 메시지 삭제
				}
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
						<input type="text" name="userid" size="28" style="height:40px; outline: none;border: 1px solid #cccccc; " value="${dto.userid}" placeholder="아이디 입력">
						<input type="button" class="idcheckButton" value="중복 체크">
						<div id="idmessage"></div>
						<input type="hidden" name="reid" id="reid" value="${reid}">
				</div>
				<div class="field">
					<label>비밀번호</label><br><input type="password" size="44" style="height:40px;
				outline: none;border: 1px solid #cccccc;" name="pwd" placeholder="비밀번호 입력"></div>
				<div id="pwdmessage"></div>
				<div class="field">
					<label>비밀번호 확인</label>
					<input type="password" name="pwdCheck" size="44" style="height:40px; outline: none;border: 1px solid #cccccc;" placeholder="비밀번호 확인 입력"></div>
				<div class="field">
					<label>이름<br></label><input type="text" name="name" size="44" style="height:40px;
                  outline: none;border: 1px solid #cccccc;" value="${dto.name}" placeholder="이름 입력"/></div>
				<div class="field">
					<label>전화번호</label><br><input type="text" name="phone" size="44" style="height:40px; outline: none;
				border: 1px solid #cccccc;" value="${dto.phone}" placeholder="전화번호 입력"/></div>
				<div class="field">
					<label>이메일</label><br><input type="text" name="email" size="44" style="height:40px;
				outline: none;border: 1px solid #cccccc;" value="${dto.email}" placeholder="이메일 입력"/></div>
				<div id="emailMessage"></div>
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
				<div class="field">
					<label>상세 주소<br></label><input type="text" id="sample6_detailAddress" name="address_detail" size="44"
				 style="height:40px; outline: none;border: 1px solid #cccccc;" value="${dto.address_detail}" placeholder="상세 주소 입력"></div>
				<div class="field">
					<label>기타 주소<br></label><input type="text" id="sample6_extraAddress" name="address_extra" size="44"
			     style="height:40px;margin-bottom:10px;outline: none;border: 1px solid #cccccc;" value="${dto.address_extra}" placeholder="기타 주소 입력"></div>
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