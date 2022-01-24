<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자/구매자</title>
</head>
<style>
	span {
		width: 200px;
		height: 200px;
		border-radius: 60px;
		display: flex;
		justify-content: center;
		flex-direction: column;
		align-items: center;
		float: left;
		font-size: 25px;
		text-decoration: none;
		font-weight: bold;
	}
	
	#s1 {
		color: blue;
		background-color: yellow;
		margin-right: 50px;
		margin-top: 200px;
	}
	
	span:hover {
		transform: scale(1.3);
		transition: .5s;
		cursor: pointer;
	}
	
	#s2 {
		color: yellow;
		background-color: blue;
		margin-top: 250px;
	}
	
	#s3 {
		background-color: #9ACD32;
		width: 80px;
		height: 45px;
		border-radius: 15px;
		font-size: 15px;
		margin-top: 480px;
		color: white;
	}

</style>
<body style="display: flex; justify-content: center;">
<a href="userjoinf"><span id="s1">구매자</span></a>
<a href="comjoinf"><span id="s2">판매자</span></a>
<a href='javascript:history.go(-1)'><span id="s3">[뒤로가기]</span></a>
</body>
</html>