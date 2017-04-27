package com.home.app.login.function;

import org.springframework.beans.factory.annotation.Autowired;

import com.home.app.login.dto.LoginSearchDto;

public class Page {
	@Autowired
	LoginSearchDto loginSearchDto;

	public Page(LoginSearchDto loginSearchDto) {
		this.loginSearchDto = loginSearchDto;
	}

	public int getTotalPage() throws Exception {
		int intReturn = 0;

		intReturn = (int) Math.ceil(this.loginSearchDto.getTotalCount() / (double) this.loginSearchDto.getListSize());

		return intReturn;
	}

	public int getStartPage() throws Exception {
		int intReturn = 0;

		intReturn = this.getEndPage() - this.loginSearchDto.getPageSize() + 1;

		return intReturn;
	}

	public int getEndPage() throws Exception {
		int intReturn = 0;

		intReturn = (int) Math.ceil(this.loginSearchDto.getPage() / (double) this.loginSearchDto.getPageSize()) * this.loginSearchDto.getPageSize();

		return intReturn;
	}

}
