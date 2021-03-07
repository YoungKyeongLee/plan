function initFunctionAfterLogin(data){
	console.log('로그인');
	console.log(data);
	console.log(data['result']);
	console.log(data['id']);
	console.log(data['name']);
	console.log(data['bunchList']);
	console.log(data['scheduleList']);
	console.log(data['goalList']);
	console.log(data['bucketList']);
	headerSettings(data['result']);
	articleSettings(data['bunchList'], data['scheduleList'], data['goalList'], data['bucketList']);
}
function initFunctionAfterLogout(){
	console.log('초기실행 또는 로그아웃');
	headerSettings(false);
	articleSettings(null, null, null, null);
}
function headerSettings(checkLogin){
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
	console.log('articleSettings 함수 실행');
	bunchSettings(bunchList);
	scheduleSettings(scheduleList);
	goalSettings(goalList);
	bucketSettings(bucketList);
}
function bunchSettings(bunchList){
	console.log('bunchSettings 함수 실행');
}
function scheduleSettings(scheduleList){
	console.log('scheduleSettings 함수 실행');
}
function goalSettings(goalList){
	console.log('goalSettings 함수 실행');
}
function bucketSettings(bucketList){
	console.log('bucketSettings 함수 실행');
}