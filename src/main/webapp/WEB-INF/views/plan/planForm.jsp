<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
    <div class="plan_container">
      <div class="planAddButton">
        <input type="button" value="직접 추가" onclick="togglePanel()"/>
      </div>
      <!-- 입력 패널 -->
      <div id="planAddPanel" class="panel">
        <h3>새 계획 추가</h3>
        <form id="planAddForm" method="post" action="addPlan">
          <input type="hidden" name="plan_category" value="place"/> <!-- category 전달 임시 값 -->
          <label for="planName">장소</label>
          <input type="text" id="planName" name="plan_name" required/><br/>
          <label for="planDate">날짜</label>
          <!-- 날짜 입력과 날짜에 맞는 plan_seq 전달 -->
          <select id="planDate" name="plan_date" required onchange="updatePlanSeq()">
              <option value=""></option>
            <c:forEach var="i" begin="0" end="${fn:length(planList)-1}" varStatus="status">
              <option value="${planList[i].travel_date}" data-plan-seq="${planList[i].plan_seq}">
                  ${planList[i].travel_date}
              </option>
            </c:forEach>
          </select>
          <input type="hidden" id="planSeq" name="plan_seq"/> <!-- plan 에 해당하는 번호 -->
          <label for="planStartTime">시작시간</label>
          <select id="planStartTime" name="starttime" required>
            <option value="00" selected>오전 00시</option>
            <option value="01">오전 01시</option>
            <option value="02">오전 02시</option>
            <option value="03">오전 03시</option>
            <option value="04">오전 04시</option>
            <option value="05">오전 05시</option>
            <option value="06">오전 06시</option>
            <option value="07">오전 07시</option>
            <option value="08">오전 08시</option>
            <option value="09">오전 09시</option>
            <option value="10">오전 10시</option>
            <option value="11">오전 11시</option>
            <option value="12">오후 12시</option>
            <option value="13">오후 01시</option>
            <option value="14">오후 02시</option>
            <option value="15">오후 03시</option>
            <option value="16">오후 04시</option>
            <option value="17">오후 05시</option>
            <option value="18">오후 06시</option>
            <option value="19">오후 07시</option>
            <option value="20">오후 08시</option>
            <option value="21">오후 09시</option>
            <option value="22">오후 10시</option>
            <option value="23">오후 11시</option>
          </select>
          <label for="planEndTime">종료시간</label>
          <select id="planEndTime" name="endtime" required>
            <option value="01" selected>오전 01시</option>
            <option value="02">오전 02시</option>
            <option value="03">오전 03시</option>
            <option value="04">오전 04시</option>
            <option value="05">오전 05시</option>
            <option value="06">오전 06시</option>
            <option value="07">오전 07시</option>
            <option value="08">오전 08시</option>
            <option value="09">오전 09시</option>
            <option value="10">오전 10시</option>
            <option value="11">오전 11시</option>
            <option value="12">오후 12시</option>
            <option value="13">오후 01시</option>
            <option value="14">오후 02시</option>
            <option value="15">오후 03시</option>
            <option value="16">오후 04시</option>
            <option value="17">오후 05시</option>
            <option value="18">오후 06시</option>
            <option value="19">오후 07시</option>
            <option value="20">오후 08시</option>
            <option value="21">오후 09시</option>
            <option value="22">오후 10시</option>
            <option value="23">오후 11시</option>
            <option value="24">오전 00시</option>
          </select>
          <div class="planAddButton">
            <button type="button" onclick="addPlan()">추가</button>
            <button type="button" onclick="togglePanel()">취소</button>
          </div>
        </form>
      </div>

      <!-- 계획 테이블 -->
      <div class="planTable">
        <!-- 시간 정보 테이블 -->
        <div class="timeList">
          <div class="time"></div>
          <div class="time">오전 00시</div>
          <div class="time">오전 01시</div>
          <div class="time">오전 02시</div>
          <div class="time">오전 03시</div>
          <div class="time">오전 04시</div>
          <div class="time">오전 05시</div>
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
        <!-- 날짜별 계획 테이블 -->
        <c:forEach var="plan" items="${planList}">
          <div class="planList" id="${plan.plan_seq}">
            <!-- 날짜 출력 -->
            <div class="cell">${plan.travel_date}</div>
            <!-- 시간 셀 출력 -->
            <c:choose>
              <%-- planDetailList[plan.plan_seq]가 비어있는 경우 --%>
              <c:when test="${empty planDetailList[plan.plan_seq]}">
                <c:forEach var="cellNum" begin="0" end="23">
                  <div class="cell"></div>
                </c:forEach>
              </c:when>

              <%-- planDetailList[plan.plan_seq]에 데이터가 있는 경우 --%>
              <c:otherwise>
                <c:set var="detailCount" value="0"/>
                <c:set var="cellCount" value="0"/>
                <c:forEach var="cellNum" begin="0" end="23">
                  <c:choose>
                    <%-- 현재 time이 detail의 starttime과 일치하는 경우 --%>
                    <c:when test="${detailCount < fn:length(planDetailList[plan.plan_seq]) && planDetailList[plan.plan_seq][detailCount].starttime == cellCount}">
                      <%-- 시간 간격 계산 --%>
                      <c:set var="startCellCount" value="${planDetailList[plan.plan_seq][detailCount].starttime}"/>
                      <c:set var="endcellCount" value="${planDetailList[plan.plan_seq][detailCount].endtime}"/>
                      <c:set var="timeGap" value="${endcellCount - startCellCount}"/>
                      <%-- 일정 칸 생성 --%>
                      <div class="cell" style="grid-row: span ${timeGap}; background: #2e8b57; color: white;">
                        <label class="planName">${planDetailList[plan.plan_seq][detailCount].plan_name}</label>
                      </div>
                      <%-- detailCount과 cellCount 값 업데이트 --%>
                      <c:set var="detailCount" value="${detailCount + 1}"/>
                      <c:set var="cellCount" value="${cellCount + (timeGap)}"/>
                    </c:when>
                    <%-- starttime과 일치하지 않는 경우 빈칸 출력 --%>
                    <c:otherwise>
                      <c:choose>
                        <c:when test="${cellCount <= 23}">
                          <div class="cell"></div>
                          <c:set var="cellCount" value="${cellCount + 1}"/>
                        </c:when>
                      </c:choose>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>
              </c:otherwise>
            </c:choose>
          </div>
        </c:forEach>
      </div>
    </div>
<%@ include file="../footer.jsp" %>
