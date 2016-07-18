<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
	<title><tiles:getAsString name="title" /></title>
	<link rel="stylesheet" href="/resources/css/jquery/jquery-ui.css"></link>
	<link rel="stylesheet" href="/resources/css/common/common.css"></link>
	<link rel="stylesheet" href="/resources/css/layouts/layout.css"></link>
	<link rel="stylesheet" href="/resources/css/main/main.css"></link>
	<script type="text/javascript" src="/resources/js/jquery/jquery-2.2.0.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery-ui.js"></script>
	<script type="text/javascript" src="/resources/js/function/function.js"></script>
	<script type="text/javascript" src="/resources/js/common/common.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {			
			var alertMsg = "${alertMsg}";
	
			if (alertMsg != "") {
				createDialog({"title" : "경고", "alertMsg" : alertMsg});
			}
			
			pageLoad();
		});
		
		function pageLoad() {}
	</script>
</head>
<body>
	<div id="divMain">
		<!-- 상단 레이아웃 -->
	    <div id="divTop">
	    	<tiles:insertAttribute name="top" />
	    </div>
	    <!-- 좌측 레이아웃 -->
	    <div id="divLeft">
	    	<tiles:insertAttribute name="left" />
	    </div>
	    <!-- 중앙 레이아웃 -->
	    <div id="divCenter">
	    	<tiles:insertAttribute name="center" />
	    </div>
	    <!-- 우측 레이아웃 -->
	    <div id="divRight">
	    	<tiles:insertAttribute name="right" />
	    </div>  
	    <!-- 하단 레이아웃 -->
	    <div id="divBottom">
	    	<tiles:insertAttribute name="bottom" />
	    </div>   
	</div>        
</body>
</html>
