<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/css/bbs/delete.css"></link>
<script type="text/javascript" src="/resources/js/bbs/bbs.js"></script>	

<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsName}">		
	<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
	<c:param name="page" value="${bbsSearchDto.page}" />
	<c:param name="listSize" value="${bbsSearchDto.listSize}" />
	<c:param name="pageSize" value="${bbsSearchDto.pageSize}" />
</c:url>
	
<sec:authorize access="isAnonymous()">
	<c:set var="isAuthenticated" value="false" />
	<c:set var="userId" value="" />
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<c:set var="isAuthenticated" value="true" />
	<sec:authentication property="principal.userId" var="userId" />
</sec:authorize>

<form:form commandName="bbsDto" method="post" action="/bbs/deleteOk/${bbsSearchDto.bbsName}/${bbsSearchDto.no}">
	<spring:bind path="*">
		<c:set var="loopStatus" value="true" />	
	  	<c:forEach items="${status.errorMessages}" var="error" varStatus="status">
	  		<c:if test="${loopStatus}">
		    	<script type="text/javascript">createDialog({"title" : "경고", "alertMsg" : "${error}"});</script>
		    	<c:set var="loopStatus" value="false" />
		    </c:if>
	  	</c:forEach>      
	</spring:bind>
	
	<form:hidden path="searchClass" value="${bbsSearchDto.searchClass}" />
	<form:hidden path="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
	<form:hidden path="page" value="${bbsSearchDto.page}" />
	<form:hidden path="listSize" value="${bbsSearchDto.listSize}" />
	<form:hidden path="pageSize" value="${bbsSearchDto.pageSize}" />
	
	<form:hidden path="subject" value="${bbsDto.subject}" />
	<form:hidden path="userName" value="${bbsDto.userName}" />
	<form:hidden path="regDate" value="${bbsDto.regDate}" />
	<form:hidden path="content" value="${bbsDto.content}" />

	<form:hidden path="userId" value="${userId}" />

    <table class="cssBbsTable">
        <caption>※  글 삭제</caption>    
	    <tr>
		    <th>* 제목 :</th>
		    <td>${bbsDto.subject}</td>
	    </tr>
	    <tr>
		    <th>* 작성자 :</th>
		    <td>${bbsDto.userName}</td>
	    </tr>
	    <sec:authorize access="isAnonymous()">
	    <tr>
		    <th>* 비밀번호 :</th>
		    <td><form:password path="userPw" size="15" /></td>
	    </tr>
	    </sec:authorize>
    </table>
    
    <div class="cssBbsButton">
	    <input type="image" id="imgBtnDelete" value="" onclick="imgBtnBbsDelete_click(form, ${isAuthenticated}); return false;" /> 
	    <input type="image" id="imgBtnList" value="" onclick="location.href='${listUrl}'; return false;" />
    </div>
    
</form:form>		
