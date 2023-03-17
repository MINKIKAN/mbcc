<%@page import="com.mbcc.vo.Member" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.mbcc.dao.memberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Address List</title>
	<script>
//address.js

function showAddressList(list) {
  // 주소록 목록을 보여주는 함수
  // list: 주소록 데이터 배열
  
  // 주소록 테이블의 tbody 엘리먼트를 찾아온다
  var tbody = document.querySelector('#addressTable tbody');
  
  // tbody 내용을 초기화
  tbody.innerHTML = '';
  
  // 주소록 데이터를 반복하여 tr 엘리먼트를 생성하여 tbody에 추가
  list.forEach(function (member) {
    var tr = document.createElement('tr');
    
    var tdNum = document.createElement('td');
    tdNum.textContent = member.memNum;
    tr.appendChild(tdNum);
    
    var tdName = document.createElement('td');
    tdName.textContent = member.memName;
    tr.appendChild(tdName);
    
    var tdEmail = document.createElement('td');
    tdEmail.textContent = member.email;
    tr.appendChild(tdEmail);
    
    tbody.appendChild(tr);
  });
}

// 주소록 데이터를 가져오는 함수 호출
var xhr = new XHttpRequest();
xhr.open('GET', '/addressList');
xhr.onreadystatechange = function () {
  if (xhr.readyState === xhr.DONE) {
    if (xhr.status === 200) {
      // 주소록 데이터 가져오기 성공
      var addressList = JSON.parse(xhr.responseText);
      showAddressList(addressList);
    } else {
      // 주소록 데이터 가져오기 실패
      alert('주소록 데이터를 가져오지 못했습니다.');
    }
  }
};
xhr.send();



</script>
</head>
<body>
	<h1>주소록</h1>
	<table>
	
			<tr>
				<th>사원 번호</th>
				<th>사원 아이디 </th>
				<th>사원 이름</th>
				<th>부서 이름</th>
				<th>등급 </th>
				<th>급여</th>
			</tr>
		
		<tbody>
			<c:forEach var="member" items="${list}">
				<tr>
					<td>${member.memNum}</td>
					<td>${member.memId}</td>
					<td>${member.memName}</td>
					<td>${member.teamName}</td>
					<td>${member.empType}</td>
					<td>${member.salary}</td>
				</tr>
			</c:forEach>
		
	</table>
</body>
</html>