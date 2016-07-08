<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<title>错误</title>
</head>
<body>
	<meta http-equiv="refresh" content="3;
	url=${pageContext.request.contextPath }/web/login.jsp">
	<br>${requestScope.returnInfo }
	<br>浏览器即将跳转到登录页
</body>
</html>
