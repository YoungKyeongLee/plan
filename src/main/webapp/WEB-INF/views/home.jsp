<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLAN</title>
<style type="text/css">
	header{
	}
	header div.header{
		width: 100%;
		display: inline-flex;
	}
	header div.icon{
		width: 100px;
		height: 100px;
	}
	header div.icon img{
		width: 100px;
		height: 100px;
	}
	header div.header div.main{
		display: inline-block;
		margin: auto;
		width: 100%;
	}
	header div.header div.main h1{
		text-align: center;
		font-size: 35pt;
	}
	header div.header div.header_membership{
		display: inline-block;
		width : 100px;
		height: auto;
	}
	header div.header div.header_button{
 		border-radius: 30px;
 		height: 50px;
 		line-height: 50px;
 		color: #1DDB16;
 		text-align: center;
	}
	header div.header div.header_button:hover{
		cursor: pointer;
		background-color: #E4F7BA;
		font-size: large;
	}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
섹션입니다.
</section>
<%@ include file="footer.jsp" %>
</body>
</html>