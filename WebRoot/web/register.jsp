<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">

<title>注册</title>

<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="../css/register.css" rel="stylesheet">
<link href="../css/login.css" rel="stylesheet">

</head>

<body>
	<div class="div_wrapper" id="div_register">

		<form action="${pageContext.request.contextPath }/servlet/RegisterServlet" method="post">
			<div class="div_inputs">
				<span><img alt="" src="../img/login/user.png"></span> <input
					type="text" name="id" value="${requestScope.form.id }" placeholder="身份证号">
			</div>
			<div class="div_inputs">
				<p style="color:red;font-size: 0.75em;">${requestScope.form.errors.id }</p>
			</div>
			<div class="div_inputs" style="margin-top: 20px;">
				<span><img alt="" src="../img/login/password.png"></span> <input
					type="password" name="password" value="${requestScope.form.password }" placeholder="密&#12288;&#12288码">
			</div>
			<div class="div_inputs">
				<p style="color:red;font-size: 0.75em;">${requestScope.form.errors.password }</p>
			</div>
			<div class="div_inputs" style="margin-top: 20px;">
				<span><img alt="" src="../img/login/password.png"></span> <input
					type="password" value="${requestScope.form.passwordConfirm }" name="passwordConfirm" placeholder="确认密码">
			</div>
			<div class="div_inputs">
				<p style="color:red;font-size: 0.75em;">${requestScope.form.errors.passwordConfirm }${requestScope.returnInfo }</p>
			</div>
			<div style="margin-top: 20px;">
				<input type="submit" class="sure" value="注册">
			</div>
		</form>

	</div>
	<script src="../js/center.js"></script>
	<script type="text/javascript">
		centerInScreen('div_register');
		window.onresize = function() {
			centerInScreen('div_register');
		}
	</script>
</body>
</html>
