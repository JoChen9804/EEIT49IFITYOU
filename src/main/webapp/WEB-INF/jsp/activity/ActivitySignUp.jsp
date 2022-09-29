<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I FIT YOU</title>
</head>
<body>
<%@ include file="../admin/FrontStageHead.jsp"%>

	<br><br><br><br><br><br><br><br>
	
	<h1>${activityId}</h1>
	
	
	<a  href="/group5/toactivity/${activityId}"  style="text-decoration:none;">
		<button class="btn-solid-reg page-scroll">返回</button>
	</a>

<%@ include file="../admin/FrontStageFoot.jsp"%>
</body>
</html>