package com.home.app.cate.dao;

import java.util.List;

import com.home.app.cate.dto.CateDto;
import com.home.app.cate.dto.CateSearchDto;

public interface CateDao {
	String selectBbsNameYn(String bbsName) throws Exception;

	int selectCateCount(CateSearchDto cateSearchDto) throws Exception;

	List<CateDto> selectCateList(CateSearchDto cateSearchDto) throws Exception;

	List<CateDto> selectBbsName() throws Exception;

	CateDto selectCateView(int no) throws Exception;

	CateDto selectCateEdit(int no) throws Exception;

	int insertCate(CateDto cateDto) throws Exception;

	int updateCate(CateDto cateDto) throws Exception;

	int deleteCate(int no) throws Exception;
}
