package com.home.app.common.service;

import java.util.List;

import com.home.app.common.dto.ComboDto;

public interface ComboService {
	public List<ComboDto> selectComboList(ComboDto comboDto) throws Exception;
}
