<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="/css/plan.css"/>
<script src="/script/plan.js"></script>
<html>
<head>
    <title>plan-table</title>
</head>
<body>

<div>
    <div class="planAddButton">
        <input type="button" value="직접 추가" onclick="togglePanel()"/>
    </div>

    <!-- 입력 패널 -->
    <div id="planAddPanel" class="panel">
        <h3>새 계획 추가</h3>
        <form id="planForm">
            <label for="planName">장소</label>
            <input type="text" id="planName" name="planName" required/><br/>
            <label for="planDate">날짜</label>
            <select id="planDate" name="planDate" required>
                <c:forEach var="i" begin="0" end="${fn:length(planList)-1}" varStatus="status">
                    <option value="date">${planList[i].travel_date}</option>
                </c:forEach>
            </select>
            <label for="planStartTime">시작시간</label>
            <select id="planStartTime" name="planStartTime" required>
                <option value="am06">오전 06시</option>
                <option value="am07">오전 07시</option>
                <option value="am08">오전 08시</option>
                <option value="am09">오전 09시</option>
                <option value="am10">오전 10시</option>
                <option value="am11">오전 11시</option>
                <option value="pm12">오후 12시</option>
                <option value="pm01">오후 01시</option>
                <option value="pm02">오후 02시</option>
                <option value="pm03">오후 03시</option>
                <option value="pm04">오후 04시</option>
                <option value="pm05">오후 05시</option>
                <option value="pm06">오후 06시</option>
                <option value="pm07">오후 07시</option>
                <option value="pm08">오후 08시</option>
                <option value="pm09">오후 09시</option>
                <option value="pm10">오후 10시</option>
                <option value="pm11">오후 11시</option>
            </select>
            <label for="planEndTime">종료시간</label>
            <select id="planEndTime" name="planEndTime" required>
                <option value="am06">오전 06시</option>
                <option value="am07">오전 07시</option>
                <option value="am08">오전 08시</option>
                <option value="am09">오전 09시</option>
                <option value="am10">오전 10시</option>
                <option value="am11">오전 11시</option>
                <option value="pm12">오후 12시</option>
                <option value="pm01">오후 01시</option>
                <option value="pm02">오후 02시</option>
                <option value="pm03">오후 03시</option>
                <option value="pm04">오후 04시</option>
                <option value="pm05">오후 05시</option>
                <option value="pm06">오후 06시</option>
                <option value="pm07">오후 07시</option>
                <option value="pm08">오후 08시</option>
                <option value="pm09">오후 09시</option>
                <option value="pm10">오후 10시</option>
                <option value="pm11">오후 11시</option>
            </select>
            <div class="planAddButton">
                <button type="button" onclick="addPlan()">추가</button>
                <button type="button" onclick="togglePanel()">취소</button>
            </div>
        </form>
    </div>

    <div class="planTable">
        <%-- 시간 정보 --%>
        <div class="timeList">
            <div class="time"></div>
            <div class="time">오전 06시</div>
            <div class="time">오전 07시</div>
            <div class="time">오전 08시</div>
            <div class="time">오전 09시</div>
            <div class="time">오전 10시</div>
            <div class="time">오전 11시</div>
            <div class="time">오후 12시</div>
            <div class="time">오후 01시</div>
            <div class="time">오후 02시</div>
            <div class="time">오후 03시</div>
            <div class="time">오후 04시</div>
            <div class="time">오후 05시</div>
            <div class="time">오후 06시</div>
            <div class="time">오후 07시</div>
            <div class="time">오후 08시</div>
            <div class="time">오후 09시</div>
            <div class="time">오후 10시</div>
            <div class="time">오후 11시</div>
        </div>
        <c:forEach var="i" begin="0" end="${fn:length(planList)-1}" varStatus="status">
            <div class="planList">
                <div class="cell">${planList[i].travel_date}</div>
                <div class="cell" id="am06"></div>
                <div class="cell" id="am07"></div>
                <div class="cell" id="am08"></div>
                <div class="cell" id="am09"></div>
                <div class="cell" id="am10"></div>
                <div class="cell" id="am11"></div>
                <div class="cell" id="pm12"></div>
                <div class="cell" id="pm01"></div>
                <div class="cell" id="pm02"></div>
                <div class="cell" id="pm03"></div>
                <div class="cell" id="pm04"></div>
                <div class="cell" id="pm05"></div>
                <div class="cell" id="pm06"></div>
                <div class="cell" id="pm07"></div>
                <div class="cell" id="pm08"></div>
                <div class="cell" id="pm09"></div>
                <div class="cell" id="pm10"></div>
                <div class="cell" id="pm11"></div>
            </div>
        </c:forEach>
    </div>
</div>

<%-- 일단 하나의 계획만 나오도록 작성 --%>

</body>
</html>
