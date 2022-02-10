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
	
	function inCheck() {	
		if (confirm("정말 삭제 하십니까 ?")==false) {
			alert('취소되었습니다');
		 	return false;
		}else {
			return true;
		}
	} //inCheck
	
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
	  	<span id="top"><a class="top" href="cartlist">장바구니</a></span>
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
<table width="70%">
	<tr height="30" align="center">
		<th colspan="2">상품현황정보</th><th>판매가</th><th>수량</th><th>구매가</th>
	</tr>
	<c:forEach var="list" items="${banana}">
	<c:forEach var="list2" items="${apple}">
	<tr height="30" align="center">
		<td><img src="${list.uploadfile}" style="width: 60px; height: 80px;"></td><td>${list.item_name}</td>
		<td>${list.item_price}</td>
		<td>${list2.cart_count}</td>
		<td> ${list.item_price*list2.cart_count}</td>
		<td><a href="cartdelete?cart_seq=${list2.cart_seq}&user_id=${loginID}" onclick="return inCheck()" id="a">[삭제]</a></td>
	</tr>
	</c:forEach>
	</c:forEach>
</table>
</body>
</html>