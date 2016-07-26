package com.home.app.common.service;

import java.util.List;

import com.home.app.common.dto.TreeDto;

public interface TreeService {
	public List<TreeDto> selectTreeList(TreeDto treeDto) throws Exception;
}



