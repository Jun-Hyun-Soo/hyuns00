<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/css/home/home.css"></link>

<script type="text/javascript">
	function pageLoad() {
		createComboBox({"id" : "cboCate", "url" : "/common/comboJson?comboType=cate"});
	}
</script>

Home <br />
${serverTime} <br />

<c:url value="/login/login" var="loginUrl"></c:url>
<c:url value="/login/logout" var="logoutUrl"></c:url>
<c:url value="/login/modify" var="modifyUrl"></c:url>
<c:url value="/bbs/list/free" var="bbsFreeUrl"></c:url>

<sec:authorize access="isAnonymous()">
	<a href="${loginUrl}">로그인</a>
</sec:authorize>

<sec:authorize access="isAuthenticated()">		
	<a href="${logoutUrl}">로그아웃</a>
	<a href="${modifyUrl}/<sec:authentication property="principal.userId"/>">정보수정</a>
	<a href="${bbsFreeUrl}">자유게시판</a>
	
	<p>principal : <sec:authentication property="principal"/></p> 
	
	<p>principal.userEmail : <sec:authentication property="principal.userEmail"/></p> 
	
	<p>principal.userName : <sec:authentication property="principal.userName"/></p> 

	<p>principal.username : <sec:authentication property="principal.username"/></p>
	
	<p>principal.password : <sec:authentication property="principal.password"/></p>
			
	<p>principal.enabled : <sec:authentication property="principal.enabled"/></p>
	
	<p>principal.accountNonExpired : <sec:authentication property="principal.accountNonExpired"/></p>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_ADMIN')" var="u">${u}</sec:authorize>

<select id="cboCate"></select>
<input type="button" value="경고" onclick="createDialog({'title' : '경고', 'alertMsg' : '경고창입니다.'});">




	