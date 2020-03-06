<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8" /> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><tiles:getAsString name="title" /></title>	
	<link rel="stylesheet" href="/resources/jquery/css/jquery-ui.min.css"></link>
	<link rel="stylesheet" href="/resources/jquery/css/jquery-ui.theme.min.css"></link>
	<link rel="stylesheet" href="/resources/jquery/css/jquery-ui.structure.min.css"></link>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="/resources/materialize/css/materialize.min.css"></link>
	<link rel="stylesheet" href="/resources/css/layouts/default/layout.css"></link>
	<link rel="stylesheet" href="/resources/css/common/common2.css"></link>
	<script type="text/javascript" src="/resources/jquery/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/resources/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/resources/materialize/js/materialize.min.js"></script>
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
		<div class="row">
		    <div id="divTop" class="col m12">
		    	<tiles:insertAttribute name="top" />
		    </div>
		</div>
	    <!-- 좌측 레이아웃 -->
	    <div class="row">
		    <div id="divLeft" class="col m2">
		    	<tiles:insertAttribute name="left" />
		    </div>
			<!-- 중앙 레이아웃 -->
		    <div id="divCenter" class="col m8">
		    	<tiles:insertAttribute name="center" />
		    </div>
	    	<!-- 우측 레이아웃 -->
		    <div id="divRight" class="col m2">
		    	<tiles:insertAttribute name="right" />
		    </div>  
		</div>
	    <!-- 하단 레이아웃 -->
	    <div class="row">
		    <div id="divBottom" class="col m12">
		    	<tiles:insertAttribute name="bottom" />
		    </div>   
		</div>
	</div>        
</body>
</html>
