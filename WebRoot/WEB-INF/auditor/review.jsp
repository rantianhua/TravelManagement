<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="navigation2.jsp"%>
<link href="${pageContext.request.contextPath }/css/check.status.css"
	rel="stylesheet" />
<script>
	function checkdetail(appNo) {
		location.href = '${pageContext.request.contextPath}/servlet/CheckApplicationServlet?appNo='
				+ appNo + '&where=auditor';
	}
</script>
<div class="contianer">
	<h4 class="red">等待审核</h4>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>申请编号</th>
				<th>申请人身份证号</th>
				<th>申请时间</th>
				<th>出行目的</th>
				<th>出行时长</th>
				<th>申请状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="a" items="${requestScope.apply }">
				<tr onclick="checkdetail('${a.applicationNumber }')">
					<td>${a.applicationNumber }</td>
					<td>${a.applicantId }</td>
					<td>${a.applyDate }</td>
					<td>${a.purposeContent }</td>
					<td>${a.type }</td>
					<td>等待审核</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>