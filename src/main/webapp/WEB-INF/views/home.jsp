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
<!-- 회원가입, 로그인 -->
<link href="resources/css/membership.css" rel="stylesheet">
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
		<article style="width:350px; height:450px; background-color: #EAEAEA;">
			
		</article>
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
</section>
<!-- 기본 메뉴 관련 메서드들 -->
<script type="text/javascript" src="resources/js/clickMenu.js"></script>
<%@ include file="footer.jsp" %>
<script>
	async function add(type){
		if(staticLoginInfo['id'] === ""){
			alert('로그인 후 이용 가능합니다^^');
			return;
		}
		ob = {};
		let checkGroup = document.querySelector('#' + type + '_form .bunchList');
		if(checkGroup.value === '선택하기'){
			checkGroup.focus();
			return;
		} else {
			ob['bunch'] = checkGroup.value;
		}
		let InputBox = document.querySelectorAll('#' + type + '_form input');
		let boxLength = InputBox.length;
		for(let ib = 1; ib < boxLength - 2; ib++){
			let thisInputBox = InputBox[ib];
			if(thisInputBox.value === ''){
				thisInputBox.focus();
				return;
			} else {
				ob[thisInputBox.name] = thisInputBox.value;
			}
		}
		ob['alarm'] = InputBox[boxLength - 2].checked ? 'Y' : 'N';
		ob['id'] = staticLoginInfo['id'];
		
		console.log(ob);
		const {data} = await axios.post('/plan/rest/' + type + '/', ob);
		console.log(data ? '성공' : '실패');
		console.log(type);
	}
	function newGroup(type){
		let boxDispay = document.querySelector("#" + type + "_form .addGroup");
		boxDispay.style.display = boxDispay.style.display === '' ? 'none' : '';
	}
</script>
<script>
	initFunctionAfterLogout();
</script>
</body>
</html>