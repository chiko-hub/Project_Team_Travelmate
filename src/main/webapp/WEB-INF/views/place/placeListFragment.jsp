<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 장소 리스트 -->
<c:forEach var="place" items="${placeList}">
  <div class="item">
    <div class="placeImage" data-place-seq="${place.place_seq}">
      <img src="/place_images/${place.savefilename}" alt="${place.place_name}"/>
    </div>
    <div class="placeText" data-place-seq="${place.place_seq}">
      <div class="placeName">${place.place_name}</div>
      <div class="placeDescription">${place.place_description}</div>
    </div>
    <div class="placeButton">
      <button class="toggle-button" data-wish-seq="${place.place_seq}">
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
        <a href="javascript:void(0);" onclick="fetchPlaceList('${placeCategory}', ${paging.beginPage-1})">◀</a>&nbsp;
      </c:if>
      <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
        <c:if test="${index != paging.page}">
          <!-- 페이지 번호 링크 (다른 페이지) -->
          <a href="javascript:void(0);" onclick="fetchPlaceList('${placeCategory}', ${index})">${index}&nbsp;</a>
        </c:if>
        <c:if test="${index == paging.page}">
          <!-- 현재 페이지 -->
          <span style="color:red">${index}&nbsp;</span>
        </c:if>
      </c:forEach>
      &nbsp;
      <c:if test="${paging.next}">
        <!-- 다음 페이지 링크 -->
        <a href="javascript:void(0);" onclick="fetchPlaceList('${placeCategory}', ${paging.endPage+1})">▶</a>
      </c:if>
    </div>
  </div> <!-- 페이지의 끝 -->
</div>