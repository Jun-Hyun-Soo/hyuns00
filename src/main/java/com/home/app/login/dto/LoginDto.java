package com.home.app.login.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class LoginDto implements UserDetails {
	private static final long serialVersionUID = 1L;

	private int no;
	private int visitCount;
	
	@Pattern(regexp = "^[a-zA-Z0-9_]{4,12}$", message = "올바른 아이디를 입력해 주세요!")
	private String userId;
	
	@NotNull @Size(min = 4, message = "비밀번호를 입력해 주세요!")
	private String userPw;
	//@NotNull @Size(min = 4, message = "비밀번호를 입력해 주세요!")
	private String userPw1;
	//@NotNull @Size(min = 4, message = "비밀번호를 입력해 주세요!")
	private String userPw2;

	@NotNull @Size(min = 2, message = "성명을 입력해 주세요!")
	private String userName;
	
	private String userRole;	
	private String userEmail;
	private String nickName;
	private String imageUrl;
	private String question;
	private String answer;
	
	private String joinDate;
	private String lastDate;
	private String exitDate;
	private String exitYn;	
	
	private String checkUserId;

	private Boolean rememberMe;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserPw1() {
		return userPw1;
	}

	public void setUserPw1(String userPw1) {
		this.userPw1 = userPw1;
	}

	public String getUserPw2() {
		return userPw2;
	}

	public void setUserPw2(String userPw2) {
		this.userPw2 = userPw2;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	public String getExitDate() {
		return exitDate;
	}

	public void setExitDate(String exitDate) {
		this.exitDate = exitDate;
	}

	public String getExitYn() {
		return exitYn;
	}

	public void setExitYn(String exitYn) {
		this.exitYn = exitYn;
	}

	public String getCheckUserId() {
		return checkUserId;
	}

	public void setCheckUserId(String checkUserId) {
		this.checkUserId = checkUserId;
	}

	public Boolean getRememberMe() {
		return rememberMe;
	}

	public void setRememberMe(Boolean rememberMe) {
		this.rememberMe = rememberMe;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> userRoleList = new ArrayList<GrantedAuthority>();
		
		for (int i = 0, li_size = this.getUserRole().split(",").length; i < li_size; i++)
		{
			userRoleList.add(new SimpleGrantedAuthority(this.getUserRole().split(",")[i]));
		}

		return userRoleList;
	}

	@Override
	public String getPassword() {
		return this.getUserPw();
	}

	@Override
	public String getUsername() {
		return this.getUserId();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	
}
