<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <div class="approval-grid">
		<div class="approval-main-top">
			<h2 id="approval-title">결재</h2>
			<div class="">
				<fieldset class="approval-main-top-mode-select">
				  <label>
				    <input type="radio" id="contact-view-mode" name="contact" value="view-mode" checked/>
				    <span>문서 확인</span>
				  </label>
				  
				  <label>
				    <input type="radio" id="contact-write-mode" name="contact" value="write-mode"/>
				    <span>새 기안</span>
				  </label>
				</fieldset>
			</div>
		</div>
		
		<div class="approval-main-side">
			<div class="approval-main-side-header">
				<div class="approval-main-side-header-content approval-main-side-header-content-sort-todo" style="width:100%;" onclick="sideHeaderContentClickTodo()">요청된 문서</div>
				<div class="approval-main-side-header-content approval-main-side-header-content-sort-inapprovalStatus" style="width:100%;" onclick="sideHeaderContentClickInapprovalStatus()">승인된 문서</div>
				<div class="approval-main-side-header-content approval-main-side-header-content-sort-done" style="width:100%;" onclick="sideHeaderContentClickDone()">반려된 문서</div>
			</div>
			<hr>
			<div class="approval-main-side-body">
				<div class="approval-main-side-header-content approval-main-side-header-content-sort-entire" style="width:100%;" onclick="sideHeaderContentClickEntire()">전체 업무</div>
				<div class="approval-main-side-header-content approval-main-side-header-content-sort-responsiblememnum" style="width:100%;" onclick="sideHeaderContentClickResponsibleMemNum()">담당 업무</div>
				<div class="approval-main-side-header-content-sort-teamnum" style="width:100%;" onclick="">참조 업무</div>
				<div class="approval-main-side-header-content-sort-memnum" style="width:100%;" onclick="sideHeaderContentClickMemNum()">내가 쓴 업무</div>
				<div class="approval-main-side-header-content" style="width:100%;" onclick="">임시 보관함</div>
			</div>
			<hr>
		</div>
		
		<div class="approval-main-center-left">
			<c:forEach var="vo" items="${alist}" varStatus="vs">
		    <div class="approval-main-center-left-alist-section" onclick="showAlistContents(this)">
		    	<div class="approval-main-center-left-alist-section-component">
		    	  <h6 class="approval-board-title">${vo.boardTitle}</h6>
		    	  <h6>
		    	  담당자 : 
		    	  	<c:forEach var="m" items="${mlist}">
	                    <c:if test="${m.memNum == vo.requestorMemNum}">
	                        ${m.memName}&nbsp;&nbsp;
	                    </c:if>
	                </c:forEach>
		    	  </h6>
		    	</div>
		    	  <h6 class="approval-main-center-left-alist-section-component
					    <c:choose>
					        <c:when test="${vo.approvalStatus == 'REQUESTED'}">approval-status-requested</c:when>
					        <c:when test="${vo.approvalStatus == 'APPROVED'}">approval-status-approved</c:when>
					        <c:when test="${vo.approvalStatus == 'REJECTED'}">approval-status-rejected</c:when>
					    </c:choose>
				  ">
					<c:choose>
				        <c:when test="${vo.approvalStatus == 'REQUESTED'}">요청됨&nbsp;&nbsp;<span class="badge bg-secondary"></span></c:when>
				        <c:when test="${vo.approvalStatus == 'APPROVED'}">승인됨&nbsp;&nbsp;<span class="badge bg-secondary"></span></c:when>
				        <c:when test="${vo.approvalStatus == 'REJECTED'}">반려됨&nbsp;&nbsp;<span class="badge bg-secondary"></span></c:when>
				    </c:choose>
				  </h6>
				  <input type="hidden" class="approval-board-id" value="${vo.boardId}">
			      <input type="hidden" class="approval-board-type" value="${vo.boardType}">
			      <input type="hidden" class="approval-board-content" value="${vo.boardContent}">
			      <input type="hidden" class="approval-create-date" value="${vo.createDate}">
			      <input type="hidden" class="approval-update-date" value="${vo.updateDate}">
			      <input type="hidden" class="approval-mem-num" value="${vo.memNum}">
			      <input type="hidden" class="approval-file-id" value="${vo.fileId}">
			      <input type="hidden" class="approval-requestor-mem-num" value="${vo.requestorMemNum}">
			      <input type="hidden" class="approval-approver-mem-num" value="${vo.approverMemNum}">
			      <input type="hidden" class="approval-type" value="${vo.approvalType}">
			      <input type="hidden" class="approval-status" value="${vo.approvalStatus}">
			      <input type="hidden" class="approval-date" value="${vo.approvalDate}">
			      <input type="hidden" class="dueDate" value="${vo.dueDate}">
			      <input type="hidden" class="approval-info" value="${vo.approvalInfo}">
	    	</div>   	 
		  	</c:forEach>
		</div>
		
		<div class="approval-main-center-right">
		  <div class="approval-main-center-right-write-form">
		    <%@ include file="approvalview.jsp" %>
		  </div>
		</div>
		
	</div>

<script>
  const viewModeElement = document.getElementById("contact-view-mode");
  const writeModeElement = document.getElementById("contact-write-mode");

  viewModeElement.addEvenalistener("change", function() {
    document.getElementById("approval-view-write-template").style.display = "none";
    document.getElementById("approval-view-view-mode").style.display = "block";
  });

  writeModeElement.addEvenalistener("change", function() {
    document.getElementById("approval-view-write-template").style.display = "block";
    document.getElementById("approval-view-view-mode").style.display = "none";
  });

 /*  function showAlistContents(data) {
	  var boardTitle = data.querySelector('.approval-board-title').textContent;
	  var approvalStatus = data.querySelector('.approval-status').value;
	  var hiddenInputs = data.querySelectorAll('input[type="hidden"]');

	  var inputData = {
	    boardTitle: boardTitle,
	    approvalStatus: approvalStatus
	  };

	  hiddenInputs.forEach(function (input) {
	    inputData[input.getAttribute('class')] = input.value;
	  });

	  var centerRight = document.querySelector('.approval-main-center-right');
	  centerRight.innerHTML = '';

	  var frame = document.createElement('div');
	  frame.classList.add('approval-main-center-right-frame');

	  var frameTop = document.createElement('div');
	  frameTop.classList.add('approval-main-center-right-frame-top');

	  // Create header div
	  var headerDiv = document.createElement('div');
	  headerDiv.classList.add('view-contents-header');

	  // Create title div
	  var titleDiv = document.createElement('div');
	  titleDiv.classList.add('detail-frametop-board-title');
	  titleDiv.textContent = inputData['boardTitle'];
	  headerDiv.appendChild(titleDiv);

	  // Create approvalStatus select box
	  var approvalStatusSelect = document.createElement('select');
	  approvalStatusSelect.classList.add('detail-frametop-board-approvalStatus');

	  // Create options
	  var options = [
	    { text: '요청됨', value: 'REQUESTED' },
	    { text: '승인됨', value: 'APPROVED' },
	    { text: '반려됨', value: 'REJECTED' }
	  ];
	
	  options.forEach(function (optionObj) {
	    var option = document.createElement('option');
	    option.textContent = optionObj.text;
	    option.value = optionObj.value;
	    if (optionObj.value === inputData['approvalStatus']) {
	      option.selected = true;
	    }
	    approvalStatusSelect.appendChild(option);
	  });
	
	  headerDiv.appendChild(approvalStatusSelect);
	  
	  // Create hidden input for approval-board-id
	  var hiddenBoardIdInput = document.createElement('input');
	  hiddenBoardIdInput.type = 'hidden';
	  hiddenBoardIdInput.setAttribute('class', 'approval-board-id');
	  hiddenBoardIdInput.value = inputData['approval-board-id'];
	  headerDiv.appendChild(hiddenBoardIdInput);
	  
	  var horizontalLine = document.createElement('hr');
	  headerDiv.appendChild(horizontalLine);
	  

	  // Append headerDiv to frameTop
	  frameTop.appendChild(headerDiv);

	  // Create header-wrapper div
	  var headerWrapper = document.createElement('div');
	  headerWrapper.classList.add('header-wrapper');
	  
	  var inputFields = [
	    { key: 'approval-create-date', label: '작성일' },
	    { key: 'approval-mem-num', label: '등록자' },
	    { key: 'approval-requestor-mem-num', label: '요청자' },
	    { key: 'approval-info', label: '참조자' }
	  ];

	  // Move the inputFields content creation inside the headerWrapper
	  inputFields.forEach(function (field) {
	    var div = document.createElement('div');
	    div.classList.add('detail-frametop-board-info');
	    div.textContent = field.label + ": " + inputData[field.key];
	    headerWrapper.appendChild(div);
	  });

	  // Append headerWrapper to frameTop
	  frameTop.appendChild(headerWrapper);

	  frame.appendChild(frameTop);

	  var frameBottom = document.createElement('div');
	  frameBottom.classList.add('approval-main-center-right-frame-bottom');
	  
	  // ss

	  var contentDiv = document.createElement('div');
	  contentDiv.textContent = inputData['approval-board-content'];
	  frameBottom.appendChild(contentDiv);

	  var buttonDiv = document.createElement('div');
	  buttonDiv.classList.add('approval-main-center-right-frame-bottom-delmodBtn-area');

	  var editButton = document.createElement('button');
	  editButton.classList.add('btn', 'btn-primary');
	  editButton.setAttribute('id', 'approval-detail-modify-button');
	  editButton.textContent = '수정';
	  editButton.addEventListener('click', function () {
		  // Edit button click handler
	  });

	  var deleteButton = document.createElement('button');
	  deleteButton.classList.add('btn', 'btn-danger');
	  deleteButton.setAttribute('id', 'approval-detail-delete-button');
	  deleteButton.textContent = '삭제';
	  deleteButton.addEventListener('click', function () {
	  // Delete button click handler
	  });

	  buttonDiv.appendChild(editButton);
	  buttonDiv.appendChild(deleteButton);
	  frameBottom.appendChild(buttonDiv);
	  //ss

	  frame.appendChild(frameBottom);

	  centerRight.appendChild(frame);
	} */
</script>

<style>
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Roboto', sans-serif;
}
body {
    background-color: #f4f6f9;
}
#approval-title {
    margin-left: 10px;
}
.approval-grid {
    display: grid;
    height: 100vh;
    grid-template-columns: 250px repeat(6, 1fr);
    grid-template-rows: 100px repeat(4, 1fr);
    grid-template-areas:
    "top top top right right right right"
    "side left left right right right right"
    "side left left right right right right"
    "side left left right right right right"
    "side left left right right right right";
}
.approval-main-side {
    background-color: #ffffff;
    border-right: 1px solid #dee2e6;
    grid-area: side;
    padding: 10px;
}

[class*="approval-main-side-header-content"] {
    font-size: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 8px 0;
    cursor: pointer;
}

[class*="approval-main-side-header-content"]:hover {
    background-color: #f4f6f9;
}

.approval-main-top {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #dee2e6;
    border-right: 1px solid #dee2e6;
    grid-area: top;
    background-color: #ffffff;
    padding: 10px;
}

.approval-main-center-left {
    border-right: 1px solid #dee2e6;
    grid-area: left;
    background-color: #ffffff;
    overflow-y: scroll;
}

.approval-main-center-left::-webkit-scrollbar {
    width: 0px; /* 스크롤바 너비를 설정합니다. */
}

.approval-main-center-left::-webkit-scrollbar-thumb {
    background: rgba(0, 0, 0, 0.5); /* 스크롤바 배경색을 반투명하게 설정합니다. */
}

.approval-main-center-left::-webkit-scrollbar-track {
    background: transparent; /* 스크롤바 트랙을 투명하게 만듭니다. */
}

.approval-main-center-left-alist-section {
    height: 100px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 10px;
    border-bottom: 1px solid #dee2e6;
    cursor: pointer;
}

.approval-main-center-left-alist-section:hover {
    background-color: #f4f6f9;
}

.approval-main-center-right {
    grid-area: right;
    background-color: #ffffff;
}

.approval-main-center-right-frame {
  position: relative;
  width: 100%;
  height: 100%;
}

.approval-main-center-right-frame-top {
  border-top:solid lightgray 1px;
  border-bottom:solid lightgray 1px;
  width: 98%;
  height: 18%;
  position: absolute;
  top: 10%;
  left: 50%;
  transform: translate(-50%, -50%);
  padding: 20px;
}

.approval-main-center-right-frame-bottom {
  border-bottom:solid lightgray 1px;
  width: 98%;
  height: 80%;
  position: absolute;
  top: 59%;
  left: 50%;
  transform: translate(-50%, -50%);
  overflow-y: auto;
  padding: 20px;
}

label {
  font-size: 18px;
  line-height: 2rem;
  padding: 0.2em 0.4em;
}

span {
  vertical-align: middle;
}

[type="radio"] {
  vertical-align: middle;
  appearance: none;
  border: max(2px, 0.1em) solid gray;
  border-radius: 50%;
  width: 1.25em;
  height: 1.25em;
  transition: border 0.2s ease-in-out;
}

[type="radio"]:checked {
  border: 0.4em solid tomato;
}

[type="radio"]:focus-visible {
  outline-offset: max(2px, 0.1em);
  outline: max(2px, 0.1em) dotted tomato;
}

[type="radio"]:hover {
  box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
  cursor: pointer;
}

[type="radio"]:disabled {
  background-color: lightgray;
  box-shadow: none;
  opacity: 0.7;
  cursor: not-allowed;
}

[type="radio"]:disabled + span {
  opacity: 0.7;
  cursor: not-allowed;
}

/* Global CSS */
fieldset {
  display: flex;
  justify-content: center;
  border: none;
  margin: 0;
  padding: 40px 20px;
}

*,
*::before,
*::after {
  box-sizing: border-box;
}

.approval-requestor-member-name {
	font-size:12px;
}

.approval-status-to-do {
    color: limegreen;
    font-size:11px;
}

.approval-status-in-approvalStatus {
    color: blue;
    font-size:12px;
}

.approval-status-done {
    color: gray;
    font-size:12px;
}
</style>