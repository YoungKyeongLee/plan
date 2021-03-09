var staticLoginInfo = {id: "", name: ""};
function initFunctionAfterLogin(data){
	if(data === undefined){
		alert('로그인 시간이 만료되었습니다. 다시 로그인 해주세요');
		initFunctionAfterLogout();
		return;
	}
	staticLoginInfo['id'] = data['id'];
	staticLoginInfo['name'] = data['name'];
	headerSettings(data['result']);
	articleSettings(data['bunchList'], data['scheduleList'], data['goalList'], data['bucketList']);
}
function initFunctionAfterLogout(){
	console.log('초기실행 또는 로그아웃');
	staticLoginInfo = {id: "", name: ""};
	headerSettings(false);
	let bunchList = ["가족행사", "미팅", "친구"];
	let scheduleList = [];
	let goalList = [];
	let bucketList = [{bucket : "다이어트", checkbox : "Y"},{bucket : "패러글라이딩", checkbox : "N"}];
	articleSettings(bunchList, scheduleList, scheduleList, bucketList);
}
function headerSettings(checkLogin){
	console.log(staticLoginInfo);
	switch(checkLogin){
	case true:
		console.log('headerSettings 함수 true 실행');
		break;
	case false:
		console.log('headerSettings 함수 false 실행');
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
		let checkBox= document.createElement('input');
		checkBox.setAttribute('type', 'checkbox');
		if(!loginCheckFunction()) checkBox.addEventListener('click', bucketCheckEvent);
		if(bucketList[bu].checkbox === 'Y') checkBox.setAttribute('checked', 'checked');
		
		li.innerHTML = bucketList[bu].bucket;
		
		li.appendChild(checkBox);
		bucketBox.appendChild(li);
	}
}
