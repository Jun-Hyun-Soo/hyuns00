package com.home.app.login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.home.app.login.custom.CustomUserDetails;
import com.home.app.login.dao.LoginDao;
import com.home.app.login.dto.LoginDto;
import com.home.app.login.function.Upload;
import com.home.app.login.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService, UserDetailsService
{
	@Autowired
	private LoginDao loginDao;

	public int selectUserIdYn(String userId) throws Exception
	{
		return loginDao.selectUserIdYn(userId);
	}

	public int selectUserEmailYn(String userEmail) throws Exception
	{
		return loginDao.selectUserEmailYn(userEmail);
	}

	public int selectUserNickYn(String userNick) throws Exception
	{
		return loginDao.selectUserNickYn(userNick);
	}

	public LoginDto selectUserId(String userId) throws Exception
	{
		return loginDao.selectUserId(userId);
	}

	public int insertJoin(LoginDto loginDto) throws Exception
	{
		return loginDao.insertJoin(Upload.saveFileList(loginDto));
	}

	public int updateModify(LoginDto loginDto) throws Exception
	{
		return loginDao.updateModify(Upload.saveFileList(loginDto));
	}

	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException, DataAccessException
	{
		LoginDto loginDto = null;

		try
		{
			loginDto = loginDao.selectUserId(userId);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		if (loginDto != null)
		{
			// UserDetails userDetails = new User(loginDto.getUserId(),
			// loginDto.getUserPw(), loginDto.getAuthorities());
			CustomUserDetails customUserDetails = new CustomUserDetails(loginDto.getUserId(), loginDto.getUserPw(), loginDto.getAuthorities(), loginDto);

			return customUserDetails;
		}
		else
		{
			throw new UsernameNotFoundException("'" + userId + "' 를 찾을수 없습니다!");
		}
	}

}
