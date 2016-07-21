<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String action = request.getParameter("action");
	if(request.getAttribute("action")!=null){
		action = (String)request.getAttribute("action");
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
			<a class="navbar-brand" href="#" style="color:white;">出入境管理</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li <c:if test="${action eq '1' || action eq '12'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath }/servlet/NavigationServlet?action=1"
					class="nav_a">公示信息</a></li>
				<li
					<c:if test="${action eq '2' || action eq '7'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath }/servlet/NavigationServlet?action=2"
					class="nav_a">个人信息</a></li>
				<li <c:if test="${action eq '3' || action eq '8'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath }/servlet/NavigationServlet?action=3"
					class="nav_a">证照管理</a></li>
				<li <c:if test="${action eq '4' || action eq '9' || action eq '11'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath }/servlet/NavigationServlet?action=4"
					class="nav_a">出国申请</a></li>
				<li <c:if test="${action eq '5' || action eq '10'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath }/servlet/NavigationServlet?action=5"
					class="nav_a">状态查询</a></li>
				<li <c:if test="${action eq '6'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath }/servlet/NavigationServlet?action=6"
					class="nav_a">回校核销</a></li>
					<li <c:if test="${action eq '0'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath }/servlet/NavigationServlet?action=0"
					class="nav_a">查看核销</a></li>
			</ul>
		</div>
	</nav>