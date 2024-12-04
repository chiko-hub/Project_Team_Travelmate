<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="/css/hotel.css">

<section>
  <article>
    <form action="travelform" method="post" name="travelstart">
      <h2>여행 계획 작성</h2>
      <input type="submit" value="작성 시작">
    </form>
  </article>
  <div class="hotel-row">
    <div class="hotel-title">추천 호텔</div>
    <c:forEach var="hotel" items="${hotelList}">
        <div class="hotel">
            <div class="place" onclick="location.href='hotelDetail?hotel_hseq=${hotel.hotel_seq}'">
                <div>
                    <img src="hotel_images/${hotel.hotel_image}" alt="${hotel.hotel_name}" />
                </div>
                <div class="hotel-info">
                    <h4>${hotel.hotel_name}</h4>
                    <p>${hotel.hotel_location}</p>
                    <p>${hotel.hotel_description}</p>
                </div>
            </div>
        </div>
    </c:forEach>
  </div>
</section>