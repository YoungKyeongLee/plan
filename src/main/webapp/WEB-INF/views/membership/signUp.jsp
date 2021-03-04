<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form class="Sign_form">
	<h1 onclick="resetSignUp()">Sign UP</h1>
	<p class="signUP_Box_1">
		<a class="signUpExplain">아이디는 5자 이상</a>
		<input id="userid" name="id" type="text" placeholder="ID">
		<span class="signUp_Button" onclick="checkId(event)">check</span>
	</p>
	<p class="signUP_Box_2">
		<a class="signUpExplain">비밀번호는 영문자 ,숫자 특수문자의 조합 7~15자리로</a>
		<input id="userpw" type="password" placeholder="PW">
		<input id="userpwConfirm" type="password" placeholder="PW 확인">
		<span class="signUp_Button" onclick="checkPW(event)">check</span>
	</p>
	<p class="signUP_Box_3">
		<a class="signUpExplain">이름 또는 별명</a>
		<input id="username" name="name" type="text" placeholder="이름">
		<span class="signUp_Button" onclick="checkName(event)">check</span>
	</p>
	<p class="signUP_Box_4">
		<a class="signUpExplain">휴대폰 번호('-'를 포함) : 000-0000-0000 형식으로 입력</a>
		<input id="phoneNum" name="phoneNum" type="tel" placeholder="phone number">
		<span class="signUp_Button" onclick="checkPhoneNum(event)">check</span>
	</p>
	<p class="signUP_Box_5">
		<a class="signUpExplain">이메일 주소 : EX) userid@plan.com</a>
		<input id="emailText" name="emailText" type="email" placeholder="email">
		<span class="signUp_Button" onclick="checkEmail(event)">check</span>
	</p>
	<p class="signUP_Box_6">
		<a class="signUpExplain">생년월일 입력</a>
		<input id="birthText" name="birthText" type="date" placeholder="생년월일">
		<span class="signUp_Button" onclick="checkBirth(event)">check</span>
	</p>
	<p class="signUP_Box_7">
		<a class="signUpExplain">↓ 완료 ↓</a>
		<input type="button" value="SIGN IN" onclick="signUp()">
	</p>
</form>