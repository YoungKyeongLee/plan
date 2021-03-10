async function addBucket(){
	if(loginCheckFunction()){
		alert('로그인 후 이용 가능합니다^^');
		return;
	}
	let input = document.getElementById('bucketListInput');
	if(input.value === ''){
		alert('내용을 입력해주세요');
	} else{
		ob = {
			id: staticLoginInfo['id'],
			bucket : input.value,
		}	
		const {data} = await axios.post('/plan/rest/addBucket/', ob);
		afterUpdate(data);
		input.value='';
	}
}
async function bucketCheckEvent(event){
	let targetInput = event.target;
	ob = {
		id: staticLoginInfo['id'],
		bucket : targetInput.parentNode.innerText,
		checkbox : targetInput.checked ? 'Y' : 'N',
	}
	const {data} = await axios.post('/plan/rest/updateBucket/', ob);
	afterUpdate(data);
}
async function removeBucket(event){
	if(loginCheckFunction()){
		alert('로그인 후 이용 가능합니다^^');
		return;
	}
	ob = {
		id:staticLoginInfo['id'],
		bucket:event.target.parentNode.children[1].innerText,
	}
	const {data} = await axios.post('/plan/rest/removeBucket/', ob);
	afterUpdate(data);
}