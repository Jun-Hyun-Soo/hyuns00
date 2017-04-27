package com.home.app.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.app.common.dao.ComboDao;
import com.home.app.common.dto.ComboDto;
import com.home.app.common.service.ComboService;

@Service
public class ComboServiceImpl implements ComboService {
	@Autowired
	private ComboDao comboDao;

	public List<ComboDto> selectComboList(ComboDto comboDto) throws Exception {
		return comboDao.selectComboList(comboDto);
	}

}
