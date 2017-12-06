<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/css/cate/view.css"></link>
<script type="text/javascript" src="/resources/js/cate/cate.js"></script>	

<c:url var="listUrl" value="/cate/list">		
	<c:param name="searchClass" value="${cateSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${cateSearchDto.searchKeyword}" />
	<c:param name="page" value="${cateSearchDto.page}" />
</c:url>

<c:url var="editUrl" value="/cate/edit/${cateSearchDto.no}">
	<c:param name="searchClass" value="${cateSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${cateSearchDto.searchKeyword}" />
	<c:param name="page" value="${cateSearchDto.page}" />
</c:url>

<c:url var="deleteUrl" value="/cate/deleteOk/${cateSearchDto.no}">
	<c:param name="searchClass" value="${cateSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${cateSearchDto.searchKeyword}" />
	<c:param name="page" value="${cateSearchDto.page}" />
</c:url>

<table id="tblCateView">
	<caption>※ 게시판 보기</caption>
    <tr>
        <th> 게시판명 :</th>
        <td><c:out value="${cateDto.bbsName}" escapeXml="true"></c:out></td>
    </tr>
    <tr>
        <th> 연결문자 :</th>
        <td><c:out value="${cateDto.bbsId}" escapeXml="true"></c:out></td>
    </tr>
    <tr>
        <th>리스트갯수 :</th>
        <td><c:out value="${cateDto.listSize}" escapeXml="true"></c:out></td>
    </tr>
    <tr>
        <th>페이지갯수 :</th>
        <td><c:out value="${cateDto.pageSize}" escapeXml="true"></c:out></td>
    </tr>
    <tr>
        <th>생성일 :</th>
        <td><c:out value="${cateDto.regDate}" escapeXml="true"></c:out></td>
    </tr>
    <tr>
        <th> 사용유무 :</th>
        <td><c:out value="${cateDto.useYn}" escapeXml="true"></c:out></td>
    </tr>
</table>

<div class="cssCateButton">
	<input type="image" id="imgBtnList" value="" onclick="location.href='${listUrl}'; return false;" />
	<input type="image" id="imgBtnEdit" value="" onclick="location.href='${editUrl}'; return false;" />
	<input type="image" id="imgBtnDelete" value="" onclick="imgBtnDelete_click('${deleteUrl}', '${listUrl}'); return false;" />
</div>
	