// ***********************************************************************************************************  
// 게시판 등록에서 체크하는 부분
// ***********************************************************************************************************  
function imgBtnCateWrite_click(form) {
	if (checkEmpty(form.bbsName.value)) {
		form.bbsName.focus();
		createDialog({
			"title" : "경고",
			"alertMsg" : "게시판명을 입력해 주세요!"
		});

		return false;
	}

	if (checkEmpty(form.bbsId.value)) {
		form.bbsId.focus();
		createDialog({
			"title" : "경고",
			"alertMsg" : "연결문자를 입력해 주세요!"
		});

		return false;
	}

	if (form.bbsIdYn.value == "N") {
		createDialog({
			"title" : "경고",
			"alertMsg" : "연결문자 중복확인을 해주세요!"
		});

		return false;
	}

	form.submit();
}
// ***********************************************************************************************************
// 게시판 수정에서 체크하는 부분
// ***********************************************************************************************************
function imgBtnCateEdit_click(form) {
	if (checkEmpty(form.bbsName.value)) {
		form.bbsName.focus();
		createDialog({
			"title" : "경고",
			"alertMsg" : "게시판명을 입력해 주세요!"
		});

		return false;
	}

	if (checkEmpty(form.bbsId.value)) {
		form.bbsId.focus();
		createDialog({
			"title" : "경고",
			"alertMsg" : "연결문자를 입력해 주세요!"
		});

		return false;
	}

	form.submit();
}

// ***********************************************************************************************************
// 게시판 등록, 수정에서 중복 연결문자 체크하는 부분
// ***********************************************************************************************************
function imgBtnBbsIdYn_click(form) {
	if (checkEmpty(form.bbsId.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "연결문자를 입력해 주세요!"
		});

		form.bbsId.focus();

		return false;
	}

	$.ajax({
		type : "POST",
		url : "/cate/checkBbsIdYn",
		dataType : "html",
		data : "bbsId=" + form.bbsId.value + "&date=" + $.now(),
		async : false,
		success : function(data) {
			if (data == "Y") {
				createDialog({
					"title" : "알림",
					"alertMsg" : "이미 사용중인 연결문자입니다."
				});

				form.bbsIdYn.value = "N";
				form.bbsId.focus();
			} else {
				createDialog({
					"title" : "알림",
					"alertMsg" : "사용 가능한 연결문자입니다."
				});

				form.bbsIdYn.value = "Y";
			}
		}
	});
}

// ***********************************************************************************************************
// 글삭제에서 체크하는 부분
// ***********************************************************************************************************
function imgBtnDelete_click(deleteUrl, listUrl) {
	createDialog({
		"title" : "경고",
		"alertMsg" : "게시판을 삭제하시겠습니까?",
		"confirm" : true,
		"function" : ""
	}).done(function() {
		$.ajax({
			type : "POST",
			url : deleteUrl,
			dataType : "json",
			data : "date=" + $.now(),
			async : false,
			success : function(data) {
				if (data > 0) {
					createDialog({
						"title" : "알림",
						"alertMsg" : "게시판이 삭제되었습니다."
					}).done(function() {
						location.href = listUrl;
					});
				}
			}
		});
	}).fail(function() {
	});
}
