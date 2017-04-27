package com.home.app.login.dao;

import java.util.List;

import com.home.app.login.dto.LoginDto;
import com.home.app.login.dto.LoginSearchDto;

public interface LoginDao {
	int selectLoginCount(LoginSearchDto loginSearchDto) throws Exception;

	List<LoginDto> selectLoginList(LoginSearchDto loginSearchDto) throws Exception;

	LoginDto selectLoginView(int no) throws Exception;

	LoginDto selectLoginEdit(int no) throws Exception;

	int updateEdit(LoginDto loginDto) throws Exception;

	LoginDto selectUserId(String userId) throws Exception;

	LoginDto selectUserEmail(String userEmail) throws Exception;

	int selectUserIdYn(String userId) throws Exception;

	int selectUserEmailYn(String userEmail) throws Exception;

	int selectUserNickYn(String userNick) throws Exception;

	int insertJoin(LoginDto loginDto) throws Exception;

	int updateModify(LoginDto loginDto) throws Exception;

	int updateLogin(LoginDto loginDto) throws Exception;

	int updateExit(LoginDto loginDto) throws Exception;
}
