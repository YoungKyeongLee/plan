<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h1>일정 확인</h1>
<nav>
	<ul class="checkMenu1">
		<li id="cale" class="select">달력
		<li id="list">리스트
		<li id="item">품목별
		<li id="graph">그래프
		<li id="goal">목표
	</ul>
</nav>
<span class="checkSpan1 cale">
	<%@ include file="checkSchedule/cale.jsp"%>
</span>
<span class="checkSpan1 list" style="display: none;">
	<%@ include file="checkSchedule/list.jsp"%>
</span>
<span class="checkSpan1 item" style="display: none;">
	<%@ include file="checkSchedule/item.jsp"%>
</span>
<span class="checkSpan1 graph" style="display: none;">
	<%@ include file="checkSchedule/graph.jsp"%>
</span>
<span class="checkSpan1 goal" style="display: none;">
	<%@ include file="checkSchedule/goal.jsp"%>
</span>