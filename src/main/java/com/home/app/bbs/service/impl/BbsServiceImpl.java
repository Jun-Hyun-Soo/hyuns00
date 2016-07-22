package com.home.app.bbs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.app.bbs.dao.BbsDao;
import com.home.app.bbs.dto.BbsCommentDto;
import com.home.app.bbs.dto.BbsDto;
import com.home.app.bbs.dto.BbsFileDto;
import com.home.app.bbs.dto.BbsSearchDto;
import com.home.app.bbs.function.Upload;
import com.home.app.bbs.service.BbsService;

@Service
public class BbsServiceImpl implements BbsService 
{	
	@Autowired
	private BbsDao bbsDao;

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

	public List<BbsFileDto> selectBbsFilePnoList(int pno) throws Exception
	{
		return bbsDao.selectBbsFilePnoList(pno);
	}

	public List<BbsCommentDto> selectBbsCommentPnoList(int pno) throws Exception
	{
		return bbsDao.selectBbsCommentPnoList(pno);
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

	public BbsFileDto selectBbsFileNo(int no) throws Exception
	{
		return bbsDao.selectBbsFileNo(no);
	}

	public BbsCommentDto selectBbsCommentNo(int no) throws Exception
	{
		return bbsDao.selectBbsCommentNo(no);
	}

	public int insertBbs(BbsDto bbsDto) throws Exception 
	{
		int intReturn = bbsDao.insertBbs(bbsDto);
		
		List<BbsFileDto> bbsFileDtoList = Upload.saveFileList(bbsDto);	
		
		if (bbsFileDtoList.size() > 0) bbsDao.insertBbsFile(bbsFileDtoList);	
		
		return intReturn;
	}

	public int insertBbsReply(BbsDto bbsDto) throws Exception 
	{
		int intReturn = bbsDao.insertBbsReply(bbsDto);
		
		List<BbsFileDto> bbsFileDtoList = Upload.saveFileList(bbsDto);	
		
		if (bbsFileDtoList.size() > 0) bbsDao.insertBbsFile(bbsFileDtoList);	
		
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
		
		String[] arrDeleteFileName = bbsDto.getDeleteFileName().split("\\|");

		for (int i = 0, li_size = arrDeleteFileName.length - 1; i < li_size; i++)
		{
			BbsFileDto bbsFileDto = bbsDao.selectBbsFileNo(Integer.parseInt(arrDeleteFileName[i]));
			
			Upload.deleteFile(bbsFileDto);
			
			bbsDao.deleteBbsFileNo(bbsFileDto.getNo());
		}	
		
		List<BbsFileDto> bbsFileDtoList = Upload.saveFileList(bbsDto);		
		
		if (bbsFileDtoList.size() > 0) bbsDao.insertBbsFile(bbsFileDtoList);	
		
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
	
	public int updateBbsFileDownCount(int no) throws Exception
	{
		return bbsDao.updateBbsFileDownCount(no);
	}

	public int deleteBbs(int no) throws Exception
	{
		List<BbsFileDto> bbsFileDtoList = bbsDao.selectBbsFilePnoList(no);
		
		Upload.deleteFileList(bbsFileDtoList);
		
		bbsDao.deleteBbsFilePno(no);
		bbsDao.deleteBbsCommentPno(no);
		
		return bbsDao.deleteBbs(no);
	}

	public int deleteBbsComment(BbsCommentDto bbsCommentDto) throws Exception
	{
		bbsDao.updateBbsComCountMinus(bbsCommentDto.getPno());
		
		return bbsDao.deleteBbsComment(bbsCommentDto);
	}

}
