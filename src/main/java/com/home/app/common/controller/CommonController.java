package com.home.app.common.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommonController 
{	
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
