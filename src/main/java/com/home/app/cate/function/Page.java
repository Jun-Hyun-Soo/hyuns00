package com.home.app.cate.function;

import org.springframework.beans.factory.annotation.Autowired;

import com.home.app.cate.dto.CateSearchDto;

public class Page {
	@Autowired
	CateSearchDto cateSearchDto;

	public Page(CateSearchDto cateSearchDto) {
		this.cateSearchDto = cateSearchDto;
	}

	public int getTotalPage() throws Exception {
		int intReturn = 0;

		intReturn = (int) Math.ceil(this.cateSearchDto.getTotalCount() / (double) this.cateSearchDto.getListSize());

		return intReturn;
	}

	public int getStartPage() throws Exception {
		int intReturn = 0;

		intReturn = this.getEndPage() - this.cateSearchDto.getPageSize() + 1;

		return intReturn;
	}

	public int getEndPage() throws Exception {
		int intReturn = 0;

		intReturn = (int) Math.ceil(this.cateSearchDto.getPage() / (double) this.cateSearchDto.getPageSize()) * this.cateSearchDto.getPageSize();

		return intReturn;
	}

}
