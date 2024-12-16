<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 호텔 리스트 -->
<c:forEach var="hotel" items="${hotelList}">
  <div class="item">
    <div class="hotelImage" data-hotel-seq="${hotel.hotel_seq}">
      <img src="/hotel_images/${hotel.hotel_savefilename}" alt="${hotel.hotel_name}"/>
    </div>
    <div class="hotelText" data-hotel-seq="${hotel.hotel_seq}">
      <div class="hotelName">${hotel.hotel_name}</div>
      <div class="hotelDescription">${hotel.hotel_description}</div>
    </div>
    <div class="hotelButton">
      <button class="toggle-button" data-wish-seq="${hotel.hotel_seq}">
        <span class="icon-plus">+</span>
      </button>
    </div>
  </div>
</c:forEach>
<!-- 상세 내용 표시 -->
<div class="pageContainer">
  <!-- 페이징 처리 -->
  <div class="row"> <!-- 페이지의 시작 -->
    <div class="col">
      <c:if test="${paging.prev}">
        <!-- 이전 페이지 링크 -->
        <a href="javascript:void(0);" onclick="fetchHotelList('${hotelCategory}', ${paging.beginPage-1})">◀</a>&nbsp;
      </c:if>
      <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
        <c:if test="${index != paging.page}">
          <!-- 페이지 번호 링크 (다른 페이지) -->
          <a href="javascript:void(0);" onclick="fetchHotelList('${hotelCategory}', ${index})">${index}&nbsp;</a>
        </c:if>
        <c:if test="${index == paging.page}">
          <!-- 현재 페이지 -->
          <span style="color:red">${index}&nbsp;</span>
        </c:if>
      </c:forEach>
      &nbsp;
      <c:if test="${paging.next}">
        <!-- 다음 페이지 링크 -->
        <a href="javascript:void(0);" onclick="fetchHotelList('${hotelCategory}', ${paging.endPage+1})">▶</a>
      </c:if>
    </div>
  </div> <!-- 페이지의 끝 -->
</div>