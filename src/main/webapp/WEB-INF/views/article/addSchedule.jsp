<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form>
	<h1>새 일정 추가 <i class="fas fa-cog"></i></h1>
	<p>
		<label>그 &nbsp;&nbsp;&nbsp; 룹 : </label>
		<select>
			<option hidden="true">선택하기</option>
			<option>가족 행사</option>
			<option>친구</option>
			<option>미팅</option>
		</select>
	</p>
	<p>
		<label>제 &nbsp;&nbsp;&nbsp; 목 : </label>
		<input type="text" placeholder="내용을 입력하세요">
	</p>
	<p>
		<label>내 &nbsp;&nbsp;&nbsp; 용 : </label>
		<input type="text" placeholder="내용을 입력하세요">
	</p>
	<p>
		<label>날 &nbsp;&nbsp;&nbsp; 짜 : </label>
		<input type="date">
	</p>
	<p>
		<label>시 &nbsp;&nbsp;&nbsp; 간 : </label>
		<input type="time">
	</p>
	<p>
		<label>알 &nbsp;&nbsp;&nbsp; 림 : </label>
		<input type="checkbox">알림
	</p>
	<p>
		<input type="button" value="저장하기">
	</p>
</form>