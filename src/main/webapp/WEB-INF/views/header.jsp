<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header>
	<div class="header">
		<div class="icon" onclick="location.href='${cpath}'">
			<img alt="메인 아이콘" src="resources/img/plan.png">
		</div>
		<div class="main">
			<h1 onclick="location.href='${cpath}'">PLAN</h1>
		</div>
		<div class="header_membership">
			<div class="header_button" onclick="membership('main_sign_up')">SIGN UP</div>
			<div class="header_button" onclick="membership('main_sign_in')">SIGN IN</div>
		</div>
		<div class="header_membership" style="display:none;">
			<div class="header_button" onclick=""></div>
			<div class="header_button" onclick="logout()">LOG OUT</div>
		</div>
	</div>
</header>
