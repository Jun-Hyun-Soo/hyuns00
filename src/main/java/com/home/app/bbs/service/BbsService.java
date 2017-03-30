package com.home.app.bbs.service;

import java.util.List;

import com.home.app.bbs.dto.BbsCommentDto;
import com.home.app.bbs.dto.BbsDto;
import com.home.app.bbs.dto.BbsFileDto;
import com.home.app.bbs.dto.BbsSearchDto;


public interface BbsService 
{
	public int selectBbsCount(BbsSearchDto bbsSearchDto) throws Exception;
	public int selectBbsDeleteCount(int no) throws Exception;
	
	public List<BbsDto> selectBbsList(BbsSearchDto bbsSearchDto) throws Exception;
	
	public BbsDto selectBbsView(int no) throws Exception;
	public BbsDto selectBbsEdit(int no) throws Exception;
	public BbsDto selectBbsReply(int no) throws Exception;
	public BbsDto selectBbsDelete(int no) throws Exception;
	
	public int insertBbs(BbsDto bbsDto) throws Exception;	
	public int insertBbsReply(BbsDto bbsDto) throws Exception;
	
	public int updateBbs(BbsDto bbsDto) throws Exception;
	public int updateBbsDelete(BbsDto bbsDto) throws Exception;
	public int updateBbsViewCount(int no) throws Exception;
	public int updateBbsComCountPlus(int no) throws Exception;
	public int updateBbsComCountMinus(int no) throws Exception;
	
	public int deleteBbs(int no) throws Exception;	
	
	public int selectBbsCommentDeleteCount(BbsCommentDto bbsCommentDto) throws Exception;

	public List<BbsCommentDto> selectBbsCommentList(int pno) throws Exception;

	public BbsCommentDto selectBbsComment(int no) throws Exception;

	public int insertBbsComment(BbsCommentDto bbsCommentDto) throws Exception;	
	public int insertBbsCommentReply(BbsCommentDto bbsCommentDto) throws Exception;

	public int updateBbsComment(BbsCommentDto bbsCommentDto) throws Exception;
	public int updateBbsCommentDelete(BbsCommentDto bbsCommentDto) throws Exception;

	public int deleteBbsComment(BbsCommentDto bbsCommentDto) throws Exception;
	
	public List<BbsFileDto> selectBbsFileList(int pno) throws Exception;

	public BbsFileDto selectBbsFile(int no) throws Exception;

	public int updateBbsFileDownCount(int no) throws Exception;
}
