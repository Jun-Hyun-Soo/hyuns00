// ***********************************************************************************************************  
// 글쓰기, 글수정에서 체크하는 부분
// ***********************************************************************************************************  
function imgBtnBbsWrite_click(form, isAuthenticated) 
{
	if (checkEmpty(form.subject.value)) 
	{
		alert("제목을 입력해 주세요!");
		form.subject.focus();
		
		return false;
	}
	
	if (!isAuthenticated)
	{
		if (checkEmpty(form.userName.value)) 
		{
			alert("작성자를 입력해 주세요!");
			form.userName.focus();
			
			return false;
		}
		
		if (checkEmpty(form.userPw.value)) 
		{
			alert("비밀번호를 입력해 주세요!");
			form.userPw.focus();
			
			return false;
		}
		
		if (!checkEmpty(form.email.value) && !checkEmail(form.email.value)) 
		{
			alert("올바른 이메일 주소를 입력해 주세요!");
			form.email.focus();
			
			return false;
		}
	}
	
	if (checkEmpty(form.content.value)) 
	{
		alert("내용을 입력해 주세요!");
		form.content.focus();
		
		return false;
	}
	
	form.submit();
}

// ***********************************************************************************************************  
// 덧글쓰기에서 체크하는 부분
// ***********************************************************************************************************  
function imgBtnBbsCommentWrite_Click(form, isAuthenticated, commentType) 
{
	if (!isAuthenticated)
	{
		if (checkEmpty(form.userName.value)) 
		{
			alert("작성자를 입력해 주세요!");
			form.userName.focus();
			
			return false;
		}
		
		if (checkEmpty(form.userPw.value)) 
		{
			alert("비밀번호를 입력해 주세요!");
			form.userPw.focus();
			
			return false;
		}
	}
	
	if (checkEmpty(form.content.value)) 
	{
		alert("내용을 입력해 주세요!");
		form.content.focus();
		
		return false;
	}
	
	$("#commentType").val(commentType);
	
	form.submit();
}

// ***********************************************************************************************************  
// 덧글답변에서 체크하는 부분
// ***********************************************************************************************************  
function imgBtnViewCommentTableReply_Click(form, isAuthenticated, commentNo, preNo, subNo, depNo) 
{
	//form.content.value = replaceBR($("#tdBbsViewCommentTableContent" + commentNo).html());
	
	$("#preNo").val(preNo);
	$("#subNo").val(subNo);
	$("#depNo").val(depNo);
	
	$("#imgBtnCommentWrite").hide();
	$("#imgBtnCommentReply").show();
	$("#imgBtnCommentEdit").hide();
	$("#imgBtnCommentDelete").hide();
}

// ***********************************************************************************************************  
// 덧글수정에서 체크하는 부분
// ***********************************************************************************************************  
function imgBtnViewCommentTableEdit_Click(form, isAuthenticated, commentNo, commentUserName)
{
	form.userName.value = commentUserName;

	form.content.value = replaceBR($("#tdBbsViewCommentTableContent" + commentNo).html());
	
	$("#no").val(commentNo);

	$("#imgBtnCommentWrite").hide();
	$("#imgBtnCommentReply").hide();
	$("#imgBtnCommentEdit").show();
	$("#imgBtnCommentDelete").hide();
}

//***********************************************************************************************************  
//덧글삭제에서 체크하는 부분
//***********************************************************************************************************  
function imgBtnViewCommentTableDelete_Click(form, isAuthenticated, commentNo, commentUserName)
{
	form.userName.value = commentUserName;
	
	form.content.value = replaceBR($("#tdBbsViewCommentTableContent" + commentNo).html());
	
	$("#imgBtnCommentWrite").hide();
	$("#imgBtnCommentReply").hide();
	$("#imgBtnCommentEdit").hide();
	$("#imgBtnCommentDelete").show();
}

// ***********************************************************************************************************  
// 글삭제에서 체크하는 부분
// ***********************************************************************************************************  
function imgBtnBbsDelete_click(form, isAuthenticated) 
{
	if (!isAuthenticated)
	{
		if (checkEmpty(form.userPw.value)) 
		{
			alert("비밀번호를 입력해 주세요!");
			form.userPw.focus();
			
			return false;
		}
	}
	
	form.submit();
}

// ***********************************************************************************************************  
// 파일 추가
// ***********************************************************************************************************  
function fileName_change(obj, intCount)
{
	try
	{
		if (intCount > 5) throw new Error(0, "최대 5개까지 가능합니다.");
		
		var strFileName = $("#" + obj.id).val();
		var strFileExt = strFileName.substring(strFileName.lastIndexOf("\\") + 1, strFileName.length);

		if (checkFileExt(strFileExt))
		{
			$("#" + obj.id).val("");
			
			throw new Error(0, "asp, aspx, jsp, php, htm, html, js 파일은 올리실 수 없습니다.");
		}
		
		$("#selectFileName").append("<option value='" + strFileName + "'>" + strFileName + "</option>");
		$("#" + obj.id).hide();
		
		intCount++;
		
		$("#spnNextFileName_" + intCount).html('<span id="spnFileName_' + intCount + '"><input type="file" name="fileNameList" id="fileName_' + intCount + '" class="cssFileName" onchange="fileName_change(this, ' + intCount + ');" /></span> <span id="spnNextFileName_' + (intCount + 1) + '"></span>');
	}
	catch (ex)
	{
		alert(ex.description);
	}
}

// ***********************************************************************************************************  
// 추가한 파일을 삭제
// ***********************************************************************************************************  
function imgBtnDeleteFileName_click()
{
	try
	{
		var intCount = 0;
		var intSelectedCount = 0;
		
		for (var i = 0, li_size = $("#selectFileName option").size(); i < li_size; i++)
		{
			if ($("#selectFileName option:eq(" + i + ")").text().substring(0, 1) == "/") intCount++;
		}
		
		$("#selectFileName option").each(function(i, objId) {
			if ($("#selectFileName option").eq(i).prop("selected")) 
			{
				intSelectedCount++;
				
				if ($(objId).text().substring(0, 1) != "/")
				{
					$(objId).remove();
					
					$("#spnFileName_" + (i - intCount)).html("");
				}
				else
				{		
					if ($("#deleteFileName").val().indexOf($("#selectFileName option:selected").val()) != -1)
					{
						$(objId).css("color", "#000000");
						
						$("#deleteFileName").val($("#deleteFileName").val().replace($("#selectFileName option:selected").val() + "|", ""));
					}
					else
					{
						$(objId).css("color", "#CCCCCC");	
						
						$("#deleteFileName").val($("#deleteFileName").val() + $(objId).val() + "|");
					}					
				}	
			}
		});

		$("#selectFileName").prop("selectedIndex", -1);
		
		if (intSelectedCount == 0)
		{
			throw new Error(0, "파일 선택후 삭제 및 취소가 가능합니다.")
		}		
	}
	catch (ex)
	{
		alert(ex.description);
	}
}

// ***********************************************************************************************************  
// 멀티박스 클릭시
// ***********************************************************************************************************  
function selectFileName_click()
{
	if ($("#selectFileName option:selected").text().substring(0, 1) != "/")
	{
		$("#imgBtnDeleteFileName").css({"background" : "url(/resources/images/button/btn_delete.gif)"});
	}
	else
	{
		if ($("#deleteFileName").val().indexOf($("#selectFileName option:selected").val()) != -1)
		{
			$("#imgBtnDeleteFileName").css({"background" : "url(/resources/images/button/btn_cancel.gif)"});
		}
		else
		{
			$("#imgBtnDeleteFileName").css({"background" : "url(/resources/images/button/btn_delete.gif)"});
		}
	}	
}
