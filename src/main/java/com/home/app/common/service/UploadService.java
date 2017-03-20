package com.home.app.common.service;

import java.util.List;

import com.home.app.common.dto.UploadDto;

public interface UploadService
{
	public List<UploadDto> selectUploadList(int pno) throws Exception;

	public UploadDto selectUpload(int no) throws Exception;

	public int updateUploadDownCount(int no) throws Exception;
}
