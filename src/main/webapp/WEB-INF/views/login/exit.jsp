<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet" href="/resources/css/login/exit.css"></link>
<script type="text/javascript" src="/resources/js/login/login.js"></script>	

<c:url value="/login/exitOk" var="exitUrl"></c:url>
<c:url value="/login/modify" var="modifyUrl"></c:url>

<form:form commandName="loginDto" method="post" action="${exitUrl}">
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
        <caption>※  회원탈퇴</caption>    
        <tr>
        	<th>*</th>
        	<td>
        		<br/>
		    	회원 탈되하시면 같은 ID로 가입할 수 없습니다. <br/>
		    	탈퇴하시려면 비밀번호를 입력해 주세요!	<br/>	 
		    	<br/> 	
		    </td>
		</tr>
	    <tr>
		    <th>* 아이디 :</th>
		    <td>
		        <form:input path="userId" maxlength="20" readonly="true" />
		    </td>
	    </tr>
	    <tr>
		    <th>* 비밀번호 :</th>
		    <td>
		        <form:password path="userPw" maxlength="20" />
		    </td>
	    </tr>
    </table>
    
    <div class="cssLoginButton">
	    <input type="image" id=imgBtnExit value="" onclick="imgBtnExit_click(form); return false;" /> 
	    <input type="image" id="imgBtnModify" value="" onclick="location.href='${modifyUrl}'; return false;" />
    </div>

</form:form>