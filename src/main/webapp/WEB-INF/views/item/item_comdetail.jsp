<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내등록물품보기</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
</head>
<script>
	function inCheck() {	
		var deleteCheck = true;
		
		if (deleteCheck) {
			if (confirm("정말 삭제 하십니까 ?")==false) {
				alert('상품삭제가 취소되었습니다');
			 	return false;
			}else {
				alert('상품삭제에 성공했습니다');
				return true;
			}
		} else return false; 
	} //inCheck
</script>
<style>
	table {
		width:70%;
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
<body>
<h3>내등록물품보기</h3>
<br>
<c:if test="${not empty message}">
=> ${message}<br>
</c:if>
<hr>
<table>
	<tr height="30" bgcolor="GreenYellow">
		<th>상품등록번호</th><th>상품명</th><th>상품가격</th><th>상품재고</th><th>상품사진</th>
	</tr>
	<c:forEach var="list" items="${apple}">
	<tr height="30" align="center">
		<td>${list.item_seq}</td><td>${list.item_name}</td>
		<td>${list.item_price}</td><td>${list.inventory}</td>
		<td><img src="${list.uploadfile}" width="70" height="100"></td>
		<td width="100px"><span><a href="itemcomdetail?jcode=U&item_seq=${list.item_seq}" id="a">[수정]</a></span>&nbsp;&nbsp;
						  <span><a href="itemdelete?item_seq=${list.item_seq}" onclick="return inCheck()" id="a">[삭제]</a></span>
		</td>
	</tr>
	</c:forEach>
</table>
<hr>
<a href="home">[HOME]</a>&nbsp;&nbsp;
<a href='javascript:history.go(-1)'>[뒤로가기]</a>
</body>
</html>