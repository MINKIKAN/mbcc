<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="main-template">
    	<div class="main-template-notice-section"><h1 class="main-template-notice-section-title">공지사항</h1></div>
    	<div class="main-template-calendar-section"><%@ include file="../mk/calendar.jsp" %></div>
    	<div class="main-template-employee-approval-section"><h1 class="main-template-notice-section-title">결재현황</h1></div>
    </div>
    
<style>
* {
	box-sizing:border-box;
	font-family:'Roboto',sans-serif;
}
.main-template {
	display:grid;
	height:100vh;
	grid-template-columns: 250px repeat(6, 1fr);
    grid-template-rows: 100px repeat(4, 1fr);
	grid-template-areas:
	"not not not cal cal cal cal"
	"not not not cal cal cal cal"
	"not not not cal cal cal cal"
	"not not not cal cal cal cal"
	"app app app app app app app"
	"app app app app app app app";
}
.main-template-notice-section {
	grid-area:not;
	border-right:1px solid #dee2e6;
	border-bottom:1px solid #dee2e6;
}
.main-template-notice-section-title {
	margin-top:5px;
	margin-left:13px;
}
.main-template-calendar-section {
    grid-area: cal;
    border-top: none;
    border-right: 1px solid #dee2e6;
    border-left: 1px solid #dee2e6;
    border-bottom: 1px solid #dee2e6;
    box-sizing: border-box;
    padding: 10px;
    height: 100%;
    overflow: auto; 
}
.main-template-calendar-section::-webkit-scrollbar {
    width: 0px; 
}

.main-template-calendar-section::-webkit-scrollbar-thumb {
    background: rgba(0, 0, 0, 0.5); 
}

.main-template-calendar-section::-webkit-scrollbar-track {
    background: transparent; 
}

.main-template-employee-approval-section {
	border-top:1px solid #dee2e6;
	grid-area:app;
}

</style>