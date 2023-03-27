<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<h1>출퇴근 시간 변경 신청 기안</h1>

<c:set var="matchedMemName" value="" />
<c:forEach items="${mlist}" var="member">
    <c:if test="${member.memId == sessionScope.id}">
        <c:set var="matchedMemName" value="${member.memName}" />
        <c:set var="matchedMemNum" value="${member.memNum}" />
    </c:if>
</c:forEach>

<!-- 출퇴근시간변경 결재 템플릿 -->
<div class="woc-form">
  <form id="woc-form">
    <div class="form-group">
      <h3>&nbsp;${matchedMemName}</h3>
    </div>
    <div class="form-group">
	  <label for="woc-in-work">출근 시간 변경</label>
	  <input type="time" class="form-control" id="in-work" name="in-work">
	</div>
	<div class="form-group">
	  <label for="woc-out-work">퇴근 시간 변경</label>
	  <input type="time" class="form-control" id="out-work" name="out-work">
	</div>
    <div class="form-group">
      <label for="reason-woc">출퇴근시간 변경 사유</label>
      <textarea class="form-control" id="reason-woc" name="reason-woc" rows="3" required></textarea>
    </div>
    <button type="button" id="woc-btn" class="btn btn-primary" onclick="submitApprovalForm(form, 'woc-btn')">제출</button>
  </form>
</div>


<script>



</script>