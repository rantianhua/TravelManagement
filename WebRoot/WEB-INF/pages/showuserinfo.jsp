<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="navigation.jsp"%>
<link
	href="${pageContext.request.contextPath }/css/show.user.detail.css"
	rel="stylesheet" />
<div class="out_wrapper">
	<div class="header">
		<h4 style="float:left;vertical_align:middle;">个人信息预览</h4>
		<button onclick="editInfo()" class="btn btn-info" style="float:right;"
			type="button">编辑</button>
	</div>
	<div class="content">
		<div style="height: 40px;"></div>
		<h4 class="red">基本信息</h4>
		<ul>
			<li><span class="text-span">身份证号：</span>${sessionScope.hr.id }</li>
			<li><span class="text-span">中文姓名：</span>${sessionScope.hr.nameCh }</li>
			<li><span class="text-span">英文姓名：</span>${sessionScope.hr.nameEn }</li>
			<li><span class="text-span">名字拼音：</span>${sessionScope.hr.namePinyin }</li>
			<li><span class="text-span">曾用姓名：</span>${sessionScope.hr.otherName }</li>
			<li><span class="text-span">性&#12288;&#12288;别：</span>${sessionScope.hr.sex }</li>
			<li><span class="text-span">出生日期：</span>${sessionScope.hr.birthday }</li>
			<li><span class="text-span">护照号码：</span>${sessionScope.hr.passport }</li>
			<li><span class="text-span">电子邮箱：</span>${sessionScope.hr.email }</li>
			<li><span class="text-span">移动电话：</span>${sessionScope.hr.mobilePhone }</li>
			<li><span class="text-span">固定电话：</span>${sessionScope.hr.fixedPhone }</li>
		</ul>
		<hr>
		<h4 class="red">身份信息</h4>
		<ul>
			<li><span class="text-span">职&#12288;&#12288;类：</span>${sessionScope.hr.category }</li>
			<li><span class="text-span">所在单位：</span>${sessionScope.hr.company }</li>
			<c:choose>
				<c:when test="${sessionScope.hr.category eq '学生' }">
					<li><span class="text-span">学&#12288;&#12288;位：</span>${sessionScope.hr.position }</li>
				</c:when>
				<c:when test="${sessionScope.hr.category eq '行政' }">
					<li><span class="text-span">职&#12288;&#12288;务：</span>${fn:substringBefore(sessionScope.hr.position,'/') }</li>
					<li><span class="text-span">职&#12288;&#12288;级：</span>${fn:substringAfter(sessionScope.hr.position,'/') }</li>
				</c:when>
				<c:when test="${sessionScope.hr.category eq '教学' }">
					<li><span class="text-span">职&#12288;&#12288;务：</span>${fn.substringBefore(sessionScope.hr.position,'/') }</li>
				</c:when>

			</c:choose>
		</ul>
		<hr>
		<h4 class="red">紧急联系人</h4>
		<ul>
			<li><span class="text-span">姓&#12288;&#12288;名：</span>${sessionScope.hr.ecp.name }</li>
			<li><span class="text-span">电子邮箱：</span>${sessionScope.hr.ecp.email }</li>
			<li><span class="text-span">移动电话：</span>${sessionScope.hr.ecp.mobilePhone }</li>
			<li><span class="text-span">固定电话：</span>${sessionScope.hr.ecp.fixedPhone }</li>
		</ul>
	</div>
</div>
<script>
	function editInfo() {
		window.location.href = "/TravelManagement/servlet/NavigationServlet?action=5";
	}
</script>
</body>
</html>
