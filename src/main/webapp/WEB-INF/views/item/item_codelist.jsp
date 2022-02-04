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
		margin: 15px 100px;
		color: #A6A6A6;
		font-weight:bold;
		text-decoration: none;
	}
	#a:hover {
		color: #0B58CA;
	}
	#b {
		color: #585858;
		text-decoration: none;
	}
	#c {
		color: #222222;
		font-size: 20px;
		font-weight: bold;
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
 	<div><a href="itemexplain?item_seq=${list.item_seq}&com_id=${list.com_id}"><img src="${list.uploadfile}" width="290px" height="290px"></a></div>
	<div><a href="itemexplain?item_seq=${list.item_seq}&com_id=${list.com_id}" id="b">${list.item_name}</a></div>
	<div id="c">${list.item_price}</div>
</div>
</c:forEach>
</body>
</html>