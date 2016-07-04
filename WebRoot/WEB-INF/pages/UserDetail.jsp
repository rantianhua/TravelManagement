<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="Navigation.jsp"%>
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
				<input id="id_number" name="id" type="text" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>中文姓名</span>
			</div>
			<div>
				<input name="nameCh" type="text" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>英文姓名</span>
			</div>
			<div>
				<input name="nameEn" value="" type="text" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>名字拼音</span>
			</div>
			<div>
				<input name="namePinyin" value="" type="text" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>曾用名</span>
			</div>
			<div>
				<input name="otherName" value="" type="text" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>性别</span>
			</div>
			<div>
				<label> <input type="radio" checked name="sex" value="男">
					男
				</label> &nbsp;&nbsp;&nbsp; <label> <input type="radio" name="sex"
					value="女"> 女
				</label>
			</div>
		</li>
		<li class="list-group-item">
			<div class="control-label">出生日期</div>
			<div class="cont">
				<input id="birthday" name="birthday" type="text" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>护照号码</span>
			</div>
			<div>
				<input name="passport" value="" type="text" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>邮箱</span>
			</div>
			<div>
				<input name="email" value="" type="email" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>移动电话</span>
			</div>
			<div>
				<input name="mobilePhone" value="" type="tel" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>固定电话</span>
			</div>
			<div>
				<input name="fixedPhone" value="" type="tel" size="45">
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
					<option value="教学">教学</option>
					<option value="行政">行政</option>
					<option value="学生">学生</option>
				</select> <input name="title" id="title" type="text" style="display:none;"
					value="教学">
			</div>
			<div id="div_sub_teaching" style="display:none;">
				<span>填写职称</span> <input name="subTitle" type="text">
			</div>
			<div id="div_sub_administration" style="display:none;">
				<span>职务职级</span> <input name="subTitle" type="text">
			</div>
			<div id="div_sub_student" style="display:none;">
				<span>选择学位</span><br> <select id="select_student"
					onchange="changeStudentDegree()">
					<option value="本科">本科</option>
					<option value="硕士">硕士</option>
					<option value="博士">博士</option>
				</select> <input name="subTitle" id="student" type="text"
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
				<input name="ecpId" type="text" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>中文姓名</span>
			</div>
			<div>
				<input name="ecpNameCh" type="text" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>邮箱</span>
			</div>
			<div>
				<input name="ecpEmail" value="" type="email" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>移动电话</span>
			</div>
			<div>
				<input name="ecpMobilePhone" value="" type="tel" size="45">
			</div>
		</li>
		<li class="list-group-item">
			<div>
				<span>固定电话</span>
			</div>
			<div>
				<input name="ecpFixedPhone" value="" type="tel" size="45">
			</div>
		</li>
	</ul>
	<div style="width:40%;margin-left:auto;margin-right:auto;position: relative;text-align: center;margin-bottom: 100px;">
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