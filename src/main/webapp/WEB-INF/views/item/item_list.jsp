<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 > ${item_name}</title>
</head>
<style>
	#a {
		margin: 17px 100px;
		color: #A6A6A6;
		font-weight:bold;
		text-decoration: none;
	}
	#a:hover {
		color: #0B58CA;
	}
</style>
<script>

</script>
<body>
<div align="right" style="width: 100%; height: 35px; font-size: medium;">
<a id="a" href="home">[HOME]</a>
</div>
<div style="font-size: 30px;"><b>${item_name}</b></div>
<hr>
<c:forEach var="list" items="${mango}">
<div style="float: left; margin-right: 10px">
 	<div><img src="${list.uploadfile}" width="237" height="237"></div>
	<div>
		<div>${list.item_name}</div>
		<div>${list.item_price}</div>
	</div>
</div>
</c:forEach>
</body>
</html>