package com.home.app.login.controller;

import javax.annotation.Resource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.home.app.login.dto.LoginDto;
import com.home.app.login.dto.LoginSearchDto;
import com.home.app.login.function.Page;
import com.home.app.login.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	JavaMailSender mailSender;

	@Autowired
	private LoginService loginService;

	@Resource(name = "uploadPathBase")
	private String uploadPathBase;

	@Resource(name = "uploadPathLogin")
	private String uploadPathLogin;

	@RequestMapping(value = "/list", produces = "text/plain; charset=UTF-8")
	public String list(LoginSearchDto loginSearchDto, Model model) throws Exception {
		loginSearchDto.setTotalCount(loginService.selectLoginCount(loginSearchDto));

		model.addAttribute("loginSearchDto", loginSearchDto);
		model.addAttribute("loginDtoList", loginService.selectLoginList(loginSearchDto));
		model.addAttribute("page", new Page(loginSearchDto));

		return "/login/list";
	}

	@RequestMapping(value = "/view/{userNo}", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String view(LoginSearchDto loginSearchDto, Model model) throws Exception {
		model.addAttribute("loginDto", loginService.selectLoginView(loginSearchDto.getUserNo()));

		return "/login/view";
	}

	@RequestMapping(value = "/edit/{userNo}", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String edit(LoginSearchDto loginSearchDto, Model model) throws Exception {
		model.addAttribute("loginSearchDto", loginSearchDto);
		model.addAttribute("loginDto", loginService.selectLoginEdit(loginSearchDto.getUserNo()));

		return "/login/edit";
	}

	@RequestMapping(value = "/editOk/{userNo}", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String editOk(RedirectAttributes redirectAttributes, @Valid LoginDto loginDto, BindingResult result, Model model) throws Exception {
		model.addAttribute("loginSearchDto", loginDto);

		if (result.hasErrors()) {
			return "/login/edit";
		}

		if (!loginDto.getUserPw1().equals("") && !loginDto.getUserPw2().equals("") && loginDto.getUserPw1().equals(loginDto.getUserPw2())) {
			loginDto.setUserPw(bcryptPasswordEncoder.encode(loginDto.getUserPw1()));
		} else {
			loginDto.setUserPw(bcryptPasswordEncoder.encode(loginDto.getUserPw()));
		}

		loginDto.setUploadPathBase(uploadPathBase);
		loginDto.setUploadPathLogin(uploadPathLogin);
		loginDto.setThumbnailYn("Y");
		loginDto.setThumbnailHeight(100);

		loginService.updateEdit(loginDto);

		redirectAttributes.addFlashAttribute("loginSearchDto", loginDto);

		return "redirect:/login/list";
	}

	@RequestMapping(value = "/login", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String login(Model model) throws Exception {
		model.addAttribute("loginDto", new LoginDto());

		return "/login/login";
	}

	@RequestMapping(value = "/failure", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String logfail(Model model) throws Exception {
		return "/login/failure";
	}

	@RequestMapping(value = "/duplilogin", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String logDuplilogin(Model model) throws Exception {
		return "/login/duplilogin";
	}

	@RequestMapping(value = "/join", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String join(Model model) throws Exception {
		model.addAttribute("loginDto", new LoginDto());

		return "/login/join";
	}

	@RequestMapping(value = "/modify/{userId}", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String modify(LoginDto loginDto, Model model) throws Exception {
		model.addAttribute("loginDto", loginService.selectUserId(loginDto.getUserId()));

		return "/login/modify";
	}

	@RequestMapping(value = "/joinOk", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String joinOk(RedirectAttributes redirectAttributes, @Valid LoginDto loginDto, BindingResult result, Model model) throws Exception {
		if (result.hasErrors()) {
			return "/login/join";
		}

		loginDto.setUserPw(bcryptPasswordEncoder.encode(loginDto.getUserPw1()));
		loginDto.setUserRole("ROLE_USER");

		loginDto.setUploadPathBase(uploadPathBase);
		loginDto.setUploadPathLogin(uploadPathLogin);
		loginDto.setThumbnailYn("Y");
		loginDto.setThumbnailHeight(100);

		loginService.insertJoin(loginDto);

		redirectAttributes.addFlashAttribute("alertMsg", "회원가입이 완료되었습니다. <br> 로그인 페이지로 이동합니다.");

		return "redirect:/login/login";
	}

	@RequestMapping(value = "/modifyOk", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String modifyOk(RedirectAttributes redirectAttributes, @Valid LoginDto loginDto, BindingResult result, Model model) throws Exception {
		if (result.hasErrors()) {
			return "/login/modify";
		}

		LoginDto passwdDto = loginService.selectUserId(loginDto.getUserId());

		if (!loginDto.getUserPw().equals("") && !bcryptPasswordEncoder.matches(loginDto.getUserPw(), passwdDto.getUserPw())) {
			model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다!");

			return "/login/modify";
		}

		if (!loginDto.getUserPw1().equals("") && !loginDto.getUserPw2().equals("") && loginDto.getUserPw1().equals(loginDto.getUserPw2())) {
			loginDto.setUserPw(bcryptPasswordEncoder.encode(loginDto.getUserPw1()));
		} else {
			loginDto.setUserPw(bcryptPasswordEncoder.encode(loginDto.getUserPw()));
		}

		loginDto.setUploadPathBase(uploadPathBase);
		loginDto.setUploadPathLogin(uploadPathLogin);
		loginDto.setThumbnailYn("Y");
		loginDto.setThumbnailHeight(100);

		loginService.updateModify(loginDto);

		redirectAttributes.addFlashAttribute("alertMsg", "회원수정이 완료되었습니다. <br> 재 로그인시 정보가 반영됩니다!");

		return "redirect:/";
	}

	@RequestMapping(value = "/userIdYn", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody int userIdYn(LoginDto loginDto) throws Exception {
		return loginService.selectUserIdYn(loginDto.getUserId());
	}

	@RequestMapping(value = "/userNickYn", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody int unickNameYn(LoginDto loginDto) throws Exception {
		return loginService.selectUserNickYn(loginDto.getUserNick());
	}

	@RequestMapping(value = "/userEmailYn", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody int userEmailYn(LoginDto loginDto) throws Exception {
		return loginService.selectUserEmailYn(loginDto.getUserEmail());
	}

	@RequestMapping(value = "/search", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String search(Model model) throws Exception {
		model.addAttribute("loginDto", new LoginDto());

		return "/login/search";
	}

	@RequestMapping(value = "/searchOk", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String searchOk(RedirectAttributes redirectAttributes, @Valid LoginDto loginDto, BindingResult result, Model model) throws Exception {
		if (result.hasErrors()) {
			return "/login/search";
		}

		loginDto = loginService.selectUserEmail(loginDto.getUserEmail());

		int tmpPasswd = (int) (Math.random() * (999999 - 111111 + 1));

		loginDto.setUserPw(bcryptPasswordEncoder.encode(String.valueOf(tmpPasswd)));

		loginService.updateModify(loginDto);

		MimeMessage msg = mailSender.createMimeMessage();

		msg.setSubject("http://hyuns00.iptime.org 에서 아이디와 임시 비밀번호를 보내드립니다.");
		msg.setText("아이디 : " + loginDto.getUserId() + ", 비밀번호 : " + tmpPasswd + "<br/><br/>임시 비밀번호이니 로그인 후에 비밀번호를 변경해 주세요.", "utf-8", "html");
		msg.setRecipient(RecipientType.TO, new InternetAddress(loginDto.getUserEmail()));

		mailSender.send(msg);

		redirectAttributes.addFlashAttribute("alertMsg", "등록된 이메일로 아이디와 <br/> 임시 비밀번호를 보내드렸습니다.");

		return "redirect:/login/login";
	}

	@RequestMapping(value = "/exit/{userId}", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String exit(LoginDto loginDto, Model model) throws Exception {
		model.addAttribute("loginDto", loginService.selectUserId(loginDto.getUserId()));

		return "/login/exit";
	}

	@RequestMapping(value = "/exitOk", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String exitOk(RedirectAttributes redirectAttributes, @Valid LoginDto loginDto, BindingResult result, Model model) throws Exception {
		if (result.hasErrors()) {
			return "/login/exit";
		}

		LoginDto passwdDto = loginService.selectUserId(loginDto.getUserId());

		if (!loginDto.getUserPw().equals("") && !bcryptPasswordEncoder.matches(loginDto.getUserPw(), passwdDto.getUserPw())) {
			model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다!");

			return "/login/exit";
		}

		loginService.updateExit(loginDto);

		redirectAttributes.addFlashAttribute("alertMsg", "회원 탈퇴되었습니다. <br/> 그동안 이용해 주셔서 감사합니다.");

		return "redirect:/";
	}

}
