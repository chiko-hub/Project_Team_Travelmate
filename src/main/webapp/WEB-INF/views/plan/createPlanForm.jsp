<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="plan_container">
  <!-- 새 일정 생성 패널 -->
  <div id="planCreatePanel" class="panel" style="display: block">
    <h3>새 일정 생성</h3>
    <form id="planCreateForm" method="post" action="roadPlan">
      <label>날짜</label>
      <input type="text" name="datefilter" value=""/><br/>
      <div class="planCreateButton">
        <button type="button" onclick="">생성</button>
      </div>
    </form>
  </div>
</div>
<%@ include file="../footer.jsp" %>
