<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

	<c:set var="matchedMemNum" value="0" />
	<c:forEach items="${mlist}" var="member">
	    <c:if test="${member.memId == sessionScope.id}">
	        <c:set var="matchedMemNum" value="${member.memNum}" />
	    </c:if>
	</c:forEach>
	<c:set var="matchedMemName" value="" />
	<c:forEach items="${mlist}" var="member">
	    <c:if test="${member.memId == sessionScope.id}">
	        <c:set var="matchedMemName" value="${member.memName}" />
	    </c:if>
	</c:forEach>
    
	<div class="task-grid">
		<div class="task-main-side">
			<button id="task-addBtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#taskModal">새 업무</button><br><hr>
			<div class="task-main-side-header">
				<div class="task-main-side-header-content task-main-side-header-content-sort-todo" style="width:100%;" onclick="sideHeaderContentClickTodo()">할 일</div>
				<div class="task-main-side-header-content task-main-side-header-content-sort-inprogress" style="width:100%;" onclick="sideHeaderContentClickInprogress()">진행 중</div>
				<div class="task-main-side-header-content task-main-side-header-content-sort-done" style="width:100%;" onclick="sideHeaderContentClickDone()">완료</div>
			</div>
			<hr>
			<div class="task-main-side-body">
				<div class="task-main-side-header-content task-main-side-header-content-sort-entire" style="width:100%;" onclick="sideHeaderContentClickEntire()">전체 업무</div>
				<div class="task-main-side-header-content task-main-side-header-content-sort-responsiblememnum" style="width:100%;" onclick="sideHeaderContentClickResponsibleMemNum()">담당 업무</div>
				<div class="task-main-side-header-content-sort-teamnum" style="width:100%;" onclick="">참조 업무</div>
				<div class="task-main-side-header-content-sort-memnum" style="width:100%;" onclick="sideHeaderContentClickMemNum()">내가 쓴 업무</div>
				<div class="task-main-side-header-content" style="width:100%;" onclick="">임시 보관함</div>
			</div>
			<hr>
		</div>
		
		<div class="task-main-top"><h2 id="task-title">담당업무</h2></div>
		
		<div class="task-main-center-left">
			<c:forEach var="vo" items="${tlist}" varStatus="vs">
		    
		    <div class="task-main-center-left-tlist-section" onclick="showTlistContents(this)">
		    	<div class="task-main-center-left-tlist-section-component">
		    	  <h6 class="task-board-title">${vo.boardTitle}</h6>
		    	  <h6>
		    	  담당자 : 
		    	  	<c:forEach var="m" items="${mlist}">
	                    <c:if test="${m.memNum == vo.responsibleMemNum}">
	                        ${m.memName}&nbsp;&nbsp;
	                    </c:if>
	                </c:forEach>
		    	  </h6>
		    	</div>
		    	  <h6 class="task-main-center-left-tlist-section-component
					    <c:choose>
					        <c:when test="${vo.progress == 'TO_DO'}">task-status-to-do</c:when>
					        <c:when test="${vo.progress == 'IN_PROGRESS'}">task-status-in-progress</c:when>
					        <c:when test="${vo.progress == 'DONE'}">task-status-done</c:when>
					    </c:choose>
				  ">
					<c:choose>
				        <c:when test="${vo.progress == 'TO_DO'}">할 일&nbsp;&nbsp;<span class="badge bg-secondary"></span></c:when>
				        <c:when test="${vo.progress == 'IN_PROGRESS'}">진행 중&nbsp;&nbsp;<span class="badge bg-secondary"></span></c:when>
				        <c:when test="${vo.progress == 'DONE'}">완료&nbsp;&nbsp;<span class="badge bg-secondary"></span></c:when>
				    </c:choose>
				  </h6>
				  <input type="hidden" class="task-board-id" value="${vo.boardId}">
			      <input type="hidden" class="task-board-type" value="${vo.boardType}">
			      <input type="hidden" class="task-board-content" value="${vo.boardContent}">
			      <input type="hidden" class="task-create-date" value="${vo.createDate}">
			      <input type="hidden" class="task-update-date" value="${vo.updateDate}">
			      <input type="hidden" class="task-mem-num" value="${vo.memNum}">
			      <input type="hidden" class="task-file-id" value="${vo.fileId}">
			      <input type="hidden" class="task-responsible-mem-num" value="${vo.responsibleMemNum}">
			      <input type="hidden" class="task-team-num" value="${vo.teamNum}">
	    	</div>   	 
		  	</c:forEach>
		</div>
		
		<div class="task-main-center-right"> <div class="task-main-center-right-frame"><div class="task-main-center-right-frame-top"></div><div class="task-main-center-right-frame-bottom"></div></div> </div>
		
	</div>
	
      <div class="modal fade" id="taskModal" tabindex="-1" role="dialog" aria-labelledby="taskModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="taskModalLabel">새 업무 작성</h5>
	        </div>
	        <div class="modal-body">
	          <!-- 업무 작성 양식 -->
	          <form id="taskForm" action="${ctx}/taskwrite.do" method="POST">
	            <div class="form-group mb-3">
	              <label for="taskTitle" class="form-label">제목</label>
	              <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요">
	            </div>
	            <div class="form-group mb-3">
	              <label for="responsibleMemNum" class="form-label">담당자 회원 번호</label>
	              <!-- <input type="number" class="form-control" id="responsibleMemNum" name="responsibleMemNum" placeholder="담당자 회원 번호를 입력하세요"> -->
	              <input type="text" class="form-control" id="responsibleMemNum" name="responsibleMemNum" placeholder="담당자 이름을 입력하세요">
	            </div>
	            <div class="form-group mb-3">
	              <label for="teamNum" class="form-label">부서 번호</label>
	              <input type="number" class="form-control" id="teamNum" name="teamNum" placeholder="부서 번호를 입력하세요">
	            </div>
	            <div class="form-group mb-3">
	              <label for="taskContent" class="form-label">내용</label>
	              <textarea class="form-control" id="boardContent" name="boardContent" rows="3"></textarea>
	            </div>
	            <input type="hidden" id="boardType" name="boardType" value="TASK">
	            
				<input type="hidden" id="memNum" name="memNum" value="${matchedMemNum}">
	            <input type="hidden" id="fileId" name="fileId" value="1">
	            <input type="hidden" id="progress" name="progress" value="TO_DO">
		      <div class="modal-footer">
		      매치드맴넘:${matchedMemNum}
		        <button type="button" class="btn btn-primary" onclick="submitTaskForm(form)">등록</button>
		      </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		
		
			
<script>

	function filterTasks(progress) {
	    var taskSections = document.querySelectorAll(".task-main-center-left-tlist-section");
	
	    taskSections.forEach(function(taskSection) {
	        var taskStatusElement = taskSection.querySelector(".task-status-to-do, .task-status-in-progress, .task-status-done");
	        var taskProgress = taskStatusElement.textContent.trim().split(' ')[0];
	
	        if (progress === null || progress === taskProgress) {
	            taskSection.style.display = "flex";
	        } else {
	            taskSection.style.display = "none";
	        }
	    });
	    
	}
	
	function sideHeaderContentClickTodo() {
	    filterTasks("할");
	}
	
	function sideHeaderContentClickInprogress() {
	    filterTasks("진행");
	}
	
	function sideHeaderContentClickDone() {
	    filterTasks("완료");
	}
	
	function sideHeaderContentClickEntire() {
	    filterTasks(null);
	}
	
	// 페이지가 로드될 때 모든 항목을 기본으로 표시
	document.addEventListener("DOMContentLoaded", function() {
	    sideHeaderContentClickEntire();
	});
	
	$(document).ready(function() {
	    $('#task-addBtn').on('click', function() {
	        $('#taskModal').modal('show');
	    });
	});
	
	function submitTaskForm(form){
		form.submit();
		/* event.preventDefault(); // 기본 submit 동작을 막습니다.

	    // FormData 객체를 생성하여 입력된 데이터를 가져옵니다.
	    const formData = new FormData(form);

	    // Fetch API를 사용하여 AJAX 요청을 전송합니다.
	    fetch(form.action, {
	        method: form.method,
	        body: formData
	    })
	    .then(response => response.json())
	    .then(data => {
	        if (data.success) {
	            alert('작업이 성공적으로 추가되었습니다.');
	            // 필요한 경우, 여기에서 추가 작업을 수행하십시오. 예: 폼 초기화, 페이지 업데이트 등
	        } else {
	            alert('작업 추가에 실패했습니다.');
	        }
	    })
	    .catch(error => {
	        console.error('Error:', error);
	        alert('작업 추가 중 오류가 발생했습니다.');
	    }); */
	}

	function showTlistContents(data) {
		  var boardTitle = data.querySelector('.task-board-title').textContent;
		  var progress = data.querySelector('.task-main-center-left-tlist-section-component + h6').textContent;
		  var hiddenInputs = data.querySelectorAll('input[type="hidden"]');

		  var inputData = {
		    boardTitle: boardTitle,
		    progress: progress
		  };

		  hiddenInputs.forEach(function (input) {
		    inputData[input.getAttribute('class')] = input.value;
		  });

		  var centerRight = document.querySelector('.task-main-center-right');
		  centerRight.innerHTML = '';

		  var frame = document.createElement('div');
		  frame.classList.add('task-main-center-right-frame');

		  var frameTop = document.createElement('div');
		  frameTop.classList.add('task-main-center-right-frame-top');

		  // Create header div
		  var headerDiv = document.createElement('div');
		  headerDiv.classList.add('view-contents-header');

		  // Create title div
		  var titleDiv = document.createElement('div');
		  titleDiv.classList.add('detail-frametop-board-title');
		  titleDiv.textContent = inputData['boardTitle'];
		  headerDiv.appendChild(titleDiv);

		  // Create progress select box
		  var progressSelect = document.createElement('select');
		  progressSelect.classList.add('detail-frametop-board-progress');

		  // Create options
		  var options = [
		    { text: '할 일', value: 'TO_DO' },
		    { text: '진행 중', value: 'IN_PROGRESS' },
		    { text: '완료', value: 'DONE' }
		  ];
		
		  options.forEach(function (optionObj) {
		    var option = document.createElement('option');
		    option.textContent = optionObj.text;
		    option.value = optionObj.value;
		    if (optionObj.value === inputData['progress']) {
		      option.selected = true;
		    }
		    progressSelect.appendChild(option);
		  });
		
		  headerDiv.appendChild(progressSelect);
		  
		  var horizontalLine = document.createElement('hr');
		  headerDiv.appendChild(horizontalLine);
		  

		  // Append headerDiv to frameTop
		  frameTop.appendChild(headerDiv);

		  // Create header-wrapper div
		  var headerWrapper = document.createElement('div');
		  headerWrapper.classList.add('header-wrapper');
		  
		  var inputFields = [
		    { key: 'task-create-date', label: '작성일' },
		    { key: 'task-mem-num', label: '등록자' },
		    { key: 'task-responsible-mem-num', label: '담당자' },
		    { key: 'task-team-num', label: '참조자' }
		  ];

		  // Move the inputFields content creation inside the headerWrapper
		  inputFields.forEach(function (field) {
		    var div = document.createElement('div');
		    div.textContent = field.label + ": " + inputData[field.key];
		    headerWrapper.appendChild(div);
		  });

		  // Append headerWrapper to frameTop
		  frameTop.appendChild(headerWrapper);

		  frame.appendChild(frameTop);

		  var frameBottom = document.createElement('div');
		  frameBottom.classList.add('task-main-center-right-frame-bottom');
		  frameBottom.textContent = inputData['task-board-content'];

		  frame.appendChild(frameBottom);

		  centerRight.appendChild(frame);
		}


	
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

#task-addBtn {
    margin-left: 10px;
    margin-top: 24px;
    margin-bottom: 9px;
}

#task-title {
    margin-left: 10px;
}

.task-grid {
    display: grid;
    height: 100vh;
    grid-template-columns: 250px repeat(6, 1fr);
    grid-template-rows: 100px repeat(4, 1fr);
    grid-template-areas:
    "side top  top  top  top  top  top"
    "side left left right right right right"
    "side left left right right right right"
    "side left left right right right right"
    "side left left right right right right";
}

.task-main-side {
    background-color: #ffffff;
    border-right: 1px solid #dee2e6;
    grid-area: side;
    padding: 10px;
}

[class*="task-main-side-header-content"] {
    font-size: 20px;
}
.task-main-side-header-content {
    font-size: 16px;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 8px 0;
    cursor: pointer;
}

[class*="task-main-side-header-content"]:hover {
    background-color: #f4f6f9;
}

.task-main-top {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #dee2e6;
    grid-area: top;
    background-color: #ffffff;
    padding: 10px;
}

.task-main-center-left {
    border-right: 1px solid #dee2e6;
    grid-area: left;
    background-color: #ffffff;
    overflow-y: scroll;
}

.task-main-center-left::-webkit-scrollbar {
    width: 0px; /* 스크롤바 너비를 설정합니다. */
}

.task-main-center-left::-webkit-scrollbar-thumb {
    background: rgba(0, 0, 0, 0.5); /* 스크롤바 배경색을 반투명하게 설정합니다. */
}

.task-main-center-left::-webkit-scrollbar-track {
    background: transparent; /* 스크롤바 트랙을 투명하게 만듭니다. */
}

.task-main-center-left-tlist-section {
    height: 100px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 10px;
    border-bottom: 1px solid #dee2e6;
    cursor: pointer;
}

.task-main-center-left-tlist-section:hover {
    background-color: #f4f6f9;
}

.task-main-center-right {
    grid-area: right;
    background-color: #ffffff;
}

.task-main-center-right-frame {
  position: relative;
  width: 100%;
  height: 100%;
}

.task-main-center-right-frame-top {
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

.task-main-center-right-frame-bottom {
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

.modal-header {
    background-color: #f8f9fa;
    border-bottom: 1px solid #dee2e6;
}

.modal-footer {
    background-color: #f8f9fa;
    border-top: 1px solid #dee2e6;
}

.form-label {
    font-weight: bold;
    font-size: 14px;
    color: #495057;
}

.form-control {
    font-size: 14px;
}

.btn {
    font-size: 14px;
}

.task-responsible-member-name {
	font-size:12px;
}

.task-status-to-do {
    color: limegreen;
    font-size:11px;
}

.task-status-in-progress {
    color: blue;
    font-size:12px;
}

.task-status-done {
    color: gray;
    font-size:12px;
}

.view-contents-header {
  display: flex;
  justify-content: flex-start;
  align-items: center;
}

.detail-frametop-board-title {
  font-size: 1.5em;
  font-weight: bold;
}

.detail-frametop-board-progress {
  margin-left: auto;
}


.header-wrapper {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: 1fr 1fr;
}
</style>