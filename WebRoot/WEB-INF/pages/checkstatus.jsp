<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp"%>
<link href="${pageContext.request.contextPath }/css/check.status.css"
	rel="stylesheet" />
<script>
function checkdetail(){
	location.href='${pageContext.request.contextPath}/servlet/ShowApplicationServlet';
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
			<tr onclick="checkdetail()">
				<td>123456</td>
				<td>2016-7-7</td>
				<td>炮决金正恩</td>
				<td>长期</td>
				<td>审核通过</td>
			</tr>
			<tr>
				<td>123456</td>
				<td>2016-7-7</td>
				<td>刺杀普京</td>
				<td>长期</td>
				<td>审核通过</td>
			</tr>
			<tr>
				<td>123456</td>
				<td>2016-7-7</td>
				<td>刺杀奥巴马</td>
				<td>长期</td>
				<td>审核通过</td>
			</tr>
		</tbody>
	</table>
	<h4 class="red">委托申请</h4>
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
			<tr>
				<td>123456</td>
				<td>2016-7-7</td>
				<td>干翻小日本</td>
				<td>长期</td>
				<td>审核通过</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>