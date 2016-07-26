package com.home.app.common.service;

import java.util.List;

import com.home.app.common.dto.MenuDto;

public interface MenuService {
	public List<MenuDto> selectMenuList(MenuDto menuDto) throws Exception;
}



