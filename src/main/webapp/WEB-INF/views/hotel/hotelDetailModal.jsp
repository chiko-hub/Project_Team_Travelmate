<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${place.place_name}</title>
    <link rel="stylesheet" href="/css/start.css">
    <link rel="stylesheet" href="/css/hotel.css">
    <style>
        /* 이미지 크기를 통일 */
        .place-detail img {
            width: 400px;
            height: 400px;
            object-fit: cover; /* 이미지 비율 유지하며 크기에 맞춤 */
        }
    </style>
</head>
<body>
<div class="modal-container">
    <div class="modal-header">
        <h2>${hotel.hotel_name}</h2>
    </div>
    <div class="modal-content">
        <img src="/hotel_images/${hotel.hotel_savefilename}" alt="${hotel.hotel_name}" />
        <p>${hotel.hotel_description}</p>
    </div>

    <!-- 추가된 버튼들 -->
    <div class="modal-buttons">
        <p>좋아요</p>
        <img id="likeImageButton" src="/images/heartbefore.png" alt="Heart"  data-hotel-seq="${hotel_seq}"/>
    </div>

</div>

</body>
</html>