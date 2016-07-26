package com.home.app.common.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.app.common.dao.MenuDao;
import com.home.app.common.dto.MenuDto;

@Repository
public class MenuDaoImpl implements MenuDao
{
	@Autowired 
	SqlSessionTemplate sqlSessionTemplate;

	public List<MenuDto> selectMenuList(MenuDto menuDto) throws Exception
	{	
		MenuDao commonDao = sqlSessionTemplate.getMapper(MenuDao.class);
		
		return commonDao.selectMenuList(menuDto);
	}

}
