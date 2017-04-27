package com.home.app.bbs.function;

import org.springframework.beans.factory.annotation.Autowired;

import com.home.app.bbs.dto.BbsSearchDto;

public class Page {
	@Autowired
	BbsSearchDto bbsSearchDto;

	public Page(BbsSearchDto bbsSearchDto) {
		this.bbsSearchDto = bbsSearchDto;
	}

	public int getTotalPage() throws Exception {
		int intReturn = 0;

		intReturn = (int) Math.ceil(this.bbsSearchDto.getTotalCount() / (double) this.bbsSearchDto.getListSize());

		return intReturn;
	}

	public int getStartPage() throws Exception {
		int intReturn = 0;

		intReturn = this.getEndPage() - this.bbsSearchDto.getPageSize() + 1;

		return intReturn;
	}

	public int getEndPage() throws Exception {
		int intReturn = 0;

		intReturn = (int) Math.ceil(this.bbsSearchDto.getPage() / (double) this.bbsSearchDto.getPageSize()) * this.bbsSearchDto.getPageSize();

		return intReturn;
	}

}
