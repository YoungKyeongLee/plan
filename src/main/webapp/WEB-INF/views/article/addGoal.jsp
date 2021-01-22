<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form>
	<h1>새 목표 추가 <i class="fas fa-cog"></i></h1>
	<p>
		<label>그 &nbsp;&nbsp;&nbsp; 룹 : </label>
		<select>
			<option hidden="true">선택하기</option>
			<option>다이어트</option>
			<option>자격증</option>
			<option>미래</option>
		</select>
	</p>
	<p>
		<label>목 &nbsp;&nbsp;&nbsp; 표 : </label>
		<input type="text" placeholder="당신의 목표는 무엇인가요?">
	</p>
	<p>
		<label>날 &nbsp;&nbsp;&nbsp; 짜 : </label>
		<input type="date">
	</p>
	<p>
		<label>알 &nbsp;&nbsp;&nbsp; 림 : </label>
		<input type="checkbox">알림
	</p>
	<p>
		<input type="button" value="저장하기">
	</p>
</form>