<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLAN</title>
<link href="resources/css/header.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/2f6ba02431.js" crossorigin="anonymous"></script>
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
	vertical-align: top;
	padding: 10px;
	height: 100%;
	width: 100%;
}
section article.art div.addGoal, 
section article.art div.checkSchedule, 
section article.art div.timeCapsual, 
section article.art div.setAlarm,
section nav.nav div i#addGoalCheck, 
section nav.nav div i#checkScheduleCheck, 
section nav.nav div i#timeCapsualCheck, 
section nav.nav div i#setAlarmCheck{
 	display: none;
} 
section nav.nav i.fas{
	color: #1DDB16;
	padding-left: 10px;
}
section article.art i.fas:hover{
	cursor: pointer;
	color: #1DDB16;
}
section article.art h1{
	font-size: 20pt;
}
section article.art label{
	margin-right: 10px;
}
section article.art .checkMenu1,
section article.art .checkMenu2{
	display: inline-block;
	padding: 0px;
	margin: 0px;
}
section article.art .checkMenu1 li,
section article.art .checkMenu2 li{
	width: 120px;
	height: 50px;
	line-height: 50px;
	display: inline-block;
	text-align: center;
	background-color: #E0FF8B;
	font-weight: bold;
	color: grey;
	font-size: 12pt;
	border-radius: 30px;
	border: 5px solid white;
}
section article.art .checkMenu1 li.select,
section article.art .checkMenu2 li.select{
	border: 5px solid green;
}
section article.art .checkMenu1 li:hover,
section article.art .checkMenu2 li:hover{
	background-color: white;
	color: #1DDB16;
	border: 5px solid #E0FF8B;
	cursor: pointer;
}
section article.art span{
	display: block;
}
section article.art span.none{
	display: none;
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
			<div class="menu" id="addSchedule">일정추가<i id="addScheduleCheck" class="fas fa-check"></i></div>
			<div class="menu" id="addGoal">목표추가<i id="addGoalCheck" class="fas fa-check"></i></div>
			<div class="menu" id="checkSchedule">일정확인<i id="checkScheduleCheck" class="fas fa-check"></i></div>
			<div class="menu" id="timeCapsual">타임캡슐<i id="timeCapsualCheck" class="fas fa-check"></i></div>
			<div class="menu" id="setAlarm">알림설정<i id="setAlarmCheck" class="fas fa-check"></i></div>
		</nav>
		<article class="art">
		
<!-- 			일정 추가 -->
			<div class="addSchedule">
				<form>
					<h1>새 일정 추가 <i class="fas fa-cog"></i></h1>
					<p>
						<label>그 &nbsp;&nbsp;&nbsp; 룹 : </label>
						<select>
							<option hidden="true">선택하기</option>
							<option>가족 행사</option>
							<option>친구</option>
							<option>미팅</option>
						</select>
					</p>
					<p>
						<label>제 &nbsp;&nbsp;&nbsp; 목 : </label>
						<input type="text" placeholder="내용을 입력하세요">
					</p>
					<p>
						<label>내 &nbsp;&nbsp;&nbsp; 용 : </label>
						<input type="text" placeholder="내용을 입력하세요">
					</p>
					<p>
						<label>날 &nbsp;&nbsp;&nbsp; 짜 : </label>
						<input type="date">
					</p>
					<p>
						<label>시 &nbsp;&nbsp;&nbsp; 간 : </label>
						<input type="time">
					</p>
					<p>
						<label>알 &nbsp;&nbsp;&nbsp; 림 : </label>
						<input type="checkbox">알림
					</p>
					<p>
						<input type="button" value="저장하기">
					</p>
				</form>
			</div>
			
<!-- 			목표 추가 -->
			<div class="addGoal">
				<form>
					<h1>새 목표 추가 <i class="fas fa-cog"></i></h1>
					<p>
						<label>그 &nbsp;&nbsp;&nbsp; 룹 : </label>
						<select>
							<option hidden="true">선택하기</option>
							<option>다이어트</option>
							<option>자격증</option>
							<option>미래</option>
						</select>
					</p>
					<p>
						<label>목 &nbsp;&nbsp;&nbsp; 표 : </label>
						<input type="text" placeholder="당신의 목표는 무엇인가요?">
					</p>
					<p>
						<label>날 &nbsp;&nbsp;&nbsp; 짜 : </label>
						<input type="date">
					</p>
					<p>
						<label>알 &nbsp;&nbsp;&nbsp; 림 : </label>
						<input type="checkbox">알림
					</p>
					<p>
						<input type="button" value="저장하기">
					</p>
				</form>
			</div>
			
<!-- 			일정 확인 -->
			<div class="checkSchedule">
				<h1>일정 확인</h1>
				<nav>
					<ul class="checkMenu1">
						<li id="cale" class="select">달력
						<li id="list">리스트
						<li id="item">품목별
						<li id="graph">그래프
					</ul>
				</nav>
				<span class="checkSpan1 cale">
					달력
				</span>
				<span class="checkSpan1 list none">
					리스트
				</span>
				<span class="checkSpan1 item none">
					품목별
				</span>
				<span class="checkSpan1 graph none">
					그래프
				</span>
			</div>
			
<!-- 			타입 캡슐 -->
			<div class="timeCapsual">
				<form>
					<h1>타임 캡슐 <i class="fas fa-envelope"></i></h1>
					<p>
						<input type="date">
					</p>
					<p>
						<input type="time">
					</p>
					<p>
						<input type="checkbox">문자 알림(유료)
						<input type="checkbox">카카오톡 알림(무료)
						<input type="checkbox">이메일 알림(무료)
					</p>
					<p>
						<input type="text" placeholder="제목">
					</p>
					<p>
						<textarea rows="10" cols="50" placeholder="내용"></textarea>
					</p>
					<p>
						<input type="button" value="저장하기">
					</p>
				</form>
			</div>
			
<!-- 			알림 설정 -->
			<div class="setAlarm">
				<h1>알림설정</h1>
				<nav>
					<ul class="checkMenu2">
						<li id="text" class="select">문자 알림
						<li id="katalk">카카오톡 알림
						<li id="email">이메일
					</ul>
				</nav>
				
				<span class="checkSpan2 text">
					문자 알림
				</span>
				<span class="checkSpan2 katalk none">
					카카오톡 알림
				</span>
				<span class="checkSpan2 email none">
					이메일
				</span>
			</div>
		</article>
	</div>
	<div class="main_div" id="main_sign_up">
		<span onclick="membership('main_div')"><i class="fas fa-undo-alt"></i></span>
		<br>
		카카오톡 회원가입
	</div>
	<div class="main_div" id="main_sign_in">
		<span onclick="membership('main_div')"><i class="fas fa-undo-alt"></i></span>
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
				checkIcon = document.querySelectorAll('#' + div.className + ' i')[0];
				if(div.className == Activation){
					div.style.display = 'block';
					checkIcon.style.display = 'inline';
				}else{
					div.style.display = "none";
					checkIcon.style.display = 'none';
				}
			});
		});
	});
	
	function checkMenuFunc(className, spanName){
		document.querySelectorAll("." + className + " li").forEach(li =>{
			li.addEventListener('click', function(event){
				document.querySelectorAll("." + spanName).forEach(sp =>{
					if(sp.className.indexOf(li.id) >= 0){
						sp.style.display="block";
						li.style.border= '5px solid green';
					} else {
						sp.style.display="none";
					}
					document.querySelectorAll("." + className + " li").forEach(others =>{
						if(others.id !== li.id)
							others.style.border='5px solid white';
					})
				});
			})
		});
	}
	checkMenuFunc('checkMenu1', 'checkSpan1');
	checkMenuFunc('checkMenu2', 'checkSpan2');
</script>
<%@ include file="footer.jsp" %>
</body>
</html>