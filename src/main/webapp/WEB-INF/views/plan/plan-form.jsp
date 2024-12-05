<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="/css/plan.css" />
<%--<%@ include file="../header.jsp" %>--%>
<html>
<head>
    <title>plan-table</title>
</head>
<body>

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
    <c:forEach var="i" begin="0" end="${fn:length(planDetailList)-1}" varStatus="status">
        <div class="planList">
            <div class="cell">${planDetailList[i].plan_date}</div>
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

<%-- 일단 하나의 계획만 나오도록 작성 --%>

</body>
</html>
