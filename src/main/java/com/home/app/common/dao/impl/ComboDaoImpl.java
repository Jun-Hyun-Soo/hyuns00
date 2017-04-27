package com.home.app.common.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.app.common.dao.ComboDao;
import com.home.app.common.dto.ComboDto;

@Repository
public class ComboDaoImpl implements ComboDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<ComboDto> selectComboList(ComboDto comboDto) throws Exception {
		ComboDao comboDao = sqlSessionTemplate.getMapper(ComboDao.class);

		return comboDao.selectComboList(comboDto);
	}

}
