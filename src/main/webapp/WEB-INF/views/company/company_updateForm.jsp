<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보수정</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<style>
	table {
	    width: 50%;
	    margin-left:auto; 
    	margin-right:auto;
    	border: 5px ridge #ff5722;
	}
	tr {
		height: 40px;
	}
	th {
		background-color: LightSteelBlue;
		text-align: center;
	}
	input {
	
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
<body>
<h3>** <span style="font-size: 25px;">${apple.com_name}</span>님의 정보 **</h3>
<br>
<c:if test="${not empty message}">
<br>=> ${message}<br><br>
</c:if>
<hr>
<form action="userupdate" method="post">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="user_id" value="${apple.com_id}" size="20" readonly="readonly"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="user_password" value="${apple.com_password}" size="20"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="user_name" value="${apple.com_name}" size="20"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td></td>
		</tr>		
		<tr>
			<td></td>
			<td><input type="submit" value="수정">&nbsp;&nbsp;
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
<hr>
<a id="a" href="home">[HOME]</a>&nbsp;&nbsp;
<a id="a" href='javascript:history.go(-1)'>[뒤로가기]</a>
</body>
</html>