<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매자 회원목록</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/myLib/styles.css" rel="stylesheet">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<style>
	table {
	    width: 80%;
	    margin-left:auto; 
    	margin-right:auto;
	}
	#a {
		color: #A6A6A6;
		font-weight:bold;
		text-decoration: none;
	}
	#a:hover {
		color: #0B58CA;
	}
</style>
<script>
	function inCheck() {	
		var deleteCheck = true;
		
		if (deleteCheck) {
			if (confirm("정말 삭제 하십니까 ? (Yes:확인 / No:취소)")==false) {
				alert('삭제 취소되었습니다');
			 	return false;
			}else {
				alert('삭제 성공했습니다');
				return true;
			}
		} else return false; 
	} //inCheck
	
	opener.location.reload();
</script>
<body>
<h3>구매자 회원목록</h3>
<br>
<c:if test="${not empty message}">
=> ${message}<br>
</c:if>
<hr>
<table>
	<tr height="30" bgcolor="pink" align="center">
		<th>아이디</th><th>이름</th><th>우편주소</th><th>도로명주소</th><th>상세주소</th>
	</tr>
	<c:forEach var="list" items="${banana}">
	<tr height="30" width="150" align="center">
		<td>${list.user_id}</td><td>${list.user_name}</td>
		<td>${list.address1}</td><td>${list.address2}</td><td>${list.address3}</td>
		<td><a href="userdelete?user_id=${list.user_id}" onclick="return inCheck()" id="a">[삭제]</a></td>
	</tr>
	</c:forEach>
</table>
<hr>
<a id="a" href="home">[HOME]</a>&nbsp;&nbsp;
<a id="a" href='javascript:history.go(-1)'>[뒤로가기]</a>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>