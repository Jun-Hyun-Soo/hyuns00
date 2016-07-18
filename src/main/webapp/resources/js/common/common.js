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
