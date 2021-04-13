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
<!-- 버킷리스트 -->
<link href="resources/css/bucket.css" rel="stylesheet">
<!-- 회원가입, 로그인 -->
<link href="resources/css/membership.css" rel="stylesheet">
<!-- 일정확인/달력 -->
<link href="resources/css/checkSchedule/cale.css" rel="stylesheet">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/2f6ba02431.js" crossorigin="anonymous"></script>
<!-- AXIOS -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<!-- 초기화 js-->
<script type="text/javascript" src="resources/js/initFunction.js"></script>
<!-- 회원가입 js-->
<script type="text/javascript" src="resources/js/signUp.js"></script>
<!-- 로그인 js-->
<script type="text/javascript" src="resources/js/signIn.js"></script>
<!-- 플랜 신규 추가 관련 js-->
<script type="text/javascript" src="resources/js/addSetting.js"></script>
<!-- 예외처리 js-->
<script type="text/javascript" src="resources/js/exception.js"></script>
<!-- 버킷리스트 js-->
<script type="text/javascript" src="resources/js/bucket.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
	<div class="intro">
		<h1>
			PLAN 과 함께 하루 목표와 일정을 관리하세요
		</h1>
	</div>
	<div style="display: inline-flex;">
		<article style="width:180px; height:620px;">
			<ins class="kakao_ad_area" style="display:none;" 
				 data-ad-unit    = "DAN-4VvW5m8OlFwcCDVW" 
				 data-ad-width   = "160" 
				 data-ad-height  = "600"></ins> 
			<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
		</article>
		<div class="main_div" id="main_div">
			
			<nav class="nav">
				<div class="menu" id="addSchedule">일정추가<i id="addScheduleCheck" class="fas fa-check"></i></div>
				<div class="menu" id="addGoal">목표추가<i id="addGoalCheck" class="fas fa-check" style="display: none;"></i></div>
				<div class="menu" id="checkSchedule">일정확인<i id="checkScheduleCheck" class="fas fa-check" style="display: none;"></i></div>
				<div class="menu" id="bucketList">버킷리스트<i id="bucketListCheck" class="fas fa-check" style="display: none;"></i></div>
				<div class="menu" id="setAlarm">알림설정<i id="setAlarmCheck" class="fas fa-check" style="display: none;"></i></div>
			</nav>
			<article class="art">
	<!-- 			일정 추가 -->
				<div id="addSchedule_div" class="article">
					<%@ include file="article/addSchedule.jsp" %>
				</div>
				
	<!-- 			목표 추가 -->
				<div id="addGoal_div" class="article" style="display: none;">
					<%@ include file="article/addGoal.jsp" %>
				</div>
				
	<!-- 			일정 확인 -->
				<div id="checkSchedule_div" class="article" style="display: none;">
					<%@ include file="article/checkSchedule.jsp" %>
				</div>
				
	<!-- 			타입 캡슐 -->
				<div id="bucketList_div" class="article" style="display: none;">
					<%@ include file="article/bucketList.jsp" %>
				</div>
				
	<!-- 			알림 설정 -->
				<div id="setAlarm_div" class="article" style="display: none;">
					<%@ include file="article/setAlarm.jsp" %>
				</div>
			</article>
		</div>
		<div class="main_div" id="main_sign_up" style="display: none;">
			<span onclick="membership('main_div')"><i class="fas fa-undo-alt"></i></span>
			<br>
	<!-- 		회원가입 -->
			<%@ include file="membership/signUp.jsp" %>	
		</div>
		<div class="main_div" id="main_sign_in" style="display: none;">
			<span onclick="membership('main_div')"><i class="fas fa-undo-alt"></i></span>
			<br>
	<!-- 		로그인 -->
			<%@ include file="membership/signIn.jsp" %>	
		</div>
	</div>
</section>
<!-- 기본 메뉴 관련 메서드들 -->
<script type="text/javascript" src="resources/js/clickMenu.js"></script>
<!-- 일정 확인/달력 js-->
<script type="text/javascript" src="resources/js/cale.js"></script>
<%@ include file="footer.jsp" %>
<script>

</script>
<script>
	if('${resultList}' === '')
		initFunctionAfterLogout();
	else{
		initFunctionAfterLogin(${resultList});
	}
</script>
</body>
</html>