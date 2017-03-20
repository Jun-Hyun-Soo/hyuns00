package com.home.app.common.dao;

import java.util.List;

import com.home.app.common.dto.UploadDto;

public interface UploadDao {
	List<UploadDto> selectUploadList(int pno) throws Exception;
	
	UploadDto selectUpload(int no) throws Exception;
	
	int insertUpload(List<UploadDto> bbsFileDtoList) throws Exception;
	
	int updateUploadDownCount(int no) throws Exception;
	
	int deleteUploadList(int pno) throws Exception;
	int deleteUpload(int no) throws Exception;
}
