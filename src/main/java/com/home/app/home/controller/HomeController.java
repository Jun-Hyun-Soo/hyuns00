package com.home.app.home.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
	    
		return "home";
	}

	@RequestMapping(value = "/error/error404", method = RequestMethod.GET)
	public String error404(HttpServletResponse response, Model model) throws Exception
	{
		response.setStatus(HttpServletResponse.SC_OK);
		
		return "/error/error404";
	}

	@RequestMapping(value = "/error/error500", method = RequestMethod.GET)
	public String error500(HttpServletResponse response, Model model) throws Exception
	{
		response.setStatus(HttpServletResponse.SC_OK);
		
		return "/error/error500";
	}

	@RequestMapping(value = "/error/error502", method = RequestMethod.GET)
	public String error502(HttpServletResponse response, Model model) throws Exception
	{
		response.setStatus(HttpServletResponse.SC_OK);
		
		return "/error/error502";
	}
	
}
