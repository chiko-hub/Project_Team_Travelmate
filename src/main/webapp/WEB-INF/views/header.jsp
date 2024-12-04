<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
    <title>header</title>
    <link rel="stylesheet" href="/css/header_footer.css" />
    <link rel="stylesheet" href="/css/main.css" />
    <link rel="stylesheet" href="/css/login.css" />

    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="/script/member.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 화면 이동없이 서버와 데이터를 주고 받을 수 있는 환경을 제공한다. Ajax -->
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
						if( data.idmessage == '1' ){
							$('#idmessage').html("&nbsp;&nbsp;<span style='color:blue'>사용 가능합니다</span>");
							$('#reid').val(data.userid);
						}else{
							$('#idmessage').html( "&nbsp;&nbsp;<span style='color:red'>사용 중인 아이디입니다</span>" );
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
<body>
<div id="wrap">
	<header>
		<nav id="top_menu">
			<div id="logo">
				<a href="/">
					<img src="/images/logo2.png" width="180" height="100">
				</a>
			</div>
			<div class="gnb">
					<c:choose>
						<c:when test="${empty loginUser}">
							<a href="loginForm">LOGIN</a>
							<a href="contract">JOIN</a>
						</c:when>
						<c:otherwise>
							<a href="#">${loginUser.name}(${loginUser.userid})</a>
							<a href="logout">LOGOUT</a>
						</c:otherwise>
					</c:choose>
					<a href="mypage">MYPAGE</a>
					<a href="customer">고객지원</a>
			</div>

			<div class="hmenu">
				<div></div>
				<div></div>
				<div></div>
			</div>
		</nav>
		</form>
	</header>