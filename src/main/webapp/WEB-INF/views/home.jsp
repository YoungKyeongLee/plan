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
<script>
	var signUpList = {};
	async function signUp(){
		const {data} = await axios.post('/plan/rest/signUp/', signUpList);
		console.log(data);
	}
	async function checkId(event){
		let useridInput = document.getElementById('userid');
		let userid = useridInput.value;
		let msg;
		if(userid !== '' && userid.length >= 5){
			const {data} = await axios.get('/plan/rest/signUp/idCheck/' + userid + "/");
			msg = data ? '사용가능한 아이디 입니다.' : '중복된 아이디 입니다.';
			if(data) {
				distroyInput(useridInput);
				nextBoxOpen(event, '2', 'id', userid);
			}
		} else {
			msg = '아이디를 5자 이상 입력해주세요';
		}
		alert(msg);
	}
	function checkPW(event){
		let userpwInput = document.getElementById('userpw');
		let userpwConfirmInput = document.getElementById('userpwConfirm');
		let userpw = userpwInput.value;
		let userpwConfirm = userpwConfirmInput.value;
		let msg;
		if(userpw === userpwConfirm){
			msg = '비밀번호가 일치합니다.';
			distroyInput(userpwInput);
			distroyInput(userpwConfirmInput);
			nextBoxOpen(event, '3', 'pw', userpw);
		} else {
			msg = '비밀번호가 일치하지 않습니다. 다시 확인해주세요';
			userpwInput.value = '';
			userpwConfirmInput.value = '';
		}
		alert(msg);
	}
	function checkName(event){
		let usernameInput = document.getElementById('username');
		let username = usernameInput.value;
		if(username.length >= 2){
			distroyInput(usernameInput);
			nextBoxOpen(event, '4', 'name', username);
		} else {
			alert('이름이 너무 짧습니다. 2자 이상 입력해주세요');
		}
	}
	function checkPhoneNum(event){
		let phoneNumInput = document.getElementById('phoneNum');
		let phoneNum = phoneNumInput.value;
		if(true){
			distroyInput(phoneNumInput);
			nextBoxOpen(event, '5', 'phone', phoneNum);
		} else{
			alert("'-' 없이 10~11자리 숫자로 입력해주세요");
		}
	}
	function checkEmail(event){
		let emailInput = document.getElementById('emailText');
		let email = emailInput.value;
		if(true){
			distroyInput(emailInput);
			nextBoxOpen(event, '6', 'email', email);
		} else{
			alert('잘못된 이메일 형식입니다.');
		}
	}
	function checkBirth(event){
		let birthInput = document.getElementById('birthText');
		let birth = birthInput.value;
		if(true){
			distroyInput(birthInput);
			nextBoxOpen(event, '7', 'birth', birth);
		} else{
			alert('잘못된 생일입니다.');
		}
	}
	function distroyInput(name){
		name.readOnly = true;
		name.className = "finish";
	}
	function nextBoxOpen(event, nex, type, value){
		event.target.style.display='none';
		document.getElementsByClassName('signUP_Box_' + nex)[0].style.display = 'block';
		signUpList[type]=value;
	}
</script>
<!-- 기본 메뉴 관련 메서드들 -->
<script type="text/javascript" src="resources/js/clickMenu.js"></script>
<%@ include file="footer.jsp" %>
</body>
</html>