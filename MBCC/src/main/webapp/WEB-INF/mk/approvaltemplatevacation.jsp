<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<h1>휴가 신청 기안</h1>

<c:set var="matchedMemName" value="" />
<c:forEach items="${mlist}" var="member">
    <c:if test="${member.memId == sessionScope.id}">
        <c:set var="matchedMemName" value="${member.memName}" />
        <c:set var="matchedMemNum" value="${member.memNum}" />
    </c:if>
</c:forEach>

<!-- 휴가 결재 템플릿 -->
<div class="vacation-form">
  <form id="vacationForm">
    <div class="form-group">
      <h3>&nbsp;${matchedMemName}</h3>
    </div>
    <!-- 하나의 approvalInfo문자열로 전송할 데이터 -->
    <div class="form-group">
      <label for="startdate">휴가 시작일</label>
      <input type="date" class="form-control" id="startdate" name="startdate" required onchange="calculateTimeoff()">
    </div>
    <div class="form-group">
      <label for="enddate">휴가 복귀일</label>
      <input type="date" class="form-control" id="enddate" name="enddate" required onchange="calculateTimeoff()">
    </div>
    <div class="form-group">
      <label for="timeoff">연차 차감시간</label>
      <p id="vacation-timeoff"></p>
    </div>
    <!-- 일반적인 form으로 전송할 데이터 -->
    <div class="form-group">
      <label for="reason-vacation">휴가기안 작성 사유</label>
      <textarea class="form-control" id="boardContent" name="boardContent" rows="3" required></textarea>
    </div>
    <input type="hidden" id="boardType" name="boardType" value="APPROVAL">
    <input type="hidden" id="boardTitle" name="boardTitle" value="MEMBER${matchedMemNum}VACATION">
    <input type="hidden" id="memNum" name="memNum" value="${matchedMemNum}">
    <input type="hidden" id="fileId" name="fileId" value="1">
    <input type="hidden" id="requestorMemNum" name="requestorMemNum" value="${matchedMemNum}">
    <input type="hidden" id="approverMemNum" name="approverMemNum" value="1">
    <input type="hidden" id="approvalType" name="approvalType" value="VACATION">
    <input type="hidden" id="approvalStatus" name="approvalStatus" value="REQUESTED">
    <input type="hidden" id="approvalInfo" name="approvalInfo">
    <button type="button" id="vacation-btn" class="btn btn-primary" onclick="submitApprovalForm('vacation-btn')">제출</button>
  </form>
</div>

<script>
	
	function calculateTimeoff() {
            
		const startDateValue=document.getElementById("startdate").value;
		const endDateValue=document.getElementById("enddate").value;
            document.getElementById("enddate").setAttribute("min",startDateValue);
		
		if(startDateValue && endDateValue) {
		    const startDate=new Date(startDateValue);
		    const endDate=new Date(endDateValue);
		    const diffInMs=endDate-startDate;
		    
		    if(diffInMs<0) {
		        alert("복귀일은 시작일보다 이전일 수 없습니다.");
		        return;
		    }
		    const diffInHours=diffInMs/(1000*60*60);
		    let day=diffInHours/24;
		  
		    document.getElementById("vacation-timeoff").innerHTML="\u00A0\u00A0"+(day*8)+"시간";
		}
	}
	
	
	
	// 전송할 때 차감시간 비어있으면 예외처리
	// 결재 승인자는 자기랑 같은 팀원중 가장 직급 높은 놈
	// 휴가사유 고를 수 있는 콤보박스 만들고 사유에 따라 차감 안되게(예비군, 출산휴가 등)
</script>