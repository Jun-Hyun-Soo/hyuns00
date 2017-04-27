package com.home.app.cate.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.home.app.cate.dto.CateDto;
import com.home.app.cate.dto.CateSearchDto;
import com.home.app.cate.function.Page;
import com.home.app.cate.service.CateService;

@Controller
@RequestMapping("/cate")
public class CateController {
	@Autowired
	private CateService cateService;

	@RequestMapping(value = "/list", produces = "text/plain; charset=UTF-8")
	public String list(CateSearchDto cateSearchDto, Model model) throws Exception {
		cateSearchDto.setTotalCount(cateService.selectCateCount(cateSearchDto));

		model.addAttribute("cateSearchDto", cateSearchDto);
		model.addAttribute("cateDtoList", cateService.selectCateList(cateSearchDto));
		model.addAttribute("page", new Page(cateSearchDto));

		return "/cate/list";
	}

	@RequestMapping(value = "/view/{no}", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String view(CateSearchDto cateSearchDto, Model model) throws Exception {
		model.addAttribute("cateDto", cateService.selectCateView(cateSearchDto.getNo()));

		return "/cate/view";
	}

	@RequestMapping(value = "/write", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String write(CateSearchDto cateSearchDto, Model model) throws Exception {
		model.addAttribute("cateSearchDto", cateSearchDto);
		model.addAttribute("cateDto", new CateDto());

		return "/cate/write";
	}

	@RequestMapping(value = "/writeOk", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String writeOk(RedirectAttributes redirectAttributes, @Valid CateDto cateDto, BindingResult result, Model model) throws Exception {
		if (result.hasErrors()) {
			model.addAttribute("cateSearchDto", cateDto);

			return "/cate/write";
		}

		cateService.insertCate(cateDto);

		redirectAttributes.addFlashAttribute("cateSearchDto", cateDto);

		return "redirect:/cate/list";
	}

	@RequestMapping(value = "/edit/{no}", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String edit(CateSearchDto cateSearchDto, Model model) throws Exception {
		model.addAttribute("cateSearchDto", cateSearchDto);
		model.addAttribute("cateDto", cateService.selectCateEdit(cateSearchDto.getNo()));

		return "/cate/edit";
	}

	@RequestMapping(value = "/editOk/{no}", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String editOk(RedirectAttributes redirectAttributes, @Valid CateDto cateDto, BindingResult result, Model model) throws Exception {
		model.addAttribute("cateSearchDto", cateDto);

		if (result.hasErrors()) {
			return "/cate/edit";
		}

		cateService.updateCate(cateDto);

		redirectAttributes.addFlashAttribute("cateSearchDto", cateDto);

		return "redirect:/cate/list";
	}

	@RequestMapping(value = "/deleteOk/{no}", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody int deleteOk(CateDto cateDto) throws Exception {
		return cateService.deleteCate(cateDto.getNo());
	}

	@RequestMapping(value = "/checkBbsNameYn", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody String checkBbsNameYn(CateDto cateDto) throws Exception {
		return cateService.selectBbsNameYn(cateDto.getBbsName());
	}

}
