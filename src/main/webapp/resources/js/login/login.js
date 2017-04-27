// ***********************************************************************************************************  
// 로그인에서 체크하는 부분
// ***********************************************************************************************************  
function imgBtnLogin_click(form) {
	if (!checkUserId(form.userId.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "아이디를 입력해 주세요!"
		});

		form.userId.focus();

		return false;
	}

	if (!checkUserPw(form.userPw.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "비밀번호를 입력해 주세요!"
		});

		form.userPw.focus();

		return false;
	}

	form.submit();
}

// ***********************************************************************************************************
// 회원가입에서 중복아이디 체크하는 부분
// ***********************************************************************************************************
function imgBtnUserIdYn_click(form) {
	if (!checkUserId(form.userId.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "아이디를 입력해 주세요!"
		});

		form.userId.focus();

		return false;
	}

	$.ajax({
		type : "POST",
		url : "/login/userIdYn",
		dataType : "json",
		data : "userId=" + form.userId.value + "&date=" + $.now(),
		async : false,
		success : function(data) {
			if (data > 0) {
				createDialog({
					"title" : "알림",
					"alertMsg" : "이미 사용중인 ID입니다."
				});

				form.userIdYn.value = "N";
				form.userId.focus();
			} else {
				createDialog({
					"title" : "알림",
					"alertMsg" : "사용 가능한 ID입니다."
				});

				form.userIdYn.value = "Y";
			}
		}
	});
}

// ***********************************************************************************************************
// 회원가입에서 중복닉네임 체크하는 부분
// ***********************************************************************************************************
function imgBtnUserNickYn_click(form) {
	if (!checkNickName(form.userNick.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "닉네임을 입력해 주세요!"
		});

		form.userNick.focus();

		return false;
	}

	$.ajax({
		type : "POST",
		url : "/login/userNickYn",
		dataType : "json",
		data : "userNick=" + form.userNick.value + "&date=" + $.now(),
		async : false,
		success : function(data) {
			if (data > 0) {
				createDialog({
					"title" : "알림",
					"alertMsg" : "이미 사용중인 닉네임입니다."
				});

				form.userNickYn.value = "N";
				form.userId.focus();
			} else {
				createDialog({
					"title" : "알림",
					"alertMsg" : "사용 가능한 닉네임입니다."
				});

				form.userNickYn.value = "Y";
			}
		}
	});
}

// ***********************************************************************************************************
// 회원가입에서 중복이메일 체크하는 부분
// ***********************************************************************************************************
function imgBtnUserEmailYn_click(form) {
	if (!checkEmail(form.userEmail.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "이메일을 입력해 주세요!"
		});

		form.userEmail.focus();

		return false;
	}

	$.ajax({
		type : "POST",
		url : "/login/userEmailYn",
		dataType : "json",
		data : "userEmail=" + form.userEmail.value + "&date=" + $.now(),
		async : false,
		success : function(data) {
			if (data > 0) {
				createDialog({
					"title" : "알림",
					"alertMsg" : "이미 사용중인 이메일입니다."
				});

				form.userEmailYn.value = "N";
				form.userId.focus();
			} else {
				createDialog({
					"title" : "알림",
					"alertMsg" : "사용 가능한 이메일입니다."
				});

				form.userEmailYn.value = "Y";
			}
		}
	});
}

// ***********************************************************************************************************
// 이미지 미리보기
// ***********************************************************************************************************
function imageUrl_change(objId) {
	if (objId.files && objId.files[0]) {
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
function imgBtnJoin_click(form) {
	if (!checkUserId(form.userId.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "아이디를 입력해 주세요!"
		});

		form.userId.focus();

		return false;
	}

	if (checkEmpty(form.userName.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "이름을 입력해 주세요!"
		});

		form.userName.focus();

		return false;
	}

	if (!checkUserPw(form.userPw1.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "비밀번호를 입력해 주세요!"
		});

		form.userPw1.focus();

		return false;
	}

	if (!checkUserPw(form.userPw2.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "비밀번호 확인을 입력해 주세요!"
		});

		form.userPw2.focus();

		return false;
	}

	if (form.userPw1.value != form.userPw2.value) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "비밀번호가 일치하지 않습니다!"
		});

		form.userPw2.focus();

		return false;
	}

	if (!checkNickName(form.userNick.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "닉네임을 입력해 주세요!"
		});

		form.userNick.focus();

		return false;
	}

	if (!checkEmail(form.userEmail.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "이메일을 입력해 주세요!"
		});

		form.userEmail.focus();

		return false;
	}

	if (form.userIdYn.value == "N") {
		createDialog({
			"title" : "경고",
			"alertMsg" : "아이디 중복확인을 해주세요!"
		});

		return false;
	}

	if (form.userNickYn.value == "N") {
		createDialog({
			"title" : "경고",
			"alertMsg" : "닉네임 중복확인을 해주세요!"
		});

		return false;
	}

	if (form.userEmailYn.value == "N") {
		createDialog({
			"title" : "경고",
			"alertMsg" : "이메일 중복확인을 해주세요!"
		});

		return false;
	}

	form.submit();
}

// ***********************************************************************************************************
// 회원수정시 체크하는 부분
// ***********************************************************************************************************
function imgBtnModify_click(form) {
	if (checkEmpty(form.userName.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "이름을 입력해 주세요!"
		});

		form.userName.focus();

		return false;
	}

	if (!checkUserPw(form.userPw.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "비밀번호를 입력해 주세요!"
		});

		form.userPw.focus();

		return false;
	}

	if (!checkUserPw(form.userPw1.value) && !checkUserPw(form.userPw2.value)) {
		if (form.userPw1.value != form.userPw2.value) {
			createDialog({
				"title" : "경고",
				"alertMsg" : "비밀번호가 일치하지 않습니다!"
			});

			form.userPw2.focus();

			return false;
		}
	}

	if (form.userNick.value != form.currUserNick.value) {
		if (!checkNickName(form.userNick.value)) {
			createDialog({
				"title" : "경고",
				"alertMsg" : "닉네임을 입력해 주세요!"
			});

			form.userNick.focus();

			return false;
		}

		if (form.userNickYn.value == "N") {
			createDialog({
				"title" : "경고",
				"alertMsg" : "닉네임 중복확인을 해주세요!"
			});

			return false;
		}
	}

	if (form.userEmail.value != form.currUserEmail.value) {
		if (!checkEmail(form.userEmail.value)) {
			createDialog({
				"title" : "경고",
				"alertMsg" : "이메일을 입력해 주세요!"
			});

			form.userEmail.focus();

			return false;
		}

		if (form.userEmailYn.value == "N") {
			createDialog({
				"title" : "경고",
				"alertMsg" : "이메일 중복확인을 해주세요!"
			});

			return false;
		}
	}

	form.submit();
}

// ***********************************************************************************************************
// 회원수정시 체크하는 부분
// ***********************************************************************************************************
function imgBtnEdit_click(form) {
	if (checkEmpty(form.userName.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "이름을 입력해 주세요!"
		});

		form.userName.focus();

		return false;
	}

	if (!checkUserPw(form.userPw1.value) && !checkUserPw(form.userPw2.value)) {
		if (form.userPw1.value != form.userPw2.value) {
			createDialog({
				"title" : "경고",
				"alertMsg" : "비밀번호가 일치하지 않습니다!"
			});

			form.userPw2.focus();

			return false;
		}
	}

	if (form.userNick.value != form.currUserNick.value) {
		if (!checkNickName(form.userNick.value)) {
			createDialog({
				"title" : "경고",
				"alertMsg" : "닉네임을 입력해 주세요!"
			});

			form.userNick.focus();

			return false;
		}

		if (form.userNickYn.value == "N") {
			createDialog({
				"title" : "경고",
				"alertMsg" : "닉네임 중복확인을 해주세요!"
			});

			return false;
		}
	}

	if (form.userEmail.value != form.currUserEmail.value) {
		if (!checkEmail(form.userEmail.value)) {
			createDialog({
				"title" : "경고",
				"alertMsg" : "이메일을 입력해 주세요!"
			});

			form.userEmail.focus();

			return false;
		}

		if (form.userEmailYn.value == "N") {
			createDialog({
				"title" : "경고",
				"alertMsg" : "이메일 중복확인을 해주세요!"
			});

			return false;
		}
	}

	form.submit();
}

// ***********************************************************************************************************
// 아이디 비밀번호 찾기하는 부분
// ***********************************************************************************************************
function imgBtnSearch_click(form) {
	if (!checkEmail(form.userEmail.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "이메일을 입력해 주세요!"
		});

		form.userEmail.focus();

		return false;
	}

	form.submit();
}

// ***********************************************************************************************************
// 회원탈퇴하는 부분
// ***********************************************************************************************************
function imgBtnExit_click(form) {
	if (!checkUserPw(form.userPw.value)) {
		createDialog({
			"title" : "경고",
			"alertMsg" : "비밀번호를 입력해 주세요!"
		});

		form.userPw.focus();

		return false;
	}

	createDialog({
		"title" : "경고",
		"alertMsg" : "회원 탈퇴하시겠습니까?",
		"confirm" : true,
		"function" : ""
	}).done(function() {
		form.submit();
	}).fail(function() {
	});
}
