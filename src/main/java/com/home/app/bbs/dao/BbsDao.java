package com.home.app.bbs.dao;

import java.util.List;

import com.home.app.bbs.dto.BbsCommentDto;
import com.home.app.bbs.dto.BbsDto;
import com.home.app.bbs.dto.BbsFileDto;
import com.home.app.bbs.dto.BbsSearchDto;

public interface BbsDao {
	int selectBbsCount(BbsSearchDto bbsSearchDto) throws Exception;
	int selectBbsDeleteCount(int no) throws Exception;
	
	List<BbsDto> selectBbsList(BbsSearchDto bbsSearchDto) throws Exception;
	List<BbsFileDto> selectBbsFilePnoList(int pno) throws Exception;
	List<BbsCommentDto> selectBbsCommentPnoList(int pno) throws Exception;
	
	BbsDto selectBbsView(int no) throws Exception;
	BbsDto selectBbsEdit(int no) throws Exception;
	BbsDto selectBbsReply(int no) throws Exception;
	BbsDto selectBbsDelete(int no) throws Exception;
	BbsFileDto selectBbsFileNo(int no) throws Exception;
	BbsCommentDto selectBbsCommentNo(int no) throws Exception;

	int insertBbs(BbsDto bbsDto) throws Exception;	
	int insertBbsReply(BbsDto bbsDto) throws Exception;	
	int insertBbsComment(BbsCommentDto bbsCommentDto) throws Exception;
	int insertBbsCommentReply(BbsCommentDto bbsCommentDto) throws Exception;
	int insertBbsFile(List<BbsFileDto> bbsFileDtoList) throws Exception;
	
	int updateBbs(BbsDto bbsDto) throws Exception;
	int updateBbsDelete(BbsDto bbsDto) throws Exception;
	int updateBbsComment(BbsCommentDto bbsCommentDto) throws Exception;
	int updateBbsViewCount(int no) throws Exception;
	int updateBbsComCount(int no) throws Exception;
	int updateBbsFileDownCount(int no) throws Exception;

	int deleteBbs(int no) throws Exception;
	int deleteBbsComment(int no) throws Exception;
	int deleteBbsCommentPno(int pno) throws Exception;
	int deleteBbsFilePno(int no) throws Exception;
	int deleteBbsFileNo(int no) throws Exception;
}
