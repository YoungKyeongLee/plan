// 	회원가입, 로그인, 그리고 회원가입과 로그인 페이지에서 뒤로가기 버튼을 누를때 그에 맞는 영역을 보여주는 메서드
	function membership(type){
		document.querySelectorAll(".main_div").forEach(main =>{
			main.style.display = (main.id === type) ? "inline-flex" : "none";
		});
	}

// 	side nav 바 클릭 시 체크 표시 추가하고, 그에 맞는 div의 display를 활성화하는 메서드
document.querySelectorAll(".menu").forEach(menu => { 
	menu.addEventListener('click', function(event){ 
		Activation = menu.id;
		document.querySelectorAll(".art div.article").forEach(div => {
			divIdName = div.id.split('_')[0];
			checkIcon = document.querySelectorAll('#' + divIdName + ' i')[0];
			if(div.id == (Activation +'_div')){
				div.style.display = 'block';
				checkIcon.style.display = 'inline';
			}else{
				div.style.display = "none";
				checkIcon.style.display = 'none';
			}
		});
	});
});

// 	일정확인과 알림설정 내의 미니 메뉴판 버튼 클릭 시 그에 맞는 영역을 활성화 시켜주고 해당 버튼 스타일을 바꾸어주는 메서드
function checkMenuFunc(className, spanName){
	document.querySelectorAll("." + className + " li").forEach(li =>{
		li.addEventListener('click', function(event){
			document.querySelectorAll("." + spanName).forEach(sp =>{
				if(sp.className.indexOf(li.id) >= 0){
					sp.style.display="block";
					li.style.border= '5px solid #E0FF8B';
					li.style.backgroundColor= 'white';
				} else {
					sp.style.display="none";
				}
				document.querySelectorAll("." + className + " li").forEach(others =>{
					if(others.id !== li.id){
						others.style.border='5px solid white';
						others.style.backgroundColor = '#E0FF8B';
					}
				})
			});
		})
	});
}
checkMenuFunc('checkMenu1', 'checkSpan1');
checkMenuFunc('checkMenu2', 'checkSpan2');