package com.home.app.login.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.home.app.login.dto.LoginDto;
import com.home.app.login.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/login", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String login(Model model) throws Exception 
	{
		model.addAttribute("loginDto", new LoginDto());
		
		return "/login/login";
	}

	@RequestMapping(value = "/failure", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String logfail(Model model) throws Exception 
	{
		return "/login/failure";
	}

	@RequestMapping(value = "/duplicate", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String logDuplicate(Model model) throws Exception 
	{
		return "/login/duplicate";
	}

	@RequestMapping(value = "/edit", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String edit(LoginDto loginDto, Model model) throws Exception 
	{
		model.addAttribute("loginDto", loginService.selectUserId(loginDto.getUserId()));
		
		return "/login/edit";
	}

	@RequestMapping(value = "/join", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String join(Model model) throws Exception {
		model.addAttribute("loginDto", new LoginDto());
		
		return "/login/join";
	}

	@RequestMapping(value = "/joinOk", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String joinOk(RedirectAttributes redirectAttributes, @Valid LoginDto loginDto, BindingResult result, Model model) throws Exception {
		if (result.hasErrors()) 
		{
			return "/login/join";
		}
		
		loginDto.setUserPw(bcryptPasswordEncoder.encode(loginDto.getUserPw1()));	
		loginDto.setUserRole("ROLE_USER");
		
		loginService.insertJoin(loginDto);	
		
		redirectAttributes.addFlashAttribute("alertMsg", "회원가입이 완료되었습니다. <br> 로그인 페이지로 이동합니다.");
		
		return "redirect:/login/login";
	}

	@RequestMapping(value = "/editOk", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String editOk(RedirectAttributes redirectAttributes, @Valid LoginDto loginDto, BindingResult result, Model model) throws Exception 
	{
		if (result.hasErrors()) 
		{
			return "/login/edit";
		}
		
		LoginDto passwdDto = loginService.selectUserId(loginDto.getUserId());
		
		if (!loginDto.getUserPw().equals("") && !bcryptPasswordEncoder.matches(loginDto.getUserPw(), passwdDto.getUserPw())) 
		{
			model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다!");
			
			return "/login/edit";	
		}				
		
		if (!loginDto.getUserPw1().equals("") && !loginDto.getUserPw2().equals("") && loginDto.getUserPw1().equals(loginDto.getUserPw2())) 
		{
			loginDto.setUserPw(bcryptPasswordEncoder.encode(loginDto.getUserPw1()));	
		} 
		else 
		{
			loginDto.setUserPw(bcryptPasswordEncoder.encode(loginDto.getUserPw()));
		}

		//loginDto.setUserRole("ROLE_USER");
		//loginDto.setRegStat("N");
		
		loginService.updateEdit(loginDto);	
		
		redirectAttributes.addFlashAttribute("alertMsg", "회원수정이 완료되었습니다. <br> 재 로그인시 정보가 반영됩니다!");
		
		return "redirect:/";
	}

	@RequestMapping(value = "/checkUserId", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody int checkUserId(LoginDto loginDto) throws Exception 
	{
		return loginService.selectCheckUserId(loginDto.getUserId());
	}

}
