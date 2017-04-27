<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet" href="/resources/css/login/search.css"></link>
<script type="text/javascript" src="/resources/js/login/login.js"></script>	

<c:url value="/login/login" var="loginUrl"></c:url>
<c:url value="/login/searchOk" var="searchUrl"></c:url>

<form:form commandName="loginDto" method="post" action="${searchUrl}">
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
        <caption>※  아이디/비밀번호 찾기</caption>    
	    <tr>
		    <th>* 이메일 :</th>
		    <td>		        
		        <form:input path="userEmail" maxlength="100" />
		    </td>
	    </tr>
    </table>
    
    <div class="cssLoginButton">
	    <input type="image" id="imgBtnSearch" value="" onclick="imgBtnSearch_click(form); return false;" /> 
	    <input type="image" id="imgBtnLogin" value="" onclick="location.href='${loginUrl}'; return false;" /> 
    </div>

</form:form>
	