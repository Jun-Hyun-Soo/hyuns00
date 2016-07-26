package com.home.app.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.app.common.dao.TreeDao;
import com.home.app.common.dto.TreeDto;
import com.home.app.common.service.TreeService;

@Service
public class TreeServiceImpl implements TreeService
{	
	@Autowired
	private TreeDao commonDao;

	public List<TreeDto> selectTreeList(TreeDto treeDto) throws Exception
	{
		return commonDao.selectTreeList(treeDto);
	}

}

