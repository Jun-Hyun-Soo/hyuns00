package com.home.app.common.dao;

import java.util.List;

import com.home.app.common.dto.MenuDto;

public interface MenuDao {
	List<MenuDto> selectMenuList(MenuDto menuDto) throws Exception;
}
