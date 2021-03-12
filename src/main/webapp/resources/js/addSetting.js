async function add(type){
	if(loginCheckFunction()){
		alert('로그인 후 이용 가능합니다^^');
		return;
	}
	ob = {};
	let checkGroup = document.querySelector('#' + type + '_form .bunchList');
	if(checkGroup.value === '선택하기'){
		checkGroup.focus();
		return;
	} else {
		ob['bunch'] = checkGroup.value;
	}
	let InputBox = document.querySelectorAll('#' + type + '_form input');
	let boxLength = InputBox.length;
	for(let ib = 1; ib < boxLength - 1; ib++){
		let thisInputBox = InputBox[ib];
		if(thisInputBox.value === ''){
			thisInputBox.focus();
			return;
		} else {
			ob[thisInputBox.name] = thisInputBox.value;
		}
	}
	ob['alarm'] = InputBox[boxLength - 1].checked ? 'Y' : 'N';
	ob['id'] = staticLoginInfo['id'];
	
	console.log(ob);
	const {data} = await axios.post('cpath + 'rest/' + type + '/', ob);
	
	afterUpdate(data);
}
function activeBunch(type){
	let boxDispay = document.querySelector("#" + type + "_form .addBunch");
	boxDispay.style.display = boxDispay.style.display === 'block' ? 'none' : 'block';
}
function resetBunchAddBox(){
	let boxDispay = document.querySelectorAll("form .addBunch");
	boxDispay[0].style.display = 'none';
	boxDispay[1].style.display = 'none';
}
async function addBunch(event, type){
	if(loginCheckFunction()){
		alert('로그인 후 이용 가능합니다^^');
		return;
	}
	let newGroup = event.target.parentNode.children[0];
	if(newGroup.value === ''){
		newGroup.focus();
		return;
	}
	ob = {
		id: staticLoginInfo['id'],
		bunch : newGroup.value,
	}
	
	const {data} = await axios.post(cpath + 'rest/addBunch/', ob);
	newGroup.value = '';
	afterUpdate(data);
	activeBunch(type);
}