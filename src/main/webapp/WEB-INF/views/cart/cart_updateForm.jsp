<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 수정 **</title>
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
<h2>UPDATE</h2>
<hr style="width:90%;height:3px;border:none;background-color:purple;">
<form action="cartupdate?item_seq=${item_seq}&user_id=${loginID}" method="post">
	<table>
		<tr>
			<td bgcolor="#997CD2" style="text-align:center;">수 량</td>
			<td><input type="text" id="cart_count" name="cart_count"></td>
		</tr>
		<tr><td></td>
			<td><input type="submit" value="UPDATE">&nbsp;&nbsp;
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