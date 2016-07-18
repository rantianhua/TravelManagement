<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="navigation.jsp"%>
<link href="${pageContext.request.contextPath }/css/check.status.css"
	rel="stylesheet" />
<script>
	function checkdetail(notifyNo) {
		location.href = '${pageContext.request.contextPath}/servlet/ShowNotifyServlet?notifyNo='
				+ notifyNo;
	}
</script>
<div class="contianer">
	<h4 class="red">公示信息</h4>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>5日内公示信息</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${requestScope.list }">
				<tr onclick="checkdetail('${item.publicNotificationId}')">
					<td>${item.applyDate }  ${item.name  }  ${item.purposeContent  }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<h4 class="warn">如果您发现以上信息中有不属实的成分，可以拨打山东大学国际事务部值班电话+86-531-8836-4853，我们会第一时间进行处理</h4>
</div>
</body>
</html>
