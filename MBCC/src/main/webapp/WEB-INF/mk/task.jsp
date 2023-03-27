<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<style>
.btn-primary:focus, .btn-primary:hover { background-position:0 0; background:#FFF; color:#0d6efd; transition:all 0.3s; }
</style>
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
			      <input type="hidden" class="task-pgs" value="${vo.progress}">
	    	</div>   	 
		  	</c:forEach>
		</div>
		
		<div class="task-main-center-right">
		  <div class="task-main-center-right-frame">
		    <div class="task-main-center-right-frame-top"></div>
		    <div class="task-main-center-right-frame-bottom">
		      <div class="task-main-center-right-frame-bottom-delmodBtn-area"></div>
		    </div>
		  </div>
		</div>
		
	</div>
	
      <div class="modal fade" id="taskModal" tabindex="-1" role="dialog" aria-labelledby="taskModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="taskModalLabel">새 업무 작성</h5>
	        </div>
	        <div class="modal-body">
	          <!-- 업무 작성 양식 -->
	          <form id="taskForm">
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
		        <button type="button" class="btn btn-primary" onclick="submitTaskForm(form)">등록</button>
		      </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		
		
			
<script>
	// 권정열 관련 스크립트
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
	
	document.addEventListener("DOMContentLoaded", function() {
	    sideHeaderContentClickEntire();
	});
	
	$(document).ready(function() {
	    $('#task-addBtn').on('click', function() {
	        $('#taskModal').modal('show');
	    });
	});
	
	function submitTaskForm(form) {
	  $.ajax({
	    url: 'taskwrite.do',
	    type: 'POST',
	    data: $('#taskForm').serialize(),
	    success: function(response) {
	      asyncMovePage('task.do');
	      $('#taskModal').modal('hide');
	    },
	    error: function(xhr, status, error) {
	      // 에러 처리
	    }
	  });
	}

	// 우측단 구성 스크립트
	function showTlistContents(data) {
		  var boardTitle = data.querySelector('.task-board-title').textContent;
		  var progress = data.querySelector('.task-pgs').value;
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
		  
		  // Create hidden input for task-board-id
		  var hiddenBoardIdInput = document.createElement('input');
		  hiddenBoardIdInput.type = 'hidden';
		  hiddenBoardIdInput.setAttribute('class', 'task-board-id');
		  hiddenBoardIdInput.value = inputData['task-board-id'];
		  headerDiv.appendChild(hiddenBoardIdInput);
		  
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
		    div.classList.add('detail-frametop-board-info');
		    div.textContent = field.label + ": " + inputData[field.key];
		    headerWrapper.appendChild(div);
		  });

		  // Append headerWrapper to frameTop
		  frameTop.appendChild(headerWrapper);

		  frame.appendChild(frameTop);

		  var frameBottom = document.createElement('div');
		  frameBottom.classList.add('task-main-center-right-frame-bottom');
		  
		  // ss

		  var contentDiv = document.createElement('div');
		  contentDiv.textContent = inputData['task-board-content'];
		  frameBottom.appendChild(contentDiv);

		  var buttonDiv = document.createElement('div');
		  buttonDiv.classList.add('task-main-center-right-frame-bottom-delmodBtn-area');

		  var editButton = document.createElement('button');
		  editButton.classList.add('btn', 'btn-primary');
		  editButton.setAttribute('id', 'task-detail-modify-button');
		  editButton.textContent = '수정';
		  editButton.addEventListener('click', function () {
  		  // Edit button click handler
		  });

		  var deleteButton = document.createElement('button');
		  deleteButton.classList.add('btn', 'btn-danger');
		  deleteButton.setAttribute('id', 'task-detail-delete-button');
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
		}

	// 업무상황 변경 스크립트
	$(document).ready(function() {
	  $(document).on('change', '.detail-frametop-board-progress', function() {
		  var progress=$(this).val();
		  var boardId = $(this).closest('.task-main-center-right-frame').find('.task-board-id').val();
		  
		  $.ajax({
		      url: 'updateprogress.do',
		      type: 'POST',
		      data: {
		      	boardId: boardId,
		      	progress: progress
		      },
		      success: function(response) {
		    	console.log(response);

		    	var targetDiv = $(".task-main-center-left-tlist-section").find(".task-board-id[value='" + boardId + "']").parent();

		    	var statusDiv = targetDiv.find("h6.task-main-center-left-tlist-section-component");
		    	var progressText, progressClass;

		    	switch (progress) {
		    	  case 'TO_DO':
		    	    progressText = '할 일\u00A0\u00A0';
		    	    progressClass = 'task-status-to-do';
		    	    break;
		    	  case 'IN_PROGRESS':
		    	    progressText = '진행 중\u00A0\u00A0';
		    	    progressClass = 'task-status-in-progress';
		    	    break;
		    	  case 'DONE':
		    	    progressText = '완료\u00A0\u00A0';
		    	    progressClass = 'task-status-done';
		    	    break;
		    	}

		    	statusDiv.removeClass("task-status-to-do task-status-in-progress task-status-done");

		    	statusDiv.addClass(progressClass);
		    	statusDiv.text(progressText + '  ');
		   	  },
		      error: function(xhr, status, error) {
		      	console.error('업무진행 업데이트에 실패했습니다: ', error);
		      	alert('업무진행 업데이트에 실패했습니다. 다시 시도해주세요.');
		      }
		  });
	  });
	});
	
	// task del ajax
	$(document).ready(function() {
	  $(document).on('click', '#task-detail-delete-button', function() {
		  var boardId = $(this).closest('.task-main-center-right-frame').find('.task-board-id').val();
		  
		  $.ajax({
		      url: 'deletetask.do',
		      type: 'POST',
		      data: {
		      	boardId: boardId
		      },
		      success: function(response) {
		    	alert("삭제 성공");
		    	asyncMovePage('task.do');
		   	  },
		      error: function(xhr, status, error) {
		      }
		  });
	  });
	});
	
	// task mod ajax
	$(document).ready(function() {
		$(document).on('click', '#task-detail-modify-button', function() {
			var boardId = $(this).closest('.task-main-center-right-frame').find('.task-board-id').val();
			alert(boardId);
			//준비중
			/* $.ajax({
				url: 'updatetask.do',
				type: 'POST',
				data: {
					boardId:boardId
				},
				success: function(resopnse) {
					alert("test");
					asyncMovePage('task.do');
				},
				error: function(xhr, status, error) {
				}
			}); */
		});
	});

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
  margin-bottom:30px;
}

.detail-frametop-board-info {
  color: gray;
  font-size: 12px;
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

.detail-frametop-board-progress {
  font-family: "Roboto", sans-serif;
  font-size: 14px;
  padding: 6px 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  background-color: #ffffff;
  background-repeat: no-repeat;
  background-size: 100% 100%;
  background-position: right 10px center;
  outline: none;
  transition: border-color 0.3s, box-shadow 0.3s;
}

.detail-frametop-board-progress:hover {
  border-color: #999;
}

.detail-frametop-board-progress:focus {
  border-color: #4a90e2;
  box-shadow: 0 0 3px 1px rgba(74, 144, 226, 0.5);
}

.detail-frametop-board-progress::-ms-expand {
  display: none;
}

.detail-frametop-board-progress option {
  font-family: "Roboto", sans-serif;
  font-size: 14px;
  padding: 4px 8px;
  background-color: #ffffff;
  color: #333;
  transition: background-color 0.2s, color 0.2s;
}

.detail-frametop-board-progress option:hover,
.detail-frametop-board-progress option:focus {
  background-color: #4a90e2;
  color: #ffffff;
}

.task-main-center-right-frame-bottom-delmodBtn-area {
  width:110px;
  display:flex;
  justify-content: space-between;
  height: 2em;
  position: fixed;
  bottom: 0;
  right:0;
  margin-bottom:40px;
}



</style>