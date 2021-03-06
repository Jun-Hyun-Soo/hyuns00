package com.home.app.login.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.validation.constraints.Pattern;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.multipart.MultipartFile;

public class LoginDto extends LoginSearchDto implements UserDetails {
	private static final long serialVersionUID = 1L;

	private int userNo;
	private int viewNo;
	private int visitCount;

	@Pattern(regexp = "^[a-zA-Z0-9_]{4,12}$", message = "올바른 아이디를 입력해 주세요!")
	private String userId;

	// @NotNull @Size(min = 4, message = "비밀번호를 입력해 주세요!")
	private String userPw;
	// @NotNull @Size(min = 4, message = "비밀번호를 입력해 주세요!")
	private String userPw1;
	// @NotNull @Size(min = 4, message = "비밀번호를 입력해 주세요!")
	private String userPw2;

	// @NotNull @Size(min = 2, message = "성명을 입력해 주세요!")
	private String userName;

	private String userRole;
	private String userEmail;
	private String userNick;
	private String imagePath;
	private String imageName;
	private String imageUrl;

	private String joinDate;
	private String lastDate;
	private String exitDate;
	private String exitYn;

	private String userIdYn;
	private String userNickYn;
	private String userEmailYn;

	private String currImagePath;
	private String currImageName;
	private String currUserNick;
	private String currUserEmail;

	private Boolean rememberMe;

	private List<MultipartFile> fileNameList;

	private String uploadPathBase;
	private String uploadPathLogin;
	private String deleteImageName;

	private String thumbnailYn;
	private int thumbnailHeight;

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getViewNo() {
		return viewNo;
	}

	public void setViewNo(int viewNo) {
		this.viewNo = viewNo;
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

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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

	public String getUserIdYn() {
		return userIdYn;
	}

	public void setUserIdYn(String userIdYn) {
		this.userIdYn = userIdYn;
	}

	public String getUserNickYn() {
		return userNickYn;
	}

	public void setUserNickYn(String userNickYn) {
		this.userNickYn = userNickYn;
	}

	public String getUserEmailYn() {
		return userEmailYn;
	}

	public void setUserEmailYn(String userEmailYn) {
		this.userEmailYn = userEmailYn;
	}

	public String getCurrImagePath() {
		return currImagePath;
	}

	public void setCurrImagePath(String currImagePath) {
		this.currImagePath = currImagePath;
	}

	public String getCurrImageName() {
		return currImageName;
	}

	public void setCurrImageName(String currImageName) {
		this.currImageName = currImageName;
	}

	public String getCurrUserNick() {
		return currUserNick;
	}

	public void setCurrUserNick(String currUserNick) {
		this.currUserNick = currUserNick;
	}

	public String getCurrUserEmail() {
		return currUserEmail;
	}

	public void setCurrUserEmail(String currUserEmail) {
		this.currUserEmail = currUserEmail;
	}

	public Boolean getRememberMe() {
		return rememberMe;
	}

	public void setRememberMe(Boolean rememberMe) {
		this.rememberMe = rememberMe;
	}

	public List<MultipartFile> getFileNameList() {
		return fileNameList;
	}

	public void setFileNameList(List<MultipartFile> fileNameList) {
		this.fileNameList = fileNameList;
	}

	public String getUploadPathBase() {
		return uploadPathBase;
	}

	public void setUploadPathBase(String uploadPathBase) {
		this.uploadPathBase = uploadPathBase;
	}

	public String getUploadPathLogin() {
		return uploadPathLogin;
	}

	public void setUploadPathLogin(String uploadPathLogin) {
		this.uploadPathLogin = uploadPathLogin;
	}

	public String getDeleteImageName() {
		return deleteImageName;
	}

	public void setDeleteImageName(String deleteImageName) {
		this.deleteImageName = deleteImageName;
	}

	public String getThumbnailYn() {
		return thumbnailYn;
	}

	public void setThumbnailYn(String thumbnailYn) {
		this.thumbnailYn = thumbnailYn;
	}

	public int getThumbnailHeight() {
		return thumbnailHeight;
	}

	public void setThumbnailHeight(int thumbnailHeight) {
		this.thumbnailHeight = thumbnailHeight;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> userRoleList = new ArrayList<GrantedAuthority>();

		for (int i = 0, li_size = this.getUserRole().split(",").length; i < li_size; i++) {
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
