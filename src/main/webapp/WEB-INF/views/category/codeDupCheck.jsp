<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품코드번호 중복 확인</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck3.js"></script>
<script>
	function idOK() {
		opener.$('#category_code').val('${newID}');
		
		opener.document.getElementById('idDup').disabled = 'disabled';
		opener.document.getElementById('submit').disabled = '';
		
		opener.$('#category_code').prop('readonly', true);
		opener.$('#category_korcode').focus();
		
		window.close();
	} //idOK
	
	function idNO() {
		window.close();
	} //idNO
</script>
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
	<h3>** 상품코드번호 중복 확인 **</h3>
	<div id="msgBlock">
		<c:if test="${codeUse=='T'}">
			사용가능합니다
			<input type="button" value="확인" onclick="idOK()">
		</c:if>
		<c:if test="${codeUse=='F'}">
			이미 사용중 입니다<br>
			<input type="button" value="확인" onclick="idNO()">
		</c:if>
	</div>
</div>
</body>
</html>