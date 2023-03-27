<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Approval</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">휴가<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">야간근무 신청</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">출퇴근 시간 변경</a>
      </li>
    </ul>
  </div>
</nav>

<style>
/* .approval-write-form-accordion-body{
	height:80%;
} */
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Roboto', sans-serif;
}
ul{list-style:none;}
.tabmenu{ 
  max-width:600px; 
  margin: 0 auto; 
  position:relative; 
}
.tabmenu ul{
  position: relative;
}
.tabmenu ul li{
  display:  inline-block;
  width:33.33%; 
  float:left;  
  text-align:center; 
  background :#dee2e6;
  line-height:40px;
}
.tabmenu label{
  display:block;
  width:100%; 
  height:40px;
  line-height:40px;
}
.tabmenu input{display:none;}
.tabCon{
  display:none; 
  width: 100%;
  text-align:left; 
  padding: 20px;
  position:absolute; 
  left:0; top:40px; 
  box-sizing: border-box; 
  border : 5px solid #f9f9f9;
}
.tabmenu input:checked ~ label{
  background:#f9f9f9;
}
.tabmenu input:checked ~ .tabCon{
  display:block;
}
</style>