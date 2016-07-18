<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="/resources/css/login/failure.css"></link>
<script type="text/javascript" src="/resources/js/login/login.js"></script>	

<h4>로그인에 실패하였습니다.</h4>

<ul>
	<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != NULL}">
		Message : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"></c:out>
	</c:if>
</ul>	