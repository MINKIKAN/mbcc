<%@page import="com.mbcc.vo.Member" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.mbcc.dao.memberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    <c:set var="ctx" value="${pageContext.request.contextPath}"/> 
    <c:forEach items="${list}" var="member">
	    <c:if test="${member.memId == sessionScope.id}">
	        <c:set var="matchedMemNum" value="${member.memNum}" />
	    </c:if>
	</c:forEach>
	<c:set var="matchedMemRole" value="" />
	<c:forEach items="${list}" var="member">
	    <c:if test="${member.memId == sessionScope.id}">
	        <c:set var="matchedMemRole" value="${member.role}" />
	    </c:if>
	</c:forEach>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#pop_resume { display:flex; justify-content:space-around; align-items:center; gap:0 30px; padding:30px; box-sizing:border-box; width:100%; height:80vh; position:fixed; left:50%; top:50%; transform:translate(-50%, -50%); background:rgba(2,7,21); border-radius:15px; box-shadow:0 0 3px #000; }
	.close_btn { display:flex; justify-content:center; align-items:center; width:30px; height:30px; border:1px solid #FFF; position: absolute; top:25px; right:25px; color:#FFF; font-size:20px; text-decoration:none; }
	.user_pic { width:300px; }
	.user_name { width:calc(100% - 300px); }
	.user_name .user_txt01 { font-size:42px; font-weight:bold; letter-spacing:-0.03em; color:#FFF; text-shadow:0 0 3px #000; }
	.user_name .user_txt02 { font-size:24px; font-weight:bold; letter-spacing:-0.03em; color:#FFF; text-shadow:0 0 3px #000; }
	.user_name .sub_txt { font-size:18px;letter-spacing:-0.03em; color:#FFF; text-shadow:0 0 3px #000; }
	
</style>
<body>
	<h1> 사원 목록 </h1>
	
	<table class="table table-striped table-hover">
	
			<tr>
				<td>사원 번호</td>
				<td>사원 아이디 </td>
				<td>사원 이름</td>
				<td>성별</td>
				<td>생년월일</td>
				<td>입사일</td>
				<td>이메일</td>
				<td>전화번호</td>
				<td>소속팀</td>
				<td>직급 </td>
				<td>급여</td>
				<td>정보확인</td>
			</tr>
		
		
			<c:forEach var="member" items="${list}">
				<tr>
					<td>${member.memNum}</td>
					<td>${member.memId}</td>
					<td>${member.memName}</td>
					<td>${member.gender}</td>
					<td>${member.birthday}</td>
					<td>${member.empDate}</td>
					<td>${member.email}</td>
					<td>${member.tel}</td>
					<td>${member.teamNum}</td>
					<td>${member.empType}</td>
					<td>${member.salary}</td>
					<td id='img'><img src="${ctx}/img/${member.memImg}" width="100" height="150"></td>
				</tr>
		
			</c:forEach>
	</table>
	
	<c:if test="${matchedMemRole == 'ADMIN'}">
<button id="delMem-Btn" type="button" data-toggle="modal" data-target="#delMemModal" style="width:8%">멤버 삭제</button>
</c:if>
	
	<div id="pop_resume" class="modal fade" id="noticeModal" tabindex="-1" role="dialog" aria-labelledby="addressModalLabel" aria-hidden="true">
		<a href="#none" class="close_btn">X</a>
		<div class="user_pic"><img src="${ctx}/img/${member.memImg}"></div>
		<div class="user_name">
			<p class="user_txt01">이름 : ${member.memName}</p>
			<p class="user_txt02">아이디: ${member.memId}</p>
			<p class="sub_txt">성별 :${member.gender}</p>
			<p class="sub_txt">생년월일 :${member.birthday}</p>
			<p class="sub_txt">고용일 :${member.empDate}</p>
			<p class="sub_txt">번호 :${member.tel}</p>
			<p class="sub_txt">소속 팀${member.teamNum}</p>
		</div>
	</div>
	
	<div class="modal fade" id="delMemModal" tabindex="-1" role="dialog" aria-labelledby="taskModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg" role="document">
	      <div class="modal-content">
	        <div class="modal-body">
	          <!-- 업무 작성 양식 -->
	          <form id="delMemForm">
	            <div class="form-group mb-3">
	              <label for="NoticeTitle" class="form-label">삭제할 사원 번호 입력</label>
	              <input type="text" class="form-control" id="memDelNum" name="memDelNum" >
	            </div>
	            <div class="form-group mb-3">
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" onclick="deleteMemberForm(form)">등록</button>
		      </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
	<script>
	
	
	$(document).ready(function() {
	    $('#delMem-Btn').on('click', function() {
		
	        $('#delMemModal').modal('show');
		
	    });
	});
	
	function deleteMemberForm(form) {
		  $.ajax({
		    url: '${ctx}/deleteMember.do',
		    type: 'POST',
		    data: $('#delMemForm').serialize(),
		    success: function(response) {
		      asyncMovePage('Address.do');
		      $('#delMemModal').modal('hide');
		    },
		    error: function(xhr, status, error) {
		      // 에러 처리
		    }
		  });
		}
	
	</script>
</body>
</html>