<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form class="login_form" action="signIn/" method="POST">
	<h1 onclick="resetSignIn()">Login</h1>
	<p>
	<input id="loginID" type="text" placeholder="ID">
	<p>
	<input id="loginPW" type="password" placeholder="PW">
	<p>
	<input type="button" value="SIGN IN" onclick="login()">
	<p>
	<a href="">did you forget your account?</a>
</form>
<script>
function resetSignIn(){
	document.getElementById('loginID').value = '';
	document.getElementById('loginPW').value = '';
}
function checkNull(loginIdInput, loginPwInput){
	let checkLoginId = loginIdInput.value === '';
	let checkLoginPw = loginPwInput.value === '';
	
	loginIdInput.style.border = checkLoginId ? '1px solid red' : '';
	loginPwInput.style.border = checkLoginPw ? '1px solid red' : '';
	
	if(checkLoginId || checkLoginPw) return true;
	else return false;
}
async function login(){
	let loginIdInput = document.getElementById('loginID');
	let loginPwInput = document.getElementById('loginPW');
	
	if(checkNull(loginIdInput, loginPwInput)) return;
	
	user = {
		id : loginIdInput.value,
		pw : loginPwInput.value,
	}
	
	const { data } = await axios.post('/plan/rest/signIn/', user);
	console.log(data);
	if(data['result']){
		alert('환영합니다.');
// 		loginSettings();
	} else {
		alert('아이디 또는 비밀번호를 확인하세요');
		resetSignIn();
	}
}
</script>