//***********************************************************************************************************  
// 로그인에서 체크하는 부분
//***********************************************************************************************************  
function imgBtnLogin_click(form) 
{
	if (checkEmpty(form.userId.value)) 
	{
		alert("아이디를 입력해 주세요!");
		form.userId.focus();
		
		return false;
	}
	
	if (checkEmpty(form.passwd.value)) 
	{
		alert("비밀번호를 입력해 주세요!");
		form.passwd.focus();
		
		return false;
	}
	
	form.submit();
}
