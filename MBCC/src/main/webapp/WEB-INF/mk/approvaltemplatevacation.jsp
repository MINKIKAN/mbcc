<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<h1>vacation template must be here</h1>

<c:set var="matchedMemName" value="" />
<c:forEach items="${mlist}" var="member">
    <c:if test="${member.memId == sessionScope.id}">
        <c:set var="matchedMemName" value="${member.memName}" />
        <c:set var="matchedMemNum" value="${member.memNum}" />
    </c:if>
</c:forEach>

<!-- 휴가 결재 템플릿 -->
<div class="vacation-form">
  <form>
    <div class="form-group">
      <label for="startdate">휴가 시작일</label>
      <input type="date" class="form-control" id="startdate" name="startdate" required>
    </div>
    <div class="form-group">
      <label for="enddate">휴가 복귀일</label>
      <input type="date" class="form-control" id="enddate" name="enddate" required>
    </div>
    <div class="form-group">
      <label for="timeoff">연차 차감시간</label>
      <input type="number" class="form-control" id="timeoff" name="timeoff" required>
    </div>
    <div class="form-group">
      <label for="reason">휴가기안 작성 사유</label>
      <textarea class="form-control" id="reason" name="reason" rows="3" required></textarea>
    </div>
    <button type="submit" class="btn btn-primary">제출</button>
  </form>
</div>
<%-- <div class="card">
  <div class="card-header">
    <h5>휴가원 작성</h5>
  </div>
  <div class="card-body">
    <form>
      <div class="form-group">
        <label for="name">${matchedMemName}</label>
      </div>
      <div class="form-group">
        <label for="startdate">시작일</label>
        <input type="date" id="startdate" placeholder="Enter the startdate" onchange="calculateTimeoff()">
      </div>
      <div class="form-group">
        <label for="enddate">복귀일</label>
        <input type="date" id="enddate" placeholder="Enter the enddate" onchange="calculateTimeoff()">
      </div>
      <div class="form-group">
        <label for="name">차감시간</label>
        <p id="vacation-timeoff"></p>
      </div>
      <div class="form-group">
        <label for="name">제출사유</label>
        <input type="text" class="form-control" id="name" placeholder="Enter your reason">
      </div>
    </form>
    <input type="hidden" name="app-boardType" value="APPROVAL">
    <input type="hidden" name="app-boardName" value="MEMBER${matchedMemNum}VACATION">
    <input type="hidden" name="app-boardContent" value="MEMBER${matchedMemNum}VACATION">
    <input type="hidden" name="app-memNum" value="${matchedMemNum}">
    <input type="hidden" name="app-fileId" value="${vo.fileId}">
    <input type="hidden" name="app-requestorMemNum" value="${matchedMemNum}">
    <input type="hidden" name="app-approverMemNum" value="">
    <input type="hidden" name="app-approvalType" value="VACTION">
    <input type="hidden" name="app-approvalStatus" value="REQUESTED">
  </div>
  <div class="card-footer">
    <button type="button" class="btn btn-primary">제출</button>
  </div>
</div> --%>


<script>
	function calculateTimeoff() {
		const startDateValue=document.getElementById("startdate").value;
		const endDateValue=document.getElementById("enddate").value;
		
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
		  
		    document.getElementById("vacation-timeoff").innerHTML=(day*8)+"시간";
		}
	}
	
	// 전송할 때 차감시간 비어있으면 예외처리
	// 결재 승인자는 자기랑 같은 팀원중 가장 직급 높은 놈
	// 휴가사유 고를 수 있는 콤보박스 만들고 사유에 따라 차감 안되게(예비군, 출산휴가 등)
</script>