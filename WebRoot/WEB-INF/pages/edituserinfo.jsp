<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="navigation.jsp"%>
<link
	href="${pageContext.request.contextPath }/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/edit.user.detail.css"
	rel="stylesheet" />
<c:set var="validate" scope="request" value="${empty requestScope.form}" />
<c:set var="subPosition" scope="request"
	value="${fn:substringAfter(sessionScope.hr.position,'/')}" />
<form
	action="${pageContext.request.contextPath }/servlet/ModifyUserInfoServlet"
	method="post">
	<ul>
		<li class="list-group-item li_header">
			<h4 class="list-group-item-heading">基本信息</h4>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>身份证号</span>
			</div>
			<div>
				<input value="${sessionScope.hr.id }" name="id" type="text"
					style="border:none;background-color: white;" disabled>
			</div>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>中文姓名</span>
			</div>
			<div>
				<input name="nameCh" type="text"
					value="${validate ? sessionScope.hr.nameCh:requestScope.form.nameCh }">
			</div>
			<p>${requestScope.form.errors.nameCh }</p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>英文姓名</span>
			</div>
			<div>
				<input name="nameEn"
					value="${validate ? sessionScope.hr.nameEn:requestScope.form.nameEn }"
					type="text">
			</div>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>名字拼音</span>
			</div>
			<div>
				<input name="namePinyin"
					value="${validate ? sessionScope.hr.namePinyin:requestScope.form.namePinyin }"
					type="text">
			</div>
			<p>${requestScope.form.errors.namePinyin }</p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>曾用姓名</span>
			</div>
			<div>
				<input name="otherName"
					value="${validate ? sessionScope.hr.otherName:requestScope.form.otherName }"
					type="text">
			</div>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>性&#12288;&#12288;别</span>
			</div>
			<div>
				<label> <input id="radio" type="radio" name="sex" value="男"
					${(validate ? sessionScope.hr.sex:requestScope.form.sex)=='男'?'checked':'' }>
					男
				</label> &nbsp;&nbsp;&nbsp; <label> <input id="radio" type="radio"
					name="sex" value="女"
					${(validate ? sessionScope.hr.sex:requestScope.form.sex)=='女'?'checked':'' }>
					女
				</label>
			</div>
			<p>${requestScope.form.errors.sex }</p>
		</li>
		<li class="border_lefft_right">
			<div>出生日期</div>
			<div>
				<input id="birthday" name="birthday"
					value="${validate ? sessionScope.hr.birthday:requestScope.form.birthday }"
					type="text" data-date-format="yyyy-mm-dd">
			</div>
			<p>${requestScope.form.errors.birthday }</p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>护照号码</span>
			</div>
			<div>
				<input name="passport"
					value="${validate ? sessionScope.hr.passport:requestScope.form.passport }"
					type="text">
			</div>
			<p>${requestScope.form.errors.passport }</p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>邮&#12288;&#12288;箱</span>
			</div>
			<div>
				<input name="email"
					value="${validate ? sessionScope.hr.email:requestScope.form.email }"
					type="text">
			</div>
			<p>${requestScope.form.errors.email }</p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>移动电话</span>
			</div>
			<div>
				<input name="mobilePhone"
					value="${validate ? sessionScope.hr.mobilePhone:requestScope.form.mobilePhone }"
					type="tel">
			</div>
			<p></p>
		</li>
		<li class="border_without_top">
			<div>
				<span>固定电话</span>
			</div>
			<div>
				<input name="fixedPhone"
					value="${validate ? sessionScope.hr.fixedPhone:requestScope.form.fixedPhone }"
					type="tel">
			</div>
			<p></p>
		</li>
	</ul>
	<ul>
		<li class="list-group-item li_header">
			<h4 class="list-group-item-heading">身份信息</h4>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>选择职称</span>
			</div>
			<div>
				<select id="select_title" name="category" onchange="titleChange()">
					<option value="教学"
						${(validate ? sessionScope.hr.category:requestScope.form.category)=='教学'?'selected':'' }>教学</option>
					<option value="行政"
						${(validate ? sessionScope.hr.category:requestScope.form.category)=='行政'?'selected':'' }>行政</option>
					<option value="学生"
						${(validate ? sessionScope.hr.category:requestScope.form.category)=='学生'?'selected':'' }>学生</option>
				</select>
			</div> <span style="margin-left:20px;">所在单位</span> <input name="company"
			type="text"
			value="${validate ? sessionScope.hr.company:requestScope.form.company }"
			style="margin-left:10px;">
			<p>${requestScope.form.errors.company }</p>
		</li>
		<li id="wrapper_sub_teaching" class="border_lefft_right"
			style="display:${(validate ? sessionScope.hr.category:requestScope.form.category)=='教学'?'block':'none' };">
			<div>
				<span>填写职务</span>
			</div>
			<div>
				<input name="position1" type="text"
					value="${validate ? sessionScope.hr.position:requestScope.form.position }">
			</div>
			<p>${requestScope.form.errors.position }</p>
		</li>
		<li id="warpper_sub_administration" class="border_lefft_right"
			style="display:${(validate ? sessionScope.hr.category:requestScope.form.category)=='行政'?'block':'none' };">
			<span>职务</span> <input name="position2" type="text"
			value="${validate ? fn:substringBefore(sessionScope.hr.position,'/'):requestScope.form.position }"
			style="margin-left:10px;"> <span style="margin-left:20px;">职级</span>
			<select name="subPosition" style="margin-left: 10px;">
				<option value="正部级"
					${(validate ? subPosition:requestScope.form.subPosition)=='正部级'?'selected':'' }>正部级</option>
				<option value="副部级"
					${(validate ? subPosition:requestScope.form.subPosition)=='副部级'?'selected':'' }>副部级</option>
				<option value="正处级"
					${(validate ? subPosition:requestScope.form.subPosition)=='正处级'?'selected':'' }>正处级</option>
				<option value="副处级"
					${(validate ? subPosition:requestScope.form.subPosition)=='副处级'?'selected':'' }>副处级</option>
				<option value="正科级"
					${(validate ? subPosition:requestScope.form.subPosition)=='正科级'?'selected':'' }>正科级</option>
				<option value="副科级"
					${(validate ? subPosition:requestScope.form.subPosition)=='副科级'?'selected':'' }>副科级</option>
		</select>
			<p>${requestScope.form.errors.position }</p>
		</li>
		<li id="wrapper_sub_student" class="border_without_top"
			style="margin-top:10px;margin-left:0px;display:${(validate ? sessionScope.hr.category:requestScope.form.category)=='学生'?'block':'none'} ;">
			<div>
				<span>选择学位</span>
			</div>
			<div>
				<select name="position3">
					<option value="本科"
						${(validate ? sessionScope.hr.position:requestScope.form.position)=='本科'?'selected':'' }>本科</option>
					<option value="硕士"
						${(validate ? sessionScope.hr.position:requestScope.form.position)=='硕士'?'selected':'' }>硕士</option>
					<option value="博士"
						${(validate ? sessionScope.hr.position:requestScope.form.position)=='博士'?'selected':'' }>博士</option>
				</select>
			</div>
		</li>
	</ul>
	<ul>
		<li class="list-group-item li_header">
			<h4 class="list-group-item-heading">紧急联系人信息</h4>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>姓&#12288;&#12288;名</span>
			</div>
			<div>
				<input name="ecpName"
					value="${validate ? sessionScope.hr.ecp.name:requestScope.form.ecpName }"
					type="text">
			</div>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>邮&#12288;&#12288;箱</span>
			</div>
			<div>
				<input name="ecpEmail"
					value="${validate ? sessionScope.hr.ecp.email:requestScope.form.ecpEmail }"
					type="text">
			</div>
			<p>${requestScope.form.errors.ecpEmail }</p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>移动电话</span>
			</div>
			<div>
				<input name="ecpMobilePhone"
					value="${validate ? sessionScope.hr.ecp.mobilePhone:requestScope.form.ecpMobilePhone }"
					type="tel">
			</div>
		</li>
		<li class="border_without_top">
			<div>
				<span>固定电话</span>
			</div>
			<div>
				<input name="ecpFixedPhone"
					value="${validate ? sessionScope.hr.ecp.fixedPhone:requestScope.form.ecpFixedPhone }"
					type="tel">
			</div>
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
	var teaching = document.getElementById("wrapper_sub_teaching");
	var administration = document.getElementById("warpper_sub_administration");
	var student = document.getElementById("wrapper_sub_student");
	if (teaching.style.display == "none"
			&& administration.style.display == "none"
			&& student.style.display == "none") {
		teaching.style.display = "block";
	}
	function titleChange() {
		var seletorTitle = document.getElementById("select_title");
		var title = seletorTitle.options[seletorTitle.selectedIndex].value;
		var divTeaching = document.getElementById("wrapper_sub_teaching");
		var divAdministration = document
				.getElementById("warpper_sub_administration");
		var divStudent = document.getElementById("wrapper_sub_student");
		if (title == "教学") {
			divTeaching.style.display = "block";
			divAdministration.style.display = "none";
			divStudent.style.display = "none";
		} else if (title == "行政") {
			divTeaching.style.display = "none";
			divAdministration.style.display = "block";
			divStudent.style.display = "none";
		} else if (title == "学生") {
			divTeaching.style.display = "none";
			divAdministration.style.display = "none";
			divStudent.style.display = "block";
		}
	}
</script>
</body>
</html>