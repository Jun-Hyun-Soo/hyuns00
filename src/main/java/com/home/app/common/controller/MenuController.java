package com.home.app.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.home.app.common.dto.MenuDto;
import com.home.app.common.service.MenuService;

@Controller
@RequestMapping("/common")
public class MenuController {
	@Autowired
	private MenuService menuService;

	@RequestMapping(value = "/menuJson", produces = "application/json; charset=UTF-8")
	public ModelAndView menuJson(MenuDto menuDto) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("menuDtoList", menuService.selectMenuList(menuDto));
		
		modelAndView.setViewName("jsonView");
		
		return modelAndView;		
	}

}
