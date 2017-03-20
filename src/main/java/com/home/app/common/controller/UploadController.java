package com.home.app.common.controller;

import java.io.File;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.home.app.common.dto.UploadDto;
import com.home.app.common.service.UploadService;

@Controller
@RequestMapping("/common")
public class UploadController
{
	@Autowired
	private UploadService uploadService;

	@RequestMapping(value = "/upload/{pno}/{no}", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE, method = RequestMethod.GET)
	@ResponseBody
	public FileSystemResource file(UploadDto uploadDto, HttpServletResponse response) throws Exception
	{
		uploadService.updateUploadDownCount(uploadDto.getNo());

		uploadDto = uploadService.selectUpload(uploadDto.getNo());

		File downFile = new File(uploadDto.getFileBase() + uploadDto.getFilePath(), uploadDto.getSaveName());

		String fileName = URLEncoder.encode(uploadDto.getFileName(), "UTF-8").replaceAll("\\+", "%20");

		response.setHeader("Content-Disposition", "attachment; filename=" + fileName);

		return new FileSystemResource(downFile);
	}
	
}
