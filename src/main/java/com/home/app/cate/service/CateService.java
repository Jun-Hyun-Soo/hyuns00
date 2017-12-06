package com.home.app.cate.service;

import java.util.List;

import com.home.app.cate.dto.CateDto;
import com.home.app.cate.dto.CateSearchDto;

public interface CateService {
	public String selectBbsIdYn(String bbsId) throws Exception;

	public int selectCateCount(CateSearchDto cateSearchDto) throws Exception;

	public List<CateDto> selectCateList(CateSearchDto cateSearchDto) throws Exception;

	public List<CateDto> selectBbsId() throws Exception;

	public CateDto selectCateView(int no) throws Exception;

	public CateDto selectCateEdit(int no) throws Exception;

	public int insertCate(CateDto cateDto) throws Exception;

	public int updateCate(CateDto cateDto) throws Exception;

	public int deleteCate(int no) throws Exception;
}
