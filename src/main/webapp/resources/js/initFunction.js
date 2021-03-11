var staticLoginInfo = {id: "", name: ""};
var resultList = '';
function initFunctionAfterLogin(data){
	if(data === undefined){
		alert('로그인 시간이 만료되었습니다. 다시 로그인 해주세요');
		initFunctionAfterLogout();
		return;
	}
	staticLoginInfo['id'] = data['id'];
	staticLoginInfo['name'] = data['name'];
	resultList = data;
	headerSettings(data['result']);
	articleSettings(data['bunchList'], data['scheduleList'], data['goalList'], data['bucketList']);
}
function initFunctionAfterLogout(){
	staticLoginInfo = {id: "", name: ""};
	resultList = '';
	headerSettings(false);
	let bunchList = ["가족행사", "미팅", "친구"];
	let scheduleList = [];
	let goalList = [];
	let bucketList = [{bucket : "다이어트", checkbox : "Y"},{bucket : "패러글라이딩", checkbox : "N"}];
	articleSettings(bunchList, scheduleList, scheduleList, bucketList);
}
async function logout(){
	if(confirm('로그아웃 하시겠습니까?') === true){
		axios.get('/plan/rest/logout/');
		initFunctionAfterLogout();
	}
}
function headerSettings(checkLogin){
	let headerBox = document.getElementsByClassName('header_membership');
	let userName = staticLoginInfo['name'];
	headerBox[1].children[0].title=userName;
	headerBox[1].children[0].innerHTML = '[' + (userName.length > 3 ? (userName.substring(0,3) + '..') : userName) + ']님';
	
	switch(checkLogin){
	case true:
		headerBox[0].style.display = 'none';
		headerBox[1].style.display = 'inline-block';
		break;
	case false:
		headerBox[0].style.display = 'inline-block';
		headerBox[1].style.display = 'none';
		break;
	}
}
function articleSettings(bunchList, scheduleList, goalList, bucketList){
	bunchSettings(bunchList);
	scheduleSettings(scheduleList);
	goalSettings(goalList);
	bucketSettings(bucketList);
}
function bunchSettings(bunchList){
	document.querySelectorAll('.bunchList').forEach(bunch => {
		bunch.innerHTML = '';
		let hiddenOption = document.createElement('option');
		hiddenOption.setAttribute("hidden", "true");
		hiddenOption.innerHTML = "선택하기";
		bunch.appendChild(hiddenOption);
		for(let bu in bunchList){
			let option = document.createElement('option');
			option.setAttribute('value', bunchList[bu]);
			option.innerHTML = bunchList[bu];
			bunch.appendChild(option);
		}
	});
}
function scheduleSettings(scheduleList){
	console.log('scheduleSettings 함수 실행');
}
function goalSettings(goalList){
	console.log('goalSettings 함수 실행');
}
function bucketSettings(bucketList){
	let bucketBox = document.getElementById('yourBucketList');
	bucketBox.innerHTML = '';
	for(let bu in bucketList){
		let li= document.createElement('li');
		let a = document.createElement('a');
		let checkBox= document.createElement('input');
		let closeButton = document.createElement('i');
		
		closeButton.setAttribute('class', 'far fa-window-close');
		closeButton.addEventListener('click', removeBucket);
		
		checkBox.setAttribute('type', 'checkbox');
		if(!loginCheckFunction()) checkBox.addEventListener('click', bucketCheckEvent);
		if(bucketList[bu].checkbox === 'Y') checkBox.setAttribute('checked', 'checked');
		
		a.innerHTML = bucketList[bu].bucket;
		
		li.appendChild(checkBox);
		li.appendChild(a);
		li.appendChild(closeButton);
		bucketBox.appendChild(li);
	}
}
