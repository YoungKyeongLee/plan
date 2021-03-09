<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form id="addSchedule_form">
	<h1>새 일정 추가 <i class="fas fa-plus-circle" onclick="newBunch('addSchedule')"></i></h1>
	<div class = "addBunch"><input type='text' placeholder="그룹 추가"><span class="green_Button" onclick="addBunch(event)">추가</span></div>
	<p>
		<label>그 &nbsp;&nbsp;&nbsp; 룹 : </label>
		<select class="bunchList">
		</select>
	</p>
	<p>
		<label>제 &nbsp;&nbsp;&nbsp; 목 : </label>
		<input type="text" name="title" placeholder="내용을 입력하세요">
	</p>
	<p>
		<label>내 &nbsp;&nbsp;&nbsp; 용 : </label>
		<input type="text" name="content" placeholder="내용을 입력하세요">
	</p>
	<p>
		<label>날 &nbsp;&nbsp;&nbsp; 짜 : </label>
		<input type="date" name="day">
	</p>
	<p>
		<label>시 &nbsp;&nbsp;&nbsp; 간 : </label>
		<input type="time" name="time">
	</p>
	<p>
		<label>알 &nbsp;&nbsp;&nbsp; 림 : </label>
		<input type="checkbox" name="alarm">알림
	</p>
	<p>
		<span class="green_Button" onclick="add('addSchedule')">저장하기</span>
	</p>
</form>