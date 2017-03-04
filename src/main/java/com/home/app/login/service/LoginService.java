package com.home.app.login.service;

import com.home.app.login.dto.LoginDto;

public interface LoginService 
{
	public LoginDto selectUserId(String userId) throws Exception;
	
	public int selectUserIdYn(String userId) throws Exception;
	public int selectUserEmailYn(String userEmail) throws Exception;
	public int selectUserNickYn(String userNick) throws Exception;
	
	public int insertJoin(LoginDto loginDto) throws Exception;	
	
	public int updateModify(LoginDto loginDto) throws Exception;
}



