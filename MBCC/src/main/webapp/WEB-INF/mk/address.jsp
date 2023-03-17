<%@page import="com.mbcc.vo.Member" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.mbcc.dao.memberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    <c:set var="ctx" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 사원 목록 </h1>
	<table class=" py-10 table table-bordered">
	
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
				</tr>
			</c:forEach>
		
	</table>
</body>
</html>