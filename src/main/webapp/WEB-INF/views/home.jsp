<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<title>그린마트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
    	width: 325px;
    	padding: 8px;
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
    .outer {
		border: 6px solid royalblue;
		width: 300px;
		height: 200px;
		margin: 0 auto;
		overflow-x: hidden;
	}
	
	.inner-list {
		display: flex;
		transition: .3s ease-out;
		height: 100%;
	}
	
	.inner {
		border: 6px solid olive;
		padding: 0 16px;
	}
	
	.button-list {
		text-align: center;
	}
	#ad {
		width: 100%;
		height:720px;
	}
	li {
		list-style: none;
		font-size: 14px;
	    line-height: 23px;
	}
	li>a {
		text-decoration-line: none;
		color: #222222;
	}
	li:hover {
		font-size: 15px;
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
<main style="float:left;">
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="width:100%; height:700px; position: absolute; z-index: 1">
	 <div class="carousel-indicators">
	   <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	   <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	   <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	 </div>
	 <div class="carousel-inner">
	   <div class="carousel-item active">
	     <a href=""><img id="ad" src="resources/image/a3.png" class="d-block w-100"></a>
	   </div>
	   <div class="carousel-item">
	     <a href=""><img id="ad" src="resources/image/bbb.gif" class="d-block w-100"></a>
	   </div>
	   <div class="carousel-item">
	     <a href=""><img id="ad" src="resources/image/ccc.gif" class="d-block w-100"></a>
	   </div>
	 </div>
</div>
<div style="position: absolute; z-index: 1000; height: 720px; width: 200px; margin-left: 55px; background-color: #F4F4F4; opacity: 0.80;">
	<ul style="margin-top:13px">
		<li style="font-size: 16px; font-weight: bold;">FOOD</li>
		<li><a href="itemcodelist?category_code=1">과일</a></li>
		<li><a href="itemcodelist?category_code=2">채소</a></li>
		<li><a href="itemcodelist?category_code=3">쌀/잡곡/견과</a></li>
		<li><a href="itemcodelist?category_code=4">정육/계란</a></li>
		<li><a href="itemcodelist?category_code=5">수산물/건해산</a></li>
		<li><a href="itemcodelist?category_code=6">우유/유제품/유아식</a></li>
		<li><a href="itemcodelist?category_code=7">냉장/냉동/간편식</a></li>
		<li><a href="itemcodelist?category_code=8">밀키트/김치/반찬</a></li>
		<li><a href="itemcodelist?category_code=9">생수/음료/주류</a></li>
		<li><a href="itemcodelist?category_code=10">커피/원두/차</a></li>
		<li><a href="itemcodelist?category_code=11">라면/면류/즉석식품/통조림</a></li>
		<li><a href="itemcodelist?category_code=12">장류/양념/가루/오일</a></li>
		<li><a href="itemcodelist?category_code=13">과자/시리얼/빙과/떡</a></li>
		<li><a href="itemcodelist?category_code=14">베이커리/잼/샐러드</a></li>
		<li><a href="itemcodelist?category_code=15">건강식품</a></li>
		<li style="font-size: 16px; font-weight: bold; line-height: 25px;">LIFE</li>
		<li><a href="itemcodelist?category_code=16">제지/위생/건강용품</a></li>
		<li><a href="itemcodelist?category_code=17">세탁/청소/욕실/생활용품</a></li>
		<li><a href="itemcodelist?category_code=18">침구/가구/홈인테리어</a></li>
		<li><a href="itemcodelist?category_code=19">주방용품</a></li>
		<li><a href="itemcodelist?category_code=20">생활잡화/공구</a></li>
		<li><a href="itemcodelist?category_code=21">반려동물</a></li>
		<li><a href="itemcodelist?category_code=22">뷰티</a></li>
		<li><a href="itemcodelist?category_code=23">유아동/출산/완구</a></li>
		<li><a href="itemcodelist?category_code=24">패션/언더웨어</a></li>
		<li><a href="itemcodelist?category_code=25">잡화/슈즈/명품</a></li>
		<li><a href="itemcodelist?category_code=26">스포츠/레저/여행/자동차</a></li>
		<li><a href="itemcodelist?category_code=27">컴퓨터/가전/디지털/렌탈</a></li>
		<li><a href="itemcodelist?category_code=28">문구/취미/도서</a></li>
	</ul>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</main>
</html>