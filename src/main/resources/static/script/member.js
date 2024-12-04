function loginCheck(){
	if( document.loginForm.userid.value==""){
		alert("아이디를 입력하세요");
		document.loginForm.userid.focus();
		return false;
	}else if( document.loginForm.pwd.value==""){
		alert("패스워드를 입력하세요");
		document.loginForm.pwd.focus();
		return false;
	}else{
		return true;
	}
}

function goNext(){
	// radio 버튼이 클릭되어 선택되어있는지 확인하는 방법 #1
	// 확인하고자 하는 radio 버튼에 id를 부여하고
	// document.getElementById(id값).checked 가 true 인지를 확인
	
	// radio 버튼이 클릭되어 선택되어있는지 확인하는 방법 #2
	// 자바스크립트에서 name 값으로 radio 버튼에 access 할때
	// 같은 이름의 radio 버튼들은 배열로 인식된다.
	// document.contract.okon[0]  ==> 동의함
	// document.contract.okon[1]  ==> 동의안함
	
	if( document.contract.okon[1].checked == true ){
		alert('회원 약관에 동의 하셔야 회원 가입이 가능합니다');
	}else{
		document.contract.submit();
	}
}





function post_zip(){
	var url = "shop.do?command=findZipnum";
	var opt = "menubar=no, scrollbars=no, width=550, height=300, top=300, left=300";
	window.open( url , 'findZipNum', opt );
}

function go_save(){
	var jf= document.joinForm;
	jf.submit();

}


function go_update(){
	var jf= document.joinForm;
	jf.submit();
}


function withdrawal(){
	var ans = confirm("회원정보와 구매이력이 모두 사라집니다. 정말로 탈퇴하시겠습니까?");
	if( ans ){
		location.href="deleteMember";
	}
}





