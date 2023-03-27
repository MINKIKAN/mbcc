<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div id="approval-view-write-template"style="display:none;">
	<div id="approval-write-template-top">
		<div class="">
				<fieldset class="approval-write-template-top-mode-select">
				  <label>
				    <input type="radio" id="approval-form-selector" name="approval-form-selector" value="VACATION" checked />
				    <span>휴가 신청</span>
				  </label>
				
				  <label>
				    <input type="radio" id="approval-form-selector" name="approval-form-selector" value="OVERTIME" />
				    <span>야간근무 신청</span>
				  </label>
				  
				  <label>
				    <input type="radio" id="approval-form-selector" name="approval-form-selector" value="WORK_HOUR_CHANGE" />
				    <span>출퇴근 시간 변경</span>
				  </label>
				</fieldset>
			</div>
	</div>
	<div id="approval-write-template-bottom">
		<div id="VACATION-form">
		<%@ include file="approvaltemplatevacation.jsp" %>
		</div>
		
		<div id="OVERTIME-form" style="display:none;">
		<%@ include file="approvaltemplateovertime.jsp" %>
		</div>
		
		<div id="WORK_HOUR_CHANGE-form" style="display:none;">
		<%@ include file="approvaltemplateworkhourchange.jsp" %>
		</div>
	</div>
</div>

<div id="approval-view-view-mode">
	<h1>viewMode</h1>
</div>

<script>
$(document).ready(function(){
  $('input[type=radio][name=approval-form-selector]').off('change');
  $('input[type=radio][name=approval-form-selector]').on('change', function() {
    if (this.value == 'VACATION') {
      $('#VACATION-form').show();
      $('#OVERTIME-form').hide();
      $('#WORK_HOUR_CHANGE-form').hide();
    }
    else if (this.value == 'OVERTIME') {
    	$('#VACATION-form').hide();
        $('#OVERTIME-form').show();
        $('#WORK_HOUR_CHANGE-form').hide();
    }
    else if (this.value == 'WORK_HOUR_CHANGE') {
    	$('#VACATION-form').hide();
        $('#OVERTIME-form').hide();
        $('#WORK_HOUR_CHANGE-form').show();
    }
  });
});

function submitApprovalForm(btnId) {
	  
	  if(btnId=="vacation-btn") {
		  const vacationInfoStr='휴가시작일='+document.getElementById("startdate").value+'&휴가복귀일='+document.getElementById("enddate").value +'&연차차감시간='+document.getElementById("vacation-timeoff").innerText;
		  document.getElementById("approvalInfo").value = vacationInfoStr;
		  
	  }
	  else if(btnId=="overtime-btn") {
		  alert("youtouchedovertimeId");
	  }
	  else if(btnId=="woc-btn") {
		  alert("youtouchedwocId");
	  }
	  
	  if(document.getElementById("approvalInfo").value!=null) {
		  alert(document.getElementById("approvalInfo").value);
		  submitToCtrl();
	  }
	  else {
		  alert("널!!");
	  }
	  
	  // Ajax 요청 보내기
	  function submitToCtrl(){
		  $.ajax({
		    url: 'approvalwrite.do',
		    type: 'POST',
		    data: $('#vacationForm').serialize(),
		    success: function(response) {
		        console.log(formData);
		        asyncMovePage('approval.do');
		    },
		    error: function(xhr, status, error) {
		        // 에러 처리
		    }
		  });
	  }
}

</script>
<style>
/* .approval-write-form-accordion-body{
	height:80%;
} */
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Roboto', sans-serif;
}
ul{list-style:none;}
.tabmenu{ 
  max-width:600px; 
  margin: 0 auto; 
  position:relative; 
}
.tabmenu ul{
  position: relative;
}
.tabmenu ul li{
  display:  inline-block;
  width:33.33%; 
  float:left;  
  text-align:center; 
  background :#dee2e6;
  line-height:40px;
}
.tabmenu label{
  display:block;
  width:100%; 
  height:40px;
  line-height:40px;
}
.tabmenu input{display:none;}
.tabCon{
  display:none; 
  width: 100%;
  text-align:left; 
  padding: 20px;
  position:absolute; 
  left:0; top:40px; 
  box-sizing: border-box; 
  border : 5px solid #f9f9f9;
}
.tabmenu input:checked ~ label{
  background:#f9f9f9;
}
.tabmenu input:checked ~ .tabCon{
  display:block;
}
</style>