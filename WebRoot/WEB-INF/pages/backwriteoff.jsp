<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp"%>
<link href="${pageContext.request.contextPath }/css/check.status.css"
	rel="stylesheet" />
<div class="contianer">
	<br> <br>
	<form class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-3 control-label">填写申请编号</label>
			<div class="col-sm-6">
				<input type="text" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">出境时间</label>
			<div class="col-sm-6">
				<input name="" type="text" class="form-control choose_date"
					data-date-format="yyyy-mm-dd">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">入境时间</label>
			<div class="col-sm-6">
				<input type="text" class="form-control choose_date"
					data-date-format="yyyy-mm-dd">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">报销项目</label>
			<div class="col-sm-6">
				<input type="text" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">报销金额</label>
			<div class="col-sm-6">
				<input type="text" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">出访总结</label>
			<div class="col-sm-6">
				<textarea class="form-control"></textarea>
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
<script>
	function bindDateTimePicker() {
		$('.choose_date').datetimepicker({
			format : "yyyy-mm-dd",
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			language : 'zh-CN',
			minView : 'month'
		})
	};
</script>
</body>
</html>