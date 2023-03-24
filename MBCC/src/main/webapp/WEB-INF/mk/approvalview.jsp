<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="tabmenu out-tabmenu">
  <ul>
    <li id="tab1" class="btnCon"> 
      <input type="radio" checked name="tabmenu" id="tabmenu1">
      <label for="tabmenu1">휴가</label>
      <div class="tabCon" >
		<h1>this is for vacation approval form</h1> 
		<%@ include file="approvaltemplatevacation.jsp" %>     
      </div>
    </li>
    <li id="tab2" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu2">
      <label for="tabmenu2">야간근무 신청</label>
      <div class="tabCon" >
      	<h1>this is for overtime approval form</h1>
      </div>
    </li>    
    <li id="tab3" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu3">
      <label for="tabmenu3">출퇴근 시간 변경</label>
      <div class="tabCon" >
      	<h1>this is for work-hour-change approval form</h1>
      </div>
    </li>
  </ul>
</div>
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