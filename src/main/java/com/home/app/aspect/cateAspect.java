package com.home.app.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;

import com.home.app.bbs.dto.BbsSearchDto;
import com.home.app.cate.service.CateService;

@Aspect
public class cateAspect {
	@Autowired
	private CateService cateService;

	@Around("execution(* com.home.app.bbs..controller.*Controller.*(..)) && args(bbsSearchDto,..)")
	public Object bbsNameYn(ProceedingJoinPoint joinPoint, BbsSearchDto bbsSearchDto) throws Throwable {
		if (cateService.selectBbsNameYn(bbsSearchDto.getBbsName()).equals("N")) {
			throw new Exception("게시판이 존재하지 않습니다!");
		}

		return joinPoint.proceed();
	}
}
