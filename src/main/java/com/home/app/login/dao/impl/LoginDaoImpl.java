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

	public int selectUserIdYn(String userId) throws Exception
	{	
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.selectUserIdYn(userId);
	}

	public int selectUserEmailYn(String userEmail) throws Exception
	{	
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.selectUserEmailYn(userEmail);
	}

	public int selectUserNickYn(String userNick) throws Exception
	{	
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.selectUserNickYn(userNick);
	}

	public LoginDto selectUserId(String userId) throws Exception
	{	
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.selectUserId(userId);
	}

	public LoginDto selectUserEmail(String userEmail) throws Exception
	{	
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.selectUserEmail(userEmail);
	}

	public int insertJoin(LoginDto loginDto) throws Exception
	{
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.insertJoin(loginDto);		
	}

	public int updateModify(LoginDto loginDto) throws Exception
	{
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.updateModify(loginDto);		
	}

	public int updateEdit(LoginDto loginDto) throws Exception
	{
		LoginDao loginDao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		return loginDao.updateEdit(loginDto);		
	}

}
