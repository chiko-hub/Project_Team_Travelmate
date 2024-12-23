<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>고객지원</title>
  <link rel="stylesheet" href="/css/customer.css">
   <script defer src="/script/customerForm.js"></script>
</head>
<body>

 <div class="logo">
     <!-- Banner Section -->
     <a href='index' style="text-decoration: none;">
         <div class="customer-banner"></div>
     </a>
        <div class="customerForm" >
            <div class="termsContainer" style="display:flex; flex-direction: column;">
                <h2>&nbsp;GETSETGO 기업 소개</h2>
                <div class="intro">
                    <p>
                        <img src="/images/GetSetGonotext.png"/>
                        (주)겟셋고(GETSETGO)는 여행자들이 보다 편하고 정확하게 일정을 만들 수 있도록<br>
                        &nbsp;&nbsp;여행 스케줄링 플래너 겟셋고를 서비스하고 있는 스타트업입니다.<br><br>
                        &nbsp;&nbsp;여행을 준비하는 과정은 매우 복잡하고 많은 시간이 소요되지만<br>
                        &nbsp;&nbsp;우리가 가지고 있는 기술력과 수많은 데이터 분석 등의 고도화를 통하여<br>
                        &nbsp;&nbsp;여행의 시작부터 끝까지 여행자들과 함께 하고자 합니다.<br><br>
                        &nbsp;&nbsp;겟셋고 팀은 성공을 위해 서로 솔직한 피드백을 주고받을 수 있는 문화,<br>
                        &nbsp;&nbsp;모두가 공유하고 인지하는 목표를 하나씩 달성해나가는 문화를 함께 만들어가고 있습니다.</p>
                </div>
            </div>
            <div class="customer-notice"style="justify-content: flex-end;">
                <div class="noticeContainer" style="display:flex; flex-direction: column;">
                    <h2>NOTICE</h2>
                    <div class="notice-intro">
                        <p onclick="toggleAnswer(this)">2024.12.18 서버점검 안내</p>
                        <div class="answer" style="display: none;">
                            <p>일시적인 서버오류로 아래와 같이 점검을 진행합니다.
                                    - 점검시간: 2024.12.18 10:00 ~ 11:00 </p>
                        </div>
                        <p onclick="toggleAnswer(this)">신규 관광지 "경주" 추가</p>
                        <div class="answer" style="display: none;">
                            <p>신규 관광지로 "경주"의 관광지들과 숙소들이 등록되었습니다.<br>
                                   많은 이용 부탁드립니다. </p>
                        </div>
                        <p onclick="toggleAnswer(this)">2024.12.14 업데이트 안내</p>
                        <div class="answer" style="display: none;">
                            <p>서비스 업데이트 안내<br>
                                    º 이제 찜콩 기능에서 고유 code를 통해 일정을 공유할 수 있습니다.<br>
                                    º 일정 관리 기능에 날짜 변경 기능이 추가되었습니다.
                            </p>
                        </div>
                        <p onclick="toggleAnswer(this)">2024.12.12 사이트 점검 안내</p>
                        <div class="answer" style="display: none;">
                            <p>점검 내용<br>
                                º 로그인 관련하여 발생하던 버그를 수정하였습니다.<br>
                                º 카카오 로그인과 관련하여 발생하던 버그를 수정하였습니다.
                            </p>
                        </div>

                        <p onclick="toggleAnswer(this)">2024.12.10 사이트 첫 개설 안내</p>
                        <div class="answer" style="display: none;">
                            <p>2024.12.10 GETSETGO! 의 서비스가 시작됩니다.</p>
                        </div>
                    </div>
                </div>
                <div class="noticeContainer" style="display:flex; flex-direction: column;">
                    <h2>자주 묻는 질문(FAQ)</h2>
                    <div class="faq-intro">
                        <p onclick="toggleAnswer(this)">▶ 검색해도 나오지 않는 장소가 있어요</p>
                        <div class="answer" style="display: none;">
                            <p>현재 장소 정보들을 데이터베이스에 담아서 구성중이며,
                                이에 따른 어느 정도의 시간이 필요합니다.<br>
                                이용에 불편을 드려 대단히 죄송하오며,
                                더욱 좋은 서비스를 제공하도록 최선을 다하겠습니다. </p>
                        </div>
                        <p onclick="toggleAnswer(this)">▶ 여행 기간을 왜 5일 이상 선택할 수 없나요?</p>
                        <div class="answer" style="display: none;">
                            <p>일정 최적화 작업 시 서버 과부화 문제로 인해
                                현재 여행 일자 설정을 최대 5일까지로 제한해두었습니다.<br>
                                이용에 불편을 드려 대단히 죄송하오며,
                                더욱 좋은 서비스를 제공하도록 최선을 다하겠습니다.</p>
                        </div>
                        <p onclick="toggleAnswer(this)">▶ 회원 탈퇴는 어디서 하나요?</p>
                        <div class="answer" style="display: none;">
                            <p> 로그인 후, 메인 첫 화면에서 우측 상단의 본인 ID를
                                클릭하셔서 회원정보 수정 페이지로 이동하시면
                                하단부에 회원 탈퇴버튼이 있습니다.<br>
                                회원 탈퇴를 진행하면 기존에 만들었던 모든 일정이 삭제되오니
                                신중하게 진행하시길 바랍니다.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

 </div>

</body>
</html>
