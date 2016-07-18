package com.home.app.login.dao;

import com.home.app.login.dto.LoginDto;

public interface LoginDao {
	LoginDto selectUserId(String userId) throws Exception;
	
	int selectCheckUserId(String userId) throws Exception;
	
	int insertJoin(LoginDto loginDto) throws Exception;	
	int updateEdit(LoginDto loginDto) throws Exception;	
}
