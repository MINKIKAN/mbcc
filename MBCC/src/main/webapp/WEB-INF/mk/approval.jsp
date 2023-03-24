<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="approval-grid">
		<div class="approval-main-top">
			<h2 id="approval-title">결재</h2>
			<div class="">
				<fieldset class="approval-main-top-mode-select">
				  <label>
				    <input type="radio" id="contact" name="contact" value="write-mode" checked />
				    <span>새 기안</span>
				  </label>
				
				  <label>
				    <input type="radio" id="contact" name="contact" value="view-mode" />
				    <span>문서 확인</span>
				  </label>
				</fieldset>
			</div>
		</div>
		
		<div class="approval-main-side">
			<div class="approval-main-side-header">
				<div class="approval-main-side-header-content approval-main-side-header-content-sort-todo" style="width:100%;" onclick="sideHeaderContentClickTodo()">요청된 문서</div>
				<div class="approval-main-side-header-content approval-main-side-header-content-sort-inprogress" style="width:100%;" onclick="sideHeaderContentClickInprogress()">승인된 문서</div>
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
		    <!-- <div class="approval-main-center-left-tlist-section" onclick="showTlistContents(this)">
		    	<div class="approval-main-center-left-tlist-section-component"></div>
		    </div> -->   	 
		</div>
		
		<div class="approval-main-center-right">
		  <div class="approval-main-center-right-write-form">
		    <%@ include file="approvalview.jsp" %>
		  </div>
		</div>
		
	</div>
<%-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#vacationModal">
  새 기안
</button>
<%@ include file="approvaltemplate.jsp" %> --%>

<script>
  $(document).ready(function() {
	  $(document).on('change','.approval-main-top-mode-select', function() {
		  var radioValue=document.querySelector('#contact').value;
		  alert(radioValue);
	  })
  })
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

.approval-main-center-left-tlist-section {
    height: 100px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 10px;
    border-bottom: 1px solid #dee2e6;
    cursor: pointer;
}

.approval-main-center-left-tlist-section:hover {
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
</style>