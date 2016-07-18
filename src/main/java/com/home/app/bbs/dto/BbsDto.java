package com.home.app.bbs.dto;

import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class BbsDto extends BbsSearchDto {
	private int no;
	private int viewNo;
	private int preNo;
	private float subNo;
	private int depNo;
	private int comCount;
	private int viewCount;
	
	private String board;
	private String userId;
	
	//@NotNull @Size(min = 4, message = "비밀번호를 입력해 주세요!")
	private String passwd;
	
	//@NotNull @Size(min = 2, message = "작성자를 입력해 주세요!")
	private String writer;
	
	@Pattern(regexp = "^([ ]*|([a-zA-Z0-9_-]+\\.)*[a-zA-Z0-9_-]+@([a-zA-Z0-9_-]+\\.)+[a-zA-Z0-9_-]+)$", message = "올바른 이메일 주소를 입력해 주세요!")
	private String email;
	
	@NotNull @Size(min = 2, message = "제목을 입력해 주세요!")
	private String subject;
	
	private String userIp;
	private String noticeYn;
	
	private String regDate;

	@NotNull @Size(min = 1, message = "내용을 입력해 주세요!")
	private String content;
	
	private List<MultipartFile> fileNameList;
	
	private String uploadPath;
	private String selectFileName;
	private String deleteFileName;

	public int getNo() 
	{
		return no;
	}

	public void setNo(int no) 
	{
		this.no = no;
	}

	public int getViewNo() 
	{
		return viewNo;
	}

	public void setViewNo(int viewNo) 
	{
		this.viewNo = viewNo;
	}

	public int getPreNo() {
		return preNo;
	}

	public void setPreNo(int preNo) {
		this.preNo = preNo;
	}

	public float getSubNo() {
		return subNo;
	}

	public void setSubNo(float subNo) {
		this.subNo = subNo;
	}

	public int getDepNo() {
		return depNo;
	}

	public void setDepNo(int depNo) {
		this.depNo = depNo;
	}

	public int getComCount() 
	{
		return comCount;
	}

	public void setComCount(int comCount) 
	{
		this.comCount = comCount;
	}

	public int getViewCount() 
	{
		return viewCount;
	}

	public void setViewCount(int viewCount) 
	{
		this.viewCount = viewCount;
	}

	public String getBoard() 
	{
		return board;
	}

	public void setBoard(String board) 
	{
		this.board = board;
	}

	public String getUserId() 
	{
		return userId;
	}

	public void setUserId(String userId) 
	{
		this.userId = userId;
	}

	public String getPasswd() 
	{
		return passwd;
	}

	public void setPasswd(String passwd) 
	{
		this.passwd = passwd;
	}

	public String getWriter() 
	{
		return writer;
	}

	public void setWriter(String writer) 
	{
		this.writer = writer;
	}

	public String getEmail() 
	{
		return email;
	}

	public void setEmail(String email) 
	{
		this.email = email;
	}

	public String getSubject() 
	{
		return subject;
	}

	public void setSubject(String subject) 
	{
		this.subject = subject;
	}

	public String getUserIp() 
	{
		return userIp;
	}

	public void setUserIp(String userIp)
	{
		this.userIp = userIp;
	}

	public String getNoticeYn() 
	{
		return noticeYn;
	}

	public void setNoticeYn(String noticeYn) 
	{
		this.noticeYn = noticeYn;
	}

	public String getRegDate() 
	{
		return regDate;
	}

	public void setRegDate(String regDate) 
	{
		this.regDate = regDate;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public List<MultipartFile> getFileNameList() 
	{
		return fileNameList;
	}

	public void setFileNameList(List<MultipartFile> fileNameList) 
	{
		this.fileNameList = fileNameList;
	}

	public String getUploadPath() 
	{
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) 
	{
		this.uploadPath = uploadPath;
	}

	public String getSelectFileName() 
	{
		return selectFileName;
	}

	public void setSelectFileName(String selectFileName)
	{
		this.selectFileName = selectFileName;
	}

	public String getDeleteFileName()
	{
		return deleteFileName;
	}

	public void setDeleteFileName(String deleteFileName)
	{
		this.deleteFileName = deleteFileName;
	}
	
}
