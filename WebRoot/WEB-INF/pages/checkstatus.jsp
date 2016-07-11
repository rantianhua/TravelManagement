<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="navigation.jsp"%>
<link href="${pageContext.request.contextPath }/css/check.status.css"
	rel="stylesheet" />
<script>
	function checkdetail(appNo) {
		location.href = '${pageContext.request.contextPath}/servlet/ShowApplicationServlet?appNo='
				+ appNo;
	}
</script>
<div class="contianer">
	<h4 class="red">我的申请</h4>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>申请编号</th>
				<th>申请时间</th>
				<th>出行目的</th>
				<th>出行时长</th>
				<th>申请状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="apply" items="${requestScope.ownApply }">
				<tr onclick="checkdetail('${apply.applicationNumber }')">
					<td>${apply.applicationNumber }</td>
					<td>${apply.applyDate }</td>
					<td>${apply.purposeContent }</td>
					<td>${apply.type }</td>
					<td>${apply.state }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<h4 class="red">委托申请</h4>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>申请编号</th>
				<th>委托人身份证号</th>
				<th>申请时间</th>
				<th>出行目的</th>
				<th>出行时长</th>
				<th>申请状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="apply" items="${requestScope.assigneeApply }">
				<tr onclick="checkdetail('${apply.applicationNumber }')">
					<td>${apply.applicationNumber }</td>
					<td>${apply.assigneeId }</td>
					<td>${apply.applyDate }</td>
					<td>${apply.purposeContent }</td>
					<td>${apply.type }</td>
					<td>${apply.state }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>