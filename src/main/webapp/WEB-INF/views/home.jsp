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
	height: 100px;
	background:  olive;
}
section div.intro h1{
	color: white;
	text-align: center;
	line-height: 100px;
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
 section article.art div.addGoal, 
 section article.art div.checkSchedule, 
 section article.art div.timeCapsual, 
 section article.art div.setAlarm{ 
 	display: none;
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
			<div class="menu" id="addSchedule">일정추가</div>
			<div class="menu" id="addGoal">목표추가</div>
			<div class="menu" id="checkSchedule">일정확인</div>
			<div class="menu" id="timeCapsual">타임캡슐</div>
			<div class="menu" id="setAlarm">알림설정</div>
		</nav>
		<article class="art">
		
<!-- 			일정 추가 -->
			<div class="addSchedule">
				<h1>새 일정 추가</h1>
				<form>
					<select>
						<option hidden="true">선택하기</option>
						<option>가족 행사</option>
						<option>친구</option>
						<option>미팅</option>
					</select>
					<input type="button" value="새 그룹 추가">
					<input type="date">
					<input type="time">
					<input type="checkbox">알림
					<input type="button" value="저장하기">
				</form>
			</div>
			
<!-- 			목표 추가 -->
			<div class="addGoal">
				<h1>새 목표 추가</h1>
				<form>
					<select>
						<option hidden="true">선택하기</option>
						<option>다이어트</option>
						<option>자격증</option>
						<option>미래</option>
					</select>
					<input type="button" value="새 그룹 추가">
					<input type="date">
					<input type="text" placeholder="당신의 목표는 무엇인가요?">
					<input type="button" value="저장하기">
				</form>	
			</div>
			
<!-- 			일정 확인 -->
			<div class="checkSchedule">
				<nav>
					<ul>
						<li>달력
						<li>리스트
						<li>품목별
						<li>그래프
					</ul>
				</nav>
			</div>
			
<!-- 			타입 캡슐 -->
			<div class="timeCapsual">
				타임캡슐
			</div>
			
<!-- 			알림 설정 -->
			<div class="setAlarm">알림설정</div>
		</article>
	</div>
</section>
<script>
	document.querySelectorAll(".menu").forEach(menu => { 
		menu.addEventListener('click', function(event){ 
			Activation = menu.id;
			document.querySelectorAll(".art div").forEach(div => {
				if(div.className == Activation)
					div.style.display = 'block';
				else
					div.style.display = "none";
			});
		});
	});
</script>
<%@ include file="footer.jsp" %>
</body>
</html>