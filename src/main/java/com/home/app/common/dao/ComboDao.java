package com.home.app.common.dao;

import java.util.List;

import com.home.app.common.dto.ComboDto;

public interface ComboDao {
	List<ComboDto> selectComboList(ComboDto comboDto) throws Exception;
}
