<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="utf-8">
	<title>** 그린마트 구매자 회원가입 **</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
    <script src="resources/myLib/jquery-3.2.1.min.js"></script>
    <script src="resources/myLib/inCheck.js"></script>
</head>
<script>
  var iCheck = false;
  var pCheck = false;
  var nCheck = false;

  $(function() {
	  $('#user_id').focus();
	  $('#user_id').keydown(function(e){
	      if (e.which==13) {
	         e.preventDefault();
	         $('#idDup').focus()
	      }
	   }).focusout(function() { 
		   iCheck = idCheck();
	   }); //id_focusout
	   
	   $('#user_password').focusout(function(){
		   	pCheck = pwCheck();
	   }); //password_focusout

	   $('#user_name').focusout(function(){
		   	nCheck = nmCheck();
	   }); //name_focusout
	   
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
		$('#nMessage').html('이름을 확인하세요');
	}

	// 모든 오류 확인완료 
	// => 없으면 submit : return true
	//    있다면 submit 취소 : return false
	if (iCheck && pCheck && nCheck) {
		if (confirm("정말 가입 하십니까?")==false) {
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
		  var url = "useridcheck?user_id="+$('#user_id').val();
		  open(url, '_blank', 
			'toolbar=no, menubar=yes, scrollbars=yes, resizable=yes, width=400, height=300');
	  }
	  
  } //idDupCheck
</script>
<style>
	* {margin: 5px; padding: 0; border: 0;}
	body {background-color: whitesmoke;}
	
	#container { width: 600px;   margin: 0 auto;}
	
	div div { margin:25px auto; align-content: center;}
	
	form div {margin: 10px;}
	
	.contentName {font-size: 22px; margin-left: 3px; }
	
	#find {width: 100px; height:50px;}
	
	input {width: 400px; height: 50px; border: 2px solid lightgray; font-size: 16px}
		
	input:focus { outline-color: limegreen; border-color: limegreen;}
	
	input[type="submit"] { color: white; background-color: limegreen; margin-left: 25px; margin-bottom: 50px; width: 180px;}
	
	input[type="reset"] { width:180px; }
	
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
	<c:if test="${not empty message}">
		alert("${message}");
	</c:if>
	<hr>
	<form action="userjoin" method="post">				
		<div>
			<span class="contentName"><b>아이디</b></span><br>
			<input type="text" id="user_id" name="user_id" placeholder=" 아이디를 입력하세요" size="20">&nbsp;&nbsp;
			<input id="find" type="button" value="ID중복확인" id="idDup" onclick="idDupCheck()"><br>
	      	<span id="iMessage" class="eMessage"></span>
		</div>
		<div>
			<span class="contentName"><b>비밀번호</b></span><br>
			<input type="password" id="user_password" name="user_password" placeholder=" 영/숫자만 입력 가능" size="20"><br>
	      	<span id="pMessage" class="eMessage"></span>
		</div>
<!-- 		<div>
			<span class="contentName"><b>비밀번호 재확인</b></span> <br>
			<input type="text" name="passwordCheck" maxlength="20" >
		</div> -->
		<div>
			<span class="contentName"><b>이름</b></span><br>
			<input type="text" id="user_name" name="user_name" placeholder=" 홍길동" size="20"><br>
	      	<span id="nMessage" class="eMessage"></span>
		</div>
		<div>
			<span class="contentName"><b>주소</b></span><br>
			<input type="text" id="address1" name="address1" placeholder=" 우편번호">
			<input id="find" type="button" onclick="sample6_execDaumPostcode()" value=" 우편번호 찾기"><br>
			<input type="text" id="address2" name="address2" placeholder=" 주소"><br>
			<input type="text" id="address3" name="address3" placeholder=" 상세주소">
			
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
			    function sample6_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수
			
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }
			
			                if(data.userSelectedType === 'R'){
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                }
			                document.getElementById("address1").value = data.zonecode;
			                document.getElementById("address2").value = addr;
			                document.getElementById("address3").focus();
			            }
			        }).open();
			    }
			</script>
		</div>
		<input type="submit" value="가입" onclick="return inCheck()" id="submit" disabled="disabled">&nbsp;&nbsp;
		<input type="reset" value="취소">
	</form>
</body>
</html>