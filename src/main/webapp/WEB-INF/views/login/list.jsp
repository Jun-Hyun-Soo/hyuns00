<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="/resources/css/login/list.css"></link>
<script type="text/javascript" src="/resources/js/login/login.js"></script>	
	
<c:url var="writeUrl" value="/login/write">
	<c:param name="searchClass" value="${loginSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${loginSearchDto.searchKeyword}" />
	<c:param name="page" value="${loginSearchDto.page}" />
</c:url>

<div id="divLoginListSearch">	
	<form:form commandName="loginSearchDto" method="post" action="/login/list">		
		<form:select path="searchClass">
			<form:option value="ALL" label="전체"></form:option>
			<form:option value="USER_ID" label="유저ID"></form:option>
			<form:option value="USER_NAME" label="유저명"></form:option>
			<form:option value="USER_NICK" label="닉네임"></form:option>
		</form:select>
		<form:input path="searchKeyword" size="20" />
		<input type="image" id="imgBtnSearch" value="" />
	</form:form>
</div>
	
<table id="tblLoginListTable">
	<tr>
		<th id="thLoginListUserNo">번호</th>
		<th id="thLoginListUserId">유저ID</th>
		<th id="thLoginListUserName">유저명</th>
		<th id="thLoginListUserRole">유저역할</th>
		<th id="thLoginListUserNick">닉네임</th>
		<th id="thLoginListJoinDate">가입일자</th>
		<th id="thLoginListVisitCount">방문횟수</th>
	</tr>
<c:set value="${loginSearchDto.totalCount - (loginSearchDto.listSize * (loginSearchDto.page - 1))}" var="pageFirstNo"></c:set>
<c:forEach var="loginDto" items="${loginDtoList}">
	<c:url var="viewUrl" value="/login/view/${loginDto.userNo}">
		<c:param name="searchClass" value="${loginSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${loginSearchDto.searchKeyword}" />
		<c:param name="page" value="${loginSearchDto.page}" />
	</c:url>
	<tr>
		<td class="cssLoginListUserNo">	
			<c:set value="${pageFirstNo - loginDto.viewNo + 1}" var="viewNo"></c:set>				
			<c:out value="${viewNo}" escapeXml="true"></c:out>
		</td>
		<td class="cssLoginListUserId">
			<a href="${viewUrl}" title="${loginDto.userId}">
				<c:out value="${loginDto.userId}" escapeXml="true"></c:out>
			</a>
		</td>
		<td class="cssLoginListUserName"><c:out value="${loginDto.userName}" escapeXml="true"></c:out></td>
		<td class="cssLoginListUserRole"><c:out value="${loginDto.userRole}" escapeXml="true"></c:out></td>
		<td class="cssLoginListUserNick"><c:out value="${loginDto.userNick}" escapeXml="true"></c:out></td>
		<td class="cssLoginListJoinDate"><c:out value="${loginDto.joinDate}" escapeXml="true"></c:out></td>
		<td class="cssLoginListVisitCount"><c:out value="${loginDto.visitCount}" escapeXml="true"></c:out></td>
	</tr>					
</c:forEach>
</table>

<div id="divLoginListPage">	
	<!-- 처음페이지 시작 -->			
	<c:url var="listUrl" value="/login/list">
		<c:param name="searchClass" value="${loginSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${loginSearchDto.searchKeyword}" />
		<c:param name="page" value="1" />
	</c:url>		

	<c:if test="${loginSearchDto.page > 1}">
		<a href="${listUrl}" title="1페이지">[처음]</a>
	</c:if>
	<!-- 처음페이지 종료 -->
	
	<!-- -pageSize페이지 시작 -->
	<c:url var="listUrl" value="/login/list">
		<c:param name="searchClass" value="${loginSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${loginSearchDto.searchKeyword}" />
		<c:param name="page" value="${page.startPage - loginSearchDto.pageSize}" />
	</c:url>		

	<c:if test="${page.startPage > loginSearchDto.pageSize}">
		<a href="${listUrl}" title="${page.startPage - loginSearchDto.pageSize}페이지">[-${loginSearchDto.pageSize}]</a>
	</c:if>
	<!-- -pageSize페이지 종료 -->
	
	<!-- 이전페이지 시작 -->
	<c:url var="listUrl" value="/login/list">
		<c:param name="searchClass" value="${loginSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${loginSearchDto.searchKeyword}" />
		<c:param name="page" value="${loginSearchDto.page - 1}" />
	</c:url>		

	<c:if test="${loginSearchDto.page > 1}">
		<a href="${listUrl}" title="${loginSearchDto.page - 1}페이지">[이전]</a>
	</c:if>
	<!-- 이전페이지 종료 -->
	
	<!-- 현재페이지 시작 -->
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}" step="1">
		<c:url var="listUrl" value="/login/list">
			<c:param name="searchClass" value="${loginSearchDto.searchClass}" />
			<c:param name="searchKeyword" value="${loginSearchDto.searchKeyword}" />
			<c:param name="page" value="${i}" />
		</c:url>		
		<c:if test="${i <= page.totalPage}">
			<c:choose>
				<c:when test="${loginSearchDto.page eq i}"><span class="cssLoginListCurrPage">[ ${i} ]</span></c:when>
				<c:otherwise><a href="${listUrl}" title="${i}페이지">[ ${i} ]</a></c:otherwise>
			</c:choose>		
		</c:if>	
	</c:forEach>
	<!-- 현재페이지 종료 -->

	<!-- 다음페이지 시작 -->
	<c:url var="listUrl" value="/login/list">
		<c:param name="searchClass" value="${loginSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${loginSearchDto.searchKeyword}" />
		<c:param name="page" value="${loginSearchDto.page + 1}" />
	</c:url>		

	<c:if test="${loginSearchDto.page < page.totalPage}">
		<a href="${listUrl}" title="${loginSearchDto.page + 1}페이지">[다음]</a>
	</c:if>
	<!-- 다음페이지 종료 -->
	
	<!-- +pageSize페이지 시작 -->
	<c:url var="listUrl" value="/login/list">
		<c:param name="searchClass" value="${loginSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${loginSearchDto.searchKeyword}" />
		<c:param name="page" value="${page.startPage + loginSearchDto.pageSize}" />
	</c:url>		

	<c:if test="${page.endPage < page.totalPage}">
		<a href="${listUrl}" title="${page.startPage + loginSearchDto.pageSize}페이지">[+${loginSearchDto.pageSize}]</a>
	</c:if>
	<!-- +pageSize페이지 종료 -->

	<!-- 끝페이지 시작 -->			
	<c:url var="listUrl" value="/login/list">
		<c:param name="searchClass" value="${loginSearchDto.searchClass}" />
		<c:param name="searchKeyword" value="${loginSearchDto.searchKeyword}" />
		<c:param name="page" value="${page.totalPage}" />
	</c:url>		

	<c:if test="${loginSearchDto.page < page.totalPage}">
		<a href="${listUrl}" title="${page.totalPage}페이지">[끝]</a>
	</c:if>
	<!-- 끝페이지 종료 -->
</div>
 