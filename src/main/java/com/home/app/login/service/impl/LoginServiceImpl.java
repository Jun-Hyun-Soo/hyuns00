package com.home.app.login.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.home.app.login.custom.CustomUserDetails;
import com.home.app.login.dao.LoginDao;
import com.home.app.login.dto.LoginDto;
import com.home.app.login.dto.LoginSearchDto;
import com.home.app.login.function.Upload;
import com.home.app.login.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService, UserDetailsService {
	@Autowired
	private LoginDao loginDao;

	public int selectLoginCount(LoginSearchDto loginSearchDto) throws Exception {
		return loginDao.selectLoginCount(loginSearchDto);
	}

	public List<LoginDto> selectLoginList(LoginSearchDto loginSearchDto) throws Exception {
		return loginDao.selectLoginList(loginSearchDto);
	}

	public LoginDto selectLoginView(int no) throws Exception {
		return loginDao.selectLoginView(no);
	}

	public LoginDto selectLoginEdit(int no) throws Exception {
		return loginDao.selectLoginEdit(no);
	}

	public int updateEdit(LoginDto loginDto) throws Exception {
		return loginDao.updateEdit(Upload.saveFileList(loginDto));
	}

	public int selectUserIdYn(String userId) throws Exception {
		return loginDao.selectUserIdYn(userId);
	}

	public int selectUserEmailYn(String userEmail) throws Exception {
		return loginDao.selectUserEmailYn(userEmail);
	}

	public int selectUserNickYn(String userNick) throws Exception {
		return loginDao.selectUserNickYn(userNick);
	}

	public LoginDto selectUserId(String userId) throws Exception {
		return loginDao.selectUserId(userId);
	}

	public LoginDto selectUserEmail(String userEmail) throws Exception {
		return loginDao.selectUserEmail(userEmail);
	}

	public int insertJoin(LoginDto loginDto) throws Exception {
		return loginDao.insertJoin(Upload.saveFileList(loginDto));
	}

	public int updateModify(LoginDto loginDto) throws Exception {
		return loginDao.updateModify(Upload.saveFileList(loginDto));
	}

	public int updateLogin(LoginDto loginDto) throws Exception {
		return loginDao.updateLogin(Upload.saveFileList(loginDto));
	}

	public int updateExit(LoginDto loginDto) throws Exception {
		return loginDao.updateExit(Upload.saveFileList(loginDto));
	}

	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException, DataAccessException {
		LoginDto loginDto = null;

		try {
			loginDto = this.selectUserId(userId);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		if (loginDto != null) {
			if (loginDto.getExitYn().equals("Y")) {
				throw new BadCredentialsException("'" + userId + "' 아이디는 회원 탈퇴한 아이디입니다!");
			}

			try {

				loginDao.updateLogin(loginDto);
			}
			catch (Exception e) {
				e.printStackTrace();
			}

			CustomUserDetails customUserDetails = new CustomUserDetails(loginDto.getUserId(), loginDto.getUserPw(), loginDto.getAuthorities(), loginDto);

			return customUserDetails;
		} else {
			throw new BadCredentialsException("'" + userId + "' 를 찾을 수 없습니다!");
		}
	}

}
