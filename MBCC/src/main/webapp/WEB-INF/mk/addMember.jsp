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
tr :last-child {
	text-align: left;
}

input[type=submit], input[type=reset] {
	text-align: center;
}

#btns {
	text-align: center;
}
</style>
<html>


<meta charset="UTF-8">
<title>회원가입</title>

<body>
<body>
	<h1 class="py-3">회원 가입</h1>
	<form method="post" action="${ctx}/addMember.do" enctype="multipart/form-data" >
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
				<td form="formFile" class="form-label">이미지 등록 </td>
			<input class="fv" type="text" name="name" size="15" />
			 <input
				type="file" class="form-control" onchange="update()" id="formFile"
				type="file" name="uploadFile" accept=" .png"></td>
		    </tr>
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
					<input type="button" value="가입" class="col-3 btn btn-primary" onclick="validCheck(form)" /> 
					<input type="reset" value="취소" class="col-3 btn btn-warning" /></td>
			</tr>
		</table>
	</form>
	

</body>
</html>

