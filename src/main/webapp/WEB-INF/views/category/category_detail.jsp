<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품코드수정</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck3.js"></script>
<style>
   body {
      background: #E6E6FA;
      font-family: 맑은고딕;
      }
   #wrap {
      margin-left: 0;
      text-align: center;
      }
   h3 {
      color: #00008B; 
      }
</style>
</head>
<body>
<div id="wrap">
	<h3>상품코드수정</h3>
	<form action="codeupdate" method="post">
		상품코드번호 :
		<input id="category_code" name="category_code" readonly="readonly" value="${apple.category_code}"><br>
		상품코드명 :
		<input type="text" id="category_korcode" name="category_korcode" value="${apple.category_korcode}"><br><br>
		<input type="submit" value="수정">&nbsp;&nbsp;
		<input type="reset" value="취소">
	</form>
</div>
<c:if test="${not empty message}">
	alert("${message}");
</c:if>
</body>
</html>