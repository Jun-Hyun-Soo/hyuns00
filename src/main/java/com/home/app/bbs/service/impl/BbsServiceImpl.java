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

	public List<BbsDto> selectBbsList(BbsSearchDto bbsSearchDto) throws Exception
	{
		return bbsDao.selectBbsList(bbsSearchDto);
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

	public int insertBbs(BbsDto bbsDto) throws Exception
	{
		int intReturn = bbsDao.insertBbs(bbsDto);

		BbsFileDto bbsFileDto = new BbsFileDto();

		bbsFileDto.setPno(bbsDto.getNo());
		bbsFileDto.setFileBase(bbsDto.getUploadPathBase());
		bbsFileDto.setFilePath(bbsDto.getUploadPathBbs());
		bbsFileDto.setFileNameList(bbsDto.getFileNameList());
		bbsFileDto.setThumbnailYn(bbsDto.getThumbnailYn());
		bbsFileDto.setThumbnailHeight(bbsDto.getThumbnailHeight());

		List<BbsFileDto> bbsFileDtoList = Upload.saveFileList(bbsFileDto);

		if (bbsFileDtoList.size() > 0) bbsDao.insertBbsFile(bbsFileDtoList);

		return intReturn;
	}

	public int insertBbsReply(BbsDto bbsDto) throws Exception
	{
		int intReturn = bbsDao.insertBbsReply(bbsDto);

		BbsFileDto bbsFileDto = new BbsFileDto();

		bbsFileDto.setPno(bbsDto.getNo());
		bbsFileDto.setFileBase(bbsDto.getUploadPathBase());
		bbsFileDto.setFilePath(bbsDto.getUploadPathBbs());
		bbsFileDto.setFileNameList(bbsDto.getFileNameList());
		bbsFileDto.setThumbnailYn(bbsDto.getThumbnailYn());
		bbsFileDto.setThumbnailHeight(bbsDto.getThumbnailHeight());

		List<BbsFileDto> bbsFileDtoList = Upload.saveFileList(bbsFileDto);

		if (bbsFileDtoList.size() > 0) bbsDao.insertBbsFile(bbsFileDtoList);

		return intReturn;
	}

	public int updateBbs(BbsDto bbsDto) throws Exception
	{
		int intReturn = bbsDao.updateBbs(bbsDto);

		String[] arrDeleteBbsFileNo = bbsDto.getDeleteBbsFileNo().split("\\|");

		for (int i = 0, li_size = arrDeleteBbsFileNo.length - 1; i <= li_size; i++)
		{
			BbsFileDto bbsFileDto = bbsDao.selectBbsFile(Integer.parseInt(arrDeleteBbsFileNo[i]));

			Upload.deleteFile(bbsFileDto);

			bbsDao.deleteBbsFile(Integer.parseInt(arrDeleteBbsFileNo[i]));
		}

		BbsFileDto bbsFileDto = new BbsFileDto();

		bbsFileDto.setPno(bbsDto.getNo());
		bbsFileDto.setFileBase(bbsDto.getUploadPathBase());
		bbsFileDto.setFilePath(bbsDto.getUploadPathBbs());
		bbsFileDto.setFileNameList(bbsDto.getFileNameList());
		bbsFileDto.setThumbnailYn(bbsDto.getThumbnailYn());
		bbsFileDto.setThumbnailHeight(bbsDto.getThumbnailHeight());

		List<BbsFileDto> bbsFileDtoList = Upload.saveFileList(bbsFileDto);

		if (bbsFileDtoList.size() > 0) bbsDao.insertBbsFile(bbsFileDtoList);

		return intReturn;
	}

	public int updateBbsDelete(BbsDto bbsDto) throws Exception
	{
		return bbsDao.updateBbsDelete(bbsDto);
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
		List<BbsFileDto> bbsFileDtoList = bbsDao.selectBbsFileList(no);

		Upload.deleteFileList(bbsFileDtoList);

		bbsDao.deleteBbsFileList(no);
		bbsDao.deleteBbsCommentList(no);

		return bbsDao.deleteBbs(no);
	}

	public int selectBbsCommentDeleteCount(BbsCommentDto bbsCommentDto) throws Exception
	{
		return bbsDao.selectBbsCommentDeleteCount(bbsCommentDto);
	}

	public List<BbsCommentDto> selectBbsCommentList(int pno) throws Exception
	{
		return bbsDao.selectBbsCommentList(pno);
	}

	public BbsCommentDto selectBbsComment(int no) throws Exception
	{
		return bbsDao.selectBbsComment(no);
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

	public int updateBbsComment(BbsCommentDto bbsCommentDto) throws Exception
	{
		return bbsDao.updateBbsComment(bbsCommentDto);
	}

	public int updateBbsCommentDelete(BbsCommentDto bbsCommentDto) throws Exception
	{
		return bbsDao.updateBbsCommentDelete(bbsCommentDto);
	}

	public int deleteBbsComment(BbsCommentDto bbsCommentDto) throws Exception
	{
		bbsDao.updateBbsComCountMinus(bbsCommentDto.getPno());

		return bbsDao.deleteBbsComment(bbsCommentDto.getNo());
	}

	public List<BbsFileDto> selectBbsFileList(int pno) throws Exception
	{
		return bbsDao.selectBbsFileList(pno);
	}

	public BbsFileDto selectBbsFile(int no) throws Exception
	{
		return bbsDao.selectBbsFile(no);
	}

	public int updateBbsFileDownCount(int no) throws Exception
	{
		return bbsDao.updateBbsFileDownCount(no);
	}

}
