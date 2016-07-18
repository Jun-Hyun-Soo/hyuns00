package com.home.app.bbs.dto;

public class BbsCommentDto extends BbsSearchDto
{
	private int no;
	private int pno;
	private int preNo;
	private float subNo;
	private int depNo;
	
	private String board;
	private String userId;	
	private String passwd;
	private String writer;
	private String userIp;
	private String regDate;
	private String content;
	
	private String commentType;
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getPno() {
		return pno;
	}
	
	public void setPno(int pno) {
		this.pno = pno;
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
	
	public String getBoard() {
		return board;
	}
	
	public void setBoard(String board) {
		this.board = board;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getPasswd() {
		return passwd;
	}
	
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getUserIp() {
		return userIp;
	}
	
	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}
	
	public String getRegDate() {
		return regDate;
	}
	
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	public String getCommentType() {
		return commentType;
	}

	public void setCommentType(String commentType) {
		this.commentType = commentType;
	}

}
