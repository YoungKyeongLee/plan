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
section div.main_div{
	display: inline-flex;
	height: 500px;
	width: 100%;
}
section div.main_div#main_sign_up,
section div.main_div#main_sign_in{
 	display: none;
}
section div.main_div nav.nav{
	display: inline-block;
	width: 300px;
}
section div.main_div nav.nav div.menu{
	display: block;
	font-size: 20pt;
	font-weight: bold;
	text-align: center;
	width: 300px;
	height: 100px;
	line-height: 100px;
	border-radius: 40px;
}
section div.main_div nav.nav div.menu:hover{
	cursor: pointer;
	background-color: #E4F7BA;
	font-size: 23pt;
	color: #1DDB16;
}
section div.main_div article{
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
	<div class="main_div" id="main_div">
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
				<h1>일정 확인</h1>
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
				<h1>타임 캡슐</h1>
				<input type="date">
				<input type="time">
				<input type="checkbox">문자 알림(유료)
				<input type="checkbox">카카오톡 알림(무료)
				<input type="checkbox">이메일 알림(무료)
				<br>
				<input type="text" placeholder="제목">
				<br>
				<textarea rows="10" cols="50" placeholder="내용"></textarea>
			</div>
			
<!-- 			알림 설정 -->
			<div class="setAlarm">
				<h1>알림설정</h1>
				<nav>
					<ul>
						<li>문자 알림
						<li>카카오톡 알림
						<li>이메일
					</ul>
				</nav>
			</div>
		</article>
	</div>
	<div class="main_div" id="main_sign_up">
		<span onclick="membership('main_div')">◀</span>
		<br>
		카카오톡 회원가입
	</div>
	<div class="main_div" id="main_sign_in">
		<span onclick="membership('main_div')">◀</span>
		<br>
		카카오톡 로그인
	</div>
</section>
<script>
	function membership(type){
		document.querySelectorAll(".main_div").forEach(main =>{
			console.log(type, main);
			if(main.id == type)
				main.style.display = "inline-flex";
			else
				main.style.display = "none";
		});
	}


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