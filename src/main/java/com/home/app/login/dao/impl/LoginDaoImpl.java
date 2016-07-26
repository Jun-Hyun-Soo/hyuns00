package com.home.app.login.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.app.login.dao.LoginDao;
import com.home.app.login.dto.LoginDto;
import com.home.app.login.dto.LoginFileDto;

@Repository
public class LoginDaoImpl implements LoginDao 
{
	@Autowired 
	SqlSessionTemplate sqlSessionTemplate;

	public int selectCheckUserId(String userId) throws Exception
	{	
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.selectCheckUserId(userId);
	}

	public int selectCheckUserEmail(String userEmail) throws Exception
	{	
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.selectCheckUserEmail(userEmail);
	}

	public int selectCheckNickName(String nickName) throws Exception
	{	
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.selectCheckNickName(nickName);
	}

	public LoginDto selectUserId(String userId) throws Exception
	{	
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.selectUserId(userId);
	}

	public int insertJoin(LoginDto loginDto) throws Exception
	{
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.insertJoin(loginDto);		
	}

	public int insertLoginFile(List<LoginFileDto> loginFileDtoList) throws Exception
	{
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.insertLoginFile(loginFileDtoList);		
	}

	public int updateEdit(LoginDto loginDto) throws Exception
	{
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.updateEdit(loginDto);		
	}

}
