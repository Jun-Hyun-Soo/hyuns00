// 공통멀티콤보박스 생성 
function createComboBox(init) 
{
	$.ajax({   
		type		: "GET",  	
 	   	url			: init.url,
 	   	dataType	: "json",
 	    data		: init.data + "&date=" + $.now(),
 	   	async		: false,

 	   	success		: function(data) {	
 	   		
 	   		$("#" + init.id).empty();
 	   		 	   		
 	   		if (init.type == 'S') 
 	   		{						   
 	   			$("#" + init.id).append("<option value='' selected>선택</option>");
 	   		} 
 	   		else if (init.type == 'A') 
 	   		{						   
 	   			$("#" + init.id).append("<option value='ALL' selected>전체</option>");						   
 	   		} 
 	   		else if (init.type == 'C') 
 	   		{
	   			$("#" + init.id).append("<option value='" + init.value + "' selected>" + init.title + "</option>");	
 	   		} 	   		
 	   		
 	   		$.each(data.comboDto, function(index, item) {	
 	   			if (item != null || item.codeId != "") 
 	   			{
 	   				if (item.no > 0) 
 	   				{
 	   					$("#" + init.id).append("<option value='" + item.codeId + "'" + (init.selectedId == item.codeId ? " selected" : "") + ">" + item.codeName + "</option>");
 	   				}
 	   				else
 	   				{
 	   					$("#" + init.id).append("<option value='" + item.codeId + "' disabled=disabled>" + item.codeName + "</option>");
 	   				}
 	   			}
 	   		});
 	   	},
 		error		: function(request, status, error) {
 		
 			if (request.status == 999) 
 			{
 				createDialog({"title" : "경고", "alertMsg" : "로그인 시간이 만료되어 로그아웃됩니다."});
 				//setTimeout("LogoutBySessionTimeout();", 1000);
 			}
 			else 
 			{ 
 				createDialog({"title" : "경고", "alertMsg" : "오류가 발생하였습니다.<br/>관리자에게 문의 바랍니다!"});
 			}
	 	}
	});			

	if (init.multipleSelect) {
		$("#" + init.id).multipleSelect({
	        isOpen: false,
	        keepOpen: false,
	        filter : true
	    });
	}
};

//달력 설정
function createDatePicker(init) {
 $("#" + init.id).datepicker({
 	dateFormat		: 'yy-mm-dd',
 	showOn			: "both",
		changeMonth		: true, 
     changeYear		: true,
     nextText		: "다음 달",
     prevText		: "이전 달", 
    	dayNames		: ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
		dayNamesMin		: ["월", "화", "수", "목", "금", "토", "일"], 
		monthNamesShort	: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		monthNames		: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		minDate			: -20,
		maxDate			: "+3D",
		showMonthAfterYear: true,
		yearSuffix		: "년"
 });			
}

// 경고창 설정
function createDialog(init) 
{	
	if ($("#dialog").length > 0) $("#dialog").remove();
	
	$("<div id='dialog' title='" + init.title + "'>" + init.alertMsg + "</div>").appendTo($("body"));   
	
    $("#dialog").dialog({
        autoOpen	: true, 
        modal		: true,
        buttons		: { "확인" : function() { $(this).dialog("close"); } }
     });		
}
