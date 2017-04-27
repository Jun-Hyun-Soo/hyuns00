package com.home.app.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.home.app.common.dto.ComboDto;
import com.home.app.common.service.ComboService;

@Controller
@RequestMapping("/common")
public class ComboController {
	@Autowired
	private ComboService comboService;

	@RequestMapping(value = "/comboJson", produces = "application/json; charset=UTF-8")
	public ModelAndView comboJson(ComboDto comboDto) throws Exception {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("comboDto", comboService.selectComboList(comboDto));

		modelAndView.setViewName("jsonView");

		return modelAndView;
	}

}
