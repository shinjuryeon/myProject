<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품코드등록</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck3.js"></script>
<script>
  var cCheck = false;
  var kCheck = false;

  $(function() {
	  $('#category_code').focus();
	  $('#category_code').keydown(function(e){
	      if (e.which==13) {
	         e.preventDefault();
	         $('#idDup').focus()
	      }
	   }).focusout(function() { 
		   cCheck = codeCheck();
	   }); //code_focusout
	   
	   $('#category_korcode').focusout(function(){
		   kCheck = korCheck();
	   });
	   
  }); //ready

function inCheck() {
	if (cCheck==false) {
		$('#iMessage').html('상품등록번호를 확인하세요');
	}
	if (kCheck==false) {
		$('#pMessage').html('상품등록명을 확인하세요');
	}

	if (cCheck && kCheck) {
		if (confirm("정말 가입 하십니까 ? (Yes:확인 / No:취소)")==false) {
			alert('상품코드등록이 취소되었습니다');
		 	return false;
		}else {
			alert('상품코드등록에 성공했습니다');
			return true;
		}
	} else return false; 
  } //inCheck
  
  function idDupCheck() {
	  if (cCheck == false) {
		  cCheck = codeCheck();
	  } else {
		  var url = "codecheck?category_code="+$('#category_code').val();
		  open(url, '_blank', 
			'toolbar=no, menubar=yes, scrollbars=yes, resizable=yes, width=400, height=150');
	  }
	  
  } //idDupCheck
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
	<h3>상품코드등록</h3>
	<form action="codejoin" method="post">
		상품코드번호 :
		<input type="text" id="category_code" name="category_code">&nbsp;
		<input type="button" value="중복확인" id="idDup" onclick="idDupCheck()"><br>
		<span id="iMessage" class="eMessage"></span><br>
		상품코드명 :
		<input type="text" id="category_korcode" name="category_korcode">
		<span id="pMessage" class="eMessage"></span><br><br>
		<input type="submit" value="등록" onclick="return inCheck()" id="submit" disabled="disabled">&nbsp;&nbsp;
		<input type="reset" value="취소">
	</form>
</div>
<c:if test="${not empty message}">
	alert("${message}");
</c:if>
</body>
</html>