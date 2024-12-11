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
  <link rel="stylesheet" href="/css/plan.css">
  <script defer src="/script/start.js"></script>
  <script defer src="/script/plan.js"></script>
</head>
<body>
<div class="container">
<!-- 좌측 STEP 메뉴 -->
<div class="sidebar">
    <button class="step-button" onclick="location.href='placeSelect?first=true'">STEP 1<br>장소 선택</button>
    <button class="step-button" onclick="location.href='hotelSelect'">STEP 2<br>숙소 선택</button>
    <button class="step-button" onclick="location.href='wishlist'">STEP 3<br>찜꽁</button>
    <button class="step-button" onclick="location.href='planForm'">STEP 4<br>일정</button>
</div>