// 경고창 설정
function createDialog(init) {
	var deferred = $.Deferred();

	if ($("#dialog").length > 0) {
		$("#dialog").remove();
	}

	$("<div id='dialog' title='" + init.title + "'>" + init.alertMsg + "</div>").appendTo($("body"));

	if (typeof (init.confirm) != "undefined") {
		$("#dialog").dialog({
			autoOpen : true,
			modal : true,
			buttons : [{
				text : "확인",
				click : function() {
					$(this).dialog("close");

					deferred.resolve();
				}
			}, {
				text : "취소",
				click : function() {
					$(this).dialog("close");

					deferred.reject();
				}
			}]
		});
	} else {
		$("#dialog").dialog({
			autoOpen : true,
			modal : true,
			buttons : [{
				text : "확인",
				click : function() {
					$(this).dialog("close");

					deferred.resolve();
				}
			}]
		});
	}

	return deferred.promise();
}

function createComboBox(init) {
	$.ajax({
		type : "GET",
		url : init.url,
		dataType : "json",
		data : "date=" + $.now(),
		async : false,
		success : function(data) {
			if (data != null) {
				$("#" + init.id).append($("<option/>", {
					value : "",
					text : "선택"
				}));

				$.each(data.comboDto, function(index, item) {
					$("#" + init.id).append($("<option/>", {
						value : item.codeId,
						text : item.codeName
					}));
				});
			}
		}
	});
}
