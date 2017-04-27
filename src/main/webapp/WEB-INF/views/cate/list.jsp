<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="/resources/css/cate/list.css"></link>
<script type="text/javascript" src="/resources/js/cate/cate.js"></script>	
	
<c:url var="writeUrl" value="/cate/write">
	<c:param name="searchClass" value="${cateSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${cateSearchDto.searchKeyword}" />
	<c:param name="page" value="${cateSearchDto.page}" />
</c:url>

<div id="divCateListSearch">	
	<form:form commandName="cateSearchDto" method="post" action="/cate/list">		
		<form:select path="searchClass">
			<form:option value="ALL" label="전체"></form:option>
			<form:option value="SUBJECT" label="게시판명"></form:option>
			<form:option value="BBS_NAME" label="연결문자"></form:option>
		</form:select>
		<form:input path="searchKeyword" size="20" />
		<input type="image" id="imgBtnSearch" value="" />
		<input type="image" id="imgBtnWrite" value="" onclick="location.href='${writeUrl}'; return false;" />
	</form:form>
</div>
	
<table id="tblCateListTable">
	<tr>
		<th id="thCateListNo">번호</th>
		<th id="thCateListSubject">게시판명</th>
		<th id="thCateListBbsName">연결문자</th>
		<th id="thCateListListSize">리스트갯수</th>
		<th id="thCateListPageSize">페이지갯수</th>
		<th id="thCateListRegDate">생성일</th>
		<th id="thCateListUseYn">사용유무</th>
	</tr>
<c:set value="${cateSearchDto.totalCount - (cateSearchDto.listSize * (cateSearchDto.page - 1))}" var="pageFirstNo"></c:set>
<c:forEach var="cateDto" items="${cateDtoList}">
	<c:url var="viewUrl" value="/cate/view/${cateDto.no}">
		<c:param name="searchClass" value="${cateSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${cateSearchDto.searchKeyword}" />
		<c:param name="page" value="${cateSearchDto.page}" />
	</c:url>
	<tr>
		<td class="cssCateListNo">	
			<c:set value="${pageFirstNo - cateDto.viewNo + 1}" var="viewNo"></c:set>				
			<c:out value="${viewNo}" escapeXml="true"></c:out>
		</td>
		<td class="cssCateListSubject">
			<a href="${viewUrl}" title="${cateDto.subject}">
				<c:out value="${cateDto.subject}" escapeXml="true"></c:out>
			</a>
		</td>
		<td class="cssCateListBbsName"><c:out value="${cateDto.bbsName}" escapeXml="true"></c:out></td>
		<td class="cssCateListListSize"><c:out value="${cateDto.listSize}" escapeXml="true"></c:out></td>
		<td class="cssCateListPageSize"><c:out value="${cateDto.pageSize}" escapeXml="true"></c:out></td>
		<td class="cssCateListRegDate"><c:out value="${cateDto.regDate}" escapeXml="true"></c:out></td>
		<td class="cssCateListUseYn"><c:out value="${cateDto.useYn}" escapeXml="true"></c:out></td>
	</tr>					
</c:forEach>
</table>

<div id="divCateListPage">	
	<!-- 처음페이지 시작 -->			
	<c:url var="listUrl" value="/cate/list">
		<c:param name="searchClass" value="${cateSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${cateSearchDto.searchKeyword}" />
		<c:param name="page" value="1" />
	</c:url>		

	<c:if test="${cateSearchDto.page > 1}">
		<a href="${listUrl}" title="1페이지">[처음]</a>
	</c:if>
	<!-- 처음페이지 종료 -->
	
	<!-- -pageSize페이지 시작 -->
	<c:url var="listUrl" value="/cate/list">
		<c:param name="searchClass" value="${cateSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${cateSearchDto.searchKeyword}" />
		<c:param name="page" value="${page.startPage - cateSearchDto.pageSize}" />
	</c:url>		

	<c:if test="${page.startPage > cateSearchDto.pageSize}">
		<a href="${listUrl}" title="${page.startPage - cateSearchDto.pageSize}페이지">[-${cateSearchDto.pageSize}]</a>
	</c:if>
	<!-- -pageSize페이지 종료 -->
	
	<!-- 이전페이지 시작 -->
	<c:url var="listUrl" value="/cate/list">
		<c:param name="searchClass" value="${cateSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${cateSearchDto.searchKeyword}" />
		<c:param name="page" value="${cateSearchDto.page - 1}" />
	</c:url>		

	<c:if test="${cateSearchDto.page > 1}">
		<a href="${listUrl}" title="${cateSearchDto.page - 1}페이지">[이전]</a>
	</c:if>
	<!-- 이전페이지 종료 -->
	
	<!-- 현재페이지 시작 -->
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}" step="1">
		<c:url var="listUrl" value="/cate/list">
			<c:param name="searchClass" value="${cateSearchDto.searchClass}" />
			<c:param name="searchKeyword" value="${cateSearchDto.searchKeyword}" />
			<c:param name="page" value="${i}" />
		</c:url>		
		<c:if test="${i <= page.totalPage}">
			<c:choose>
				<c:when test="${cateSearchDto.page eq i}"><span class="cssCateListCurrPage">[ ${i} ]</span></c:when>
				<c:otherwise><a href="${listUrl}" title="${i}페이지">[ ${i} ]</a></c:otherwise>
			</c:choose>		
		</c:if>	
	</c:forEach>
	<!-- 현재페이지 종료 -->

	<!-- 다음페이지 시작 -->
	<c:url var="listUrl" value="/cate/list">
		<c:param name="searchClass" value="${cateSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${cateSearchDto.searchKeyword}" />
		<c:param name="page" value="${cateSearchDto.page + 1}" />
	</c:url>		

	<c:if test="${cateSearchDto.page < page.totalPage}">
		<a href="${listUrl}" title="${cateSearchDto.page + 1}페이지">[다음]</a>
	</c:if>
	<!-- 다음페이지 종료 -->
	
	<!-- +pageSize페이지 시작 -->
	<c:url var="listUrl" value="/cate/list">
		<c:param name="searchClass" value="${cateSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${cateSearchDto.searchKeyword}" />
		<c:param name="page" value="${page.startPage + cateSearchDto.pageSize}" />
	</c:url>		

	<c:if test="${page.endPage < page.totalPage}">
		<a href="${listUrl}" title="${page.startPage + cateSearchDto.pageSize}페이지">[+${cateSearchDto.pageSize}]</a>
	</c:if>
	<!-- +pageSize페이지 종료 -->

	<!-- 끝페이지 시작 -->			
	<c:url var="listUrl" value="/cate/list">
		<c:param name="searchClass" value="${cateSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${cateSearchDto.searchKeyword}" />
		<c:param name="page" value="${page.totalPage}" />
	</c:url>		

	<c:if test="${cateSearchDto.page < page.totalPage}">
		<a href="${listUrl}" title="${page.totalPage}페이지">[끝]</a>
	</c:if>
	<!-- 끝페이지 종료 -->
</div>
 