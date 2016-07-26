package com.home.app.common.dao;

import java.util.List;

import com.home.app.common.dto.TreeDto;

public interface TreeDao {
	List<TreeDto> selectTreeList(TreeDto treeDto) throws Exception;
}
