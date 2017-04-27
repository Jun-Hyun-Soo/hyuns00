package com.home.app.cate.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.app.cate.dao.CateDao;
import com.home.app.cate.dto.CateDto;
import com.home.app.cate.dto.CateSearchDto;

@Repository
public class CateDaoImpl implements CateDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public String selectBbsNameYn(String bbsName) throws Exception {
		CateDao cateDao = sqlSessionTemplate.getMapper(CateDao.class);

		return cateDao.selectBbsNameYn(bbsName);
	}

	public int selectCateCount(CateSearchDto cateSearchDto) throws Exception {
		CateDao cateDao = sqlSessionTemplate.getMapper(CateDao.class);

		return cateDao.selectCateCount(cateSearchDto);
	}

	public List<CateDto> selectCateList(CateSearchDto cateSearchDto) throws Exception {
		CateDao cateDao = sqlSessionTemplate.getMapper(CateDao.class);

		return cateDao.selectCateList(cateSearchDto);
	}

	public List<CateDto> selectBbsName() throws Exception {
		CateDao cateDao = sqlSessionTemplate.getMapper(CateDao.class);

		return cateDao.selectBbsName();
	}

	public CateDto selectCateView(int no) throws Exception {
		CateDao cateDao = sqlSessionTemplate.getMapper(CateDao.class);

		return cateDao.selectCateView(no);
	}

	public CateDto selectCateEdit(int no) throws Exception {
		CateDao cateDao = sqlSessionTemplate.getMapper(CateDao.class);

		return cateDao.selectCateEdit(no);
	}

	public int insertCate(CateDto cateDto) throws Exception {
		CateDao cateDao = sqlSessionTemplate.getMapper(CateDao.class);

		return cateDao.insertCate(cateDto);
	}

	public int updateCate(CateDto cateDto) throws Exception {
		CateDao cateDao = sqlSessionTemplate.getMapper(CateDao.class);

		return cateDao.updateCate(cateDto);
	}

	public int deleteCate(int no) throws Exception {
		CateDao cateDao = sqlSessionTemplate.getMapper(CateDao.class);

		return cateDao.deleteCate(no);
	}

}
