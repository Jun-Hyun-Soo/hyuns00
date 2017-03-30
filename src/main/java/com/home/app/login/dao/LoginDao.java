package com.home.app.login.dao;

import com.home.app.login.dto.LoginDto;

public interface LoginDao
{
	LoginDto selectUserId(String userId) throws Exception;
	LoginDto selectUserEmail(String userEmail) throws Exception;
	
	int selectUserIdYn(String userId) throws Exception;
	int selectUserEmailYn(String userEmail) throws Exception;
	int selectUserNickYn(String userNick) throws Exception;
	
	int insertJoin(LoginDto loginDto) throws Exception;	
	
	int updateModify(LoginDto loginDto) throws Exception;	
	int updateEdit(LoginDto loginDto) throws Exception;	
}
