<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp"%>
<link
	href="${pageContext.request.contextPath }/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/apply.abroad.css"
	rel="stylesheet">
<form class="form-horizontal" role="form">
	<div class="form-group">
		<div class="col-offset-2 col-sm-4">
			<h3 class="text-info text-center">时限检验</h3>
		</div>
		<div class="col-sm-12">
			<hr />
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span> 出发时间</label>
		<div class="col-sm-6">
			<input id="start_time" class="form-control choose_date" type="text"
				name="startTime" data-date-format="yyyy-mm-dd">
		</div>
	</div>
	<!-- 提示信息 -->
	<div class="form-group">
		<div class="col-offset-2 col-sm-4">
			<h3 class="text-info text-center">基本信息</h3>
		</div>
		<div class="col-sm-12">
			<hr />
		</div>
	</div>
	<div class="col-sm-offset-4 col-sm-6">
		<p></p>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span> 选择身份</label>
		<div class="col-sm-6">
			<select class="form-control">
				<option>教学及科研人员</option>
				<option>行政人员</option>
				<option>学生</option>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">是否委托申请</label>
		<div class="col-sm-6">
			<div>
				<label class="checkbox-inline"> <input type="radio"
					name="help_apply" value="是">是
				</label> <label class="checkbox-inline"> <input type="radio"
					value="否" name="help_apply" checked>否
				</label>
			</div>
		</div>
	</div>
	<div class="form-group" id="real_identity" style="display: none;">
		<label class="control-label col-sm-4"><span>* </span>申请人身份证号</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">证照类型选择</label>
		<div class="col-sm-6">
			<div>
				<label class="checkbox-inline"> <input type="radio"
					value="因公证照" checked name="passport_type">因公证照
				</label> <label class="checkbox-inline"> <input type="radio"
					value="因私证照" name="passport_type">因私证照
				</label> <small class="checkbox-inline" style="vertical-align: bottom;"
					id="passport_desc">适用于工作和学习的出境目的</small>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">证照名称</label>
		<div class="col-sm-6">
			<p class="form-control-static">证照名称</p>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">姓名</label>
		<div class="col-sm-6">
			<p class="form-control-static">证照名称</p>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">性别</label>
		<div class="col-sm-6">
			<p class="form-control-static">证照名称</p>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">签发地</label>
		<div class="col-sm-6">
			<p class="form-control-static">证照名称</p>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">生日</label>
		<div class="col-sm-6">
			<p class="form-control-static">证照名称</p>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">有效日期</label>
		<div class="col-sm-6">
			<p class="form-control-static">证照名称</p>
		</div>
	</div>
	<!-- 出访目的 -->
	<div class="form-group">
		<div class="col-offset-2 col-sm-4">
			<h3 class="text-info text-center">出访目的</h3>
		</div>
		<div class="col-sm-12">
			<hr />
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">选择长期短期</label>
		<div class="col-sm-6">
			<div>
				<label class="checkbox-inline"> <input type="radio"
					value="长期" checked name="visit_type">长期
				</label> <label class="checkbox-inline"> <input type="radio"
					value="短期" name="visit_type">短期
				</label>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">出访目的</label>
		<div class="col-sm-6">
			<select class="form-control" id="select_purpose">
				<option value="培训" selected>培训</option>
				<option value="进修">进修</option>
				<option value="任教">任教</option>
				<option value="科研合作">科研合作</option>
				<option value="攻读学位">攻读学位</option>
			</select>
		</div>
	</div>
	<div class="form-group" id="div_class_name" style="display: none;">
		<label class="control-label col-sm-4"><span>* </span>授课名称</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group" id="div_cooperation_content"
		style="display: none;">
		<label class="control-label col-sm-4"><span>* </span>合作内容</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group" id="div_train_content" style="display: block;">
		<label class="control-label col-sm-4"><span>* </span>培训内容</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group" id="div_study_content" style="display: none;">
		<label class="control-label col-sm-4"><span>* </span>进修内容</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group" id="div_degree_content" style="display: none;">
		<label class="control-label col-sm-4"><span>* </span>攻读学位类别</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div id="div_foreign_parter" style="display: none;">
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>外方合伙伴姓名</label>
			<div class="col-sm-6">
				<input class="form-control" type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>外方合伙伴头衔</label>
			<div class="col-sm-6">
				<input class="form-control" type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>外方合伙伴专长</label>
			<div class="col-sm-6">
				<input class="form-control" type="text">
			</div>
		</div>
	</div>
	<div id="div_teacher_content" style="display: none;">
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>指导教师姓名</label>
			<div class="col-sm-6">
				<input class="form-control" type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>指导教师头衔</label>
			<div class="col-sm-6">
				<input class="form-control" type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>指导教师专长</label>
			<div class="col-sm-6">
				<input class="form-control" type="text">
			</div>
		</div>
	</div>
	<div id="div_meeting_content" style="display: none;">
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>国际会议中文名</label>
			<div class="col-sm-6">
				<input class="form-control" type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>国际会议英文名</label>
			<div class="col-sm-6">
				<input class="form-control" type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>会议情况简介</label>
			<div class="col-sm-6">
				<textarea class="form-control"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4">是否受邀发言</label>
			<div class="col-sm-6">
				<div>
					<label class="checkbox-inline"> <input type="radio"
						value="0" checked name="shouyao">是
					</label> <label class="checkbox-inline"> <input type="radio"
						value="1" name="shouyao">否
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4">发言提纲</label>
			<div class="col-sm-6">
				<input type="file" value="上传文件">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4">论文提纲</label>
			<div class="col-sm-6">
				<textarea class="form-control"></textarea>
			</div>
		</div>
	</div>
	<!-- 出访路线及计划部分 -->
	<div class="form-group">
		<div class="col-offset-2 col-sm-4">
			<h3 class="text-info text-center">出访路线及计划部分</h3>
		</div>
		<div class="col-sm-12">
			<hr />
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">离境城市</label>
		<div class="col-sm-6">
			<input type="text" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>离境日期</label>
		<div class="col-sm-6">
			<input type="text" class="form-control choose_date" name="outDate">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>抵达国家</label>
		<div class="col-sm-6">
			<input type="text" name="reachCountry1" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>抵达城市</label>
		<div class="col-sm-6">
			<input type="text" name="reachCity1" id="reach_city"
				class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>抵达日期</label>
		<div class="col-sm-6">
			<input type="text" name="reachDate1" class="form-control choose_date">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>离境日期</label>
		<div class="col-sm-6">
			<input type="text" name="exitDate1" class="form-control choose_date">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">是否过境转机</label>
		<div class="col-sm-6">
			<div>
				<label class="checkbox-inline"> <input type="radio"
					value="0" checked name="transfer1">是
				</label> <label class="checkbox-inline"> <input type="radio"
					value="1" name="transfer1">否
				</label>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>转机地点</label>
		<div class="col-sm-6">
			<input type="text" name="transferAdress1" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>停留时间</label>
		<div class="col-sm-6">
			<p id="stayTime1" class="form-control-static"></p>
		</div>
	</div>
	<div class="form-group" id="div_add_destination">
		<div class="col-sm-offset-4 col-sm-6">
			<button type="button" class="btn btn-default"
				onclick="addDestination()">添加抵达城市</button>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>回国入境城市</label>
		<div class="col-sm-6">
			<input type="text" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>入境日期</label>
		<div class="col-sm-6">
			<input type="text" class="form-control choose_date" name="enterDate">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">出访天数</label>
		<div class="col-sm-6">
			<p id="visit_total_days" class="form-control-static"></p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-offset-2 col-sm-4">
			<h3 class="text-info text-center">参团出访</h3>
		</div>
		<div class="col-sm-12">
			<hr />
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">是否参团</label>
		<div class="col-sm-6">
			<div>
				<label class="checkbox-inline"> <input type="radio"
					value="是" checked name="canTuan">是
				</label> <label class="checkbox-inline"> <input type="radio"
					value="否" name="canTuan">否
				</label>
			</div>
		</div>
	</div>
	<div id="div_can_tuan">
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>组团单位</label>
			<div class="col-sm-6">
				<input type="text" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>出访审批单位</label>
			<div class="col-sm-6">
				<input type="text" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>团组职务</label>
			<div class="col-sm-6">
				<input type="text" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>成员名单</label>
			<div class="col-sm-6">
				<input type="file">
			</div>
		</div>
	</div>
	<!-- 邀请方信息 -->
	<div class="form-group">
		<div class="col-offset-2 col-sm-4">
			<h3 class="text-info text-center">邀请方信息</h3>
		</div>
		<div class="col-sm-12">
			<hr />
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>姓名</label>
		<div class="col-sm-6">
			<input type="text" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>中文头衔</label>
		<div class="col-sm-6">
			<input type="text" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>英文头衔</label>
		<div class="col-sm-6">
			<input type="text" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>单位名称</label>
		<div class="col-sm-6">
			<input type="text" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>单位地址</label>
		<div class="col-sm-6">
			<input type="text" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>联系电话</label>
		<div class="col-sm-6">
			<input type="text" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>电子邮箱</label>
		<div class="col-sm-6">
			<input type="text" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>单位网址</label>
		<div class="col-sm-6">
			<input type="text" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">邀请函原件</label>
		<div class="col-sm-6">
			<input type="file">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">邀请函中文翻译件</label>
		<div class="col-sm-6">
			<input type="file">
		</div>
	</div>
	<!-- 经费信息 -->
	<div class="form-group">
		<div class="col-offset-2 col-sm-4">
			<h3 class="text-info text-center">经费信息</h3>
		</div>
		<div class="col-sm-12">
			<hr />
		</div>
	</div>
	<div
		style="width:70%;margin-left:auto;margin-right:auto;margin-top: 40px;">
		<table class="table table-bordered">
			<tr>
				<td>邀请方负担情况</td>
				<td><label> <input type="radio" value="0" checked
						name="fudan">全部负担
				</label> &nbsp;&nbsp;&nbsp; <label> <input type="radio" value="1"
						name="fudan">部分负担
				</label> <label> <input type="radio" value="２" name="fudan">不负担
				</label></td>
			</tr>
			<tr>
				<td>部分负担费用</td>
				<td><select>
						<option value="住宿费，餐费" selected>住宿费，餐费</option>
						<option value="机票费">机票费</option>
						<option value="其他">其他</option>
				</select> <input type="text" placeholder="选择其他时，请再次说明付费项目"></td>
			</tr>
			<tr>
				<td>我方负担情况</td>
				<td>
					<table class="table table-bordered">
						<tr>
							<th>负担费用</th>
							<th>经费账号</th>
							<th>经费账号</th>
							<th>备注</th>
						</tr>
						<tr>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><select>
									<option value="住宿费，餐费">住宿费，餐费</option>
									<option value="机票费">机票费</option>
									<option value="其他">其他</option>
							</select></td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><select>
									<option value="住宿费，餐费">住宿费，餐费</option>
									<option value="机票费">机票费</option>
									<option value="其他">其他</option>
							</select></td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><select>
									<option value="住宿费，餐费">住宿费，餐费</option>
									<option value="机票费">机票费</option>
									<option value="其他">其他</option>
							</select></td>
							<td><input type="text"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>其他出资方</td>
				<td>
					<table class="table table-bordered">
						<tr>
							<td>资助范围</td>
							<td><textarea rows="4"></textarea></td>
						</tr>
						<tr>
							<td>证明文件</td>
							<td><input type="file" value="选择文件"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</form>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/locales/bootstrap-datetimepicker.zh-CN.js"
	charset="UTF-8"></script>
<script>
	var reachIndex = 2;
	bindDateTimePicker();
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
		}).on('changeDate', function() {
			$('.choose_date').trigger("input");
		});
		//$('.choose_date').bind('input propertychange onchange oninput',checkTime);
	};

	function addDestination() {
		var newReach = '<div class="form-group"><label class="control-label col-sm-4"><span>* </span>抵达国家</label><div class="col-sm-6"><input type="text"name="reachCountry' + reachIndex +'" class="form-control"></div></div><div class="form-group"><label class="control-label col-sm-4"><span>* </span>抵达城市</label><div class="col-sm-6"><input type="text"name="reachCity' + reachIndex + '" class="form-control"></div></div><div class="form-group"><label class="control-label col-sm-4"><span>* </span>抵达日期</label><div class="col-sm-6"><input type="text"name="reachDate' + reachIndex + '" class="form-control choose_date"></div></div><div class="form-group"><label class="control-label col-sm-4"><span>* </span>离境日期</label><div class="col-sm-6"><input type="text"name="exitDate' + reachIndex + '" class="form-control choose_date"></div></div><div class="form-group"><label class="control-label col-sm-4">是否过境转机</label><div class="col-sm-6"><div><label class="checkbox-inline"><input type="radio"value="0"checked name="transfer'+reachIndex+'">是</label><label class="checkbox-inline"><input type="radio"value="1"name="transfer'+reachIndex+'">否</label></div></div></div><div class="form-group"><label class="control-label col-sm-4"><span>* </span>转机地点</label><div class="col-sm-6"><input type="text"name="transferAdress'+reachIndex+'"class="form-control"></div></div><div class="form-group"style="display: none;"><label class="control-label col-sm-4"><span>* </span>停留时间</label><div class="col-sm-6"><p id="stayTime' + reachIndex +'" class="form-control-static"></p></div></div>';
		$("#div_add_destination").before(newReach);
		reachIndex = reachIndex + 1;
		bindDateTimePicker();
	}

	//根据时间做计算和检查
	function checkTime() {
		var dateName = $(this).attr("name");
		var searchReachIndex = dateName.search("reachDate");
		var searchExitIndex = dateName.search("exitDate");
		if (dateName == "startTime") {
			var startTime = $('#start_time').val();
			var toDay = new Date();
			var toDayS = toDay.getYear() + "-" + (toDay.getMonth() + 1) + "-"
					+ toDay.getDay();
			if (startTime.length < 10)
				return;
			var days = indicateDays(startTime, toDayS);
			if (days < 5) {
				alert("时间不够，不足５天无法办理");
			}
		} else if (searchExitIndex != -1 || searchReachIndex != -1) {
			//计算中间到达地点的停留时间
			/*var i;
			if(searchExitIndex != -1) {
				i = dateName.substring("exitDate".length,dateName.length);
			}else {
				i = dateName.substring("reachDate".length,dateName.length);
			}
			var reachDate = $("input[name=reachDate" + i + "]").val();
			var exitDate = $("input[name=exitDate" + i + "]").val();
			if(reachDate.length < 10  || exitDate < 10) return;
			var days = indicateDays(exitDate,reachDate);
			alert(days);
			if(days >= 0) {
				$("#stayTime" + i).text("停留" + days + "天");
			}*/
		}

	}
	//是否选择委托申请
	$("input[name=help_apply]").bind('click', function() {
		if ($("input[name=help_apply]:checked").val() == "是") {
			//委托申请
			$("#real_identity").show();
		} else {
			$("#real_identity").hide();
		}
	});

	//选择证照类型
	$("input[name=passport_type]").bind('click', function() {
		if ($("input[name=passport_type]:checked").val() == "因公证照") {
			$("#passport_desc").html("适用于工作和学习的出境目的");
		} else {
			$("#passport_desc").html("短期请假、停薪留职、辞职等因私申请适用，外籍人士不可适用因私证照");
		}
	});
	
	//参团情况
	$("input[name=canTuan]").bind('click', function() {
		if ($("input[name=canTuan]:checked").val() == "是") {
			$("#div_can_tuan").show();
		} else {
				$("#div_can_tuan").hide();
		}
	});
	
	//选择目的
	$("#select_purpose").change(function() {
		checkPurpose($("#select_purpose").val());
	})

	function checkPurpose(purpose) {
		switch (purpose) {
		case "进修":
			$("#div_study_content").show();
			$("#div_teacher_content").show();
			$("#div_class_name").hide();
			$("#div_cooperation_content").hide();
			$("#div_train_content").hide();
			$("#div_degree_content").hide();
			$("#div_foreign_parter").hide();
			$("#div_meeting_content").hide();
			break;
		case "任教":
			$("#div_study_content").hide();
			$("#div_teacher_content").hide();
			$("#div_class_name").show();
			$("#div_cooperation_content").hide();
			$("#div_train_content").hide();
			$("#div_degree_content").hide();
			$("#div_foreign_parter").show();
			$("#div_meeting_content").hide();
			break;
		case "培训":
			$("#div_study_content").hide();
			$("#div_teacher_content").hide();
			$("#div_class_name").hide();
			$("#div_cooperation_content").hide();
			$("#div_train_content").show();
			$("#div_degree_content").hide();
			$("#div_foreign_parter").hide();
			$("#div_meeting_content").hide();
			break;
		case "科研合作":
			$("#div_study_content").hide();
			$("#div_teacher_content").hide();
			$("#div_class_name").hide();
			$("#div_cooperation_content").show();
			$("#div_train_content").hide();
			$("#div_degree_content").hide();
			$("#div_foreign_parter").show();
			$("#div_meeting_content").hide();
			break;
		case "攻读学位":
			$("#div_study_content").hide();
			$("#div_teacher_content").show();
			$("#div_class_name").hide();
			$("#div_cooperation_content").hide();
			$("#div_train_content").hide();
			$("#div_degree_content").show();
			$("#div_foreign_parter").hide();
			$("#div_meeting_content").hide();
			break;
		case "参加国际会议":
			$("#div_study_content").hide();
			$("#div_teacher_content").hide();
			$("#div_class_name").hide();
			$("#div_cooperation_content").hide();
			$("#div_train_content").hide();
			$("#div_degree_content").hide();
			$("#div_foreign_parter").hide();
			$("#div_meeting_content").show();
			break;
		}
	}

	//长期短期出访的选择
	$("input[name=visit_type]").bind(
			'click',
			function() {
				$("#select_purpose").empty();
				$("#select_purpose").append(
						"<option value='培训' selected>培训</option>");
				$("#select_purpose").append("<option value='进修'>进修</option>");
				$("#select_purpose").append(
						"<option value='科研合作'>科研合作</option>");
				$("#select_purpose").append("<option value='任教'>任教</option>");
				if ($("input[name=visit_type]:checked").val() == "长期") {
					$("#select_purpose").append(
							"<option value='攻读学位'>攻读学位</option>");
				} else {
					$("#select_purpose").append(
							"<option value='参加国际会议'>参加国际会议</option>");
				}
				checkPurpose("培训");
			});
	//计算两个日期之间的天数
	function indicateDays(dateOne, dateTwo) {
		var date1 = dateOne.split("-");
		var date2 = dateTwo.split("-");
		if (date1.length < 3 || date2.length < 3)
			return -1;
		var dateS = new Date(date1[0], date1[1] - 1, date1[2]);
		var dateE = new Date(date2[0], date2[1] - 1, date2[2]);
		var days = parseInt(Math.abs(dateS - dateE) / 1000 / 60 / 60 / 24);
		return days;
	}
</script>
</body>
</html>
