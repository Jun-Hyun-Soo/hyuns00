package com.home.app.login.service;

import java.util.List;

import com.home.app.login.dto.LoginDto;
import com.home.app.login.dto.LoginSearchDto;

public interface LoginService {
	public int selectLoginCount(LoginSearchDto loginSearchDto) throws Exception;

	public List<LoginDto> selectLoginList(LoginSearchDto loginSearchDto) throws Exception;

	public LoginDto selectLoginView(int no) throws Exception;

	public LoginDto selectLoginEdit(int no) throws Exception;

	public int updateEdit(LoginDto loginDto) throws Exception;

	public LoginDto selectUserId(String userId) throws Exception;

	public LoginDto selectUserEmail(String userEmail) throws Exception;

	public int selectUserIdYn(String userId) throws Exception;

	public int selectUserEmailYn(String userEmail) throws Exception;

	public int selectUserNickYn(String userNick) throws Exception;

	public int insertJoin(LoginDto loginDto) throws Exception;

	public int updateModify(LoginDto loginDto) throws Exception;

	public int updateLogin(LoginDto loginDto) throws Exception;

	public int updateExit(LoginDto loginDto) throws Exception;
}
