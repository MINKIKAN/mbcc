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
	<c:set var="matchedMemRole" value="" />
	<c:forEach items="${mlist}" var="member">
	    <c:if test="${member.memId == sessionScope.id}">
	        <c:set var="matchedMemRole" value="${member.role}" />
	    </c:if>
	</c:forEach>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>

<style>
 .list_area { display: flex; flex-direction: column; gap: 10px 0; width: 90%; margin: 0 auto; }
 .list_items {display: flex; justify-content: space-between; gap: 0 30px; align-items: center; border-bottom: 1px solid #adadad;}
 .img_box { max-width:60px; }
 .img_box img { max-width:100%; object-fit:contain; }
 .text_line { width:calc(100% - 140px); }
 .text_line .user_name { font-size:16px; font-weight:bold; }
 .text_line .preview_notice { font-size:14px; letter-spacing:-0.03em; }
 .date_txt { min-width:80px; font-size:12px; color:#999; }
 .write{
    display: flex;
    justify-content: flex-end;
    min-height: 60px;
	border-radius:15px;
	transition:all 0.3s;
	gap: 30px 30px;
   }
   .btn-primary:focus, .btn-primary:hover { background-position:0 0; background:#FFF; color:#0d6efd; transition:all 0.3s; }
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
</style>
<body>
<h1>공지사항</h1>
 <input type="text" id="memNum" name="memNum" value="${matchedMemRole}"> 
<div class="write" > 

<c:if test="${matchedMemRole == 'ADMIN'}">
<button id="task-addBtn" type="button" data-toggle="modal" data-target="#taskModal" style="width:8%">글쓰기</button>
</c:if>
</div>
 
	<div class="notice_list">
		<c:forEach var="list" items="${nlist}">
		<ul class="list_area">
			<li class="list_items">
				<div class="img_box">
				<img src="${ctx}/img/user.png" alt="user1" />
				</div>
				<div class="text_line">
					<p class="user_name">${list.memNum}</p>
					<p class="title">${list.boardTitle}</p>
					<p class="preview_notice">${list.boardContent}</p>
				</div>
				<div class="date_txt">${list.createDate}</div>
			</li>
			
		</ul>
	</div>
	</c:forEach>
	
	<div class="modal fade" id="noticeModal" tabindex="-1" role="dialog" aria-labelledby="taskModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="taskNoticeLabel">새 공지 작성</h5>
	        </div>
	        <div class="modal-body">
	          <!-- 업무 작성 양식 -->
	          <form id="noticeForm">
	            <div class="form-group mb-3">
	              <label for="NoticeTitle" class="form-label">제목</label>
	              <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요">
	            </div>
	           
	            <div class="form-group mb-3">
	              <label for="NoticeContent" class="form-label">내용</label>
	              <textarea class="form-control" id="boardContent" name="boardContent" rows="3"></textarea>
	            </div>
	            <input type="hidden" id="boardType" name="boardType" value="FREE">
	            	<input type="hidden" id="memNum" name="memNum" value="${matchedMemNum}">
	            <input type="hidden" id="fileId" name="fileId" value="1">
				<input type="number" class="form-control" id="teamNum" name="teamNum" value="0">
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" onclick="submitNoticeForm(form)">등록</button>
		      </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
	
	<script>
	var check=${member.role}
	
	$(document).ready(function() {
	    $('#task-addBtn').on('click', function() {
		
	        $('#noticeModal').modal('show');
		
	    });
	});
	
	function submitNoticeForm(form) {
		  $.ajax({
		    url: '${ctx}/NoticeWrite.do',
		    type: 'POST',
		    data: $('#noticeForm').serialize(),
		    success: function(response) {
		      asyncMovePage('notice.do');
		      $('#noticeModal').modal('hide');
		    },
		    error: function(xhr, status, error) {
		      // 에러 처리
		    }
		  });
		}
	</script>
</body>
</html>