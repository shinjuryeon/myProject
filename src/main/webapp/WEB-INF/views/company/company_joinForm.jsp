<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="utf-8">
	<title>** 그린마트 판매자 회원가입 **</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
    <script src="resources/myLib/jquery-3.2.1.min.js"></script>
    <script src="resources/myLib/inCheck2.js"></script>
</head>
<script>
  var iCheck = false;
  var pCheck = false;
  var nCheck = false;
  var cCheck = false;

  $(function() {
	  $('#com_id').focus();
	  $('#com_id').keydown(function(e){
	      if (e.which==13) {
	         e.preventDefault();
	         $('#idDup').focus()
	      }
	   }).focusout(function() { 
		   iCheck = idCheck();
	   }); //id_focusout
	   
	   $('#com_password').focusout(function(){
		   	pCheck = pwCheck();
	   }); //password_focusout

	   $('#com_name').focusout(function(){
		   	nCheck = cnmCheck();
	   }); //name_focusout
	   
	   $('#com_num').focusout(function(){
		   	cCheck = cnCheck();
	   }); //num_focusout
	   
  }); //ready

// 3) submit 여부를 판단 & 실행 : JS 의 function
function inCheck() {
	// 모든 항목에 오류 없음을 확인 : switch 변수
	if (iCheck==false) {
		$('#iMessage').html('아이디를 확인하세요');
	}
	if (pCheck==false) {
		$('#pMessage').html('비밀번호를 확인하세요');
	}
	if (nCheck==false) {
		$('#nMessage').html('회사명을 확인하세요');
	}
	if (cCheck==false) {
		$('#cMessage').html('사업자등록번호를 확인하세요');
	}

	// 모든 오류 확인완료 
	// => 없으면 submit : return true
	//    있다면 submit 취소 : return false
	if (iCheck && pCheck && nCheck && cCheck) {
		if (confirm("정말 가입 하십니까 ? (Yes:확인 / No:취소)")==false) {
			alert('회원가입이 취소되었습니다');
		 	return false;
		}else {
			alert('회원가입에 성공했습니다');
			return true;
		}
	} else return false; 
  } //inCheck
  
  // ** ID 중복 확인하기
  function idDupCheck() {
	  if (iCheck == false) {
		  iCheck = idCheck();
	  } else {
		  var url = "comidcheck?com_id="+$('#com_id').val();
		  open(url, '_blank', 
			'toolbar=no, menubar=yes, scrollbars=yes, resizable=yes, width=400, height=300');
	  }
	  
  } //idDupCheck
</script>
<style>
	* {margin: 5px; padding: 0; border: 0;}
	body {background-color: whitesmoke;}
	
	#container { width: 600px;   margin: 0 auto;}
	
	div div {
		margin:25px auto; align-content: center; 
	}
	
	form div {margin: 10px;}
	
	.contentName {font-size: 22px; margin-left: 3px; }
	
	input {width: 600px; height: 50px; border: 2px solid lightgray; font-size: 15px}
	
	.select { width: 600px; height: 50px; ; font-size: 15px; border: 2px solid lightgray;}
	
	input:focus,select:focus { outline-color: limegreen; border-color: limegreen;}
	
	input[type="submit"] { color: white; background-color: limegreen; margin-bottom: 50px; width: 250px;}
	
	input[type="reset"] { width:250px; }
	
	input[type="submit"]:hover {cursor: pointer; }
			
</style>
<body style="display: flex;flex-direction: column;justify-content: center;align-items: center;">
	<div id="" class="" style="width: 100%; height: 35px; font-size: medium;">
	
	</div>
	<header class="" style="display: flex;flex-direction: column;align-items: center;">
		<a href="home"><img src="resources/image/logo.png" style="width:210px; height:110px;"></a><br>
		<div style="position: relative; margin:30px 0px;">
			<h2>회원가입</h2>
			<p style="font-size: 25px">그린마트에 오신것을 환영합니다.</p>
			<p style="font-size: medium;">
			회원가입하신 후 다양한 서비스를 이용해보세요.
			</p>
		</div>
	</header>
	<form action="comjoin" method="post">				
		<div>
			<span class="contentName"><b>아이디</b></span><br>
			<input type="text" id="com_id" name="com_id" placeholder=" 아이디를 입력하세요" size="20">&nbsp;&nbsp;
			<input type="button" value="ID중복확인" id="idDup" onclick="idDupCheck()"><br>
	      	<span id="iMessage" class="eMessage"></span>
		</div>
		<div>
			<span class="contentName"><b>비밀번호</b></span><br>
			<input type="password" id="com_password" name="com_password user_password" placeholder=" 영/숫자만 입력 가능" size="20"><br>
	      	<span id="pMessage" class="eMessage"></span>
		</div>
<!-- 		<div>
			<span class="contentName"><b>비밀번호 재확인</b></span> <br>
			<input type="text" name="passwordCheck" maxlength="20" >
		</div> -->
		<div>
			<span class="contentName"><b>회사명</b></span><br>
			<input type="text" id="com_name" name="com_name" placeholder=" 그린마트" size="20"><br>
	      	<span id="nMessage" class="eMessage"></span>
		</div>
		<div>
			<span class="contentName"><b>사업자등록번호</b></span><br>
			<input type="text" id="com_num" name="com_num" placeholder=" '-' 없이 10자리 입력" size="20"><br>
	      	<span id="cMessage" class="eMessage"></span>
		</div>
		<input type="submit" value="가입" onclick="return inCheck()" id="submit" disabled="disabled">&nbsp;&nbsp;
		<input type="reset" value="취소">&nbsp;&nbsp;
	</form>
	<c:if test="${not empty message}">
	alert("${message}");
	</c:if>
</body>
</html>