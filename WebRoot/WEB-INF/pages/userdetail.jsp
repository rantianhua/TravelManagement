<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp"%>
<form>
	<ul style="width:80%;margin-left:auto;margin-right:auto;">
		<li class="list-group-item active">
			<h4 class="list-group-item-heading">基本信息</h4>
		</li>
		<li class="list-group-item">
			<div>
				<span>身份证号</span>
			</div>
			<div>
				<input id="id_number" name="id" value="${sessionScope.hr.id }"
					type="text" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>中文姓名</span>
			</div>
			<div>
				<input name="nameCh" type="text" value="${sessionScope.hr.nameCh }"
					size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>英文姓名</span>
			</div>
			<div>
				<input name="nameEn" value="${sessionScope.hr.nameEn }" type="text"
					size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>名字拼音</span>
			</div>
			<div>
				<input name="namePinyin" value="${sessionScope.hr.namePinyin }"
					type="text" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>曾用名</span>
			</div>
			<div>
				<input name="otherName" value="${sessionScope.hr.otherName }"
					type="text" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>性别</span>
			</div>
			<div>
				<label> <input type="radio" checked name="sex" value="男"
					${sessionScope.hr.sex=='男'?'checked':'' }> 男
				</label> &nbsp;&nbsp;&nbsp; <label> <input type="radio" name="sex"
					value="女" ${sessionScope.hr.sex=='女'?'checked':'' }> 女
				</label>
			</div>
		</li>
		<li class="list-group-item">
			<div class="control-label">出生日期</div>
			<div class="cont">
				<input id="birthday" name="birthday"
					value="${sessionScope.hr.birthday }" type="text" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>护照号码</span>
			</div>
			<div>
				<input name="passport" value="${sessionScope.hr.passport }"
					type="text" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>邮箱</span>
			</div>
			<div>
				<input name="email" value="${sessionScope.hr.email }" type="email"
					size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>移动电话</span>
			</div>
			<div>
				<input name="mobilePhone" value="${sessionScope.hr.mobilePhone }"
					type="tel" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>固定电话</span>
			</div>
			<div>
				<input name="fixedPhone" value="${sessionScope.hr.fixedPhone }"
					type="tel" size="45">
			</div>
		</li>
	</ul>
	<ul style="width:80%;margin-left:auto;margin-right:auto;">
		<li class="list-group-item active">
			<h4 class="list-group-item-heading">身份信息</h4>
		</li>
		<li class="list-group-item">
			<div>
				<span>选择职称</span>
			</div>
			<div>
				<select id="select_title" onchange="titleChange()">
					<option value="教学" ${sessionScope.hr.category=='教学'?'selected':'' }>教学</option>
					<option value="行政" ${sessionScope.hr.category=='行政'?'selected':'' }>行政</option>
					<option value="学生" ${sessionScope.hr.category=='学生'?'selected':'' }>学生</option>
				</select> <input name="title" id="title" type="text" style="display:none;"
					value="教学">
			</div>
			<div id="div_sub_teaching" style="display:none;">
				<span>填写职称</span> <input name="position" type="text" value="${sessionScope.hr.position }">
			</div>
			<div id="div_sub_administration" style="display:none;">
				<span>职务职级</span> <input name="position" type="text" value="${sessionScope.hr.position }">
			</div>
			<div id="div_sub_student" style="display:none;">
				<span>选择学位</span><br> <select id="select_student"
					onchange="changeStudentDegree()">
					<option value="本科" ${sessionScope.hr.position=='本科'?'selected':'' }>本科</option>
					<option value="硕士" ${sessionScope.hr.position=='硕士'?'selected':'' }>硕士</option>
					<option value="博士" ${sessionScope.hr.position=='博士'?'selected':'' }>博士</option>
				</select> <input name="position" id="student" type="text"
					style="display:none;" value="本科">
			</div>
		</li>
	</ul>
	<ul style="width:80%;margin-left:auto;margin-right:auto;">
		<li class="list-group-item active">
			<h4 class="list-group-item-heading">紧急联系人信息</h4>
		</li>
		<li class="list-group-item">
		<li class="list-group-item">
			<div>
				<span>身份证号</span>
			</div>
			<div>
				<input name="ecpId" value="${sessionScope.hr.ecp.id }" type="text"
					size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>姓名</span>
			</div>
			<div>
				<input name="ecpNameCh" value="${sessionScope.hr.ecp.name }"
					type="text" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>邮箱</span>
			</div>
			<div>
				<input name="ecpEmail" value="${sessionScope.hr.ecp.email }"
					type="email" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>移动电话</span>
			</div>
			<div>
				<input name="ecpMobilePhone"
					value="${sessionScope.hr.ecp.mobilePhone }" type="tel" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>固定电话</span>
			</div>
			<div>
				<input name="ecpFixedPhone"
					value="${sessionScope.hr.ecp.fixedPhone }" type="tel" size="45">
			</div>
		</li>
	</ul>
	<div
		style="width:40%;margin-left:auto;margin-right:auto;position: relative;text-align: center;margin-bottom: 100px;">
		<input type="submit" value="提交" style="width:100px;">
	</div>
</form>
<script src="${pageContext.request.contextPath }/laydate/laydate.js"></script>
<script>
	laydate.skin("molv");
	laydate({
		elem : '#birthday',
		event : "focus",
		istoday : true,
	})
	function titleChange() {
		var seletorTitle = document.getElementById("select_title");
		var title = seletorTitle.options[seletorTitle.selectedIndex].value;
		alert(title);
		var divTeaching = document.getElementById("div_sub_teaching");
		var divAdministration = document
				.getElementById("div_sub_administration");
		var divStudent = document.getElementById("div_sub_student");
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

	function changeStudentDegree() {
		var seletorDegree = document.getElementById("select_student");
		var degree = seletorDegree.options[seletorDegree.selectedIndex].value;
		alert(degree);
		var inputSub = document.getElementById("student");
		inputSub.innerHTML = degree;
	}
</script>
</body>
</html>