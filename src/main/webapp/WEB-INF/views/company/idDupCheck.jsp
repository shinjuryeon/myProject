<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** ID 중복 확인 **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck2.js"></script>
<script>
	function idOK() {
		opener.$('#com_id').val('${newID}');
		
		opener.document.getElementById('submit').disabled = '';
		
		opener.$('#com_id').prop('readonly', true);
		opener.$('#com_password').focus();
		
		window.close();
	} //idOK
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
	<h3>** ID 중복 확인 **</h3>
	<form action="comidcheck" method="post">
	User ID :
	<input type="text" id="com_id" name="com_id">&nbsp;
	<input type="submit" value="ID중복확인" onclick="return idCheck()"><br>
	<span id="iMessage" class="eMessage"></span>
	</form>
	<br><br><hr><br>
	<div id="msgBlock">
		<c:if test="${idUse=='T'}">
			${newID}는 사용가능합니다
			<input type="button" value="ID OK" onclick="idOK()">
		</c:if>
		<c:if test="${idUse=='F'}">
			${newID}는 이미 사용중 입니다<br>
			다시 입력하세요!
             <script>
             	$('#com_id').focus();
             	opener.document.getElementById('com_id').value = '';
             </script>
		</c:if>
	</div>
</div>
</body>
</html>