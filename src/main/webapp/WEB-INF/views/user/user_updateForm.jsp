<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보수정</title>
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
		if (confirm("정말 가입 하십니까 ? (Yes:확인 / No:취소)")==false) {
		 	return false;
		}else {
			return true;
		}
	} else return false; 
  } //inCheck
</script>
<style>
	table {
	    width: 50%;
	    margin-left:auto; 
    	margin-right:auto;
    	border: 5px ridge #ff5722;
	}
	tr {
		height: 40px;
	}
	th {
		background-color: LightSteelBlue;
		text-align: center;
	}
	input {
	
	}
	#a {
		color: #A6A6A6;
		font-weight:bold;
		text-decoration: none;
	}
	#a:hover {
		color: #0B58CA;
	}
</style>
<body>
<h3>** <span style="font-size: 25px;">${apple.user_name}</span>님의 정보 **</h3>
<br>
<c:if test="${not empty message}">
<br>=> ${message}<br><br>
</c:if>
<hr>
<form action="userupdate" method="post">
	<table>
		<tr>
			<th>아이디</th>
			<td id="t"><input type="text" name="user_id" value="${apple.user_id}" size="20" readonly="readonly"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td id="t"><input type="password" name="user_password" value="${apple.user_password}" size="20"></td>
			<td><span id="pMessage" class="eMessage"></span></td>
		</tr>
		<tr>
			<th>이름</th>
			<td id="t"><input type="text" name="user_name" value="${apple.user_name}" size="20"></td>
			<td><span id="nMessage" class="eMessage"></span></td>
		</tr>
		<tr>
			<th>주소</th>
			<td id="t">
				<div>
				<input type="text" id="address1" name="address1" value="${apple.address1}">
				<input type="button" onclick="sample6_execDaumPostcode()" value="주소찾기"><br>
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
			</td>
		</tr>		
		<tr>
			<td></td>
			<td id="t"><input type="submit" value="수정" onclick="return inCheck()">&nbsp;&nbsp;
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
<hr>
<a id="a" href="home">[HOME]</a>&nbsp;&nbsp;
<a id="a" href='javascript:history.go(-1)'>[뒤로가기]</a>
</body>
</html>