<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>header</title>
    <link rel="stylesheet" href="/css/header_footer.css" />
    <link rel="stylesheet" href="/css/main.css" />
    <link rel="stylesheet" href="/css/index.css" />

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
<%--<div id="wrap">
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
    </nav>--%>

    <div class="header">
        <div class="logo">MYRO</div>
        <nav>
            <a href="#">여행지</a>
            <a href="#">고객지원</a>
            <a href="#">이용방법</a>
            <c:choose>
                <c:when test="${empty loginUser}">
                    <a href="loginForm">로그인</a>
                </c:when>
                <c:otherwise>
                    <a href="#">${loginUser.name}(${loginUser.userid})</a>
                    <a href="logout">로그아웃</a>
                </c:otherwise>
            </c:choose>
        </nav>
    </div>

    <div class="main">
        <h1> 기존에 경험하지 못한 <br>
            새로운 여행 플래너</h1>
        <p>고민만 하던 여행 계획을 마이로를 통해 몇 분 만에 스케줄링 해보세요.</p>
        <div><input type="button" name="startButton" value="마이로 시작하기"
                    onclick="location.href='travel-start'"/></div>

        <div class="map">
            <img src="" style="border: solid 1px black;" alt="지도 이미지">
        </div>
    </div>

    <div class="statistics">
        <div class="statItem">
            <span>AI로 생성된 일정 수</span> 214,975
            <span>여행지 수</span> 96
        </div>
    </div>
</body>
</html>
