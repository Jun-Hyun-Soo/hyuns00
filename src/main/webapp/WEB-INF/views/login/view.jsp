<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/css/login/view.css"></link>
<script type="text/javascript" src="/resources/js/login/login.js"></script>	

<c:url var="listUrl" value="/login/list">		
	<c:param name="searchClass" value="${loginSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${loginSearchDto.searchKeyword}" />
	<c:param name="page" value="${loginSearchDto.page}" />
</c:url>

<c:url var="editUrl" value="/login/edit/${loginSearchDto.userNo}">
	<c:param name="searchClass" value="${loginSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${loginSearchDto.searchKeyword}" />
	<c:param name="page" value="${loginSearchDto.page}" />
</c:url>

<c:url var="deleteUrl" value="/login/deleteOk/${loginSearchDto.userNo}">
	<c:param name="searchClass" value="${loginSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${loginSearchDto.searchKeyword}" />
	<c:param name="page" value="${loginSearchDto.page}" />
</c:url>

<table id="tblLoginView">
	<caption>※ 사용자 보기</caption>
    <tr>
        <th>사용자ID :</th>
        <td><c:out value="${loginDto.userId}" escapeXml="true"></c:out></td>
    </tr>
    <tr>
        <th>사용자명 :</th>
        <td><c:out value="${loginDto.userName}" escapeXml="true"></c:out></td>
    </tr>
    <tr>
        <th>닉네임 :</th>
        <td><c:out value="${loginDto.userNick}" escapeXml="true"></c:out></td>
    </tr>
    <tr>
        <th>권한 :</th>
        <td><c:out value="${loginDto.userRole}" escapeXml="true"></c:out></td>
    </tr>
    <tr>
        <th>이메일 :</th>
        <td><c:out value="${loginDto.userEmail}" escapeXml="true"></c:out></td>
    </tr>
    <tr>
        <th>가입일 :</th>
        <td><c:out value="${loginDto.joinDate}" escapeXml="true"></c:out></td>
    </tr>
    <tr>
        <th>마지막접속일 :</th>
        <td><c:out value="${loginDto.lastDate}" escapeXml="true"></c:out></td>
    </tr>
    <tr>
        <th>탈퇴일 :</th>
        <td><c:out value="${loginDto.exitDate}" escapeXml="true"></c:out></td>
    </tr>
    <tr>
        <th>탈퇴유무 :</th>
        <td><c:out value="${loginDto.exitYn}" escapeXml="true"></c:out></td>
    </tr>
    <tr>
        <th>방문횟수 :</th>
        <td><c:out value="${loginDto.visitCount}" escapeXml="true"></c:out></td>
    </tr>
    <tr>
        <th>이미지 :</th>
        <td><img src="/upload/<c:out value="${loginDto.currImagePath}" escapeXml="true"></c:out>s_<c:out value="${loginDto.currImageName}" escapeXml="true"></c:out>" /></td>
    </tr>
</table>

<div class="cssLoginButton">
	<input type="image" id="imgBtnList" value="" onclick="location.href='${listUrl}'; return false;" />
	<input type="image" id="imgBtnEdit" value="" onclick="location.href='${editUrl}'; return false;" />
	<input type="image" id="imgBtnDelete" value="" onclick="imgBtnDelete_click('${deleteUrl}', '${listUrl}'); return false;" />
</div>
	