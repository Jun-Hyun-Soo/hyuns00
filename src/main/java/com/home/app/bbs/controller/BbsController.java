package com.home.app.bbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.home.app.bbs.dto.BbsCommentDto;
import com.home.app.bbs.dto.BbsDto;
import com.home.app.bbs.dto.BbsSearchDto;
import com.home.app.bbs.function.Func;
import com.home.app.bbs.function.Page;
import com.home.app.bbs.service.BbsService;
import com.home.app.common.service.UploadService;
import com.home.app.login.custom.CustomUserDetails;

@Controller
@RequestMapping("/bbs")
public class BbsController
{
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	private BbsService bbsService;

	@Autowired
	private UploadService uploadService;

	@Resource(name = "uploadPathBase")
	public String uploadPathBase;

	@Resource(name = "uploadPathBbs")
	public String uploadPathBbs;

	@RequestMapping(value = "/list/{bbsName}", produces = "text/plain; charset=UTF-8")
	public String list(BbsSearchDto bbsSearchDto, Model model) throws Exception
	{
		bbsSearchDto.setTotalCount(bbsService.selectBbsCount(bbsSearchDto));

		model.addAttribute("bbsSearchDto", bbsSearchDto);
		model.addAttribute("bbsDtoList", bbsService.selectBbsList(bbsSearchDto));
		model.addAttribute("page", new Page(bbsSearchDto));
		model.addAttribute("func", new Func());

		return "/bbs/list";
	}

	@RequestMapping(value = "/view/{bbsName}/{no}", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String view(BbsSearchDto bbsSearchDto, Model model) throws Exception
	{
		model.addAttribute("bbsDto", bbsService.selectBbsView(bbsSearchDto.getNo()));
		model.addAttribute("bbsFileDtoList", uploadService.selectUploadList(bbsSearchDto.getNo()));
		model.addAttribute("bbsCommentDtoList", bbsService.selectBbsCommentList(bbsSearchDto.getNo()));
		model.addAttribute("bbsCommentDto", new BbsCommentDto());
		model.addAttribute("func", new Func());

		return "/bbs/view";
	}

	@RequestMapping(value = "/write/{bbsName}", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String write(BbsSearchDto bbsSearchDto, Model model) throws Exception
	{
		model.addAttribute("bbsSearchDto", bbsSearchDto);
		model.addAttribute("bbsDto", new BbsDto());

		return "/bbs/write";
	}

	@RequestMapping(value = "/writeOk/{bbsName}", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String writeOk(RedirectAttributes redirectAttributes, @Valid BbsDto bbsDto, BindingResult result, Model model) throws Exception
	{
		if (result.hasErrors())
		{
			model.addAttribute("bbsSearchDto", bbsDto);

			return "/bbs/write";
		}

		if (!SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser"))
		{
			CustomUserDetails customUserDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			bbsDto.setUserName(customUserDetails.getUserNick());
			bbsDto.setUserPw(customUserDetails.getUserPw());
			bbsDto.setUserEmail(customUserDetails.getUserEmail());
		}
		else
		{
			bbsDto.setUserPw(bcryptPasswordEncoder.encode(bbsDto.getUserPw()));
		}

		bbsDto.setUploadPathBase(uploadPathBase);
		bbsDto.setUploadPathBbs(uploadPathBbs + bbsDto.getBbsName() + "\\");
		bbsDto.setUserIp(Func.getUserIp());

		bbsService.insertBbs(bbsDto);

		redirectAttributes.addFlashAttribute("bbsSearchDto", bbsDto);

		return "redirect:/bbs/list/" + bbsDto.getBbsName();
	}

	@RequestMapping(value = "/edit/{bbsName}/{no}", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String edit(BbsSearchDto bbsSearchDto, Model model) throws Exception
	{
		model.addAttribute("bbsSearchDto", bbsSearchDto);
		model.addAttribute("bbsDto", bbsService.selectBbsEdit(bbsSearchDto.getNo()));
		model.addAttribute("bbsFileDtoList", uploadService.selectUploadList(bbsSearchDto.getNo()));

		return "/bbs/edit";
	}

	@RequestMapping(value = "/editOk/{bbsName}/{no}", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String editOk(RedirectAttributes redirectAttributes, @Valid BbsDto bbsDto, BindingResult result, Model model) throws Exception
	{
		BbsDto passwdDto = bbsService.selectBbsEdit(bbsDto.getNo());

		model.addAttribute("bbsSearchDto", bbsDto);
		model.addAttribute("bbsFileDtoList", uploadService.selectUploadList(bbsDto.getNo()));

		if (result.hasErrors())
		{
			return "/bbs/edit";
		}

		if (!SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser"))
		{
			CustomUserDetails customUserDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			bbsDto.setUserName(customUserDetails.getUserNick());
			bbsDto.setUserPw(customUserDetails.getUserPw());
			bbsDto.setUserEmail(customUserDetails.getUserEmail());

			if (!customUserDetails.getUserId().equals("") && !customUserDetails.getUserId().equals(passwdDto.getUserId()) && !customUserDetails.getUserRoles().contains("ROLE_ADMIN"))
			{
				model.addAttribute("alertMsg", "등록자가 아닙니다!");

				return "/bbs/edit";
			}
		}
		else
		{
			if (bbsDto.getUserPw().equals("") || !bcryptPasswordEncoder.matches(bbsDto.getUserPw(), passwdDto.getUserPw()))
			{
				model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다!");

				return "/bbs/edit";
			}

			bbsDto.setUserPw(bcryptPasswordEncoder.encode(bbsDto.getUserPw()));
		}

		bbsDto.setUploadPathBase(uploadPathBase);
		bbsDto.setUploadPathBbs(uploadPathBbs + bbsDto.getBbsName() + "\\");
		bbsDto.setUserIp(Func.getUserIp());

		bbsService.updateBbs(bbsDto);

		redirectAttributes.addFlashAttribute("bbsSearchDto", bbsDto);

		return "redirect:/bbs/list/" + bbsDto.getBbsName();
	}

	@RequestMapping(value = "/delete/{bbsName}/{no}", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String delete(BbsSearchDto bbsSearchDto, Model model) throws Exception
	{
		model.addAttribute("bbsSearchDto", bbsSearchDto);
		model.addAttribute("bbsDto", bbsService.selectBbsDelete(bbsSearchDto.getNo()));

		return "/bbs/delete";
	}

	@RequestMapping(value = "/deleteOk/{bbsName}/{no}", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String deleteOk(RedirectAttributes redirectAttributes, @Valid BbsDto bbsDto, BindingResult result, Model model) throws Exception
	{
		BbsDto passwdDto = bbsService.selectBbsDelete(bbsDto.getNo());

		model.addAttribute("bbsSearchDto", bbsDto);

		if (result.hasErrors())
		{
			return "bbs/delete";
		}

		if (!SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser"))
		{
			CustomUserDetails customUserDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			if (!customUserDetails.getUserId().equals("") && !customUserDetails.getUserId().equals(passwdDto.getUserId()) && !customUserDetails.getUserRoles().contains("ROLE_ADMIN"))
			{
				model.addAttribute("alertMsg", "등록자가 아닙니다!");

				return "/bbs/delete";
			}
		}
		else
		{
			if (bbsDto.getUserPw().equals("") || !bcryptPasswordEncoder.matches(bbsDto.getUserPw(), passwdDto.getUserPw()))
			{
				model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다!");

				return "/bbs/delete";
			}
		}

		bbsDto.setUploadPathBase(uploadPathBase);
		bbsDto.setUploadPathBbs(uploadPathBbs + bbsDto.getBbsName() + "\\");
		bbsDto.setUserIp(Func.getUserIp());

		int deleteCount = bbsService.selectBbsDeleteCount(bbsDto.getNo());

		if (deleteCount > 1 || passwdDto.getComCount() > 0)
		{
			bbsService.updateBbsDelete(bbsDto);
		}
		else
		{
			bbsService.deleteBbs(bbsDto.getNo());
		}

		redirectAttributes.addFlashAttribute("bbsSearchDto", bbsDto);

		return "redirect:/bbs/list/" + bbsDto.getBbsName();
	}

	@RequestMapping(value = "/reply/{bbsName}/{no}", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String reply(BbsSearchDto bbsSearchDto, Model model) throws Exception
	{
		model.addAttribute("bbsSearchDto", bbsSearchDto);
		model.addAttribute("bbsDto", bbsService.selectBbsReply(bbsSearchDto.getNo()));

		return "/bbs/reply";
	}

	@RequestMapping(value = "/replyOk/{bbsName}/{no}", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String replyOk(RedirectAttributes redirectAttributes, @Valid BbsDto bbsDto, BindingResult result, Model model) throws Exception
	{
		if (result.hasErrors())
		{
			model.addAttribute("bbsSearchDto", bbsDto);

			return "/bbs/reply";
		}

		if (!SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser"))
		{
			CustomUserDetails customUserDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			bbsDto.setUserName(customUserDetails.getUserNick());
			bbsDto.setUserPw(customUserDetails.getUserPw());
			bbsDto.setUserEmail(customUserDetails.getUserEmail());
		}
		else
		{
			bbsDto.setUserPw(bcryptPasswordEncoder.encode(bbsDto.getUserPw()));
		}

		bbsDto.setUploadPathBase(uploadPathBase);
		bbsDto.setUploadPathBbs(uploadPathBbs);
		bbsDto.setUserIp(Func.getUserIp());

		bbsService.insertBbsReply(bbsDto);

		redirectAttributes.addFlashAttribute("bbsSearchDto", bbsDto);

		return "redirect:/bbs/list/" + bbsDto.getBbsName();
	}

	@RequestMapping(value = "/commentWriteOk/{bbsName}/{pno}", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String commentWriteOk(RedirectAttributes redirectAttributes, @Valid BbsCommentDto bbsCommentDto, BindingResult result, Model model) throws Exception
	{
		if (result.hasErrors())
		{
			model.addAttribute("bbsSearchDto", bbsCommentDto);

			return "/bbs/view";
		}

		bbsCommentDto.setUserIp(Func.getUserIp());

		if (!SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser"))
		{
			CustomUserDetails customUserDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			bbsCommentDto.setUserName(customUserDetails.getUserNick());
			bbsCommentDto.setUserPw(customUserDetails.getUserPw());
		}
		else
		{
			bbsCommentDto.setUserPw(bcryptPasswordEncoder.encode(bbsCommentDto.getUserPw()));
		}

		bbsService.insertBbsComment(bbsCommentDto);

		redirectAttributes.addFlashAttribute("bbsSearchDto", bbsCommentDto);

		return "redirect:/bbs/view/" + bbsCommentDto.getBbsName() + "/" + bbsCommentDto.getPno();
	}

	@RequestMapping(value = "/commentEditOk/{bbsName}/{pno}", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String commentEditOk(RedirectAttributes redirectAttributes, @Valid BbsCommentDto bbsCommentDto, BindingResult result, Model model) throws Exception
	{
		if (result.hasErrors())
		{
			model.addAttribute("bbsSearchDto", bbsCommentDto);

			return "/bbs/view";
		}

		bbsCommentDto.setUserIp(Func.getUserIp());

		if (!SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser"))
		{
			CustomUserDetails customUserDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			if (!customUserDetails.getUserId().equals(bbsCommentDto.getUserId()) && !customUserDetails.getUserRoles().contains("ROLE_ADMIN"))
			{
				model.addAttribute("alertMsg", "등록자가 아닙니다!");

				return "/bbs/view";
			}
		}
		else
		{
			BbsCommentDto passwdDto = bbsService.selectBbsComment(bbsCommentDto.getNo());

			if (bbsCommentDto.getUserPw().equals("") || !bcryptPasswordEncoder.matches(bbsCommentDto.getUserPw(), passwdDto.getUserPw()))
			{
				model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다!");

				return "/bbs/view";
			}
		}

		if (!SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser"))
		{
			CustomUserDetails customUserDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			bbsCommentDto.setUserName(customUserDetails.getUserNick());
			bbsCommentDto.setUserPw(customUserDetails.getUserPw());
		}
		else
		{
			bbsCommentDto.setUserPw(bcryptPasswordEncoder.encode(bbsCommentDto.getUserPw()));
		}

		bbsService.updateBbsComment(bbsCommentDto);

		redirectAttributes.addFlashAttribute("bbsSearchDto", bbsCommentDto);

		return "redirect:/bbs/view/" + bbsCommentDto.getBbsName() + "/" + bbsCommentDto.getPno();
	}

	@RequestMapping(value = "/commentReplyOk/{bbsName}/{pno}", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String commentReplyOk(RedirectAttributes redirectAttributes, @Valid BbsCommentDto bbsCommentDto, BindingResult result, Model model) throws Exception
	{
		if (result.hasErrors())
		{
			model.addAttribute("bbsSearchDto", bbsCommentDto);

			return "/bbs/view";
		}

		bbsCommentDto.setUserIp(Func.getUserIp());

		if (!SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser"))
		{
			CustomUserDetails customUserDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			bbsCommentDto.setUserName(customUserDetails.getUserNick());
			bbsCommentDto.setUserPw(customUserDetails.getUserPw());
		}
		else
		{
			bbsCommentDto.setUserPw(bcryptPasswordEncoder.encode(bbsCommentDto.getUserPw()));
		}

		bbsService.insertBbsCommentReply(bbsCommentDto);

		redirectAttributes.addFlashAttribute("bbsSearchDto", bbsCommentDto);

		return "redirect:/bbs/view/" + bbsCommentDto.getBbsName() + "/" + bbsCommentDto.getPno();
	}

	@RequestMapping(value = "/commentDeleteOk/{bbsName}/{pno}", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String commentDeleteOk(RedirectAttributes redirectAttributes, @Valid BbsCommentDto bbsCommentDto, BindingResult result, Model model) throws Exception
	{
		if (result.hasErrors())
		{
			model.addAttribute("bbsSearchDto", bbsCommentDto);

			return "/bbs/view";
		}

		bbsCommentDto.setUserIp(Func.getUserIp());

		if (!SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser"))
		{
			CustomUserDetails customUserDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			if (!customUserDetails.getUserId().equals(bbsCommentDto.getUserId()) && !customUserDetails.getUserRoles().contains("ROLE_ADMIN"))
			{
				model.addAttribute("alertMsg", "등록자가 아닙니다!");

				return "/bbs/view";
			}
		}
		else
		{
			BbsCommentDto passwdDto = bbsService.selectBbsComment(bbsCommentDto.getNo());

			if (bbsCommentDto.getUserPw().equals("") || !bcryptPasswordEncoder.matches(bbsCommentDto.getUserPw(), passwdDto.getUserPw()))
			{
				model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다!");

				return "/bbs/view";
			}
		}

		int deleteCommentCount = bbsService.selectBbsCommentDeleteCount(bbsCommentDto);

		if (deleteCommentCount > 0)
		{
			bbsService.updateBbsCommentDelete(bbsCommentDto);
		}
		else
		{
			bbsService.deleteBbsComment(bbsCommentDto);
		}

		redirectAttributes.addFlashAttribute("bbsSearchDto", bbsCommentDto);

		return "redirect:/bbs/view/" + bbsCommentDto.getBbsName() + "/" + bbsCommentDto.getPno();
	}

	@RequestMapping(value = "/checkBbsUserPw", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody int checkUserPw(BbsDto bbsDto) throws Exception
	{
		BbsDto passwdDto = bbsService.selectBbsEdit(bbsDto.getNo());

		if (!bbsDto.getUserPw().equals("") && !bcryptPasswordEncoder.matches(bbsDto.getUserPw(), passwdDto.getUserPw()))
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}

	@RequestMapping(value = "/checkBbsCommentUserPw", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody int checkBbsCommentUserPw(BbsCommentDto bbsCommentDto) throws Exception
	{
		BbsCommentDto passwdDto = bbsService.selectBbsComment(bbsCommentDto.getNo());

		if (!bbsCommentDto.getUserPw().equals("") && !bcryptPasswordEncoder.matches(bbsCommentDto.getUserPw(), passwdDto.getUserPw()))
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}

	@RequestMapping(value = "/jsonView/{bbsName}", produces = "text/plain; charset=UTF-8")
	public ModelAndView jsonView(BbsSearchDto bbsSearchDto) throws Exception
	{
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("bbsDtoList", bbsService.selectBbsList(bbsSearchDto));

		modelAndView.setViewName("jsonView");

		return modelAndView;
	}

	@RequestMapping(value = "/jsonBody/{bbsName}", produces = "text/plain; charset=UTF-8")
	public @ResponseBody List<BbsDto> jsonBody(BbsSearchDto bbsSearchDto) throws Exception
	{
		List<BbsDto> bbsDtoList = bbsService.selectBbsList(bbsSearchDto);

		return bbsDtoList;
	}

}
