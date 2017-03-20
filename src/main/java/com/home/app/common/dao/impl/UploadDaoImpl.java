package com.home.app.common.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.app.common.dao.UploadDao;
import com.home.app.common.dto.UploadDto;

@Repository
public class UploadDaoImpl implements UploadDao
{
	@Autowired 
	SqlSessionTemplate sqlSessionTemplate;

	
	public List<UploadDto> selectUploadList(int pno) throws Exception
	{	
		UploadDao uploadDao = sqlSessionTemplate.getMapper(UploadDao.class);
		
		return uploadDao.selectUploadList(pno);
	}

	public UploadDto selectUpload(int no) throws Exception
	{	
		UploadDao uploadDao = sqlSessionTemplate.getMapper(UploadDao.class);
		
		return uploadDao.selectUpload(no);
	}

	public int insertUpload(List<UploadDto> uploadDtoList) throws Exception
	{
		UploadDao uploadDao = sqlSessionTemplate.getMapper(UploadDao.class);
		
		return uploadDao.insertUpload(uploadDtoList);		
	}

	public int updateUploadDownCount(int no) throws Exception
	{
		UploadDao uploadDao = sqlSessionTemplate.getMapper(UploadDao.class);
		
		return uploadDao.updateUploadDownCount(no);		
	}

	public int deleteUploadList(int pno) throws Exception
	{
		UploadDao uploadDao = sqlSessionTemplate.getMapper(UploadDao.class);
		
		return uploadDao.deleteUploadList(pno);		
	}

	public int deleteUpload(int no) throws Exception
	{
		UploadDao uploadDao = sqlSessionTemplate.getMapper(UploadDao.class);
		
		return uploadDao.deleteUpload(no);		
	}

}
