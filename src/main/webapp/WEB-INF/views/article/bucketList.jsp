<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form id="bucketList_form">
	<h1>버킷 리스트</h1>
	<p>
		<input id="bucketListInput" type="text" placeholder="버킷리스트 추가">
	</p>
	<p>
		<span class="green_Button" onclick="addBucket()">추가하기</span>
	</p>
	<div>
		<ul id="yourBucketList">
		</ul>
	</div>
</form>