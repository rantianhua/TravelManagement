<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>重新登录</title>
</head>
<body>
	<meta http-equiv="refresh" content="3;
	url=${pageContext.request.contextPath }/web/login.jsp">
	<br>您已超过30分钟在线时间，请重新登录<br>浏览器即将跳转到登录页
</body>
</html>
