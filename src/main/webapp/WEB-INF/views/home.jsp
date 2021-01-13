<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLAN</title>
<!-- 헤더 -->
<link href="resources/css/header.css" rel="stylesheet">
<!-- 전체 섹션 -->
<link href="resources/css/section.css" rel="stylesheet">
<!-- 일정 추가, 목표 추가 -->
<link href="resources/css/addSetting.css" rel="stylesheet">
<!-- 일정 확인, 알림 설정 -->
<link href="resources/css/spanMenu.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/2f6ba02431.js" crossorigin="anonymous"></script>
<style type="text/css">
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
			<div class="menu" id="addGoal">목표추가<i id="addGoalCheck" class="fas fa-check" style="display: none;"></i></div>
			<div class="menu" id="checkSchedule">일정확인<i id="checkScheduleCheck" class="fas fa-check" style="display: none;"></i></div>
			<div class="menu" id="timeCapsual">타임캡슐<i id="timeCapsualCheck" class="fas fa-check" style="display: none;"></i></div>
			<div class="menu" id="setAlarm">알림설정<i id="setAlarmCheck" class="fas fa-check" style="display: none;"></i></div>
		</nav>
		<article class="art">
<!-- 			일정 추가 -->
			<div id="addSchedule_div" class="article">
				<%@ include file="addSchedule.jsp" %>
			</div>
			
<!-- 			목표 추가 -->
			<div id="addGoal_div" class="article" style="display: none;">
				<%@ include file="addGoal.jsp" %>
			</div>
			
<!-- 			일정 확인 -->
			<div id="checkSchedule_div" class="article" style="display: none;">
				<%@ include file="checkSchedule.jsp" %>
			</div>
			
<!-- 			타입 캡슐 -->
			<div id="timeCapsual_div" class="article" style="display: none;">
				<%@ include file="timeCapsual.jsp" %>
			</div>
			
<!-- 			알림 설정 -->
			<div id="setAlarm_div" class="article" style="display: none;">
				<%@ include file="setAlarm.jsp" %>
			</div>
		</article>
	</div>
	<div class="main_div" id="main_sign_up" style="display: none;">
		<span onclick="membership('main_div')"><i class="fas fa-undo-alt"></i></span>
		<br>
		카카오톡 회원가입
	</div>
	<div class="main_div" id="main_sign_in" style="display: none;">
		<span onclick="membership('main_div')"><i class="fas fa-undo-alt"></i></span>
		<br>
		카카오톡 로그인
	</div>
</section>
<script>
// 	회원가입, 로그인, 그리고 회원가입과 로그인 페이지에서 뒤로가기 버튼을 누를때 그에 맞는 영역을 보여주는 메서드
	function membership(type){
		document.querySelectorAll(".main_div").forEach(main =>{
			main.style.display = (main.id === type) ? "inline-flex" : "none";
		});
	}

// 	side nav 바 클릭 시 체크 표시 추가하고, 그에 맞는 div의 display를 활성화하는 메서드
	document.querySelectorAll(".menu").forEach(menu => { 
		menu.addEventListener('click', function(event){ 
			Activation = menu.id;
			document.querySelectorAll(".art div.article").forEach(div => {
				divIdName = div.id.split('_')[0];
				checkIcon = document.querySelectorAll('#' + divIdName + ' i')[0];
				if(div.id == (Activation +'_div')){
					div.style.display = 'block';
					checkIcon.style.display = 'inline';
				}else{
					div.style.display = "none";
					checkIcon.style.display = 'none';
				}
			});
		});
	});
	
// 	일정확인과 알림설정 내의 미니 메뉴판 버튼 클릭 시 그에 맞는 영역을 활성화 시켜주고 해당 버튼 스타일을 바꾸어주는 메서드
	function checkMenuFunc(className, spanName){
		document.querySelectorAll("." + className + " li").forEach(li =>{
			li.addEventListener('click', function(event){
				document.querySelectorAll("." + spanName).forEach(sp =>{
					if(sp.className.indexOf(li.id) >= 0){
						sp.style.display="block";
						li.style.border= '5px solid #E0FF8B';
						li.style.backgroundColor= 'white';
					} else {
						sp.style.display="none";
					}
					document.querySelectorAll("." + className + " li").forEach(others =>{
						if(others.id !== li.id){
							others.style.border='5px solid white';
							others.style.backgroundColor = '#E0FF8B';
						}
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