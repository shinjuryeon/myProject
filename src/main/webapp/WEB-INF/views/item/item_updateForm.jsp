<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="utf-8">
	<title>** 판매물품수정 **</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
    <script src="resources/myLib/jquery-3.2.1.min.js"></script>
    <script src="resources/myLib/inCheck4.js"></script>
</head>
<script>
  var nCheck = false;
  var pCheck = false;
  var iCheck = false;
  
  $(function() {
      var responseMessage = "<c:out value="${message}" />";
      if(responseMessage != "") {
          alert(responseMessage);
      }
  })

  $(function() {
	  $('#item_name').focus();
	  $('#item_name').keydown(function(e){
	      if (e.which==13) {
	         e.preventDefault();
	      }
	   }).focusout(function() { 
		   nCheck = nameCheck();
	   }); //name_focusout
	   
	   $('#item_price').focusout(function(){
		   	pCheck = priceCheck();
	   }); //price_focusout

	   $('#inventory').focusout(function(){
		   	iCheck = invenCheck();
	   }); //inventory_focusout
	   
	   
  }); //ready

function inCheck() {
	if (nCheck==false) {
		$('#nMessage').html('상품명 확인하세요');
	}
	if (pCheck==false) {
		$('#pMessage').html('상품가격을 확인하세요');
	}
	if (iCheck==false) {
		$('#iMessage').html('상품재고를 확인하세요!');
	}

	if (iCheck && pCheck && nCheck) {
		if (confirm("정말 수정 하십니까?")==false) {
			alert('상품수정이 취소되었습니다');
		 	return false;
		}else {
			alert('상품수정에 성공했습니다');
			return true;
		}
	} else return false; 
  } //inCheck
  
</script>
<style>
	* {margin: 5px; padding: 0; border: 0;}
	
	body {background-color: whitesmoke; display: flex; flex-direction: column; justify-content: center; align-items: center;}
	
	.header {display: flex; flex-direction: column; align-items: center;}
	
	hr {width:90%; height:1px; border:none; background-color:lightgray;}
		
	div div { margin:25px auto; align-content: center;}
	
	form div {margin: 10px;}
	
	.contentName {font-size: 22px; margin-left: 3px; }
	
	#find {width: 100px; height:50px;}
	
	textarea {border: 2px solid lightgray;}
	
	textarea:focus {outline-color: limegreen; border-color: limegreen;}
	
	.select {marin: 0px; width: 200px; height: 50px; border: 2px solid lightgray; font-size: 16px;}
	
	.select:focus {outline-color: limegreen; border-color: limegreen;}
	
	.uploadfilef {width: 400px; height: 30px;}
	
	input {width: 400px; height: 50px; border: 2px solid lightgray; font-size: 16px;}
		
	input:focus { outline-color: limegreen; border-color: limegreen;}
	
	input[type="submit"] { color: white; background-color: limegreen; margin-left: 25px; margin-bottom: 50px; width: 180px;}
	
	input[type="reset"] { width:180px; }
	
	input[type="submit"]:hover {cursor: pointer; }

</style>
<body>
	<div id="" class="" style="width: 100%; height: 35px; font-size: medium;">
	
	</div>
	<header class="header">
		<a href="home"><img src="resources/image/logo.png" style="width:210px; height:110px;"></a><br>
		<div style="position: relative; margin:30px 0px;">
			<h2>판매물품수정</h2>
			<p style="font-size: medium;">
			다양한 어쩌구 저쩌구~
			</p>
		</div>
	</header>
	<hr>
	<form action="itemupdate" method="post" enctype="multipart/form-data" id="myForm">
		<div>
			<span class="contentName"><b>상품명</b></span><br>
			<input type="text" id="item_name" name="item_name" value="${peach.item_name}" size="20"><br>
	      	<span id="nMessage" class="eMessage"></span>
		</div>
		<div>
			<span class="contentName"><b>상품가격</b></span><br>
			<input type="text" id="item_price" name="item_price" value="${peach.item_price}" size="20"><br>
	      	<span id="pMessage" class="eMessage"></span>
		</div>
		<div>
			<span class="contentName"><b>상품소개글</b></span><br>
			<textarea name="content" rows="10" cols="48">${peach.content}</textarea>
		</div>
		<div>
			<span class="contentName"><b>상품재고</b></span><br>
			<input type="text" id="inventory" name="inventory" value="${peach.inventory}" size="20"><br>
	      	<span id="iMessage" class="eMessage"></span>
		</div>
		<div>
			<span class="contentName"><b>상품사진</b></span><br>
			<img src="${peach.uploadfile}" class="select_img"><br>
			<input type="file" name="uploadfilef" id="uploadfilef" class="uploadfilef">
			<script>  
		       $('#uploadfilef').change(function(){
		          if(this.files && this.files[0]) {
		             var reader = new FileReader;
		                 reader.onload = function(e) {
		                 $(".select_img").attr("src", e.target.result)
		                    .width(200).height(200); 
		                 } // onload_function
		                 reader.readAsDataURL(this.files[0]);
		           } // if
		       }); // change
			</script>
		</div>
		<div>
			<span class="contentName"><b>상품코드</b></span><br>
			<select class="select" id="category_code" name="category_code">
				<option value="1">과일</option>
				<option value="2">채소</option>
				<option value="3">쌀/잡곡/견과</option>
				<option value="4">정육/계란</option>
				<option value="5">수산물/건해산</option>
				<option value="6">우유/유제품/유아식</option>
				<option value="7">냉장/냉동/간편식</option>
				<option value="8">밀키트/김치/반찬</option>
				<option value="9">생수/음료/주류</option>
				<option value="10">커피/원두/차</option>
				<option value="11">라면/면류/즉석식품/통조림</option>
				<option value="12">장류/양념/가루/오일</option>
				<option value="13">과자/시리얼/빙과/떡</option>
				<option value="14">베이커리/잼/샐러드</option>
				<option value="15">건강식품</option>
				<option value="16">제지/위생/건강용품</option>
				<option value="17">세탁/청소/욕실/생활용품</option>
				<option value="18">침구/가구/홈인테리어</option>
				<option value="19">주방용품</option>
				<option value="20">생활잡화/공구</option>
				<option value="21">반려동물</option>
				<option value="22">뷰티</option>
				<option value="23">유아동/출산/완구</option>
				<option value="24">패션/언더웨어</option>
				<option value="25">잡화/슈즈/명품</option>
				<option value="26">스포츠/레저/여행/자동차</option>
				<option value="27">컴퓨터/가전/디지털/렌탈</option>
				<option value="28">문구/취미/도서</option>
			</select>
		</div>
		<div>
			<span class="contentName"><b>등록회사</b></span><br>
			<input type="text" id="com_id" name="com_id" value="${peach.com_id}" readonly="readonly" size="20">&nbsp;&nbsp;
		</div>
		<input type="submit" value="수정" onclick="return inCheck()" id="submit">&nbsp;&nbsp;
		<input type="reset" value="취소">&nbsp;&nbsp;
	</form>
</body>
</html>