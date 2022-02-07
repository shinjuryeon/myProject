<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 그린마트 구매자 로그인 **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<style>
   body {
      background: #E6E6F1;
      font-family: 맑은고딕;
      }
   #wrap {
      margin-left: 0;
      text-align: center;
      }
   h2 {
      color: #00008B; 
      }
</style>
<body style="display: flex; flex-direction: column; align-items: center;">
<h2>LOGIN</h2>
<hr style="width:90%;height:3px;border:none;background-color:purple;">
<form action="userlogin" method="post">
	<table>
		<tr>
			<td bgcolor="#997CD2" style="text-align:center;">I D</td>
			<td><input type="text" id="user_id" name="user_id" placeholder="아이디를 입력하세요"></td>
		</tr>
		<tr>
			<td bgcolor="#997CD2" style="text-align:center;">Password</td>
			<td><input type="password" id="user_password" name="user_password" placeholder="비밀번호를 입력하세요"></td>
		</tr>
		<tr><td></td>
			<td><input type="submit" value="LOGIN">&nbsp;&nbsp;
			    <input type="reset" value="RESET">
			</td>
		</tr>
	</table>
</form>
<span id="message"></span>
<c:if test="${not empty message}">
	alert("${message}");
</c:if>
</body>
</html>