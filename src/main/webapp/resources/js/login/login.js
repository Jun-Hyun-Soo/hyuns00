// ***********************************************************************************************************  
// 로그인에서 체크하는 부분
// ***********************************************************************************************************  
function imgBtnLogin_click(form) 
{
	if (checkEmpty(form.userId.value)) 
	{
		alert("아이디를 입력해 주세요!");
		form.userId.focus();
		
		return false;
	}
	
	if (checkEmpty(form.userPw.value)) 
	{
		alert("비밀번호를 입력해 주세요!");
		form.userPw.focus();
		
		return false;
	}
	
	form.submit();
}

// ***********************************************************************************************************  
// 회원가입에서 중복아이디 체크하는 부분
// ***********************************************************************************************************  
function imgBtnCheckUserId_click(form) 
{
	if (checkUserId(form.userId.value)) 
	{
		alert("아이디를 입력해 주세요!");
		form.userId.focus();
		
		return false;
	}
	
	$.ajax({
		type		: "POST",  	
        url			: "/login/checkUserId",
 	   	dataType	: "json",
 	    data		: "userId=" + form.userId.value + "&date=" + $.now(),
 	   	async		: false,
        success		: function(data) {
            if (data > 0) 
            {
            	createDialog({"title" : "알림", "alertMsg" : "이미 사용중인 ID입니다."});
            	form.checkUserId.value = "N";
            	form.userId.focus();
            } 
            else 
            {
            	createDialog({"title" : "알림", "alertMsg" : "사용 가능한 ID입니다."});
            	form.checkUserId.value = "Y";
            }
        }
    });
}

//***********************************************************************************************************  
//회원가입에서 중복닉네임 체크하는 부분
//***********************************************************************************************************  
function imgBtnCheckNickName_click(form) 
{
	if (checkNickName(form.nickName.value)) 
	{
		alert("닉네임을 입력해 주세요!");
		form.nickName.focus();
		
		return false;
	}
	
	$.ajax({
		type		: "POST",  	
		url			: "/login/checkNickName",
	   	dataType	: "json",
	    data		: "nickName=" + form.nickName.value + "&date=" + $.now(),
	   	async		: false,
	   	success		: function(data) {
	   		if (data > 0) 
	   		{
	   			createDialog({"title" : "알림", "alertMsg" : "이미 사용중인 닉네임입니다."});
	   			form.checkNickName.value = "N";
	   			form.userId.focus();
	   		} 
	   		else 
	   		{         	
	   			createDialog({"title" : "알림", "alertMsg" : "사용 가능한 닉네임입니다."});         	
	   			form.checkNickName.value = "Y";         
	   		}
     }
 });
}

//***********************************************************************************************************  
//회원가입에서 중복이메일 체크하는 부분
//***********************************************************************************************************  
function imgBtnCheckUserEmail_click(form) 
{
	if (checkEmail(form.userEmail.value)) 
	{
		alert("이메일을 입력해 주세요!");
		form.userEmail.focus();
		
		return false;
	}
	
	$.ajax({
		type		: "POST",  	
		url			: "/login/checkUserEmail",
	   	dataType	: "json",
	    data		: "userEmail=" + form.userEmail.value + "&date=" + $.now(),
	   	async		: false,
	   	success		: function(data) {
	   		if (data > 0) 
	   		{
	   			createDialog({"title" : "알림", "alertMsg" : "이미 사용중인 ID입니다."});
			 	form.checkUserEmail.value = "N";
			 	form.userId.focus();
			} 
	   		else 
	   		{
			 	createDialog({"title" : "알림", "alertMsg" : "사용 가능한 ID입니다."});
			 	form.checkUserEmail.value = "Y";
			}
	   	}
	});
}

// ***********************************************************************************************************  
// 이미지 미리보기
// ***********************************************************************************************************  
function imageUrl_change(objId) 
{
	if (objId.files && objId.files[0])
	{
		var reader = new FileReader();
		
		reader.onload = function(e) {
			$("#imgPreview").attr("src", e.target.result);
		}
		
		reader.readAsDataURL(objId.files[0])
	}
}

// ***********************************************************************************************************  
// 회원가입시 체크하는 부분
// ***********************************************************************************************************  
function imgBtnJoin_click(form) 
{
	if (checkUserId(form.userId.value)) 
	{
		form.userId.focus();
		createDialog({"title" : "경고", "alertMsg" : "아이디를 입력해 주세요!"});
		
		return false;
	}
	
	if (checkEmpty(form.userName.value)) 
	{
		form.userName.focus();
		createDialog({"title" : "경고", "alertMsg" : "이름을 입력해 주세요!"});
		
		return false;
	}
	
	if (checkEmpty(form.userPw1.value)) 
	{
		form.userPw1.focus();
		createDialog({"title" : "경고", "alertMsg" : "비밀번호를 입력해 주세요!"});
		
		return false;
	}
	
	if (checkEmpty(form.userPw2.value)) 
	{
		form.userPw2.focus();
		createDialog({"title" : "경고", "alertMsg" : "비밀번호 확인을 입력해 주세요!"});
		
		return false;
	}
	
	if (form.userPw1.value != form.userPw2.value) {
		form.userPw2.focus();
		createDialog({"title" : "경고", "alertMsg" : "비밀번호가 일치하지 않습니다!"});
		
		return false;
	}
	
	if (checkNickName(form.nickName.value)) 
	{
		form.nickName.focus();
		createDialog({"title" : "경고", "alertMsg" : "닉네임을 입력해 주세요!"});
		
		return false;
	}
	
	if (checkEmail(form.userEmail.value)) 
	{
		form.userEmail.focus();
		createDialog({"title" : "경고", "alertMsg" : "이메일을 입력해 주세요!"});
		
		return false;
	}
	
	if (checkEmpty(form.question.value)) 
	{
		form.question.focus();
		createDialog({"title" : "경고", "alertMsg" : "보안질문을 입력해 주세요!"});
		
		return false;
	}
	
	if (checkEmpty(form.answer.value)) 
	{
		form.answer.focus();
		createDialog({"title" : "경고", "alertMsg" : "보안대답을 입력해 주세요!"});
		
		return false;
	}
	
	if (form.checkUserId.value == "N") {
		createDialog({"title" : "경고", "alertMsg" : "아이디 중복확인을 해주세요!"});
		
		return false;
	}
	
	if (form.checkNickName.value == "N") {
		createDialog({"title" : "경고", "alertMsg" : "닉네임 중복확인을 해주세요!"});
		
		return false;
	}
	
	if (form.checkUserEmail.value == "N") {
		createDialog({"title" : "경고", "alertMsg" : "이메일 중복확인을 해주세요!"});
		
		return false;
	}
	
	form.submit();
}


// ***********************************************************************************************************  
// 회원수정시 체크하는 부분
// ***********************************************************************************************************  
function imgBtnEdit_click(form) 
{
	if (checkEmpty(form.userName.value)) 
	{
		form.userName.focus();
		createDialog({"title" : "경고", "alertMsg" : "이름을 입력해 주세요!"});
		
		return false;
	}
	
	if (checkEmpty(form.userPw.value)) 
	{
		form.userPw.focus();
		createDialog({"title" : "경고", "alertMsg" : "비밀번호를 입력해 주세요!"});
		
		return false;
	}
	
	if (!checkEmpty(form.userPw1.value) && !checkEmpty(form.userPw2.value)) 
	{
		if (form.userPw1.value != form.userPw2.value) {
			form.userPw2.focus();
			createDialog({"title" : "경고", "alertMsg" : "비밀번호가 일치하지 않습니다!"});
			
			return false;
		}
	}
	
	if (checkNickName(form.nickName.value)) 
	{
		form.nickName.focus();
		createDialog({"title" : "경고", "alertMsg" : "닉네임을 입력해 주세요!"});
		
		return false;
	}
	
	if (checkEmail(form.userEmail.value)) 
	{
		form.userEmail.focus();
		createDialog({"title" : "경고", "alertMsg" : "이메일을 입력해 주세요!"});
		
		return false;
	}
	
	if (checkEmpty(form.question.value)) 
	{
		form.question.focus();
		createDialog({"title" : "경고", "alertMsg" : "보안질문을 입력해 주세요!"});
		
		return false;
	}
	
	if (checkEmpty(form.answer.value)) 
	{
		form.answer.focus();
		createDialog({"title" : "경고", "alertMsg" : "보안대답을 입력해 주세요!"});
		
		return false;
	}
	
	form.submit();
}

