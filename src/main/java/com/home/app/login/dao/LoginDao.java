package com.home.app.login.dao;

import java.util.List;

import com.home.app.login.dto.LoginDto;
import com.home.app.login.dto.LoginFileDto;

public interface LoginDao
{
	LoginDto selectUserId(String userId) throws Exception;
	
	int selectCheckUserId(String userId) throws Exception;
	int selectCheckUserEmail(String userEmail) throws Exception;
	int selectCheckNickName(String nickName) throws Exception;
	
	int insertJoin(LoginDto loginDto) throws Exception;	
	int updateEdit(LoginDto loginDto) throws Exception;	
	
	int insertLoginFile(List<LoginFileDto> loginFileDtoList) throws Exception;
}
