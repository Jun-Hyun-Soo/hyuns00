package com.home.app.bbs.dto;

public class BbsFileDto 
{
	private int no;
	private int pno;
	private int viewNo;
	private int fileSize;
	private int downCount;
	
	private String filePath;
	private String fileName;	
	private String saveName;
	private String editName;
	
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
	
	public int getViewNo() 
	{
		return viewNo;
	}

	public void setViewNo(int viewNo) 
	{
		this.viewNo = viewNo;
	}

	public int getFileSize()
	{
		return fileSize;
	}
	
	public void setFileSize(int fileSize) 
	{
		this.fileSize = fileSize;
	}
	
	public int getDownCount() 
	{
		return downCount;
	}
	
	public void setDownCount(int downCount) 
	{
		this.downCount = downCount;
	}
	
	public String getFilePath() 
	{
		return filePath;
	}
	
	public void setFilePath(String filePath) 
	{
		this.filePath = filePath;
	}
	
	public String getFileName() 
	{
		return fileName;
	}
	
	public void setFileName(String fileName) 
	{
		this.fileName = fileName;
	}
	
	public String getSaveName() 
	{
		return saveName;
	}
	
	public void setSaveName(String saveName)
	{
		this.saveName = saveName;
	}

	public String getEditName() 
	{
		return editName;
	}

	public void setEditName(String editName) 
	{
		this.editName = editName;
	}

}
