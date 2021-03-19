<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
준비중입니다.
<div class="listDiv" style="overflow: scroll;">
	
</div>
<script>
	function createScheduleList(scheduleList){
		let listDiv = document.getElementsByClassName('listDiv')[0];
		scheduleList.forEach(li => {
			let one = document.createElement('div');
			one.innerHTML = li.content;
			listDiv.appendChild(one);
		});
	}
</script>