<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<h1>연장근무 신청 기안</h1>

<c:set var="matchedMemName" value="" />
<c:forEach items="${mlist}" var="member">
    <c:if test="${member.memId == sessionScope.id}">
        <c:set var="matchedMemName" value="${member.memName}" />
        <c:set var="matchedMemNum" value="${member.memNum}" />
    </c:if>
</c:forEach>

<!-- 연장근무신청 결재 템플릿 -->
<div class="overtime-form">
  <form id="overtime-form">
    <div class="form-group">
      <h3>&nbsp;${matchedMemName}</h3>
    </div>
    <div class="form-group">
	  <label for="over-start-time">연장근무 시작 시간</label>
	  <input type="text" class="form-control" id="starttime" name="starttime" value="오후 06:30" readonly>
	</div>
	<div class="form-group">
	  <label for="over-end-time">연장근무 종료 시간</label>
	  <select class="form-control" id="endtime" name="endtime" onchange="calculateExtraAllowance()" required>
	    <option value="">시간 선택</option>
	  </select>
	</div>
    <div class="form-group">
      <label for="over-extra-allowance">연장근무 추가 수당</label>
      <p id="extra-allowance"></p>
    </div>
    <div class="form-group">
      <label for="reason-overtime">연장근무 신청 사유</label>
      <textarea class="form-control" id="reason-overtime" name="reason-overtime" rows="3" required></textarea>
    </div>
    <button type="button" id="overtime-btn" class="btn btn-primary" onclick="submitApprovalForm(form, 'overtime-btn')">제출</button>
  </form>
</div>


<script>
	const ovtimes = [
	  "오후 07:30",
	  "오후 08:30",
	  "오후 09:30",
	  "오후 10:30",
	  "오후 11:30"
	];

	const selectElement = document.getElementById("endtime");
	for (let i = 0; i < ovtimes.length; i++) {
	  const optionElement = document.createElement("option");
	  optionElement.value = ovtimes[i];
	  optionElement.textContent = ovtimes[i];
	  selectElement.appendChild(optionElement);
	}


	function calculateExtraAllowance() {
	  const startTimeStr = "18:30:00";
	  const [startHour, startMin, startSec] = startTimeStr.split(":").map(Number);
	  const startDate = new Date();
	  startDate.setHours(startHour, startMin, startSec, 0);

	  const selectedIndex = document.getElementById("endtime").selectedIndex;
	  const minutes = selectedIndex * 60;
	  const extraAllowance = minutes * 300;

	  document.getElementById("extra-allowance").textContent = "\u00A0\u00A0야간근무 추가수당 : " + extraAllowance + "원";
	}


</script>