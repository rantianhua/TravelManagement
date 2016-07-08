<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp"%>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/brief.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script>
	function skip() {
		location.href = '${pageContext.request.contextPath}/servlet/ApplyAbroadServlet';
	}
</script>
<div id="label1">申请流程</div>
<div id="label2">
	1申请之前需要完成个人信息和护照信息 <br> <br>
	2证照使用说明（因公、因私；护照、通行证等的不同，以及什么情况下使用哪种证照）
	选择是否代表他人填写，如是，填写登录信息登录委托人账户，然后填写委托人的护照，身份证等相关信息， <br> <br>
	3填写姓名，身份证，邮箱，联系方式，身份，性别等个人信息 <br> <br>
	4提交户口本，邀请信，护照照片，短期出行或长期出行，处境目的，行程，经费情况，邀请方（如果有的话）,最后一次出境情况等与处境相关的信息 <br>
	<br> 5确认表单已填写且需要个人上传的文件完成上传 <br> <br>
	6等待各级有关部门审批审核，对于特定人群，将在网上根据人群身份进行公示，公示后方可完成审批，公示内容从填写的信息中汲取 <br> <br>
	7在审批过程中申请人可随时登陆本网站查询审批状态
</div>
<div style="text-align: center;margin-top:40px">
	<input id="btn" type="button" class="btn btn-primary" value="确认"
		onclick="skip()">
</div>
</body>
</html>
