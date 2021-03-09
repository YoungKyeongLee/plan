function afterUpdate(data){
	if(data === false){
		alert('정상적으로 등록되지 않았습니다. 새로고침(F5)후 다시 시도해보세요.');
	} else if(data === 'conflict'){
		alert('중복된 데이터 입니다.');
	} else{
		initFunctionAfterLogin(data);
		alert('정상처리 되었습니다.');
	}
}
function loginCheckFunction(){
	return staticLoginInfo['id'] === "";
}