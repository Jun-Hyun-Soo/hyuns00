package com.home.app.cate.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.app.cate.dao.CateDao;
import com.home.app.cate.dto.CateDto;
import com.home.app.cate.dto.CateSearchDto;
import com.home.app.cate.service.CateService;

@Service
public class CateServiceImpl implements CateService {
	@Autowired
	private CateDao cateDao;

	public String selectBbsNameYn(String bbsName) throws Exception {
		return cateDao.selectBbsNameYn(bbsName);
	}

	public int selectCateCount(CateSearchDto cateSearchDto) throws Exception {
		return cateDao.selectCateCount(cateSearchDto);
	}

	public List<CateDto> selectCateList(CateSearchDto cateSearchDto) throws Exception {
		return cateDao.selectCateList(cateSearchDto);
	}

	public List<CateDto> selectBbsName() throws Exception {
		return cateDao.selectBbsName();
	}

	public CateDto selectCateView(int no) throws Exception {
		return cateDao.selectCateView(no);
	}

	public CateDto selectCateEdit(int no) throws Exception {
		return cateDao.selectCateEdit(no);
	}

	public int insertCate(CateDto cateDto) throws Exception {
		return cateDao.insertCate(cateDto);
	}

	public int updateCate(CateDto cateDto) throws Exception {
		return cateDao.updateCate(cateDto);
	}

	public int deleteCate(int no) throws Exception {
		return cateDao.deleteCate(no);
	}

}
