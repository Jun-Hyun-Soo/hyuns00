package com.home.app.login.custom;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.User;

import com.home.app.login.dto.LoginDto;

public class CustomUserDetails extends User {
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;
	
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private Collection<? extends GrantedAuthority> userRoles;
	
	public CustomUserDetails(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities, LoginDto loginDto) {
		
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);

		this.userId = username;
		this.userPw = password;
		this.userName = loginDto.getUserName();
		this.userEmail = loginDto.getUserEmail();
		this.userRoles = loginDto.getAuthorities();
	}
	
	public CustomUserDetails(String username, String password, Collection<? extends GrantedAuthority> authorities, LoginDto loginDto) {
		
		super(username, password, authorities);

		this.userId = username;
		this.userPw = password;
		this.userName = loginDto.getUserName();
		this.userEmail = loginDto.getUserEmail();
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}
	
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Collection<? extends GrantedAuthority> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(Collection<? extends GrantedAuthority> userRoles) {
		this.userRoles = userRoles;
	}

}