<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form id="addGoal_form">
	<h1>새 목표 추가 <i class="fas fa-plus-circle" onclick="newBunch('addGoal')"></i></h1>
	<div class = "addBunch"><input type='text' placeholder="그룹 추가"><span class="green_Button" onclick="addBunch(event)">추가</span></div>
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
		<span class="green_Button" onclick="add('addGoal')">저장하기</span>
	</p>
</form>