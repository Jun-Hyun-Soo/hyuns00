package com.home.app.login.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.app.login.dao.LoginDao;
import com.home.app.login.dto.LoginDto;

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

	public int updateEdit(LoginDto loginDto) throws Exception
	{
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.updateEdit(loginDto);		
	}

}
