<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="/resources/css/bbs/list.css"></link>
<script type="text/javascript" src="/resources/js/bbs/bbs.js"></script>	
	
<c:url var="writeUrl" value="/bbs/write/${bbsSearchDto.bbsName}">
	<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
	<c:param name="page" value="${bbsSearchDto.page}" />
	<c:param name="listSize" value="${bbsSearchDto.listSize}" />
</c:url>

<div id="divBbsListSearch">	
	<form:form commandName="bbsSearchDto" method="post" action="/bbs/list/${bbsSearchDto.bbsName}">		
		<form:select path="searchClass">
			<form:option value="ALL" label="전체"></form:option>
			<form:option value="USER_NAME" label="글쓴이"></form:option>
			<form:option value="SUBJECT" label="제목"></form:option>
			<form:option value="CONTENT" label="내용"></form:option>
		</form:select>
		<form:input path="searchKeyword" size="20" />
		<input type="image" id="imgBtnSearch" />
		<input type="image" id="imgBtnWrite" onclick="location.href='${writeUrl}'; return false;" />
	</form:form>
</div>
	
<table id="tblBbsListTable">
	<tr>
		<th id="thBbsListNo">번호</th>
		<th id="thBbsListSubject">제목</th>
		<th id="thBbsListUserName">작성자</th>
		<th id="thBbsListRegDate">작성일</th>
		<th id="thBbsListVisitCount">조회수</th>
	</tr>
<c:set value="${bbsSearchDto.totalCount - (bbsSearchDto.listSize * (bbsSearchDto.page - 1))}" var="pageFirstNo"></c:set>
<c:forEach var="bbsDto" items="${bbsDtoList}">
	<c:url var="viewUrl" value="/bbs/view/${bbsSearchDto.bbsName}/${bbsDto.no}">
		<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
		<c:param name="page" value="${bbsSearchDto.page}" />
		<c:param name="listSize" value="${bbsSearchDto.listSize}" />
	</c:url>
	<tr>
		<td class="cssBbsListNo">	
			<c:set value="${pageFirstNo - bbsDto.viewNo + 1}" var="viewNo"></c:set>				
			<c:choose>
				<c:when test="${bbsDto.noticeYn eq 'Y'}">공지</c:when>
				<c:otherwise><c:out value="${viewNo}" escapeXml="true"></c:out></c:otherwise>
			</c:choose>
		</td>
		<td class="cssBbsListSubject">
			<a href="${viewUrl}" title="${bbsDto.subject}">
				<c:out value="${func.getReplyImage(bbsDto.depNo, 'List')}" escapeXml="false"></c:out>
				<c:out value="${bbsDto.subject}" escapeXml="true"></c:out>
			</a>
		</td>
		<td class="cssBbsListUserName"><c:out value="${bbsDto.userName}" escapeXml="true"></c:out></td>
		<td class="cssBbsListRegDate"><c:out value="${bbsDto.regDate}" escapeXml="true"></c:out></td>
		<td class="cssBbsListVisitCount"><c:out value="${bbsDto.viewCount}" escapeXml="true"></c:out></td>
	</tr>					
</c:forEach>
</table>

<div id="divBbsListPage">	
	<!-- 처음페이지 시작 -->			
	<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsName}">
		<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
		<c:param name="page" value="1" />
		<c:param name="listSize" value="${bbsSearchDto.listSize}" />
	</c:url>		

	<c:if test="${bbsSearchDto.page > 1}"><a href="${listUrl}" title="1페이지">[처음]</a></c:if>
	<!-- 처음페이지 종료 -->
	
	<!-- -pageSize페이지 시작 -->
	<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsName}">
		<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
		<c:param name="page" value="${page.startPage - bbsSearchDto.pageSize}" />
		<c:param name="listSize" value="${bbsSearchDto.listSize}" />
	</c:url>		

	<c:if test="${page.startPage > bbsSearchDto.pageSize}">
		<a href="${listUrl}" title="${page.startPage - bbsSearchDto.pageSize}페이지">[-${bbsSearchDto.pageSize}]</a>
	</c:if>
	<!-- -pageSize페이지 종료 -->
	
	<!-- 이전페이지 시작 -->
	<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsName}">
		<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
		<c:param name="page" value="${bbsSearchDto.page - 1}" />
		<c:param name="listSize" value="${bbsSearchDto.listSize}" />
	</c:url>		

	<c:if test="${bbsSearchDto.page > 1}">
		<a href="${listUrl}" title="${bbsSearchDto.page - 1}페이지">[이전]</a>
	</c:if>
	<!-- 이전페이지 종료 -->
	
	<!-- 현재페이지 시작 -->
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}" step="1">
		<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsName}">
			<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
			<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
			<c:param name="page" value="${i}" />
			<c:param name="listSize" value="${bbsSearchDto.listSize}" />
		</c:url>		
		<c:if test="${i <= page.totalPage}">
			<c:choose>
				<c:when test="${bbsSearchDto.page eq i}"><span class="cssBbsListCurrPage">[ ${i} ]</span></c:when>
				<c:otherwise><a href="${listUrl}" title="${i}페이지">[ ${i} ]</a></c:otherwise>
			</c:choose>		
		</c:if>	
	</c:forEach>
	<!-- 현재페이지 종료 -->

	<!-- 다음페이지 시작 -->
	<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsName}">
		<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
		<c:param name="page" value="${bbsSearchDto.page + 1}" />
		<c:param name="listSize" value="${bbsSearchDto.listSize}" />
	</c:url>		

	<c:if test="${bbsSearchDto.page < page.totalPage}">
		<a href="${listUrl}" title="${bbsSearchDto.page + 1}페이지">[다음]</a>
	</c:if>
	<!-- 다음페이지 종료 -->
	
	<!-- +pageSize페이지 시작 -->
	<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsName}">
		<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
		<c:param name="page" value="${page.startPage + bbsSearchDto.pageSize}" />
		<c:param name="listSize" value="${bbsSearchDto.listSize}" />
	</c:url>		

	<c:if test="${page.endPage < page.totalPage}">
		<a href="${listUrl}" title="${page.startPage + bbsSearchDto.pageSize}페이지">[+${bbsSearchDto.pageSize}]</a>
	</c:if>
	<!-- +pageSize페이지 종료 -->

	<!-- 끝페이지 시작 -->			
	<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsName}">
		<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
		<c:param name="page" value="${page.totalPage}" />
		<c:param name="listSize" value="${bbsSearchDto.listSize}" />
	</c:url>		

	<c:if test="${bbsSearchDto.page < page.totalPage}">
		<a href="${listUrl}" title="${page.totalPage}페이지">[끝]</a>
	</c:if>
	<!-- 끝페이지 종료 -->
</div>
 