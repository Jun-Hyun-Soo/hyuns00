package com.home.app.login.function;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

import com.home.app.login.dto.LoginDto;

public class Upload
{
	public static LoginDto saveFileList(LoginDto loginDto) throws Exception
	{
		String fileSaveName = "";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy\\MM\\dd\\");

		String fileCurrPath = sdf.format(new Date());

		File dirPath = new File(loginDto.getUploadPathBase() + loginDto.getUploadPathLogin() + fileCurrPath);

		if (!dirPath.exists()) dirPath.mkdirs();

		List<MultipartFile> fileNameList = loginDto.getFileNameList();

		if (fileNameList != null && fileNameList.size() > 0)
		{
			for (MultipartFile file : fileNameList)
			{
				if (file.getSize() > 0)
				{
					fileSaveName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

					loginDto.setImagePath(loginDto.getUploadPathLogin() + fileCurrPath);
					loginDto.setImageName(fileSaveName);

					file.transferTo(new File(loginDto.getUploadPathBase() + loginDto.getUploadPathLogin() + fileCurrPath, fileSaveName));

					String[] imgContentType = new String[] { "image/jpeg", "image/png", "image/gif", "image/tiff" };

					if (loginDto.getThumbnailYn().equals("Y"))
					{
						if (Arrays.asList(imgContentType).contains(file.getContentType()))
						{
							createThumbnail(loginDto.getUploadPathBase() + loginDto.getUploadPathLogin() + fileCurrPath, fileSaveName, loginDto.getThumbnailHeight());
						}
					}
				}
			}
		}
		
		return loginDto;
	}

	public static void deleteFile(LoginDto loginDto) throws Exception
	{
		File deleteFile = new File(loginDto.getUploadPathBase() + loginDto.getCurrImagePath(), loginDto.getCurrImageName());
		File deleteThumb = new File(loginDto.getUploadPathBase() + loginDto.getCurrImagePath(), "s_" + loginDto.getCurrImageName());

		if (deleteFile.exists()) deleteFile.delete();
		if (deleteThumb.exists()) deleteThumb.delete();
	}

	public static void createThumbnail(String uploadPath, String fileName, int thumbnailHeight) throws Exception
	{
		BufferedImage sourceImage = ImageIO.read(new File(uploadPath, fileName));

		BufferedImage destImage = Scalr.resize(sourceImage, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, thumbnailHeight);

		String thumbnailName = uploadPath + File.separator + "s_" + fileName;

		File newFile = new File(thumbnailName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		ImageIO.write(destImage, formatName.toUpperCase(), newFile);
	}
}
