package com.home.app.login.service;

import com.home.app.login.dto.LoginDto;

public interface LoginService 
{
	public LoginDto selectUserId(String userId) throws Exception;
	
	public int selectCheckUserId(String userId) throws Exception;
	public int selectCheckUserEmail(String userEmail) throws Exception;
	public int selectCheckNickName(String nickName) throws Exception;
	
	public int insertJoin(LoginDto loginDto) throws Exception;	
	
	public int updateEdit(LoginDto loginDto) throws Exception;
}



