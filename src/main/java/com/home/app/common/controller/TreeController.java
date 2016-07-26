package com.home.app.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.home.app.common.dto.TreeDto;
import com.home.app.common.service.TreeService;

@Controller
@RequestMapping("/common")
public class TreeController {
	@Autowired
	private TreeService treeService;

	@RequestMapping(value = "/treeJson", produces = "application/json; charset=UTF-8")
	public @ResponseBody List<TreeDto> treeJson(TreeDto treeDto) throws Exception {
		List<TreeDto> treeDtoList = treeService.selectTreeList(treeDto);
		
		return treeDtoList;
	}

}
