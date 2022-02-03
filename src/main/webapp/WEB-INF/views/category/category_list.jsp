<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품코드조회/등록</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/myLib/styles.css" rel="stylesheet">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<style>
	table {
		width:40%;
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
			if (confirm("정말 삭제 하십니까 ?")==false) {
				alert('상품코드삭제가 취소되었습니다');
			 	return false;
			}else {
				alert('상품코드삭제에 성공했습니다');
				return true;
			}
		} else return false; 
	} //inCheck
	
	function codejoin() {
		var url = "/green/categoryjoin";
		open(url, "_blank", "toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes, width=400, height=200");
	}
	opener.location.reload();
	self.close();
</script>
<body>
<h3>상품코드조회/등록</h3>
<br>
<c:if test="${not empty message}">
=> ${message}<br>
</c:if>
<hr>
<table>
	<tr height="30" bgcolor="pink" align="center">
		<th>상품코드번호</th><th>상품코드명</th>
	</tr>
	<c:forEach var="list" items="${banana}">
	<tr height="30" width="150" align="center">
		<td>${list.category_code}</td><td>${list.category_korcode}</td>
		<td><a href="codedetail?category_code=${list.category_code}" id="a">[수정]</a></td>
		<td><a href="codedelete?category_code=${list.category_code}" onclick="return inCheck()" id="a">[삭제]</a></td>
	</tr>
	</c:forEach>
</table>
<hr>
<a id="a" href="home">[HOME]</a>&nbsp;&nbsp;
<span id="a" onclick="codejoin()">[상품코드등록]</span>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
