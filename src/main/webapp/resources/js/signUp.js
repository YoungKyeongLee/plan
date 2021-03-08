var signUpList = {};
async function signUp(){
	const {data} = await axios.post('/plan/rest/signUp/', signUpList);
	alert(data ? '회원가입이 완료되었습니다.' : '오류발생! 다시 시도해주세요');
	resetSignUp();
	membership('main_div');
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
			nextBoxOpen(event, 2, 'id', userid);
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
	const regExp = /^.*(?=^.{7,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	if(userpw !== userpwConfirm){
		msg = '비밀번호가 일치하지 않습니다. 다시 확인해주세요';
		userpwInput.value = '';
		userpwConfirmInput.value = '';
	} else if(!regExp.test(userpw)){
		msg = '비밀번호는 영문자 ,숫자 특수문자의 조합 7~15자리로';
		userpwInput.value = '';
		userpwConfirmInput.value = '';
	}else {
		msg = '비밀번호가 일치합니다.';
		distroyInput(userpwInput);
		distroyInput(userpwConfirmInput);
		nextBoxOpen(event, 3, 'pw', userpw);
	}
	alert(msg);
}
function checkName(event){
	let usernameInput = document.getElementById('username');
	let username = usernameInput.value;
	if(username.length >= 2){
		distroyInput(usernameInput);
		nextBoxOpen(event, 4, 'name', username);
	} else {
		alert('이름이 너무 짧습니다. 2자 이상 입력해주세요');
	}
}
function checkPhoneNum(event){
	const regExp = /^\d{3}-\d{3,4}-\d{4}$/;
	let phoneNumInput = document.getElementById('phoneNum');
	let phoneNum = phoneNumInput.value;
	if(regExp.test(phoneNum)){
		distroyInput(phoneNumInput);
		nextBoxOpen(event, 5, 'phone', phoneNum);
	} else{
		alert("'-'를 포함하여 입력해주세요");
	}
}
function checkEmail(event){
	const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	let emailInput = document.getElementById('emailText');
	let email = emailInput.value;
	if(regExp.test(email)){
		distroyInput(emailInput);
		nextBoxOpen(event, 6, 'email', email);
	} else{
		alert('잘못된 이메일 형식입니다.');
	}
}
function checkBirth(event){
	let birthInput = document.getElementById('birthText');
	let birth = birthInput.value;
	if(true){
		distroyInput(birthInput);
		nextBoxOpen(event, 7, 'birth', birth);
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
	document.querySelector('.signUP_Box_' + (nex - 1) + ' .signUpExplain').style.display = 'none';
	signUpList[type]=value;
}
function resetSignUp(){
	signUpList = {};
	inputList = document.querySelectorAll('.Sign_form input');
	pList = document.querySelectorAll('.Sign_form p');
	buttonList = document.querySelectorAll('.Sign_form span');
	explainList = document.querySelectorAll('.Sign_form .signUpExplain');
	
	for(let index = 0; index < inputList.length; index++){
		inputList[index].className = "";
		inputList[index].readOnly = false;
		inputList[index].value="";
	}
	for(let index = 1; index < pList.length; index++){
		pList[index].style.display = 'none';
	}
	buttonList.forEach(li => {
		li.style.display = "inline-block";
	});
	explainList.forEach(li => {
		li.style.display = "block";
	});
}