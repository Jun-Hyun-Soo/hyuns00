<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet" href="/resources/css/login/login.css"></link>
<script type="text/javascript" src="/resources/js/login/login.js"></script>	

<c:url value="/login/logOk" var="loginUrl"></c:url>
<c:url value="/login/search" var="searchUrl"></c:url>
<c:url value="/login/join" var="joinUrl"></c:url>

<form:form commandName="loginDto" method="post" action="${loginUrl}">
	<spring:bind path="*">
		<c:set var="loopStatus" value="true"/>	
	  	<c:forEach items="${status.errorMessages}" var="error" varStatus="status">
	  		<c:if test="${loopStatus}">
		    	<script type="text/javascript">createDialog({"title" : "경고", "alertMsg" : "${error}"});</script>
		    	<c:set var="loopStatus" value="false"/>
		    </c:if>
	  	</c:forEach>      
	</spring:bind>
	
    <table class="cssLoginTable">	
        <caption>※  로그인</caption>    
	    <tr>
		    <th>* 아이디 :</th>
		    <td colspan="3">
		        <form:input path="userId" maxlength="20" />
		    </td>
	    </tr>
	    <tr>
		    <th>* 비밀번호 :</th>
		    <td>
		        <form:password path="userPw" maxlength="20" />
		    </td>
		    <td>
		    	<form:checkbox path="rememberMe" id="rememberMe" /> <label for="rememberMe">자동 로그인</label>
		    </td>
		    <td>
		    </td>
	    </tr>
    </table>
    
    <div class="cssLoginButton">
	    <input type="image" id="imgBtnLogin" onclick="imgBtnLogin_click(form); return false;" /> 
	    <input type="image" id="imgBtnSearch" onclick="location.href='${searchUrl}'; return false;" /> 
	    <input type="image" id="imgBtnJoin" onclick="location.href='${joinUrl}'; return false;" /> 
    </div>

</form:form>