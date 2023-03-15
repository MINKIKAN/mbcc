<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
    
	<div class="task-grid">
		<div class="task-main-side">
			<button type="button" class="btn btn-primary" id="task-addBtn">새 업무</button>
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
	    <div>
	    	  <h6>${vo.content}</h6>
    	</div>   	 
	  	</c:forEach>
		</div>
		<div class="task-main-center-right"></div>
	</div>
	
<script>
	function sideHeaderContentClick(){
		alert("HI!");
	}
</script>
	
<style>
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

#task-addBtn {
	margin-left:10px;
	margin-top:24px;
	margin-bottom:9px;
}
#task-title {
	margin-left:10px;
}

.task-grid {
	border: 1px solid black;
    display: grid;
    height: 100vh;
    grid-template: 
    "side top top top top top" 0.5fr
    "side left left right right right" 4fr
    "side left left right right right" 1fr
    ;
}
.task-main-side {
	background-color:#E6E6E6;
	border: 0.5px solid black;
    grid-area: side;
}
.task-main-side-header-content{
	font-size:20px;
	display:flex;
	justify-content:center;
	align-items:center;
}
.task-main-side-header-content:hover{
	background-color:lightgrey;
}
.task-main-top {
	display:flex;
	justify-content:left;
	align-items:center;
	border: 0.5px solid black;
    grid-area: top;
}
.task-main-center-left {
	border: 0.5px solid black;
    grid-area: left;
}
.task-main-center-right {
	border: 0.5px solid black;
    grid-area: right;
}
</style>