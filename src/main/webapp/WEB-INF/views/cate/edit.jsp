<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/css/cate/edit.css"></link>
<script type="text/javascript" src="/resources/js/cate/cate.js"></script>	
	
<c:url var="listUrl" value="/cate/list">
	<c:param name="searchClass" value="${cateSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${cateSearchDto.searchKeyword}" />
	<c:param name="page" value="${cateSearchDto.page}" />
</c:url>

<form:form commandName="cateDto" method="post" action="/cate/editOk/${cateDto.no}">
	<spring:bind path="*">
		<c:set var="loopStatus" value="true" />	
	  	<c:forEach items="${status.errorMessages}" var="error" varStatus="status">
	  		<c:if test="${loopStatus}">
		    	<script type="text/javascript">createDialog({"title" : "경고", "alertMsg" : "${error}"});</script>
		    	<c:set var="loopStatus" value="false" />
		    </c:if>
	  	</c:forEach>      
	</spring:bind>
	
	<form:hidden path="searchClass" value="${cateSearchDto.searchClass}" />
	<form:hidden path="searchKeyword" value="${cateSearchDto.searchKeyword}" />
	<form:hidden path="page" value="${cateSearchDto.page}" />
	
	<form:hidden path="bbsIdYn" value="N" />
	
	<form:hidden path="no" value="${cateDto.no}" />
	    
    <table class="cssCateTable">	
        <caption>※  게시판 수정</caption>    
	    <tr>
		    <th>* 게시판명 :</th>
		    <td>
		        <form:input path="bbsName" maxlength="42" />
		    </td>
	    </tr>
	    <tr>
		    <th>* 연결문자 :</th>
		    <td>
		        <form:input path="bbsId" maxlength="20" readonly="true" />
		    </td>
	    </tr>
	    <tr>
		    <th>* 리스트갯수 :</th>
		    <td>
				<form:radiobutton path="listSize" value="5" label="5" />
				<form:radiobutton path="listSize" value="10" label="10" />
				<form:radiobutton path="listSize" value="15" label="15" />
				<form:radiobutton path="listSize" value="20" label="20" />	        
		    </td>
	    </tr>
	    <tr>
		    <th> 페이지갯수 :</th>
		    <td>
				<form:radiobutton path="pageSize" value="5" label="5" />
				<form:radiobutton path="pageSize" value="10" label="10" />
				<form:radiobutton path="pageSize" value="15" label="15" />
				<form:radiobutton path="pageSize" value="20" label="20" />	        
		    </td>
	    </tr>
	    <tr>
		    <th> 사용유무 :</th>
		    <td>
				<form:radiobutton path="useYn" value="Y" label="예" />
				<form:radiobutton path="useYn" value="N" label="아니오" />
		    </td>
	    </tr>
    </table>
    
    <div class="cssCateButton">
	    <input type="image" id="imgBtnEdit" value="" onclick="imgBtnCateEdit_click(form); return false;" /> 
	    <input type="image" id="imgBtnList" value="" onclick="location.href='${listUrl}'; return false;" />
    </div>
    
</form:form>
