<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Interactive Steps</title>
  <link rel="stylesheet" href="/css/start.css">
  <link rel="stylesheet" href="/css/sider.css">
  <link rel="stylesheet" href="/css/place.css">
  <link rel="stylesheet" href="/css/plan.css">
  <link rel="stylesheet" href="/css/wishlist.css">
  <script defer src="/script/start.js"></script>
  <script defer src="/script/place.js"></script>
  <script defer src="/script/hotel.js"></script>
  <script defer src="/script/plan.js"></script>
  <script defer src="/script/createPlan.js"></script>
  <script defer src="/script/wishlist.js"></script>
    <%-- 날짜 선택용 캘린더 api --%>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
</head>
<body>
<div class="container">
    <!-- 좌측 STEP 메뉴 -->
    <div class="sidebar">
      <button id="placeButton" class="step-button" onclick="selectStep(this, 'place')">STEP 1<br>장소 선택</button>
      <button id="hotelButton" class="step-button" onclick="selectStep(this, 'hotel')">STEP 2<br>숙소 선택</button>
      <button id="wishlistButton" class="step-button" onclick="selectStep(this, 'wishlist')">STEP 3<br>찜꽁</button>
      <button id="planFormButton" class="step-button" onclick="selectStep(this, 'planForm')">STEP 4<br>일정</button>
    </div>