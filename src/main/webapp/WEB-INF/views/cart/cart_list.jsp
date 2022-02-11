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
	table {
	  width: 100%;
	  border-top: 1px solid lightgray;
	  border-collapse: collapse;
	}
	th, td {
	  border-bottom: 1px solid lightgray;
	  padding: 10px;
	}
	td > form > a, td > a {
		text-decoration: none;
		color: #A6A6A6;
	}
</style>
<script>
 	$(function() {
	    var responseMessage = "<c:out value="${message}" />";
	    if(responseMessage != "") {
	        alert(responseMessage);
	    }
	}) 

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
	
	function deCheck() {	
		if (confirm("정말 삭제 하십니까 ?")==false) {
			alert('취소되었습니다');
		 	return false;
		}else {
			return true;
		}
	} //deCheck
	
	function orderCheck() {	
		if (confirm("결제페이지로 넘어갈까요 ?")==false) {
			alert('취소되었습니다');
		 	return false;
		}else {
			return true;
		}
	} //orderCheck
	
	opener.location.reload();
	
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
<form action="orderinsert" method="get">
<table>
	<tr height="30" align="center">
		<th colspan="2">상품현황정보</th><th>판매가</th><th>수량</th><th>구매가</th><th></th>
	</tr>
	<c:forEach var="list" items="${banana}">
	<tr align="center">
		<td><img src="${list.uploadfile}" style="width: 60px; height: 80px;"></td>
		<td>${list.item_name}</td>
		<td>${list.item_price} 원</td>
		<td style="width: 16%;">
		<input id="cart_count${list.cart_seq}" name="cart_count" value="${list.cart_count}" readonly="readonly">
		<a href="cartupdatef?item_seq=${list.item_seq}&user_id=${loginID}" id="a">[수정]</a>
		</td>
		<td >${list.item_price*list.cart_count} 원</td>
		<td style="width: 6%;">
		<a href="cartdelete?cart_seq=${list.cart_seq}&user_id=${loginID}" onclick="return deCheck()" id="a">[삭제]</a></td>
	</tr>
	</c:forEach>
	<tr>
		<td></td><td></td><td>총금액<span></span></td>
	</tr>
</table>
<input type="submit" value="결제하기" id="order" class="submit" onclick="return orderCheck()" style="background-color: #EA4F33; color:white;">
</form>
</body>
</html>