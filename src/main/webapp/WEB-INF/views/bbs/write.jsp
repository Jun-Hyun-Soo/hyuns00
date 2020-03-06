<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/css/bbs/write.css"></link>
<script type="text/javascript" src="/resources/js/bbs/bbs.js"></script>	
	
<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsId}">
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

<form:form commandName="bbsDto" method="post" enctype="multipart/form-data" action="/bbs/writeOk/${bbsSearchDto.bbsId}" cssClass="form-horizontal" role="form">
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
	
	<form:hidden path="deleteBbsFileNo" value="" />		
	<form:hidden path="userId" value="${userId}" />
   
	<div class="form-group">
		<label class="control-label col-sm-2" for="subject">* 제목 :</label>
		<div class="control col-sm-10">
			
		</div>
	</div>
	
      <div class="row">
        <div class="input-field col s6">
          <input placeholder="Placeholder" id="first_name" type="text" class="validate">
          <label for="first_name">First Name</label>
        </div>
        <div class="input-field col s6">
          <input id="last_name" type="text" class="validate">
          <label for="last_name">Last Name</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input disabled value="I am not editable" id="disabled" type="text" class="validate">
          <label for="disabled">Disabled</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="password" type="password" class="validate">
          <label for="password">Password</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="email" type="email" class="validate">
          <label for="email">Email</label>
        </div>
      </div>
      <div class="row">
        <div class="col s12">
          This is an inline input field:
          <div class="input-field inline">
            <input id="email_inline" type="email" class="validate">
            <label for="email_inline">Email</label>
            <span class="helper-text" data-error="wrong" data-success="right">Helper text</span>
          </div>
        </div>
      </div>
	

    <table class="cssBbsTable">
        <caption>※  글 쓰기</caption>    
	    <tr>
		    <th>* 제목 :</th>
		    <td colspan="3">
		    	<form:input path="subject" cssClass="form-control" placeholder="제목을 입력해 주세요!" />
		    </td>
	    </tr>
		<sec:authorize access="isAnonymous()">		    
	    <tr>
		    <th>* 작성자 :</th>
		    <td>
		        <form:input path="userName" maxlength="20" />
		    </td>
		    <th>* 비밀번호 :</th>
		    <td>
		        <form:password path="userPw" maxlength="20" />
		    </td>
	    </tr>
	    <tr>
		    <th> 이메일 :</th>
		    <td colspan="3">
		        <form:input path="userEmail" maxlength="200" />
		    </td>
	    </tr>
		</sec:authorize>		    
	    <tr>
		    <td colspan="4">
		        <form:textarea path="content"></form:textarea>
		    </td>
	    </tr>
	    <tr>
		    <th>* 공지글 :</th>
		    <td colspan="3">
		    	<form:radiobutton path="noticeYn" label="예" value="Y" />
				<form:radiobutton path="noticeYn" label="아니오" value="N" checked="true" />
		    </td>
	    </tr>
	    <tr>
		    <th> 파일 :</th>
		    <td colspan="3">
		    	<span id="spnFileName0">
		    		<input type="file" id="fileName_0" name="fileNameList" class="cssFileName" onchange="fileName_change(this, 0); return false;" />
		    	</span>
		    	<span id="spnNextFileName_1"></span><input type="image" id="imgBtnDeleteFileName" value="" onclick="imgBtnDelFileName_click(); return false;" /><br>
		    	<form:select path="selectFileName" multiple="multiple"></form:select>
		    </td>
	    </tr>
    </table>
    
    <div class="cssBbsButton">
	    <input type="image" id="imgBtnWrite" value="" onclick="imgBtnBbsWrite_click(form, ${isAuthenticated}, 'Write'); return false;" /> 
	    <input type="image" id="imgBtnList" value="" onclick="location.href='${listUrl}'; return false;" />
    </div>
    
</form:form>

