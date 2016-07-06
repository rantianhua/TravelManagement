<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp"%>
<link href="${pageContext.request.contextPath }/css/bootstrap-datetimepicker.min.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath }/css/edit.user.detail.css" rel="stylesheet"/>
<form>
	<ul>
		<li class="list-group-item li_header" >
			<h4 class="list-group-item-heading">基本信息</h4>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>身份证号</span>
			</div>
			<div>
				<input value="${sessionScope.hr.id }"
					type="text"  style="border:none;background-color: white;" disabled>
			</div>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>中文姓名</span>
			</div>
			<div>
				<input name="nameCh" type="text" value="${sessionScope.hr.nameCh }">
			</div>
			<p></p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>英文姓名</span>
			</div>
			<div>
				<input name="nameEn" value="${sessionScope.hr.nameEn }" type="text"
					 >
			</div>
			<p></p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>名字拼音</span>
			</div>
			<div>
				<input name="namePinyin" value="${sessionScope.hr.namePinyin }"
					type="text"  >
			</div>
			<p></p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>曾用姓名</span>
			</div>
			<div>
				<input name="otherName" value="${sessionScope.hr.otherName }"
					type="text"  >
			</div>
			<p></p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>性&#12288;&#12288;别</span>
			</div>
			<div>
				<label> <input type="radio" checked name="sex" value="男"
					${sessionScope.hr.sex=='男'?'checked':'' }> 男
				</label> &nbsp;&nbsp;&nbsp; <label> <input type="radio" name="sex"
					value="女" ${sessionScope.hr.sex=='女'?'checked':'' }> 女
				</label>
			</div>
		</li>
		<li class="border_lefft_right">
			<div>出生日期</div>
			<div>
				<input id="birthday" name="birthday"
					value="${sessionScope.hr.birthday }" type="text" data-date-format="yyyy-mm-dd">
			</div>
			<p></p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>护照号码</span>
			</div>
			<div>
				<input name="passport" value="${sessionScope.hr.passport }"
					type="text"  >
			</div>
			<p></p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>邮&#12288;&#12288;箱</span>
			</div>
			<div>
				<input name="email" value="${sessionScope.hr.email }" type="email"
					 >
			</div>
			<p></p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>移动电话</span>
			</div>
			<div>
				<input name="mobilePhone" value="${sessionScope.hr.mobilePhone }"
					type="tel"  >
			</div>
			<p></p>
		</li>
		<li class="border_without_top">
			<div>
				<span>固定电话</span>
			</div>
			<div>
				<input name="fixedPhone" value="${sessionScope.hr.fixedPhone }"
					type="tel"  >
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
				<select id="select_title" onchange="titleChange()">
					<option value="教学"  ${sessionScope.hr.category=='教学'?'selected':'' }>教学</option>
					<option value="行政"  ${sessionScope.hr.category=='行政'?'selected':'' }>行政</option>
					<option value="学生"  ${sessionScope.hr.category=='学生'?'selected':'' }>学生</option>
				</select> <input name="title" id="title" type="text" style="display:none;"
					value="${sessionScope.hr.category}">
			</div>
			<span style="margin-left:20px;">所在单位</span>
			<input name="company" type="text" style="margin-left:10px;">
			<p></p>
		</li>
		<li id="wrapper_sub_teaching" class="border_lefft_right"  style="display:${sessionScope.hr.category=='教学'?'block':'none' };">
			<div>
				<span>填写职务</span> 
			</div>
			<div>
				<input name="position" type="text" value="${sessionScope.hr.position }">
			</div>
			<p></p>
		</li>
		<li id="warpper_sub_administration"  class="border_lefft_right" style="display:${sessionScope.hr.category=='行政'?'block':'none' };">
				<span>职务</span> <input name="position" type="text" value="${sessionScope.hr.position }" style="margin-left:10px;">
				<span style="margin-left:20px;">职级</span>
				<select id="select_sub_position"  name="subPosition" style="margin-left: 10px;">
					<option value="正部级">正部级</option>
					<option value="副部级">副部级</option>
					<option value="正处级" >正处级</option>
					<option value="副处级" >副处级</option>
					<option value="正科级">正科级</option>
					<option value="副科级">副科级</option>
				</select> <input name="subPosition" id="sub_postion" type="text" style="display:none;"
				value="${sessionScope.hr.category}">
				<p></p>
		</li>
		<li id="wrapper_sub_student" class="border_without_top" style="margin-top:10px;margin-left:0px;display:${sessionScope.hr.category=='学生'?'block':'none'} ;">
			<div >
				<span>选择学位</span>
			</div>
			<div>
				<select id="select_student" name="position">
					<option value="本科" ${sessionScope.hr.position=='本科'?'selected':'' }>本科</option>
					<option value="硕士" ${sessionScope.hr.position=='硕士'?'selected':'' }>硕士</option>
					<option value="博士" ${sessionScope.hr.position=='博士'?'selected':'' }>博士</option>
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
				<input name="ecpNameCh" value="${sessionScope.hr.ecp.name }"
					type="text"  >
			</div>
			<p></p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>邮&#12288;&#12288;箱</span>
			</div>
			<div>
				<input name="ecpEmail" value="${sessionScope.hr.ecp.email }"
					type="email"  >
			</div>
			<p></p>
		</li>
		<li class="border_lefft_right">
			<div>
				<span>移动电话</span>
			</div>
			<div>
				<input name="ecpMobilePhone"
					value="${sessionScope.hr.ecp.mobilePhone }" type="tel"  >
			</div>
			<p></p>
		</li>
		<li class="border_without_top">
			<div>
				<span>固定电话</span>
			</div>
			<div>
				<input name="ecpFixedPhone"
					value="${sessionScope.hr.ecp.fixedPhone }" type="tel"  >
			</div>
			<p></p>
		</li>
	</ul>
	<div
		style="width:40%;margin-left:auto;margin-right:auto;position: relative;text-align: center;margin-bottom: 100px;">
		<input type="submit" value="提交" style="width:100px;">
	</div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script>
	$('#birthday').datetimepicker({
		format: "yyyy-mm-dd",
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
        language: 'zh-CN',
        minView: 'month'
    });
    var teaching = document.getElementById("wrapper_sub_teaching");
	var administration = document.getElementById("warpper_sub_administration");
	var student = document.getElementById("wrapper_sub_student");
	if(teaching.style.display == "none" && administration.style.display == "none" && student.style.display == "none") {
		teaching.style.display = "block";
	}
	function titleChange() {
		var seletorTitle = document.getElementById("select_title");
		var title = seletorTitle.options[seletorTitle.selectedIndex].value;
		var divTeaching = document.getElementById("wrapper_sub_teaching");
		var divAdministration = document.getElementById("warpper_sub_administration");
		var divStudent = document.getElementById("wrapper_sub_student");
		var inputTitle = document.getElementById("title");
		inputTitle.innerHTML = title;
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