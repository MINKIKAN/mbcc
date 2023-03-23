<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="kr">
  <head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="js/login.js" defer></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- 나의 스타일 추가 -->
    <link rel="stylesheet" href="css/login.css">

  </head>
  <body class="text-center">
    
    <!--  html 전체 영역을 지정하는 container -->
    <div id="container">
      <!--  login 폼 영역을 : loginBox -->
      <div id="loginBox" >
      
        <!-- 로그인 페이지 타이틀 -->
        <div id="loginBoxTitle">MBCC PROJECT</div>
        <!-- 아이디, 비번, 버튼 박스 -->
      <div id="inputBox">
  <div class="input-form-box"><span style="margin-right: 20px ">아이디 </span><input type="text" id="id" name="id" class="form-control"></div>
  <div class="input-form-box" ><span style="margin-right:20px">비밀번호 </span><input type="password" id="pw"  name="pw" class="form-control"></div>
  <div class="button-login-box" >
    <button id="login" class="btn btn-primary " style="width:100%">로그인</button>
    <a id="insertmember" href="#" onclick="location.href='${ctx}/mk/addMember.do'" >회원가입</a>
    <a id="findPw" href="#" onclick="location.href='${ctx}mk/addMember.jsp'">비밀번호 찾기</a>
  </div>
</div>

        
      </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  </body>
</html>