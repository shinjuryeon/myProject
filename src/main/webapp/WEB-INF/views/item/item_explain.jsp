<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${cherry.item_name}</title>
    <link href="resources/myLib/styles.css" rel="stylesheet">
    <script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<style>
	#login:hover {
		color: #0B58CA;
	}
	.top {
		margin-right: 15px;
		color: #A6A6A6;
		font-weight:bold;
		text-decoration: none;
	}
	header {
		background-color: #9ACD32;
		width: 100%;
		height: 120px;
	}
    #search {
    	position: absolute;
    	width: 400px;
    	height: 45px;
    	border: 1px solid #262626;
    	background-color: #ffffff;
    	margin-left: 35%;
    	top: 90px;
    }
    input {
    	font-size: 16px;
    	width: 195px;
    	padding: 9px;
    	border: 0px;
    	outline: none;
    	float: left;
    }
    button {
    	width: 50px;
    	height: 100%;
    	border: 0px;
    	color: #ffffff;
    	outline: none;
    	float: right;
    	background-color: #222222;
    }
    #comid {
    	font-size: 15px;
    	line-height: 35px;
    	color: #585858;
    }
    #name {
        font-size: 28px;
    	line-height: 35px;
    	color: #222222;
    	letter-spacing: -0.5px;
   		word-wrap: break-word;
    	word-break: break-all;
    }
    #price {
    	font-size: 45px;
    	color: #222222;
    	vertical-align: middle;
    }
    #price2 {
    	font-size: 25px;
    	color: #222222;
    	vertical-align: middle;
    	display: inline-block;
   		margin: 4px 0 0 0;
    }
    #inven {
    	margin-right: 10px;
    	width: 30px;
    	color: #222222;
    }
    #cart {
    	background-color: #222222;
    }
    #buy {
    	background-color: #EA4F33;
    }
    .submit {
    	color: white;
    }
</style>
<script>
	$(function() {
	    var responseMessage = "<c:out value="${message}" />";
	    if(responseMessage != "") {
	        alert(responseMessage);
	    }
	})
	
	function cartCheck() {
		if (confirm("장바구니에 담으시겠습니까?")==false) {
			alert('취소되었습니다');
		 	return false;
		} else return true;
	}

	function userloginf() {
		var url = "/green/userloginf";
		open(url, "_blank", "toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes, width=400, height=200");
	}
	function comloginf() {
		var url = "/green/comloginf";
		open(url, "_blank", "toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes, width=400, height=200");
	}
 	opener.document.location.reload();
	self.close();
	
	function count(type) {
  		const resultElement = document.getElementById('cart_count');
  		const resultSum = document.getElementById('sum');
  
  		let number = resultElement.value;
  		var sum = resultSum.innerText;
  
  		if(type === 'plus') {
   		 	number = parseInt(number) + 1;
   		 	sum = ${cherry.item_price} * parseInt(number);
  		}else if(type === 'minus') {
    		number = parseInt(number) - 1;
    		sum = ${cherry.item_price} * parseInt(number);
  		}
  	  	resultElement.value = number;
  	  	resultSum.innerText = sum;
  	  	
  	  	if(number > ${cherry.inventory}) {
  	  		alert("재고가 부족합니다! ${cherry.inventory}개 이하로 선택해주세요");
  	  		resultElement.value = ${cherry.inventory};
  	  		resultSum.innerText = ${cherry.item_price} * ${cherry.inventory};
  	  	} else if(number < 1) {
  	  		alert("1개 이상 선택해주세요");
  	  	  	resultElement.value = 1;
  	  		resultSum.innerText = ${cherry.item_price};
  	  	}
	}
</script>
<body>
<div id="" class="" align="right" style="width: 100%; height: 35px; font-size: medium;">
	<c:if test="${empty loginID && empty logincID}">
	<div style="margin: 17px 100px;">
	  	<span id="login" class="top" onclick="userloginf()">구매자 로그인</span>
	  	<span id="login" class="top" onclick="comloginf()">판매자 로그인</span>
	  	<span id="top"><a class="top" href="joinselect">회원가입</a></span>
	</div>
	</c:if>
	<c:if test="${not empty loginID && empty logincID && loginID != 'admin'}">
	<div style="margin: 17px 100px;">
		<span class="top" style="margin-right:0px; color: black;">${loginName}</span><span class="top">님 반갑습니다!</span>
	  	<span id="top"><a class="top" href="userdetail?user_id=${loginID}">내정보보기</a></span>
	  	<span id="top"><a class="top" href="cartlist?user_id=${loginID}">장바구니</a></span>
	  	<span id="top"><a class="top" href="orderlist">주문내역</a></span>
	  	<span id="top"><a class="top" href="logout">로그아웃</a></span>
	</div>
	</c:if>
	<c:if test="${not empty logincID && empty loginID && logincID != 'admin'}">
	<div style="margin: 17px 100px;">
	  	<span class="top" style="margin-right:0px; color: black;">${loginName}</span><span class="top">님 반갑습니다!</span>
	  	<span id="top"><a class="top" href="comdetail?com_id=${logincID}">내정보보기</a></span>
	  	<span id="top"><a class="top" href="itemcomlist?com_id=${logincID}">내등록물품보기</a></span>
	  	<span id="top"><a class="top" href="itemjoinf?com_id=${logincID}">판매물품등록</a></span>
	  	<span id="top"><a class="top" href="logout">로그아웃</a></span>
	</div>
	</c:if>
	<c:if test="${logincID == 'admin' || loginID == 'admin'}">
	<div style="margin: 17px 100px;">
	  	<span class="top" style="margin-right:0px; color: black;">${loginName}</span><span class="top">님 반갑습니다!</span>
	  	<span id="top"><a class="top" href="userlist">구매자리스트</a></span>
	  	<span id="top"><a class="top" href="comlist">판매자리스트</a></span>
	  	<span id="top"><a class="top" href="itemlist">판매상품조회/등록</a></span>
	  	<span id="top"><a class="top" href="categorylist">상품코드조회/등록</a></span>
	  	<span id="top"><a class="top" href="logout">로그아웃</a></span>
	</div>
	</c:if>
</div>
<header class="" style="background-color: #9ACD32; height: 120px;">
	<a href="home"><img src="resources/image/logoW.png" style="width:210px; height:110px; float: left; margin: 5px 0px 0px 50px;"></a>
	<div id="search">
		<input type="text" placeholder="검색어 입력">
		<button>검색</button>
	</div>
</header>
<div style="display: flex; justify-content: center; margin-top: 20px;">
	<div style="float: left; margin-right: 70px;">
		<img src="${cherry.uploadfile}" width="400px" height="400px">
	</div>
	<div style="width: 400px; height: 400px;">
		<div>
			<span id="comid">${comName}</span><br>
			<h2 id="name">${cherry.item_name}</h2>
		</div>
		<div>
			<span id="price">${cherry.item_price}</span><span id="price2">원</span>
		</div>
		<hr>
		<form action="cartinsert" method="get">
			<input type="hidden" name="item_seq" value="${cherry.item_seq}">
			<input type="hidden" name="user_id" value="${loginID}">
			<div style="font-size: 20px; display:flex; margin-left: 10px;">
				<a href="javascript:void(0);" onclick='count("minus")' style="text-decoration: none;"><span id="inven">-</span></a>
				<div id="inven"><input id="cart_count" name="cart_count" value="1" readonly="readonly"></div>
				<a href="javascript:void(0);" onclick='count("plus")' style="text-decoration: none;"><span id="inven">+</span></a>
			</div>
			<div style="float: right; margin: 10px 0px;">
				<span style="display: inline-block;margin: 4px 0 -4px;font-weight: normal;font-size: 20px;color: #222;vertical-align: middle;">합계</span>&nbsp;&nbsp;
				<span id="sum" style="color: #f7511a; display: inline-block; font-size: 35px; vertical-align: middle;">${cherry.item_price}</span>
				<span style="color: #f7511a; display: inline-block; margin: 4px 0 -4px 2px; font-size: 20p; vertical-align: middle;">원</span>
			</div>
			<br><br><br>
			<hr>
			<input type="submit" value="장바구니" id="cart" class="submit" onclick="return cartCheck()">&nbsp;&nbsp;
			<input type="submit" value="바로구매" id="buy" class="submit">
		</form>
	</div>
</div>
<hr style="width: 90%; height: 3px; margin: 50px auto 20px;">
<div><h3 style="padding: 20px 0 15px;font-size: 22px;line-height: 1;letter-spacing: 0.5px;color: #222; margin-left:10%">상품상세정보</h3></div>
<hr style="width: 90%; height: 3px; margin: 20px auto;">
<div style="width: 70%; margin: 50px auto; text-align: center; font-size: large;">
${cherry.content}
</div>
</body>
</html>