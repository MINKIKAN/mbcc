<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="main-template">
    	<div class="main-template-notice-section"></div>
    	<div class="main-template-calendar-section"></div>
    	<div class="main-template-employee-approval-section"></div>
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
	border-right:1px solid black;
	border-bottom:1px solid black;
}
.main-template-calendar-section {
	grid-area:cal;
	border-bottom:1px solid black;
}
.main-template-employee-approval-section {
	grid-area:app;
}

</style>