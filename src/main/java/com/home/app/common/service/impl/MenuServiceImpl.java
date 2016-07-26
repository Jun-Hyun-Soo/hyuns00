package com.home.app.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.app.common.dao.MenuDao;
import com.home.app.common.dto.MenuDto;
import com.home.app.common.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService
{	
	@Autowired
	private MenuDao commonDao;

	public List<MenuDto> selectMenuList(MenuDto menuDto) throws Exception
	{
		return commonDao.selectMenuList(menuDto);
	}

}

