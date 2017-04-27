package com.home.app.advice.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class AdviceController {
	// private static final Logger logger = LoggerFactory.getLogger(AdviceController.class);

	@ExceptionHandler(Exception.class)
	private String error(Exception ex, Model model) {
		model.addAttribute("exception", ex);

		return "/error/error";
	}

}
