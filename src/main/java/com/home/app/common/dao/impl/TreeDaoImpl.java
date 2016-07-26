package com.home.app.common.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.app.common.dao.TreeDao;
import com.home.app.common.dto.TreeDto;

@Repository
public class TreeDaoImpl implements TreeDao
{
	@Autowired 
	SqlSessionTemplate sqlSessionTemplate;

	public List<TreeDto> selectTreeList(TreeDto treeDto) throws Exception
	{	
		TreeDao commonDao = sqlSessionTemplate.getMapper(TreeDao.class);
		
		return commonDao.selectTreeList(treeDto);
	}

}
