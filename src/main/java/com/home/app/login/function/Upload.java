package com.home.app.login.function;

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

import com.home.app.login.dto.LoginDto;
import com.home.app.login.dto.LoginFileDto;

public class Upload 
{	
	public static List<LoginFileDto> saveFileList(LoginDto loginDto) throws Exception 
	{
		List<LoginFileDto> loginFileDtoList = new ArrayList<LoginFileDto>();
		
		String fileSaveName = "";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy\\MM\\dd\\");
		
		String fileCurrPath = "login\\" + sdf.format(new Date());
		
		File dirPath = new File(loginDto.getUploadPath(), fileCurrPath);
		
		if (!dirPath.exists())
		{
			dirPath.mkdirs();
		}
		
		List<MultipartFile> fileNameList = loginDto.getFileNameList();
		
		if (fileNameList != null && fileNameList.size() > 0)
		{
			for (MultipartFile file : fileNameList) 
			{
				if (file.getSize() > 0)
				{
					fileSaveName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
					
					LoginFileDto loginFileDto = new LoginFileDto();
					
					loginFileDto.setPno(loginDto.getNo());
					loginFileDto.setFilePath(loginDto.getUploadPath() + fileCurrPath);
					loginFileDto.setFileName(file.getOriginalFilename());
					loginFileDto.setFileSize((int) file.getSize());					
					loginFileDto.setSaveName(fileSaveName);
					
					loginFileDtoList.add(loginFileDto);
					
					file.transferTo(new File(loginDto.getUploadPath() + fileCurrPath, fileSaveName));
					
					String[] imgContentType = new String[] {"image/jpeg", "image/png", "image/gif", "image/tiff"};
					
					if (loginDto.isThumbnailFlag())
					{
						if (Arrays.asList(imgContentType).contains(file.getContentType()))
						{
							createThumbnail(loginDto.getUploadPath(), fileCurrPath, fileSaveName, loginDto.getThumbnailHeight());
						}
					}
				}
			}
		}
		
		return loginFileDtoList;
	}

	public static void deleteFileList(List<LoginFileDto> loginFileDtoList) throws Exception 
	{
		for (LoginFileDto loginFileDto : loginFileDtoList)
		{
			File deleteFile = new File(loginFileDto.getFilePath(), loginFileDto.getSaveName());
			File deleteThumb = new File(loginFileDto.getFilePath(), "s_" + loginFileDto.getSaveName());
			
			if (deleteFile.exists()) deleteFile.delete();	
			if (deleteThumb.exists()) deleteThumb.delete();
		}		
	}

	public static void deleteFile(LoginFileDto loginFileDto) throws Exception 
	{
		File deleteFile = new File(loginFileDto.getFilePath(), loginFileDto.getSaveName());
		
		if (deleteFile.exists()) deleteFile.delete();
	}
	
	public static String createThumbnail(String uploadPath, String fileCurrPath, String fileName, int thumbnailHeight) throws Exception 
	{
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + fileCurrPath, fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, thumbnailHeight);
		
		String thumbnailName = uploadPath + fileCurrPath + File.separator + "s_" + fileName;
		
		File newFile = new File(thumbnailName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);	
		
		return thumbnailName.substring(thumbnailName.length()).replace(File.separatorChar, '/');
	}
}

