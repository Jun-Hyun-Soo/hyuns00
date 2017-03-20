package com.home.app.bbs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.app.bbs.dao.BbsDao;
import com.home.app.bbs.dto.BbsCommentDto;
import com.home.app.bbs.dto.BbsDto;
import com.home.app.bbs.dto.BbsSearchDto;
import com.home.app.bbs.service.BbsService;
import com.home.app.common.dao.UploadDao;
import com.home.app.common.dto.UploadDto;
import com.home.app.common.function.Upload;

@Service
public class BbsServiceImpl implements BbsService 
{	
	@Autowired
	private BbsDao bbsDao;

	@Autowired
	private UploadDao uploadDao;

	public int selectBbsCount(BbsSearchDto bbsSearchDto) throws Exception
	{
		return bbsDao.selectBbsCount(bbsSearchDto);		
	}

	public int selectBbsDeleteCount(int no) throws Exception
	{
		return bbsDao.selectBbsDeleteCount(no);		
	}

	public int selectBbsCommentDeleteCount(BbsCommentDto bbsCommentDto) throws Exception
	{
		return bbsDao.selectBbsCommentDeleteCount(bbsCommentDto);		
	}

	public List<BbsDto> selectBbsList(BbsSearchDto bbsSearchDto) throws Exception
	{
		return bbsDao.selectBbsList(bbsSearchDto);
	}

	public List<BbsCommentDto> selectBbsCommentList(int pno) throws Exception
	{
		return bbsDao.selectBbsCommentList(pno);
	}

	public BbsDto selectBbsView(int no) throws Exception
	{
		bbsDao.updateBbsViewCount(no);

		return bbsDao.selectBbsView(no);
	}

	public BbsDto selectBbsEdit(int no) throws Exception
	{
		return bbsDao.selectBbsEdit(no);
	}

	public BbsDto selectBbsReply(int no) throws Exception
	{
		return bbsDao.selectBbsReply(no);
	}
	
	public BbsDto selectBbsDelete(int no) throws Exception
	{
		return bbsDao.selectBbsDelete(no);
	}

	public BbsCommentDto selectBbsComment(int no) throws Exception
	{
		return bbsDao.selectBbsComment(no);
	}

	public int insertBbs(BbsDto bbsDto) throws Exception 
	{
		int intReturn = bbsDao.insertBbs(bbsDto);		
		
		UploadDto uploadDto = new UploadDto();
		
		uploadDto.setPno(bbsDto.getNo());
		uploadDto.setFileBase(bbsDto.getUploadPathBase());
		uploadDto.setFilePath(bbsDto.getUploadPathBbs());
		uploadDto.setFileNameList(bbsDto.getFileNameList());
		
		List<UploadDto> uploadDtoList = Upload.saveFileList(uploadDto);		
		
		if (uploadDtoList.size() > 0) uploadDao.insertUpload(uploadDtoList);	
		
		return intReturn;
	}

	public int insertBbsReply(BbsDto bbsDto) throws Exception 
	{
		int intReturn = bbsDao.insertBbsReply(bbsDto);		
		
		UploadDto uploadDto = new UploadDto();
		
		uploadDto.setPno(bbsDto.getNo());
		uploadDto.setFileBase(bbsDto.getUploadPathBase());
		uploadDto.setFilePath(bbsDto.getUploadPathBbs());
		uploadDto.setFileNameList(bbsDto.getFileNameList());
		
		List<UploadDto> uploadDtoList = Upload.saveFileList(uploadDto);		
		
		if (uploadDtoList.size() > 0) uploadDao.insertUpload(uploadDtoList);	
		
		return intReturn;
	}

	public int insertBbsComment(BbsCommentDto bbsCommentDto) throws Exception 
	{
		int intReturn = bbsDao.insertBbsComment(bbsCommentDto);
		
		bbsDao.updateBbsComCountPlus(bbsCommentDto.getPno());
		
		return intReturn;
	}

	public int insertBbsCommentReply(BbsCommentDto bbsCommentDto) throws Exception 
	{
		int intReturn = bbsDao.insertBbsCommentReply(bbsCommentDto);
		
		bbsDao.updateBbsComCountPlus(bbsCommentDto.getPno());
		
		return intReturn;
	}

	public int updateBbs(BbsDto bbsDto) throws Exception 
	{
		int intReturn = bbsDao.updateBbs(bbsDto);
		
		String[] arrDeleteUploadNo = bbsDto.getDeleteUploadNo().split("\\|");

		for (int i = 0, li_size = arrDeleteUploadNo.length - 1; i < li_size; i++)
		{
			UploadDto uploadDto = uploadDao.selectUpload(Integer.parseInt(arrDeleteUploadNo[i]));
			
			Upload.deleteFile(uploadDto);
			
			uploadDao.deleteUpload(Integer.parseInt(arrDeleteUploadNo[i]));
		}	
		
		UploadDto uploadDto = new UploadDto();
		
		uploadDto.setPno(bbsDto.getNo());
		uploadDto.setFileBase(bbsDto.getUploadPathBase());
		uploadDto.setFilePath(bbsDto.getUploadPathBbs());
		uploadDto.setFileNameList(bbsDto.getFileNameList());
		
		List<UploadDto> uploadDtoList = Upload.saveFileList(uploadDto);		
		
		if (uploadDtoList.size() > 0) uploadDao.insertUpload(uploadDtoList);	
		
		return intReturn;
	}

	public int updateBbsDelete(BbsDto bbsDto) throws Exception 
	{
		return bbsDao.updateBbsDelete(bbsDto);
	}

	public int updateBbsComment(BbsCommentDto bbsCommentDto) throws Exception 
	{
		return bbsDao.updateBbsComment(bbsCommentDto);
	}

	public int updateBbsCommentDelete(BbsCommentDto bbsCommentDto) throws Exception 
	{
		return bbsDao.updateBbsCommentDelete(bbsCommentDto);
	}
	
	public int updateBbsViewCount(int no) throws Exception
	{
		return bbsDao.updateBbsViewCount(no);
	}
	
	public int updateBbsComCountPlus(int no) throws Exception
	{
		return bbsDao.updateBbsComCountPlus(no);
	}
	
	public int updateBbsComCountMinus(int no) throws Exception
	{
		return bbsDao.updateBbsComCountMinus(no);
	}

	public int deleteBbs(int no) throws Exception
	{
		List<UploadDto> uploadDtoList = uploadDao.selectUploadList(no);
		
		Upload.deleteFileList(uploadDtoList);

		uploadDao.deleteUploadList(no);
		bbsDao.deleteBbsCommentList(no);
		
		return bbsDao.deleteBbs(no);
	}

	public int deleteBbsComment(BbsCommentDto bbsCommentDto) throws Exception
	{
		bbsDao.updateBbsComCountMinus(bbsCommentDto.getPno());
		
		return bbsDao.deleteBbsComment(bbsCommentDto.getNo());
	}

}
