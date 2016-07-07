<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp"%>
<link href="${pageContext.request.contextPath }/css/check.status.css"
	rel="stylesheet" />
<div class="contianer">
	<br>
	<br>
	<form class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-3 control-label">填写申请编号</label>
			<div class="col-sm-6">
				<input type="text" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword" class="col-sm-3 control-label">上传核销材料</label>
			<div class="col-sm-6">
				<input type="file" value="上传文件">
			</div>
		</div>
		<br>
		<div class="form-group">
			<label class="col-sm-3 control-label"></label>
			<div class="col-sm-6">
				<button type="submit" class="btn btn-success">提交</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>