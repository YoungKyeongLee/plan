<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLAN</title>
<link href="resources/css/header.css" rel="stylesheet">
<style type="text/css">
section .intro{
	height: 300px;
	background:  olive;
}
section div.intro h1{
	color: white;
	text-align: center;
	line-height: 300px;
}
section div.main{
	display: inline-flex;
	height: 500px;
	width: 100%;
	borer: 1px solid yellow;
}
section div.main nav.nav{
	display: inline-block;
	width: 300px;
}
section div.main nav.nav div.menu{
	display: block;
	font-size: 20pt;
	font-weight: bold;
	text-align: center;
	width: 300px;
	height: 100px;
	line-height: 100px;
}
section div.main nav.nav div.menu:hover{
	background-color: green;
}
section div.main article{
	display:inline-block;
	border: 1px solid orange;
	vertical-align: top;
	height: 100%;
	width: 100%;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
	<div class="intro">
		<h1>
			PLAN과 함께 하루 목표와 일정을 관리하세요
		</h1>
	</div>
	<div class="main">
		<nav class="nav">
			<div class="menu">일정추가</div>
			<div class="menu">목표추가</div>
			<div class="menu">일정확인</div>
			<div class="menu">타임캡슐</div>
			<div class="menu">알림설정</div>
		</nav>
		<article class="art">
			<div class="addSchedule">addSchedule</div>
			<div class="addGoal">addGoal</div>
			<div class="checkSchedule">checkSchedule</div>
			<div class="timeCapsual">timeCapsual</div>
			<div class="setAlarm">setAlarm</div>
		</article>
	</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>