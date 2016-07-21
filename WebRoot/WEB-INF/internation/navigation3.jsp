<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String action = request.getParameter("action");
	if (request.getAttribute("action") != null) {
		action = (String) request.getAttribute("action");
	}
	pageContext.setAttribute("action", action == null ? "1" : action);
%>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<link href="${pageContext.request.contextPath }/css/navigation.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		style="background-color: #1ABC9C;">
		<div class="navbar-header">
			<a class="navbar-brand" href="#" style="color:white;">出入境管理（${sessionScope.hr.nameCh }）</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li <c:if test="${action eq '1' }">class="active"</c:if>><a
					href="${pageContext.request.contextPath }/servlet/NavigationServlet3?action=1"
					class="nav_a">申请审核</a></li>
				<li <c:if test="${action eq '2' }">class="active"</c:if>><a
					href="${pageContext.request.contextPath }/servlet/NavigationServlet3?action=2"
					class="nav_a">核销审核</a></li>
			</ul>
		</div>
	</nav>