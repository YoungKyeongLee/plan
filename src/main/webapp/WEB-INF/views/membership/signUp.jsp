<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form class="Sign_form">
	<h1>Sign UP</h1>
	<p class="signUP_Box_1">
		<input id="userid" name="id" type="text" placeholder="ID">
		<span class="signUp_Button" onclick="checkId(event)">check</span>
	</p>
	<p class="signUP_Box_2">
		<input id="userpw" type="password" placeholder="PW">
		<input id="userpwConfirm" type="password" placeholder="PW_Confirm">
		<span class="signUp_Button" onclick="checkPW(event)">check</span>
	</p>
	<p class="signUP_Box_3">
		<input id="username" name="name" type="text" placeholder="Name">
		<span class="signUp_Button" onclick="checkName(event)">check</span>
	</p>
	<p class="signUP_Box_4">
		<input id="phoneNum" name="phoneNum" type="tel" placeholder="phoneNum">
		<span class="signUp_Button" onclick="checkPhoneNum(event)">check</span>
	</p>
	<p class="signUP_Box_5">
		<input id="emailText" name="emailText" type="email" placeholder="email">
		<span class="signUp_Button" onclick="checkEmail(event)">check</span>
	</p>
	<p class="signUP_Box_6">
		<input id="birthText" name="birthText" type="date" placeholder="birthday">
		<span class="signUp_Button" onclick="checkBirth(event)">check</span>
	</p>
	<p class="signUP_Box_7">
		<input type="button" value="SIGN IN" onclick="signUp()">
	</p>
</form>