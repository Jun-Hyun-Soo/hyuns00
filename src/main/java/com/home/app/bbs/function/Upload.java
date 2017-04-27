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

import com.home.app.bbs.dto.BbsFileDto;

public class Upload {
	public static List<BbsFileDto> saveFileList(BbsFileDto bbsFileDto) throws Exception {
		List<BbsFileDto> bbsFileDtoList = new ArrayList<BbsFileDto>();

		String fileSaveBase = bbsFileDto.getFileBase();
		String fileSavePath = bbsFileDto.getFilePath();
		String fileSaveName = "";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy\\MM\\dd\\");

		String fileCurrPath = sdf.format(new Date());

		File dirPath = new File(fileSaveBase + fileSavePath, fileCurrPath);

		if (!dirPath.exists()) dirPath.mkdirs();

		List<MultipartFile> fileNameList = bbsFileDto.getFileNameList();

		if (fileNameList != null && fileNameList.size() > 0) {
			for (MultipartFile file : fileNameList) {
				if (file.getSize() > 0) {
					fileSaveName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

					BbsFileDto fileDto = new BbsFileDto();

					fileDto.setPno(bbsFileDto.getPno());
					fileDto.setFileBase(fileSaveBase);
					fileDto.setFilePath(fileSavePath + fileCurrPath);
					fileDto.setFileName(file.getOriginalFilename());
					fileDto.setFileSize((int) file.getSize());
					fileDto.setSaveName(fileSaveName);

					bbsFileDtoList.add(fileDto);

					file.transferTo(new File(fileSaveBase + fileSavePath + fileCurrPath, fileSaveName));

					String[] imgContentType = new String[] { "image/jpeg", "image/png", "image/gif", "image/tiff" };

					if (bbsFileDto.getThumbnailYn().equals("Y")) {
						if (Arrays.asList(imgContentType).contains(file.getContentType())) {
							createThumbnail(fileSaveBase + fileSavePath + fileCurrPath, fileSaveName, bbsFileDto.getThumbnailHeight());
						}
					}
				}
			}
		}

		return bbsFileDtoList;
	}

	public static void deleteFileList(List<BbsFileDto> bbsFileDtoList) throws Exception {
		for (BbsFileDto bbsFileDto : bbsFileDtoList) {
			File deleteFile = new File(bbsFileDto.getFileBase() + bbsFileDto.getFilePath(), bbsFileDto.getSaveName());
			File deleteThumb = new File(bbsFileDto.getFileBase() + bbsFileDto.getFilePath(), "s_" + bbsFileDto.getSaveName());

			if (deleteFile.exists()) deleteFile.delete();
			if (deleteThumb.exists()) deleteThumb.delete();
		}
	}

	public static void deleteFile(BbsFileDto bbsFileDto) throws Exception {
		File deleteFile = new File(bbsFileDto.getFileBase() + bbsFileDto.getFilePath(), bbsFileDto.getSaveName());
		File deleteThumb = new File(bbsFileDto.getFileBase() + bbsFileDto.getFilePath(), "s_" + bbsFileDto.getSaveName());

		if (deleteFile.exists()) deleteFile.delete();
		if (deleteThumb.exists()) deleteThumb.delete();
	}

	public static String createThumbnail(String uploadPath, String fileName, int thumbnailHeight) throws Exception {
		BufferedImage sourceImage = ImageIO.read(new File(uploadPath, fileName));

		BufferedImage destImage = Scalr.resize(sourceImage, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, thumbnailHeight);

		String thumbnailName = uploadPath + File.separator + "s_" + fileName;

		File newFile = new File(thumbnailName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		ImageIO.write(destImage, formatName.toUpperCase(), newFile);

		return thumbnailName.substring(thumbnailName.length()).replace(File.separatorChar, '/');
	}

}
