<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 그린마트 판매자 로그인 **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<style>
   body {
      background: #E8B759;
      font-family: 맑은고딕;
      display: flex; flex-direction: column; align-items: center;
      }
   #wrap {
      margin-left: 0;
      text-align: center;
      }
   h2 {
      color: #00008B; 
      }
   hr {
      width:90%; height:3px; border:none; background-color:orange;
   }
</style>
<body>
<h2>LOGIN</h2>
<hr>
<form action="comlogin" method="post">
	<table>
		<tr>
			<td bgcolor="#997CD2" style="text-align:center;">I D</td>
			<td><input type="text" id="com_id" name="com_id" placeholder="아이디를 입력하세요"></td>
		</tr>
		<tr>
			<td bgcolor="#997CD2" style="text-align:center;">Password</td>
			<td><input type="password" id="com_password" name="com_password" placeholder="비밀번호를 입력하세요"></td>
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
	<br>=> ${message}<br><br>
</c:if>
</body>
</html>