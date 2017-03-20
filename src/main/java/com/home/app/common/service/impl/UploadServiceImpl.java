package com.home.app.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.app.common.dao.UploadDao;
import com.home.app.common.dto.UploadDto;
import com.home.app.common.service.UploadService;

@Service
public class UploadServiceImpl implements UploadService
{	
	@Autowired
	private UploadDao uploadDao;


	public List<UploadDto> selectUploadList(int pno) throws Exception
	{
		return uploadDao.selectUploadList(pno);
	}

	public UploadDto selectUpload(int no) throws Exception
	{
		return uploadDao.selectUpload(no);
	}
	
	public int updateUploadDownCount(int no) throws Exception
	{
		return uploadDao.updateUploadDownCount(no);
	}

}

