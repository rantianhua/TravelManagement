<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp"%>
<link
	href="${pageContext.request.contextPath }/css/show.user.detail.css"
	rel="stylesheet" />
<c:set var="none" scope="request" value="${empty requestScope.passport}" />
<div class="out_wrapper">
	<div class="header">
		<h4 style="float:left;vertical_align:middle;">证照信息预览</h4>
		<button onclick="editInfo()" class="btn btn-info" style="float:right;"
			type="button">编辑</button>
	</div>
	<div class="content">
		<div style="height: 40px;"></div>
		<h4 class="red">护照信息</h4>
		<ul>
			<li><span class="text-span">护照名称：</span>${requestScope.passport.passportName }</li>
			<li><span class="text-span">姓&#12288;&#12288;名：</span>${none ? sessionScope.hr.nameCh:requestScope.passport.name}</li>
			<li><span class="text-span">性&#12288;&#12288;别：</span>${none ? sessionScope.hr.sex:requestScope.passport.sex }</li>
			<li><span class="text-span">签发地区：</span>${requestScope.passport.issuingPlace }</li>
			<li><span class="text-span">出生日期：</span>${none ? sessionScope.hr.birthday:requestScope.passport.birthday }</li>
			<li><span class="text-span">有效日期：</span>${requestScope.passport.expDate }</li>
		</ul>
		<hr>
		<h4 class="red">护照照片</h4>
		<img id="img"
			src="${pageContext.request.contextPath }${requestScope.passport.img }"
			onerror="this.src='../img/default/default.png';this.onerror=null">
		<hr>
		<h4 class="red">身份证照片</h4>
		<img id="img"
			src="${pageContext.request.contextPath }${requestScope.passport.idCard }"
			onerror="this.src='../img/default/default.png';this.onerror=null">
		<hr>
		<h4 class="red">户口本照片</h4>
		<img id="img"
			src="${pageContext.request.contextPath }${requestScope.passport.accountBook }"
			onerror="this.src='../img/default/default.png';this.onerror=null">
	</div>
</div>
<script>
	function editInfo() {
		window.location.href = "/TravelManagement/servlet/NavigationServlet?action=8";
	}
</script>
</body>
</html>
