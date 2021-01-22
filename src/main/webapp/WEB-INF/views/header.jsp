<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header>
	<div class="header">
		<div class="icon">
			<img alt="메인 아이콘" src="resources/img/plan.png">
		</div>
		<div class="main">
			<h1>PLAN</h1>
		</div>
		<div class="header_membership">
			<div class="header_button" onclick="location.href='/plan/kakao/signUp/'">SIGN UP</div>
<!-- 			<div class="header_button" onclick="membership('main_sign_up');location=href='https://kauth.kakao.com/oauth/authorize?client_id=cf83f297804712adcff8375dfef83e89&redirect_uri=http://localhost:7070/plan/signup/&response_type=code';">SIGN UP</div> -->
			<div class="header_button" onclick="membership('main_sign_in')">SIGN IN</div>
		</div>
	</div>
</header>