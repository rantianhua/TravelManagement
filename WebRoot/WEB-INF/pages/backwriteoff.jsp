<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="navigation.jsp"%>
<link href="${pageContext.request.contextPath }/css/check.status.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" />
<div class="contianer">
	<br> <br>
	<form class="form-horizontal"
		action="${pageContext.request.contextPath }/servlet/VertificationServlet"
		method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label class="col-sm-3 control-label">填写申请编号</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="vertificationId">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">出境时间</label>
			<div class="col-sm-6">
				<input class="form-control choose_date"
				name="exitBorderDate" type="text"
					 data-date-format="yyyy-mm-dd">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">入境时间</label>
			<div class="col-sm-6">
				<input class="form-control choose_date" 
				name="enterBorderDate" type="text"
					 data-date-format="yyyy-mm-dd">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">报销项目</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="vertificationProgram">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">报销金额</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="vertificationMoney">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">出访总结</label>
			<div class="col-sm-6">
				<textarea class="form-control" name="vertificationSummerize"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword" class="col-sm-3 control-label">上传核销材料</label>
			<div class="col-sm-6">
				<input type="file" value="上传文件" name="vertificationStuff">
			</div>
		</div>
		<br>
		<div class="form-group">
			<label class="col-sm-3 control-label"></label>
			<div class="col-sm-6">
				<button type="submit" class="btn btn-success">提交</button>
			</div>
		</div>
		<p>${requestScope.form.errors.returnInfo}</p>

	</form>
</div>
</body>
</html>