<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>欢迎</title>
<link href="${pageContext.request.contextPath }/css/index.css"
	rel="stylesheet" />
</head>

<body>
	<meta http-equiv="refresh"
		content="3;
	url=${pageContext.request.contextPath }/web/login.jsp">
	<div class="spinner">
		<div class="rect1"></div>
		<div class="rect2"></div>
		<div class="rect3"></div>
		<div class="rect4"></div>
		<div class="rect5"></div>
	</div>
	<p id="welcome">正在进入山东大学出入境管理系统</p>
</body>
</html>