<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="navigation.jsp"%>
<link
	href="${pageContext.request.contextPath }/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/edit.user.detail.css"
	rel="stylesheet" />
<c:set var="validate" scope="request" value="${empty requestScope.form}" />
<c:set var="none" scope="request" value="${empty requestScope.passport}" />
<br>
<br>
<br>
<br>
<form id="form"
	action="${pageContext.request.contextPath }/servlet/ModifyPassportInfoServlet"
	enctype="multipart/form-data" method="post">
	<ul>
		<li class="list-group-item li_header">
			<h4 class="list-group-item-heading">护照信息</h4>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>护照名称</span>
			</div>
			<div>
				<input name="passportName"
					value="${validate ? requestScope.passport.passportName:requestScope.form.passportName }"
					type="text">
			</div>
			<p>${requestScope.form.errors.passportName }</p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>姓&#12288;&#12288;名</span>
			</div>
			<div>
				<input name="name" type="text"
					value="${validate ? (none ? sessionScope.hr.nameCh:requestScope.passport.name):requestScope.form.name }">
			</div>
			<p>${requestScope.form.errors.name }</p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>性&#12288;&#12288;别</span>
			</div>
			<div>
				<label> <input id="radio" type="radio" name="sex" value="男"
					${(validate ? (none ? sessionScope.hr.sex:requestScope.passport.sex):requestScope.form.sex)=='男'?'checked':'' }>
					男
				</label> &nbsp;&nbsp;&nbsp; <label> <input id="radio" type="radio"
					name="sex" value="女"
					${(validate ? (none ? sessionScope.hr.sex:requestScope.passport.sex):requestScope.form.sex)=='女'?'checked':'' }>
					女
				</label>
			</div>
			<p>${requestScope.form.errors.sex }</p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>签发地区</span>
			</div>
			<div>
				<input name="issuingPlace"
					value="${validate ? requestScope.passport.issuingPlace:requestScope.form.issuingPlace }"
					type="text">
			</div>
			<p>${requestScope.form.errors.issuingPlace }</p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>出生日期</span>
			</div>
			<div>
				<input id="birthday" name="birthday"
					value="${validate ? (none ? sessionScope.hr.birthday:requestScope.passport.birthday):requestScope.form.birthday }"
					type="text" data-date-format="yyyy-mm-dd">
			</div>
			<p>${requestScope.form.errors.birthday }</p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>有效日期</span>
			</div>
			<div>
				<input id="expDate" name="expDate"
					value="${validate ? requestScope.passport.expDate:requestScope.form.expDate }"
					type="text" data-date-format="yyyy-mm-dd">
			</div>
			<p>${requestScope.form.errors.expDate }</p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>护照照片</span>
			</div>
			<div>
				<img id="img"
					src="${pageContext.request.contextPath }/img/default/default2.png"><input
					id="upload1" name="img" type="file"
					onchange="preImg(this.id,'img');">
			</div>
			<p>${requestScope.form.errors.img }${requestScope.message }</p>
		</li>
	</ul>
	<ul>
		<li class="list-group-item li_header">
			<h4 class="list-group-item-heading">身份证信息</h4>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>身份证照片</span>
			</div>
			<div>
				<img id="idCard"
					src="${pageContext.request.contextPath }/img/default/default2.png"><input
					id="upload2" name="idCard" type="file"
					onchange="preImg(this.id,'idCard');">
			</div>
			<p>${requestScope.form.errors.idCard }${requestScope.message }</p>
		</li>
	</ul>
	<ul>
		<li class="list-group-item li_header">
			<h4 class="list-group-item-heading">户口本信息</h4>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>户口本照片</span>
			</div>
			<div>
				<img id="accountBook"
					src="${pageContext.request.contextPath }/img/default/default2.png"><input
					id="upload3" name="accountBook" type="file"
					onchange="preImg(this.id,'accountBook');">
			</div>
			<p>${requestScope.form.errors.accountBook }${requestScope.message }</p>
		</li>
	</ul>
	<div
		style="width:40%;margin-left:auto;margin-right:auto;position: relative;text-align: center;margin-bottom: 100px;">
		<input type="submit" value="提交" style="width:100px;">
	</div>
</form>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/locales/bootstrap-datetimepicker.zh-CN.js"
	charset="UTF-8"></script>
<script>
	$('#birthday').datetimepicker({
		format : "yyyy-mm-dd",
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		language : 'zh-CN',
		minView : 'month'
	});
	$('#expDate').datetimepicker({
		format : "yyyy-mm-dd",
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		language : 'zh-CN',
		minView : 'month'
	});
	function preImg(sourceId, targetId) {
		var url = getFileUrl(sourceId);
		var imgPre = document.getElementById(targetId);
		imgPre.src = url;
	}
	function getFileUrl(sourceId) {
		var url;
		if (navigator.userAgent.indexOf("MSIE") >= 1) { // IE
			url = document.getElementById(sourceId).value;
		} else if (navigator.userAgent.indexOf("Firefox") > 0) { // Firefox
			url = window.URL
					.createObjectURL(document.getElementById(sourceId).files
							.item(0));
		} else if (navigator.userAgent.indexOf("Chrome") > 0) { // Chrome
			url = window.URL
					.createObjectURL(document.getElementById(sourceId).files
							.item(0));
		}
		return url;
	}
</script>
</body>
</html>
