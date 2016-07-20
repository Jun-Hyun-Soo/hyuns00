package com.home.app.bbs.dto;

public class BbsCommentDto extends BbsSearchDto
{
	private int no;
	private int pno;
	private int preNo;
	private float subNo;
	private int depNo;
	
	private String bbsName;
	private String userId;	
	private String userPw;
	private String userName;
	private String userIp;
	private String regDate;
	private String content;
	
	private String commentType;

	public int getNo()
	{
		return no;
	}

	public void setNo(int no) 
	{
		this.no = no;
	}

	public int getPno() 
	{
		return pno;
	}

	public void setPno(int pno)
	{
		this.pno = pno;
	}

	public int getPreNo() 
	{
		return preNo;
	}

	public void setPreNo(int preNo) 
	{
		this.preNo = preNo;
	}

	public float getSubNo() 
	{
		return subNo;
	}

	public void setSubNo(float subNo)
	{
		this.subNo = subNo;
	}

	public int getDepNo()
	{
		return depNo;
	}

	public void setDepNo(int depNo)
	{
		this.depNo = depNo;
	}

	public String getBbsName() 
	{
		return bbsName;
	}

	public void setBbsName(String bbsName)
	{
		this.bbsName = bbsName;
	}

	public String getUserId() 
	{
		return userId;
	}

	public void setUserId(String userId)
	{
		this.userId = userId;
	}

	public String getUserPw()
	{
		return userPw;
	}

	public void setUserPw(String userPw)
	{
		this.userPw = userPw;
	}

	public String getUserName() 
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getUserIp()
	{
		return userIp;
	}

	public void setUserIp(String userIp)
	{
		this.userIp = userIp;
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

	public String getCommentType() 
	{
		return commentType;
	}

	public void setCommentType(String commentType) 
	{
		this.commentType = commentType;
	}

}
