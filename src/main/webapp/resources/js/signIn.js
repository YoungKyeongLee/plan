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
	if(data['result']){
		membership('main_div');
		alert('환영합니다.');
		initFunctionAfterLogin(data);
	} else {
		alert('아이디 또는 비밀번호를 확인하세요');
		resetSignIn();
	}
}