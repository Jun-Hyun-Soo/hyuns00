package com.home.app.bbs.dao;

import java.util.List;

import com.home.app.bbs.dto.BbsCommentDto;
import com.home.app.bbs.dto.BbsDto;
import com.home.app.bbs.dto.BbsSearchDto;

public interface BbsDao 
{
	int selectBbsCount(BbsSearchDto bbsSearchDto) throws Exception;
	int selectBbsDeleteCount(int no) throws Exception;
	
	List<BbsDto> selectBbsList(BbsSearchDto bbsSearchDto) throws Exception;
	
	BbsDto selectBbsView(int no) throws Exception;
	BbsDto selectBbsEdit(int no) throws Exception;
	BbsDto selectBbsReply(int no) throws Exception;
	BbsDto selectBbsDelete(int no) throws Exception;

	int insertBbs(BbsDto bbsDto) throws Exception;	
	int insertBbsReply(BbsDto bbsDto) throws Exception;	
	
	int updateBbs(BbsDto bbsDto) throws Exception;
	int updateBbsDelete(BbsDto bbsDto) throws Exception;
	int updateBbsViewCount(int no) throws Exception;
	int updateBbsComCountPlus(int no) throws Exception;
	int updateBbsComCountMinus(int no) throws Exception;

	int deleteBbs(int no) throws Exception;	
	
	int selectBbsCommentDeleteCount(BbsCommentDto bbsCommentDto) throws Exception;
	
	List<BbsCommentDto> selectBbsCommentList(int pno) throws Exception;
	
	BbsCommentDto selectBbsComment(int no) throws Exception;
	
	int insertBbsComment(BbsCommentDto bbsCommentDto) throws Exception;
	int insertBbsCommentReply(BbsCommentDto bbsCommentDto) throws Exception;
	
	int updateBbsComment(BbsCommentDto bbsCommentDto) throws Exception;
	int updateBbsCommentDelete(BbsCommentDto bbsCommentDto) throws Exception;
	
	int deleteBbsCommentList(int pno) throws Exception;
	int deleteBbsComment(int no) throws Exception;
}
