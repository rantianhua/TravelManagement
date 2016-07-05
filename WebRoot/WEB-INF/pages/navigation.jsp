<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//String path = request.getContextPath();
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String requestUri =  request.getRequestURI();
String requestName = requestUri.substring(requestUri.lastIndexOf("/")+1,requestUri.indexOf("."));
pageContext.setAttribute("requestName", requestName);
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<link href="${pageContext.request.contextPath }/css/navigation.css" rel="stylesheet"> 
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation" style="background-color: #1ABC9C;">
		<div class="navbar-header">
			<a class="navbar-brand"  href="#" style="color:white;">出入境管理</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li <c:if test="${requestName eq 'LoginServlet'}">class="active"</c:if>><a href="" class="nav_a">个人信息</a></li>
				<li <c:if test="${requestName eq 'apply'}">class="active"</c:if>><a href="#" class="nav_a">出国申请</a></li>
				<li <c:if test="${requestName eq ''}">class="active"</c:if>><a href="#" class="nav_a">状态查询</a></li>
				<li <c:if test="${requestName eq ''}">class="active"</c:if>><a href="#" class="nav_a">回校核销</a></li>
			</ul>
		</div>
	</nav>

