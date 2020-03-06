<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet" href="/resources/css/login/modify.css"></link>
<script type="text/javascript" src="/resources/js/login/login.js"></script>	

<script type="text/javascript">
	function pageLoad() {
		loadImageUrl();
	}
	
	function loadImageUrl() {
		$("#imgPreview").attr("src", "/upload" + $("#currImagePath").val() + "s_" + $("#currImageName").val());
	}
</script>

<c:url value="/login/login" var="loginUrl"></c:url>
<c:url value="/login/modifyOk" var="modifyUrl"></c:url>
<c:url value="/login/exit/${loginDto.userId}" var="exitUrl"></c:url>

<form:form commandName="loginDto" method="post" enctype="multipart/form-data" action="${modifyUrl}">
	<spring:bind path="*">
		<c:set var="loopStatus" value="true"/>	
	  	<c:forEach items="${status.errorMessages}" var="error" varStatus="status">
	  		<c:if test="${loopStatus}">
		    	<script type="text/javascript">createDialog({"title" : "경고", "alertMsg" : "${error}"});</script>
		    	<c:set var="loopStatus" value="false"/>
		    </c:if>
	  	</c:forEach>      
	</spring:bind>
	
	<form:hidden path="currUserNick" />
	<form:hidden path="currUserEmail" />
	<form:hidden path="currImagePath" />
	<form:hidden path="currImageName" />
	
	<form:hidden path="userNickYn" value="N" />
	<form:hidden path="userEmailYn" value="N" />	
	
    <table class="cssLoginTable">
        <caption>※  회원수정</caption>    
	    <tr>
		    <th>* 아이디 :</th>
		    <td>
		        <form:input path="userId" maxlength="20" readonly="true" />
		    </td>
		    <th>* 이름 :</th>
		    <td>
		        <form:input path="userName" maxlength="20" />
		    </td>
	    </tr>
	    <tr>
		    <th>* 현재 비밀번호 :</th>
		    <td colspan="3">
		        <form:password path="userPw" maxlength="20" />
		    </td>
	    </tr>
	    <tr>
		    <th>* 신규 비밀번호 :</th>
		    <td>
		        <form:password path="userPw1" maxlength="20" />
		    </td>
		    <th>* 신규 비밀번호 확인 :</th>
		    <td>
		        <form:password path="userPw2" maxlength="20" />
		    </td>
	    </tr>
	    <tr>
		    <th>* 닉네임 :</th>
		    <td colspan="3">
		        <form:input path="userNick" maxlength="20" />
		        <input type="image" id="imgBtnUserNickYn" value="" onclick="imgBtnUserNickYn_click(form); return false;" />
		    </td>
	    </tr>
	    <tr>
		    <th>* 이메일 :</th>
		    <td colspan="3">		        
		        <form:input path="userEmail" maxlength="100" />
		        <input type="image" id="imgBtnUserEmailYn" value="" onclick="imgBtnUserEmailYn_click(form); return false;" />
		    </td>
	    </tr>
	    <tr>
		    <th>* 이미지 :</th>
		    <td colspan="3">
		    	<img src="" id="imgPreview" /><br />
		        <input type="file" id="imageUrl" name="fileNameList" onchange="imageUrl_change(this);" />
		    </td>
	    </tr>
    </table>
    
    <div class="cssLoginButton">
	    <input type="image" id="imgBtnModify" value="" onclick="imgBtnModify_click(form); return false;" /> 
	    <input type="image" id="imgBtnLogin" value="" onclick="location.href='${loginUrl}'; return false;" /> 
	    <input type="image" id="imgBtnExit" value="" onclick="location.href='${exitUrl}'; return false;" /> 
    </div>

</form:form>
	