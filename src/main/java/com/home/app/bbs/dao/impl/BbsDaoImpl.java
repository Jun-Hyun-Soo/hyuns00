package com.home.app.bbs.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.app.bbs.dao.BbsDao;
import com.home.app.bbs.dto.BbsCommentDto;
import com.home.app.bbs.dto.BbsDto;
import com.home.app.bbs.dto.BbsFileDto;
import com.home.app.bbs.dto.BbsSearchDto;

@Repository
public class BbsDaoImpl implements BbsDao 
{
	@Autowired 
	SqlSessionTemplate sqlSessionTemplate;
	
	public int selectBbsCount(BbsSearchDto bbsSearchDto) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.selectBbsCount(bbsSearchDto);		
	}
	
	public int selectBbsDeleteCount(int no) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.selectBbsDeleteCount(no);		
	}
	
	public List<BbsDto> selectBbsList(BbsSearchDto bbsSearchDto) throws Exception
	{	
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.selectBbsList(bbsSearchDto);
	}
	
	public List<BbsFileDto> selectBbsFilePnoList(int pno) throws Exception
	{	
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.selectBbsFilePnoList(pno);
	}
	
	public List<BbsCommentDto> selectBbsCommentPnoList(int pno) throws Exception
	{	
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.selectBbsCommentPnoList(pno);
	}

	public BbsDto selectBbsView(int no) throws Exception
	{	
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.selectBbsView(no);
	}
	
	public BbsDto selectBbsEdit(int no) throws Exception
	{	
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.selectBbsEdit(no);
	}
	
	public BbsDto selectBbsReply(int no) throws Exception
	{	
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.selectBbsReply(no);
	}
	
	public BbsDto selectBbsDelete(int no) throws Exception
	{	
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.selectBbsDelete(no);
	}

	public BbsFileDto selectBbsFileNo(int no) throws Exception
	{	
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.selectBbsFileNo(no);
	}

	public BbsCommentDto selectBbsCommentNo(int no) throws Exception
	{	
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.selectBbsCommentNo(no);
	}

	public int insertBbs(BbsDto bbsDto) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.insertBbs(bbsDto);		
	}

	public int insertBbsReply(BbsDto bbsDto) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.insertBbsReply(bbsDto);		
	}

	public int insertBbsComment(BbsCommentDto bbsCommentDto) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.insertBbsComment(bbsCommentDto);		
	}

	public int insertBbsCommentReply(BbsCommentDto bbsCommentDto) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.insertBbsCommentReply(bbsCommentDto);		
	}

	public int insertBbsFile(List<BbsFileDto> bbsFileDtoList) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.insertBbsFile(bbsFileDtoList);		
	}
	
	public int updateBbs(BbsDto bbsDto) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.updateBbs(bbsDto);		
	}
	
	public int updateBbsDelete(BbsDto bbsDto) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.updateBbsDelete(bbsDto);		
	}
	
	public int updateBbsComment(BbsCommentDto bbsCommentDto) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.updateBbsComment(bbsCommentDto);		
	}

	public int updateBbsViewCount(int no) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.updateBbsViewCount(no);		
	}

	public int updateBbsComCount(int no) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.updateBbsComCount(no);		
	}

	public int updateBbsFileDownCount(int no) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.updateBbsFileDownCount(no);		
	}

	public int deleteBbs(int no) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.deleteBbs(no);		
	}

	public int deleteBbsComment(int no) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.deleteBbsComment(no);		
	}

	public int deleteBbsCommentPno(int pno) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.deleteBbsComment(pno);		
	}

	public int deleteBbsFilePno(int no) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.deleteBbsFilePno(no);		
	}

	public int deleteBbsFileNo(int no) throws Exception
	{
		BbsDao bbsDao = sqlSessionTemplate.getMapper(BbsDao.class);
		
		return bbsDao.deleteBbsFileNo(no);		
	}

}
