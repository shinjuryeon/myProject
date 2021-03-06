<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보보기</title>
</head>
<style>
	table {
	    width: 50%;
	    margin-left:auto; 
    	margin-right:auto;
    	border: 5px ridge #ff5722;
	}
	tr {
		height: 30px;
		text-align: center;
	}
	th {
		background-color: pink;
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
			if (confirm("정말 회원 탈퇴 하십니까 ?")==false) {
				alert('회원 탈퇴가 취소되었습니다');
			 	return false;
			}else {
				alert('회원 탈퇴 되었습니다');
				return true;
			}
		} else return false; 
	} //inCheck
</script>
<body>
<h3>** <span style="font-size: 25px;">${apple.user_name}</span>님의 정보 **</h3>
<br>
<c:if test="${not empty message}">
=> ${message}<br>
</c:if>
<hr>
<table>
	<tr>
		<th>아이디</th><td>${apple.user_id}</td>
	</tr>
	<tr>
		<th>비밀번호</th><td>${apple.user_password}</td>
	</tr>
	<tr>
		<th>이름</th><td>${apple.user_name}</td>
	</tr>
	<tr>
		<th>우편주소</th><td>${apple.address1}</td>
	</tr>
	<tr>
		<th>도로명주소</th><td>${apple.address2}</td>
	</tr>
	<tr>
		<th>상세주소</th><td>${apple.address3}</td>
	</tr>
</table>
<hr>
<a id="a" href="home">[HOME]</a>&nbsp;&nbsp;
<a id="a" href="userdetail?jcode=U&user_id=${apple.user_id}">[정보수정]</a>&nbsp;&nbsp;
<a href="userdelete?user_id=${apple.user_id}" onclick="return inCheck()" id="a">[회원탈퇴]</a>&nbsp;&nbsp;
<a id="a" href='javascript:history.go(-1)'>[뒤로가기]</a>
</body>
</html>