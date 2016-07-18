package com.home.app.bbs.function;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

import com.home.app.bbs.dto.BbsDto;
import com.home.app.bbs.dto.BbsFileDto;

public class Upload 
{	
	public static List<BbsFileDto> saveFileList(BbsDto bbsDto) throws Exception 
	{
		List<BbsFileDto> bbsFileDtoList = new ArrayList<BbsFileDto>();
		
		String fileSaveName = "";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy\\MM\\dd\\");
		
		String fileCurrPath = sdf.format(new Date());
		
		File dirPath = new File(bbsDto.getUploadPath(), fileCurrPath);
		
		if (!dirPath.exists())
		{
			dirPath.mkdirs();
		}
		
		List<MultipartFile> fileNameList = bbsDto.getFileNameList();
		
		if (fileNameList != null && fileNameList.size() > 0)
		{
			for (MultipartFile file : fileNameList) 
			{
				if (file.getSize() > 0)
				{
					fileSaveName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
					
					BbsFileDto bbsFileDto = new BbsFileDto();
					
					bbsFileDto.setPno(bbsDto.getNo());
					bbsFileDto.setFilePath(bbsDto.getUploadPath() + fileCurrPath);
					bbsFileDto.setFileName(file.getOriginalFilename());
					bbsFileDto.setFileSize((int) file.getSize());					
					bbsFileDto.setSaveName(fileSaveName);
					
					bbsFileDtoList.add(bbsFileDto);
					
					file.transferTo(new File(bbsDto.getUploadPath() + fileCurrPath, fileSaveName));
					
					String[] imgContentType = new String[] {"image/jpeg", "image/png", "image/gif", "image/tiff"};
					
					if (Arrays.asList(imgContentType).contains(file.getContentType()))
					{
						makeThumbnail(bbsDto.getUploadPath(), fileCurrPath, fileSaveName);
					}
				}
			}
		}
		
		return bbsFileDtoList;
	}

	public static void deleteFileList(List<BbsFileDto> bbsFileDtoList) throws Exception 
	{
		for (BbsFileDto bbsFileDto : bbsFileDtoList)
		{
			File deleteFile = new File(bbsFileDto.getFilePath(), bbsFileDto.getSaveName());
			File deleteThumb = new File(bbsFileDto.getFilePath(), "s_" + bbsFileDto.getSaveName());
			
			if (deleteFile.exists()) deleteFile.delete();	
			if (deleteThumb.exists()) deleteThumb.delete();
		}		
	}

	public static void deleteFile(BbsFileDto bbsFileDto) throws Exception 
	{
		File deleteFile = new File(bbsFileDto.getFilePath(), bbsFileDto.getSaveName());
		
		if (deleteFile.exists()) deleteFile.delete();
	}
	
	public static String makeThumbnail(String uploadPath, String fileCurrPath, String fileName) throws Exception 
	{
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + fileCurrPath, fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		String thumbnailName = uploadPath + fileCurrPath + File.separator + "s_" + fileName;
		
		File newFile = new File(thumbnailName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);	
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}

