<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet" href="/resources/css/login/join.css"></link>
<script type="text/javascript" src="/resources/js/login/login.js"></script>	

<c:url value="/login/login" var="loginUrl"></c:url>
<c:url value="/login/joinOk" var="joinUrl"></c:url>

<form:form commandName="loginDto" method="post" action="${joinUrl}">
	<spring:bind path="*">
		<c:set var="loopStatus" value="true"/>	
	  	<c:forEach items="${status.errorMessages}" var="error" varStatus="status">
	  		<c:if test="${loopStatus}">
		    	<script type="text/javascript">createDialog({"title" : "경고", "alertMsg" : "${error}"});</script>
		    	<c:set var="loopStatus" value="false"/>
		    </c:if>
	  	</c:forEach>      
	</spring:bind>
	
	<form:hidden path="checkUserId" value="N" />
	
    <table class="cssLoginTable">
        <caption>※  회원가입</caption>    
	    <tr>
		    <th>* 아이디 :</th>
		    <td>
		        <form:input path="userId" maxlength="20" />
		        <input type="image" id="imgBtnCheckUserId" onclick="imgBtnCheckUserId_click(form); return false;" />
		    </td>
		    <th>* 이름 :</th>
		    <td>
		        <form:input path="userName" maxlength="20" />
		    </td>
	    </tr>
	    <tr>
		    <th>* 비밀번호 :</th>
		    <td>
		        <form:password path="userPw1" maxlength="20" />
		    </td>
		    <th>* 비밀번호 확인 :</th>
		    <td>
		        <form:password path="userPw2" maxlength="20" />
		    </td>
	    </tr>
	    <tr>
		    <th>* 닉네임 :</th>
		    <td>
		        <form:input path="nickName" maxlength="20" />
		    </td>
		    <th>* 이메일 :</th>
		    <td>		        
		        <form:input path="userEmail" maxlength="20" />
		    </td>
	    </tr>
	    <tr>
		    <th>* 보안질문 :</th>
		    <td>
		        <form:input path="question" maxlength="20" />
		    </td>
		    <th>* 보안대답 :</th>
		    <td>
		        <form:input path="answer" maxlength="20" />
		    </td>
	    </tr>
	    <tr>
		    <th>* 이미지 :</th>
		    <td colspan="3">
		        <input type="file" id="imageUrl" name="imageUrl" />
		    </td>
	    </tr>
    </table>
    
    <div class="cssLoginButton">
	    <input type="image" id="imgBtnJoin" onclick="imgBtnJoin_click(form); return false;" /> 
	    <input type="image" id="imgBtnLogin" onclick="location.href='${loginUrl}'; return false;" /> 
    </div>

</form:form>
	