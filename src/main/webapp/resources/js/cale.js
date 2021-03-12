var selectDay = new Date();
var Calendar = document.getElementById('calendar');
var showBox = document.getElementById('show');
var calscheduleList = [];
var calgoalList = [];
function createCalendar(scheduleList, goalList){
	calscheduleList = scheduleList;
	calgoalList = goalList;
	const year = selectDay.getFullYear();
	const month = selectDay.getMonth();
	document.getElementById('calendarTitle').innerHTML = year + '년 ' + (month+1) + '월';
	Calendar.innerHTML = '';
	showBox.innerHTML = '';
	let week = 0;
	
	pushWeekDiv();
	
	pushDayDiv('name', 'SUN', week);
	pushDayDiv('name', 'MON', week);
	pushDayDiv('name', 'TUE', week);
	pushDayDiv('name', 'WED', week);
	pushDayDiv('name', 'THU', week);
	pushDayDiv('name', 'FRI', week);
	pushDayDiv('name', 'SAT', week++);
	
	const firstDate = new Date(year, month, 1);
	const lastDate = new Date(year, month+1, 0);
	const lastDateNum = lastDate.getDate();
	const lastMonth = new Date(year, month, 0);
	// 0~6 (일~)
	const firstDay = firstDate.getDay();
	const lastDay = lastDate.getDay();
	
	let lastMonthLastDay = lastMonth.getDate() - (firstDay - 1);
	let index = firstDay;
	pushWeekDiv();
	
	for(let i = 0; i < firstDay; i++){
		// 시작 일 전
		pushDayDiv('beforeDay', lastMonthLastDay++, week);
	}
	for(let day = 1; day <= lastDateNum; day++){
		// 달력 날
		if(index === 0){
			pushWeekDiv();
			week++;
		}
		pushDayDiv('activeDay', day, week);
		index = index === 6 ? 0 : index + 1;
	}
	let afterDay = 1;
	for(let i = (lastDay + 1); i <= 6; i++){
		// 끝
		pushDayDiv('afterDay', afterDay++, week);
	}
	
	setList(year, month);
}
function setList(year, month){
	let compareDate = year + '-' + (month < 10 ? '0' : '') + (month + 1);
	console.log(compareDate);
	
	let scheduleList = calscheduleList;
	let goalList = calgoalList;
	
	let filterSc = scheduleList.filter((sc) => sc.day.indexOf(compareDate) === 0);
	let filterGo = goalList.filter((sc) => sc.day.indexOf(compareDate) === 0);
	
	dayList = document.querySelectorAll('.activeDay span');
	
	filterSc.forEach(fi => {dayList.forEach(da => {
		if(parseInt(da.innerHTML) === parseInt(fi.day.substring(8,10))){
			da.parentNode.children[1].className = 'sceduleDay';
			da.parentNode.children[1].id = fi.day;
			da.parentNode.children[1].addEventListener('click', event => showList('schedual', fi.day));
		}
	})})
		
	filterGo.forEach(fi => {dayList.forEach(da => {
		if(parseInt(da.innerHTML) === parseInt(fi.day.substring(8,10))){
			da.parentNode.children[2].className = 'goalDay';
			da.parentNode.children[2].id = fi.day;
			da.parentNode.children[2].addEventListener('click', event => showList('goal', fi.day));
		}
	})})
}
function showList(type, dayVal){
	let showList;
	switch(type){
	case "schedual":
		showBox.innerHTML = '<span>일정</span>';
		showList = calscheduleList.filter((cl) => cl.day === dayVal);
		break;
	case "goal":
		showBox.innerHTML = '<span>목표</span>';
		showList = calgoalList.filter((cl) => cl.day === dayVal);
		break;
	}
	showList.forEach(cl => {
		let span = document.createElement('span');
		console.log(cl);
		switch(type){
		case "schedual":
			span.innerHTML += '[ ' + cl.time + ' ] ' + cl.title + ' : ' + cl.content;
			span.title = '<' + cl.bunch + '>' + cl.content;
			break;
		case "goal":
			span.innerHTML += '[' + cl.goal + ']';
			span.title = '<' + cl.bunch + '>';
			break;
		}
		showBox.appendChild(span);
	});
}
function pushWeekDiv(){
	let weekBox = document.createElement('div');
	weekBox.setAttribute('class', 'week');
	Calendar.appendChild(weekBox);
}

function pushDayDiv(className, text, week){
	let dayBox = document.createElement('div');
	dayBox.setAttribute('class', className);
	dayBox.innerHTML = '<span>' + text + '</span>';
	dayBox.appendChild(document.createElement('div'));
	dayBox.appendChild(document.createElement('div'));
	Calendar.children[week].appendChild(dayBox);
	
}
function changeCalendar(where){
	selectDay = new Date(selectDay.setMonth(selectDay.getMonth() + where));
	createCalendar(calscheduleList, calgoalList);
}