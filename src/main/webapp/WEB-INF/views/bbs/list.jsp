<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="/resources/css/bbs/list.css"></link>
<script type="text/javascript" src="/resources/js/bbs/bbs.js"></script>
	
<c:url var="writeUrl" value="/bbs/write/${bbsSearchDto.bbsId}">
	<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
	<c:param name="page" value="${bbsSearchDto.page}" />
	<c:param name="listSize" value="${bbsSearchDto.listSize}" />
	<c:param name="pageSize" value="${bbsSearchDto.pageSize}" />
</c:url>

<form:form commandName="bbsSearchDto" method="post" action="/bbs/list/${bbsSearchDto.bbsId}">	
    <div class="row">    
        <div class="col-lg-4 col-md-5 col-sm-4 col-xs-8">
		    <div class="input-group">
		    	<span class="input-group-addon">검색어</span>
                <form:input path="searchKeyword" cssClass="form-control" placeholder="검색어 입력" />      
                <span class="input-group-btn">
                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                    <button class="btn btn-default" type="button" onclick="location.href='${writeUrl}';"><span class="glyphicon glyphicon-pencil"></span></button>
                </span>
            </div>
        </div>
	</div>
</form:form>

<table class="table table-bordered table-hover table-condensed">
	<thead>
		<tr class="active">
			<th class="text-center">번호</th>
			<th class="text-center">제목</th>
			<th class="text-center">작성자</th>
			<th class="text-center hidden-xs">작성일</th>
			<th class="text-center hidden-xs">조회수</th>
		</tr>
	</thead>		
	<tbody>
	<c:set value="${bbsSearchDto.totalCount - (bbsSearchDto.listSize * (bbsSearchDto.page - 1))}" var="pageFirstNo"></c:set>
	<c:forEach var="bbsDto" items="${bbsDtoList}">
		<c:url var="viewUrl" value="/bbs/view/${bbsSearchDto.bbsId}/${bbsDto.no}">
			<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
			<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
			<c:param name="page" value="${bbsSearchDto.page}" />
			<c:param name="listSize" value="${bbsSearchDto.listSize}" />
			<c:param name="pageSize" value="${bbsSearchDto.pageSize}" />
		</c:url>
		<tr>
			<td class="text-center">	
				<c:set value="${pageFirstNo - bbsDto.viewNo + 1}" var="viewNo"></c:set>				
				<c:choose>
					<c:when test="${bbsDto.noticeYn eq 'Y'}">공지</c:when>
					<c:otherwise><c:out value="${viewNo}" escapeXml="true"></c:out></c:otherwise>
				</c:choose>
			</td>
			<td>
				<div class="cssTextOverflowEllipsis">
					<a href="${viewUrl}" title="${bbsDto.subject}">
						<c:if test="${bbsDto.depNo > 0}">
							<img src="/resources/images/icon/icon_dummy.gif" width="${15 * (bbsDto.depNo - 1)}" height="1" border="0" style="vertical-align: middle;" />
							<img src="/resources/images/icon/icon_reply.gif" border="0" style="vertical-align: middle;" />
						</c:if>
						<c:out value="${bbsDto.subject}" escapeXml="true"></c:out>
					</a>
				</div>
			</td>
			<td class="text-center"><c:out value="${bbsDto.userName}" escapeXml="true"></c:out></td>
			<td class="text-center hidden-xs"><c:out value="${bbsDto.regDate}" escapeXml="true"></c:out></td>
			<td class="text-center hidden-xs"><c:out value="${bbsDto.viewCount}" escapeXml="true"></c:out></td>
		</tr>	
	</c:forEach>
	</tbody>				
</table>

<nav class="text-center">
	<ul class="pagination pagination-sm">
		<!-- 처음페이지 시작 -->			
		<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsId}">
			<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
			<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
			<c:param name="page" value="1" />
			<c:param name="listSize" value="${bbsSearchDto.listSize}" />
			<c:param name="pageSize" value="${bbsSearchDto.pageSize}" />
		</c:url>		

		<c:if test="${bbsSearchDto.page > 1}">
			<li><a href="${listUrl}" title="1페이지">처음</a></li>
		</c:if>
		<!-- 처음페이지 종료 -->
	
		<!-- -pageSize페이지 시작 -->
		<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsId}">
			<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
			<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
			<c:param name="page" value="${page.startPage - bbsSearchDto.pageSize}" />
			<c:param name="listSize" value="${bbsSearchDto.listSize}" />
			<c:param name="pageSize" value="${bbsSearchDto.pageSize}" />
		</c:url>		
	
		<c:if test="${page.startPage > bbsSearchDto.pageSize}">
			<li><a href="${listUrl}" title="${page.startPage - bbsSearchDto.pageSize}페이지">-${bbsSearchDto.pageSize}</a></li>
		</c:if>
		<!-- -pageSize페이지 종료 -->
	
		<!-- 이전페이지 시작 -->
		<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsId}">
			<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
			<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
			<c:param name="page" value="${bbsSearchDto.page - 1}" />
			<c:param name="listSize" value="${bbsSearchDto.listSize}" />
			<c:param name="pageSize" value="${bbsSearchDto.pageSize}" />
		</c:url>		
	
		<c:if test="${bbsSearchDto.page > 1}">
			<li><a href="${listUrl}" title="${bbsSearchDto.page - 1}페이지">이전</a></li>
		</c:if>
		<!-- 이전페이지 종료 -->
	
		<!-- 현재페이지 시작 -->
		<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}" step="1">
			<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsId}">
				<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
				<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
				<c:param name="page" value="${i}" />
				<c:param name="listSize" value="${bbsSearchDto.listSize}" />
				<c:param name="pageSize" value="${bbsSearchDto.pageSize}" />
			</c:url>		
			<c:if test="${i <= page.totalPage}">
				<c:choose>
					<c:when test="${bbsSearchDto.page eq i}"><li class="active"><a href="#;">${i}</a></li></c:when>
					<c:otherwise><li><a href="${listUrl}" title="${i}페이지">${i}</a></li></c:otherwise>
				</c:choose>		
			</c:if>	
		</c:forEach>
		<!-- 현재페이지 종료 -->
	
		<!-- 다음페이지 시작 -->
		<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsId}">
			<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
			<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
			<c:param name="page" value="${bbsSearchDto.page + 1}" />
			<c:param name="listSize" value="${bbsSearchDto.listSize}" />
			<c:param name="pageSize" value="${bbsSearchDto.pageSize}" />
		</c:url>		
	
		<c:if test="${bbsSearchDto.page < page.totalPage}">
			<li><a href="${listUrl}" title="${bbsSearchDto.page + 1}페이지">다음</a></li>
		</c:if>
		<!-- 다음페이지 종료 -->
		
		<!-- +pageSize페이지 시작 -->
		<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsId}">
			<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
			<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
			<c:param name="page" value="${page.startPage + bbsSearchDto.pageSize}" />
			<c:param name="listSize" value="${bbsSearchDto.listSize}" />
			<c:param name="pageSize" value="${bbsSearchDto.pageSize}" />
		</c:url>		
	
		<c:if test="${page.endPage < page.totalPage}">
			<li><a href="${listUrl}" title="${page.startPage + bbsSearchDto.pageSize}페이지">[+${bbsSearchDto.pageSize}]</a></li>
		</c:if>
		<!-- +pageSize페이지 종료 -->
	
		<!-- 끝페이지 시작 -->			
		<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsId}">
			<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
			<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
			<c:param name="page" value="${page.totalPage}" />
			<c:param name="listSize" value="${bbsSearchDto.listSize}" />
			<c:param name="pageSize" value="${bbsSearchDto.pageSize}" />
		</c:url>		
	
		<c:if test="${bbsSearchDto.page < page.totalPage}">
			<li><a href="${listUrl}" title="${page.totalPage}페이지">[끝]</a></li>
		</c:if>
		<!-- 끝페이지 종료 -->
 	</ul>
</nav> 	