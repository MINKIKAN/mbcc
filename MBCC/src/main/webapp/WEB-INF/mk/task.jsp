<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
    
	<div class="task-grid">
		<div class="task-main-side">
			<button id="task-addBtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#taskModal">새 업무</button>
			<br>
			<hr>
			<div class="task-main-side-header">
				<div class="task-main-side-header-content" style="width:100%;" onclick="sideHeaderContentClick()">멘션된 업무</div>
				<div class="task-main-side-header-content" style="width:100%;" onclick="">중요 업무</div>
				<div class="task-main-side-header-content" style="width:100%;" onclick="">내가 쓴 댓글</div>
			</div>
			<hr>
			<div class="task-main-side-body">
				<div class="task-main-side-header-content" style="width:100%;" onclick="sideHeaderContentClick()">전체 업무</div>
				<div class="task-main-side-header-content" style="width:100%;" onclick="">담당 업무</div>
				<div class="task-main-side-header-content" style="width:100%;" onclick="">참조 업무</div>
				<div class="task-main-side-header-content" style="width:100%;" onclick="">내가 쓴 업무</div>
				<div class="task-main-side-header-content" style="width:100%;" onclick="">임시 보관함</div>
			</div>
			<hr>
		</div>
		<div class="task-main-top"><h2 id="task-title">담당업무</h2></div>
		<div class="task-main-center-left">
		<c:forEach var="vo" items="${tlist}" varStatus="vs">
	    <div class="task-main-center-left-tlist-section" data-board-title="${vo.boardTitle}" onclick="showTlistContents(this)">
	    	  <h6 class="task-main-center-left-tlist-section-component">${vo.boardTitle}</h6>
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
    	</div>   	 
	  	</c:forEach>
		</div>
		<div class="task-main-center-right"></div>
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
	              <input type="text" class="form-control" id="taskTitle" placeholder="제목을 입력하세요">
	            </div>
	            <div class="form-group mb-3">
	              <label for="responsibleMemNum" class="form-label">담당자 회원 번호</label>
	              <input type="number" class="form-control" id="responsibleMemNum" placeholder="담당자 회원 번호를 입력하세요">
	            </div>
	            <div class="form-group mb-3">
	              <label for="teamNum" class="form-label">부서 번호</label>
	              <input type="number" class="form-control" id="teamNum" placeholder="부서 번호를 입력하세요">
	            </div>
	            <div class="form-group mb-3">
	              <label for="progress" class="form-label">진행 상황</label>
	              <select class="form-control" id="progress">
	                <option>할 일&nbsp;&nbsp;<span class="badge bg-secondary">&nbsp;</span></option>
	                <option>진행 중&nbsp;&nbsp;<span class="badge bg-secondary">&nbsp;</span></option>
	                <option>완료&nbsp;&nbsp;<span class="badge bg-secondary">&nbsp;</span></option>
	              </select>
	            </div>
	            <div class="form-group mb-3">
	              <label for="taskContent" class="form-label">내용</label>
	              <textarea class="form-control" id="taskContent" rows="3"></textarea>
	            </div>
		          
		          <!-- <div class="form-group">
		            <label for="taskType">게시판 종류</label>
		            <select class="form-control" id="taskType">
		              <option>BUSINESS</option>
		              <option>FREE</option>
		              <option>APPROVAL</option>
		            </select>
		          </div> -->
		          
		          <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button> -->
		          
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" onclick="submitTaskForm()">저장</button>
		      </div>
		    </div>
		  </div>
		</div>
			
<script>
	function sideHeaderContentClick(){
		alert("HI!");
	}
	
	$(document).ready(function() {
	    $('#task-addBtn').on('click', function() {
	        $('#taskModal').modal('show');
	    });
	});
	
	function submitTaskForm() {
	    // 양식 데이터 가져오기
	    const taskTitle = $('#taskTitle').val();
	    const taskContent = $('#taskContent').val();
	    const taskType = $('#taskType').val();
	    const responsibleMemNum = $('#responsibleMemNum').val();
	    const teamNum = $('#teamNum').val();
	    const progress = $('#progress').val();

	    // 양식 데이터 확인
	    console.log('Title:', taskTitle);
	    console.log('Content:', taskContent);
	    console.log('Type:', taskType);
	    console.log('Responsible Member Number:', responsibleMemNum);
	    console.log('Team Number:', teamNum);
	    console.log('Progress:', progress);

	    // 서버로 데이터 전송 (예시)
	    /*
	    $.ajax({
	        type: 'POST',
	        url: 'submitTask', // 실제 전송하려는 서버 URL
	        data: {
	            title: taskTitle,
	            content: taskContent,
	            type: taskType,
	            responsibleMemNum: responsibleMemNum,
	            teamNum: teamNum,
	            progress: progress
	        },
	        success: function(response) {
	            // 서버로부터의 응답을 처리
	            console.log(response);
	            // 모달 닫기
	            $('#taskModal').modal('hide');
	        },
	        error: function(xhr, status, error) {
	            // 에러 처리
	            console.error('Error:', error);
	        }
	    });
	    */
	}
	
	function showTlistContents(element) {
	    const clickedBoardTitle = element.getAttribute('data-board-title');
	    let selectedTask;

	    const tlist = Array.from(document.querySelectorAll('.task-main-center-left-tlist-section')).map(taskElement => {
	        return {
	            boardTitle: taskElement.getAttribute('data-board-title')
	            // 다른 속성들도 여기에 추가하세요
	        };
	    });

	    for (const task of tlist) {
	        if (task.boardTitle === clickedBoardTitle) {
	        	alert("true");
	            selectedTask = task;
	            break;
	        }
	    }
	    alert(${selectedTask.boardTitle});

	    if (selectedTask) {
	        let html = '';
	        html += `<div class="task-content">`;
	        html += `<h4>${selectedTask.boardTitle}</h4>`;
	        // 다른 필요한 데이터도 여기에 추가하세요
	        html += `</div>`;
	        

	        document.querySelector(".task-main-center-right").innerHTML = html;
	    }
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
    grid-template:
    "side top top top top top" 0.5fr
    "side left right right right right" 4fr
    "side left right right right right" 1fr
    ;
}

.task-main-side {
    background-color: #ffffff;
    border-right: 1px solid #dee2e6;
    grid-area: side;
    padding: 10px;
}

.task-main-side-header-content {
    font-size: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 8px 0;
    cursor: pointer;
}

.task-main-side-header-content:hover {
    background-color: #f4f6f9;
}

.task-main-top {
    display: flex;
    justify-content: left;
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

.task-status-to-do {
    color: limegreen;
    font-size:11px;
}

.task-status-in-progress {
    color: blue;
    font-size:12px;
}

.task-status-done {
    color: #E0E0E0;
    font-size:12px;
}
</style>