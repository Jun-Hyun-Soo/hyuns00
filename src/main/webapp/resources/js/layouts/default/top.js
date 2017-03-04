// ***********************************************************************************************************  
// 메뉴 생성
// ***********************************************************************************************************  
/*
$(function() {	
	$.ajax({
		type		: "GET",  	
	    url			: "/common/menuJson",
		dataType	: "json",
		data		: "date=" + $.now(),
		async		: false,
	    success		: function(data) {
	    	var htmlMenu = "";
	    	
	    	var itemSubIndex = 0;
	    	var itemSubCount = 0;
	    	
	    	$.each(data.menuDtoList, function(index, item) {
 	   			if (item != null || item.menuId != "") {
   					if (item.subCount > 0) {
   						itemSubCount = item.subCount;
   						
   						htmlMenu += '<li><a href="/' + item.menuId + '">' + item.menuName + '</a><ul>';
   					} else {
   						htmlMenu += '<li><a href="/' + item.menuId + '">' + item.menuName + '</a></li>';
   						
   						if (item.menuPno > 0) {
   							itemSubIndex++;
   						}
   						
   						if (itemSubCount == itemSubIndex && item.menuPno > 0) {   							
   							htmlMenu += '</ul>';
   							
   							itemSubCount = 0;
   							itemSubIndex = 0;
   						}   						
   					}
 	   			}
 	   		});	    
	    	
	    	$("#ulMenu").html(htmlMenu);
	    }        
	});

	$("#ulMenu").menu({
		position: { my: "left top", at: "left-0 bottom+0" }
	});	
});
*/

