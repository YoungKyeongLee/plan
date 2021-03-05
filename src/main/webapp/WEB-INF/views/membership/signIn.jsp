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