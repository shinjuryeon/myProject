<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보수정</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck2.js"></script>
</head>
<script>
  var pCheck = false;
  var nCheck = false;
  var cCheck = false;

  $(function() {
	   $('#com_password').focus();
	   $('#com_password').keydown(function(e){
	       if (e.which==13) {
	          e.preventDefault();
	       }
	   }).focusout(function() { 
	       pCheck = pwCheck();
	   }); //password_focusout

	   $('#com_name').focusout(function(){
		   nCheck = cnmCheck();
	   }); //name_focusout
	   
	   $('#com_num').focusout(function(){
		   	cCheck = cnCheck();
	   }); //num_focusout
	   
  }); //ready

function inCheck() {
	if (pCheck==false) {
		$('#pMessage').html('비밀번호를 확인하세요');
	}
	if (nCheck==false) {
		$('#nMessage').html('회사명을 확인하세요');
	}
	if (cCheck==false) {
		$('#cMessage').html('사업자등록번호를 확인하세요');
	}

	if (pCheck && nCheck && cCheck) {
		if (confirm("정말 수정 하십니까?")==false) {
		 	return false;
		}else {
			return true;
		}
	} else return false; 
  } //inCheck
</script>
<style>
	* {margin: 5px; padding: 0; border: 0;}
	body {background-color: whitesmoke;}
	
	#container { width: 600px;   margin: 0 auto;}
	
	div div { margin:25px auto; align-content: center;}
	
	form div {margin: 10px;}
	
	.contentName {font-size: 22px; margin-left: 3px; }
	
	input {width: 400px; height: 50px; border: 2px solid lightgray; font-size: 16px}
		
	input:focus { outline-color: limegreen; border-color: limegreen;}
	
	input[type="submit"] { color: white; background-color: limegreen; margin-left: 25px; margin-bottom: 50px; width: 180px;}
	
	input[type="reset"] { width:180px; }
	
	input[type="submit"]:hover {cursor: pointer; }
	#a {
		color: #A6A6A6;
		font-weight:bold;
		text-decoration: none;
	}
	#a:hover {
		color: #0B58CA;
	}
</style>
<body style="display: flex;flex-direction: column;justify-content: center;align-items: center;">
<div id="" class="" style="width: 100%; height: 35px; font-size: medium;">

</div>
<header class="" style="display: flex;flex-direction: column;align-items: center;">
	<a href="home"><img src="resources/image/logo.png" style="width:210px; height:110px;"></a><br>
	<div style="position: relative; margin:30px 0px;">
		<h3>** <span style="font-size: 25px;">${apple.com_name}</span>님의 정보수정 **</h3>
	</div>
</header>
<c:if test="${not empty message}">
	alert("${message}");
</c:if>
<hr>
<form action="comupdate" method="post">
	<div>
		<span class="contentName"><b>아이디</b></span><br>
		<input type="text" id="com_id" name="com_id" value="${apple.com_id}" size="20" readonly="readonly">&nbsp;&nbsp;
	</div>
	<div>
		<span class="contentName"><b>비밀번호</b></span><br>
		<input type="password" id="com_password" name="com_password" value="${apple.com_password}" size="20"><br>
      	<span id="pMessage" class="eMessage"></span>
	</div>
<!-- 		<div>
			<span class="contentName"><b>비밀번호 재확인</b></span> <br>
			<input type="text" name="passwordCheck" maxlength="20" >
		</div> -->
	<div>
		<span class="contentName"><b>이름</b></span><br>
		<input type="text" id="com_name" name="com_name" value="${apple.com_name}" size="20"><br>
      	<span id="nMessage" class="eMessage"></span>
	</div>
	<div>
		<span class="contentName"><b>사업자등록번호</b></span><br>
		<input type="text" id="com_num" name="com_num" value="${apple.com_num}">
		<span id="cMessage" class="eMessage"></span>
	</div>
	<input type="submit" value="수정" onclick="return inCheck()" id="submit">&nbsp;&nbsp;
	<input type="reset" value="취소">
</form>
</body>
</html>