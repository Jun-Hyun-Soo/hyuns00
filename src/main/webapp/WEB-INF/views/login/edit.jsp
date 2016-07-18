<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet" href="/resources/css/login/edit.css"></link>
<script type="text/javascript" src="/resources/js/login/login.js"></script>	

<script type="text/javascript">
	function pageLoad() {
		createComboBox({"id" : "facId", "url" : "/common/comboJson?comboType=code&groupCode=A01", "type" : "S", "selectedId" : "${loginDto.facId}", "multipleSelect" : false});
	}
</script>

<c:url value="/login/login" var="loginUrl"></c:url>
<c:url value="/login/editOk" var="editUrl"></c:url>

<form:form commandName="loginDto" method="post" action="${editUrl}">
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
        <caption>※  회원가입</caption>    
	    <tr>
		    <th>* 아이디 :</th>
		    <td>
		        <form:input path="userId" maxlength="20" disabled="disabled" />
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
		    <th>* 전화번호 :</th>
		    <td>
		        <form:input path="userTel" maxlength="20" />
		    </td>
		    <th>* 공정 :</th>
		    <td>		        
		        <form:select path="facId"></form:select>
		    </td>
	    </tr>
	    <tr>
		    <th>* 부서코드 :</th>
		    <td>
		        <form:input path="deptId" maxlength="20" />
		    </td>
		    <th>* 부서명 :</th>
		    <td>
		        <form:input path="deptName" maxlength="20" />
		    </td>
	    </tr>
    </table>
    
    <div class="cssLoginButton">
	    <input type="image" id="imgBtnEdit" onclick="imgBtnEdit_click(form); return false;" /> 
	    <input type="image" id="imgBtnLogin" onclick="location.href='${loginUrl}'; return false;" /> 
    </div>

</form:form>
	