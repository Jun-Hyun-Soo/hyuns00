<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/css/home/home.css"></link>

Home <br />
${serverTime} <br />

<c:url value="/login/login" var="loginUrl"></c:url>
<c:url value="/login/logout" var="logoutUrl"></c:url>

<sec:authorize access="isAnonymous()">
	<a href="${loginUrl}">로그인</a>
</sec:authorize>

<sec:authorize access="isAuthenticated()">		
	<a href="${logoutUrl}">로그아웃</a>	
	
	<p>principal : <sec:authentication property="principal"/></p> 
	
	<p>principal.email : <sec:authentication property="principal.email"/></p> 
	
	<p>principal.userName : <sec:authentication property="principal.userName"/></p> 

	<p>principal.username : <sec:authentication property="principal.username"/></p>
	
	<p>principal.password : <sec:authentication property="principal.password"/></p>
			
	<p>principal.enabled : <sec:authentication property="principal.enabled"/></p>
	
	<p>principal.accountNonExpired : <sec:authentication property="principal.accountNonExpired"/></p>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_USER')" var="u">${u}</sec:authorize> 



<script type="text/javascript">
	function pageLoad() {
		createDatePicker({"id" : "txtDate"});
		
		createComboBox({"id" : "loginYn", "url" : "/common/comboJson?comboType=code&groupCode=LOGIN_YN", "type" : "", "selectedId" : "", "multipleSelect" : false});
		
		var init = {};

		createJsTree(init);
	}

	// 트리 생성
	function createJsTree(init) {
		var url ="";

		url = "/common/treeJson?date=" + $.now();
		
		$("#Tree").jstree("destroy");
		
		$("#Tree").jstree({
		     "plugins" 	: 	[ "checkbox" ],
		     "core" 	: 	{
								"data" 	: 	{
				    							"url" 		: url,
				    							"dataType" 	: "json" 
											}
							}
		});    	    	
		
		$(function () {
			$("#Tree").on("changed.jstree", function (e, data) {
			}).jstree();
			
		 	$("#Tree").bind("loaded.jstree", function(event, data) {
			    data.instance.open_all();
			}).jstree();
		});
	};	
</script>

<input type="text" id="txtDate" name="txtDate">
<select id="loginYn" name="loginYn" style="width: 150px;"></select>
<input type="button" value="경고" onclick="createDialog({'title' : '경고', 'alertMsg' : '경고창입니다.'});">

<div id="Tree"></div>



	