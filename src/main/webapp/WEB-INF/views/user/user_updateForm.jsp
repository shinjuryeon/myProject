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
<script src="resources/myLib/inCheck.js"></script>
</head>
<script>
  var pCheck = false;
  var nCheck = false;

  $(function() {
	   $('#user_password').focus();
	   $('#user_password').keydown(function(e){
	       if (e.which==13) {
	          e.preventDefault();
	       }
	    }).focusout(function() { 
	    	pCheck = pwCheck();
	    }); //password_focusout

	   $('#user_name').focusout(function(){
		   	nCheck = nmCheck();
	   }); //name_focusout
	   
  }); //ready

function inCheck() {
	if (pCheck==false) {
		$('#pMessage').html('비밀번호를 확인하세요');
	}
	if (nCheck==false) {
		$('#nMessage').html('이름을 확인하세요');
	}

	if (pCheck && nCheck) {
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
	
	#find {width: 100px; height:50px;}
	
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
		<h3>** <span style="font-size: 25px;">${apple.user_name}</span>님의 정보수정 **</h3>
	</div>
</header>
<c:if test="${not empty message}">
	alert("${message}");
</c:if>
<hr>
<form action="userupdate" method="post">
	<div>
		<span class="contentName"><b>아이디</b></span><br>
		<input type="text" id="user_id" name="user_id" value="${apple.user_id}" size="20" readonly="readonly">&nbsp;&nbsp;
	</div>
	<div>
		<span class="contentName"><b>비밀번호</b></span><br>
		<input type="password" id="user_password" name="user_password" value="${apple.user_password}" size="20"><br>
      	<span id="pMessage" class="eMessage"></span>
	</div>
<!-- 		<div>
			<span class="contentName"><b>비밀번호 재확인</b></span> <br>
			<input type="text" name="passwordCheck" maxlength="20" >
		</div> -->
	<div>
		<span class="contentName"><b>이름</b></span><br>
		<input type="text" id="user_name" name="user_name" value="${apple.user_name}" size="20"><br>
      	<span id="nMessage" class="eMessage"></span>
	</div>
	<div>
		<span class="contentName"><b>주소</b></span><br>
		<input type="text" id="address1" name="address1" value="${apple.address1}">
		<input id="find" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="address2" name="address2" value="${apple.address2}"><br>
		<input type="text" id="address3" name="address3" value="${apple.address3}">
		
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
	<input type="submit" value="수정" onclick="return inCheck()" id="submit">&nbsp;&nbsp;
	<input type="reset" value="취소">
</form>
</body>
</html>