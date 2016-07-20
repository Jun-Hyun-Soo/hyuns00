package com.home.app.bbs.dto;

public class BbsSearchDto {
	private int no;

	private int page = 1;
	private int listSize = 15;
	private int pageSize = 5;
	private int totalCount = 0;
	
	private String bbsName;

	private String searchClass;
	
	private String searchKeyword;

	public int getNo() 
	{
		return no;
	}

	public void setNo(int no) 
	{
		this.no = no;
	}

	public int getPage()
	{
		return page;
	}

	public void setPage(int page) 
	{
		this.page = page;
	}

	public int getListSize() 
	{
		return listSize;
	}

	public void setListSize(int listSize) 
	{
		this.listSize = listSize;
	}

	public int getPageSize() 
	{
		return pageSize;
	}

	public void setPageSize(int pageSize) 
	{
		this.pageSize = pageSize;
	}

	public int getTotalCount() 
	{
		return totalCount;
	}

	public void setTotalCount(int totalCount) 
	{
		this.totalCount = totalCount;
	}

	public String getBbsName() 
	{
		return bbsName;
	}

	public void setBbsName(String bbsName) 
	{
		this.bbsName = bbsName;
	}

	public String getSearchClass()
	{
		return searchClass;
	}
	
	public void setSearchClass(String searchClass) 
	{
		this.searchClass = searchClass;
	}

	public String getSearchKeyword() 
	{
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) 
	{
		this.searchKeyword = searchKeyword;
	}

}
