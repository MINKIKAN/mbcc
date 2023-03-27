<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="/MBCC/js/addMember.js" defer></script>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<style>
#add-Member-Title {
	color:white;
}
tr :last-child {
	text-align: left;
}

input[type=submit], input[type=reset] {
	text-align: center;
}

#btns {
	text-align: center;
}

/* Global Styles */

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* body {
  background-color: #f7f7f7;
  font-family: 'Noto Sans KR', sans-serif;
} */
html, body {
  height: 100%;
  background: #0A0A0A;
  font-family: 'Noto Sans KR', sans-serif;
}

h1 {
  text-align: center;
  margin-top: 50px;
}

/* Form Styles */

form {
  max-width: 600px;
  margin: 50px auto;
  padding: 20px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
}

input[type="text"],
input[type="password"],
input[type="email"] {
  display: block;
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  font-size: 16px;
  border: none;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

input[type="submit"],
input[type="reset"],
button {
  display: block;
  width: 100%;
  padding: 10px;
  margin-top: 20px;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
  background-color: #0d6efd;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.3s;
}

input[type="submit"]:hover,
input[type="reset"]:hover,
button:hover {
  background-color: #0062cc;
}

button {
  background-color: #fff;
  color: #0d6efd;
  border: 1px solid #0d6efd;
}

button:hover {
  background-color: #0d6efd;
  color: #fff;
}

label {
  font-size: 16px;
  font-weight: bold;
  margin-bottom: 10px;
  display: block;
}

table {
  width: 100%;
  border-collapse: collapse;
}

th,
td {
  padding: 10px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  font: Roboto;
}

th {
  background-color: #f5f5f5;
}

</style>
<html>


<meta charset="UTF-8">
<title>회원가입</title>

<body>
<body>
	<h1 id="add-Member-Title"class="py-3">회원 가입</h1>
	<form method="post" action="${ctx}/addMember.do" enctype="multipart/form-data" >
	<label for="formFile" class="form-label">사원 이미지 등록 </label>
			<input class="fv" type="text" name="photoFile" size="15" />
			 <input
				type="file" class="form-control" onchange="update()" id="formFile"
				type="file" name="uploadFile" accept=" .png">
		<table class="table table-bordered">
			<tr>
				<td>아이디</td>
				<td><input class="col-5" type="text" name="id" id="id" autofocus required />
				 <input type="button" value="중복체크" onclick="idcheck()" class="btn btn-outline-dark"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input class="col-5" type="text" name="pw" id="pw" required/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input class="col-5" type="text" name="name" id="name" required/></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input class="col-5" type="text" name="gender" id="gender" required/></td>
			</tr>
			<tr>
			<td>생년월일</td>
				<td><input class="col-5" type="text" name="birthday" id="birthday" required/></td>
			</tr>
			<tr>
			<td>입사일</td>
				<td><input class="col-5" type="text" name="empDate" id="empDate" required/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input class="col-5" type="text" name="email" id="email" required/></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input class="col-5" type="text" name="tel" id="tel" required/></td>
			</tr>
			<tr>
				<td>부서번호</td>
				<td><input class="col-5" type="text" name="teamNum" id="teamNum" required/></td>
			</tr>
			<tr>
				<td>직함</td>
				<td><input class="col-5" type="text" name="empType" id="empType" required/></td>
			</tr>
			<tr>
				<td>관리자</td>
				<td><input class="col-5" type="text" name="role" id="role" required/></td>
			</tr>
			<tr>
				<td colspan="2" id="btns">
				
					<!-- <input type="button" id="signup-btn" value="가입" class="col-3 btn btn-primary" onclick="validCheck(form)" /> --> 
					<button type="button" id="signup-btn" value="가입" class="col-3 btn btn-primary" onclick="validCheck(form)" >가입</button>
					<input type="reset" value="취소" class="col-3 btn btn-warning" /></td>
			</tr>
		</table>
	</form>
	
	
	
	

</body>
</html>


