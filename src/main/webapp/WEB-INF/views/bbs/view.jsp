<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/css/bbs/view.css"></link>
<script type="text/javascript" src="/resources/js/bbs/bbs.js"></script>	

<c:url var="listUrl" value="/bbs/list/${bbsSearchDto.bbsName}">		
	<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
	<c:param name="page" value="${bbsSearchDto.page}" />
	<c:param name="listSize" value="${bbsSearchDto.listSize}" />
</c:url>

<c:url var="editUrl" value="/bbs/edit/${bbsSearchDto.bbsName}/${bbsSearchDto.no}">
	<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
	<c:param name="page" value="${bbsSearchDto.page}" />
	<c:param name="listSize" value="${bbsSearchDto.listSize}" />
</c:url>

<c:url var="deleteUrl" value="/bbs/delete/${bbsSearchDto.bbsName}/${bbsSearchDto.no}">
	<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
	<c:param name="page" value="${bbsSearchDto.page}" />
	<c:param name="listSize" value="${bbsSearchDto.listSize}" />
</c:url>
	
<c:url var="replyUrl" value="/bbs/reply/${bbsSearchDto.bbsName}/${bbsSearchDto.no}">
	<c:param name="searchClass" value="${bbsSearchDto.searchClass}" />
	<c:param name="searchKeyword" value="${bbsSearchDto.searchKeyword}" />
	<c:param name="page" value="${bbsSearchDto.page}" />
	<c:param name="listSize" value="${bbsSearchDto.listSize}" />
</c:url>
	
<sec:authorize access="isAnonymous()">
	<c:set var="isAuthenticated" value="false" />
	<c:set var="userId" value="" />
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<c:set var="isAuthenticated" value="true" />
	<sec:authentication property="principal.userId" var="userId" />
</sec:authorize>

<form:form commandName="bbsCommentDto" method="post" action="/bbs/commentOk/${bbsSearchDto.bbsName}/${bbsSearchDto.no}">			
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

	<form:hidden path="userId" value="${userId}" />
	<form:hidden path="commentType" value="Write" />
	
	<form:hidden path="bbsName" value="${bbsSearchDto.bbsName}" />
	
	<form:hidden path="pno" value="${bbsSearchDto.no}" />
	<form:hidden path="no" value="0" />
		
	<form:hidden path="preNo" value="0" />
	<form:hidden path="subNo" value="0" />
	<form:hidden path="depNo" value="0" />

	<table id="tblBbsView">
		<caption>※ 글 보기</caption>
	    <tr>
	        <th> 제목 :</th>
	        <td colspan="6"><c:out value="${bbsDto.subject}" escapeXml="true"></c:out></td>
	    </tr>
	    <tr>
	        <th> 작성자 :</th>
	        <td><c:out value="${bbsDto.userName}" escapeXml="true"></c:out></td>
	        <th>작성일 :</th>
	        <td><c:out value="${bbsDto.regDate}" escapeXml="true"></c:out></td>
	        <th> 조회수 :</th>
	        <td><c:out value="${bbsDto.viewCount}" escapeXml="true"></c:out></td>
	    </tr>
	    <tr>
	        <td colspan="6" class="cssBbsView"><c:out value="${bbsDto.content}" escapeXml="false"></c:out></td>
	    </tr>
	</table>
	
	<c:if test="${bbsFileDtoList.size() > 0}">	
		<div id="divBbsViewEmpty"></div>
		
		<table id="tblBbsViewFileListTable">
			<tr>
				<th id="thBbsViewFileListNo">번호</th>
				<th id="thBbsViewFileListFileName">파일명</th>
				<th id="thBbsViewFileListFileSize">파일크기</th>
				<th id="thBbsViewFileListDownCount">다운회수</th>
			</tr>
		<c:forEach var="bbsFileDto" items="${bbsFileDtoList}">
			<c:url var="downUrl" value="/bbs/file/${bbsFileDto.pno}/${bbsFileDto.no}"></c:url>
			<tr>
				<td id="tdBbsViewFileListNo"><c:out value="${bbsFileDto.viewNo}" escapeXml="true"></c:out></td>
				<td id="tdBbsViewFileListFileName"><a href="${downUrl}" title="${bbsFileDto.fileName}"><c:out value="${bbsFileDto.fileName}" escapeXml="true"></c:out></a></td>
				<td id="tdBbsViewFileListFileSize"><c:out value="${bbsFileDto.fileSize}" escapeXml="true"></c:out></td>
				<td id="tdBbsViewFileListDownCount"><c:out value="${bbsFileDto.downCount}" escapeXml="true"></c:out></td>
	 		</tr>					
		</c:forEach>
		</table>
	</c:if>
	
	<c:if test="${bbsCommentDtoList.size() > 0}">	
		<div id="divBbsViewEmpty"></div>
		<div id="divBbsViewEmpty"></div>
		
		<div id="divBbsViewCommentTotal">※ 전체댓글수 : ${bbsDto.comCount}</div>
		
		<c:set value="0" var="commentNo"></c:set>
		<c:forEach var="bbsCommentDto" items="${bbsCommentDtoList}">
			<c:set value="${commentNo + 1}" var="commentNo"></c:set>
			<c:set value="${15 * bbsCommentDto.depNo}" var="marginLeft"></c:set>
			<c:set value="${600 - marginLeft}" var="tableWidth"></c:set>
			
			<table id="tblBbsViewCommentTable${bbsCommentDto.no}" class="cssBbsViewCommentTable" style="margin-left: ${marginLeft}px; width: ${tableWidth}px;">
				<tr>
					<th id="thBbsViewCommentTableUserName${bbsCommentDto.no}" class="cssBbsViewCommentTableUserName">
						<c:out value="${func.getReplyImage(bbsCommentDto.depNo, 'Comment')}" escapeXml="false"></c:out>
						<c:out value="${bbsCommentDto.userName}" escapeXml="true"></c:out>
					</th>
					<th id="thBbsViewCommentTableRegDate${bbsCommentDto.no}" class="cssBbsViewCommentTableRegDate"><c:out value="${bbsCommentDto.regDate}" escapeXml="true"></c:out></th>
					<th id="thBbsViewCommentTableButton${bbsCommentDto.no}" class="cssBbsViewCommentTableButton">
						<input type="image" id="imgBtnViewCommentTableReply" onclick="imgBtnViewCommentTableReply_Click(form, ${isAuthenticated}, '${bbsCommentDto.no}', '${bbsCommentDto.preNo}', '${bbsCommentDto.subNo}', '${bbsCommentDto.depNo}'); return false;" />
						<input type="image" id="imgBtnViewCommentTableEdit" onclick="imgBtnViewCommentTableEdit_Click(form, ${isAuthenticated}, '${bbsCommentDto.no}', '${bbsCommentDto.userName}'); return false;" />
						<input type="image" id="imgBtnViewCommentTableDelete" onclick="imgBtnViewCommentTableDelete_Click(form, ${isAuthenticated}, '${bbsCommentDto.no}', '${bbsCommentDto.preNo}', '${bbsCommentDto.depNo}', '${bbsCommentDto.userName}'); return false;" />
					</th>
				</tr>
				<tr>					
					<td id="tdBbsViewCommentTableContent${bbsCommentDto.no}" class="cssBbsViewCommentTableContent" colspan="3"><c:out value="${func.replaceBR(bbsCommentDto.content)}" escapeXml="false"></c:out></td>
		 		</tr>					
			</table>
			
			<div id="divBbsViewEmpty"></div>
		</c:forEach>
	</c:if>
		
	<table id="tblBbsViewCommentContent">
		<tr>
			<td id="tdBbsViewCommentContent"><form:textarea path="content"></form:textarea></td>
		</tr>
	</table>
	
	<table id="tblBbsViewCommentWrite">			
		<tr>				
			<td id="tdBbsViewCommentUserNameEmpty"></td>
			<sec:authorize access="isAnonymous()">
		    <th>* 작성자 :</th>
		    <td id="tdBbsViewCommentWriteUserName">
		        <form:input path="userName" maxlength="20" />
		    </td>
		    <th>* 비밀번호 :</th>
		    <td id="tdBbsViewCommentWriteUserPw">
		        <form:password path="userPw" maxlength="20" />
		    </td>
		    </sec:authorize>
		    <td id="tdBbsViewCommentWriteButton">
		    	<input type="image" id="imgBtnCommentWrite" onclick="imgBtnBbsCommentWrite_Click(form, ${isAuthenticated}, 'Write'); return false;" /> 
		    	<input type="image" id="imgBtnCommentReply" onclick="imgBtnBbsCommentWrite_Click(form, ${isAuthenticated}, 'Reply'); return false;" />
		    	<input type="image" id="imgBtnCommentEdit" onclick="imgBtnBbsCommentWrite_Click(form, ${isAuthenticated}, 'Edit'); return false;" />
		    	<input type="image" id="imgBtnCommentDelete" onclick="imgBtnBbsCommentWrite_Click(form, ${isAuthenticated}, 'Delete'); return false;" />
		    </td>
		</tr>
	</table>

	<div class="cssBbsButton">
		<input type="image" id="imgBtnList" onclick="location.href='${listUrl}'; return false;" />
		<input type="image" id="imgBtnEdit" onclick="location.href='${editUrl}'; return false;" />
		<input type="image" id="imgBtnDelete" onclick="location.href='${deleteUrl}'; return false;" />
		<input type="image" id="imgBtnReply" onclick="location.href='${replyUrl}'; return false;" />
	</div>
	
</form:form>