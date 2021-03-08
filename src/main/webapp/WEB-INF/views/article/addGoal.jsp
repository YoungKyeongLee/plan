<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form id="addGoal_form">
	<h1>새 목표 추가 <i class="fas fa-cog"></i></h1>
	<p>
		<label>그 &nbsp;&nbsp;&nbsp; 룹 : </label>
		<select class="bunchList">
		</select>
	</p>
	<p>
		<label>목 &nbsp;&nbsp;&nbsp; 표 : </label>
		<input type="text" name="goal" placeholder="당신의 목표는 무엇인가요?">
	</p>
	<p>
		<label>날 &nbsp;&nbsp;&nbsp; 짜 : </label>
		<input type="date" name="day">
	</p>
	<p>
		<label>알 &nbsp;&nbsp;&nbsp; 림 : </label>
		<input type="checkbox" name="alarm">알림
	</p>
	<p>
		<input type="button" name="button" value="저장하기" onclick="add('addGoal')">
	</p>
</form>