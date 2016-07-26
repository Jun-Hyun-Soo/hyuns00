package com.home.app.common.dto;

public class MenuDto {
	private int no;
	private int menuPno;
	private int subCount;	
	
	private String menuId;
	private String menuName;
	private String menuOrder;
	private String MenuUseYn;
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getMenuPno() {
		return menuPno;
	}
	
	public void setMenuPno(int menuPno) {
		this.menuPno = menuPno;
	}
	
	public int getSubCount() {
		return subCount;
	}
	
	public void setSubCount(int subCount) {
		this.subCount = subCount;
	}
	
	public String getMenuId() {
		return menuId;
	}
	
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	
	public String getMenuName() {
		return menuName;
	}
	
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	
	public String getMenuOrder() {
		return menuOrder;
	}
	
	public void setMenuOrder(String menuOrder) {
		this.menuOrder = menuOrder;
	}

	public String getMenuUseYn() {
		return MenuUseYn;
	}

	public void setMenuUseYn(String menuUseYn) {
		MenuUseYn = menuUseYn;
	}
	
}
