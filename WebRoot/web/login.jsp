<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
  	<meta charset="utf-8">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <title>登录</title>
	<!-- Bootstrap -->
    <!--<link href="../css/bootstrap.min.css" rel="stylesheet">-->
	<link href="../css/login.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
  
  <body>
  
  	<div class="div_wrapper" id="div_login">
  	
  		<form action="../UserDetail.html">
  			<div class="div_inputs">
  				<span><img alt="" src="../img/login/user.png"></span>
  				<input type="text" name="username" placeholder="身份证号">
  			</div>
  			<div class="div_inputs" style="margin-top: 40px;">
  				<span><img alt="" src="../img/login/password.png"></span>
  				<input type="password" name="password" placeholder="密&#12288;&#12288码">
  			</div>
  			<div style="margin-top: 40px;">
  				<input type="submit" class="sure" value="登录">
  			</div>
  		</form>
  		<div style="margin-top: 40px;text-align: center;">
  				<a href="register.jsp">没有账号，现在注册？</a>
  		</div>
  	</div>
  
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!-- <script src="../js/bootstrap.min.js"></script> -->
    <script src="../js/center.js"></script>
    <script type="text/javascript">
    	centerInScreen('div_login');
    	window.onresize = function() {	
    		centerInScreen('div_login');
    	}
    </script>
  </body>
</html>
