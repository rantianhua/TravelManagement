<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp"%>
<form class="form-horizontal" role="form">
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span> 出发时间</label>
		<div class="col-sm-6">
			<input id="start_time" class="form-control" type="text"
				data-date-format="yyyy-mm-dd">
		</div>
	</div>
	<!-- 提示信息 -->
	<div class="col-sm-offset-4 col-sm-6">
		<p></p>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span> 选择身份</label>
		<div class="col-sm-6">
			<select class="form-control">
				<option>教学及科研人员</option>
				<option>行政人员</option>
				<option>学生</option>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">是否首次办理</label>
		<div class="col-sm-6">
			<div>
				<label class="checkbox-inline"> <input type="radio" checked
					name="optionsRadios">是
				</label> <label class="checkbox-inline"> <input type="radio"
					value="1" name="optionsRadios">否
				</label>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">证照类型选择</label>
		<div class="col-sm-6">
			<div>
				<label class="checkbox-inline"> <input type="radio"
					value="0" checked name="password_type">因公证照
				</label> <label class="checkbox-inline"> <input type="radio"
					value="1" name="password_type">因私证照
				</label>
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
		<label class="control-label col-sm-4">选择长期短期</label>
		<div class="col-sm-6">
			<div>
				<label class="checkbox-inline"> <input type="radio"
					value="0" checked name="type">长期
				</label> <label class="checkbox-inline"> <input type="radio"
					value="1" name="type">短期
				</label>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">出访目的</label>
		<div class="col-sm-6">
			<select class="form-control">
				<option value="培训" selected>培训</option>
				<option value="进修">进修</option>
				<option value="任教">任教</option>
				<option value="科研合作">科研合作</option>
				<option value="攻读学位">攻读学位</option>
				<option value="参加国际会议">参加国际会议</option>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span>授课名称</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span>合作内容</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span>培训内容</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span>进修内容</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span>攻读学位类别</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span>外方合伙伴姓名</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span>外方合伙伴头衔</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span>外方合伙伴专长</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span>指导教师姓名</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span>指导教师头衔</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span>指导教师专长</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span>国际会议中文名</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span>国际会议英文名</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>*</span>会议情况简介</label>
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
	<!-- 出访路线及计划部分 -->
	<div class="form-group">
		<label class="control-label col-sm-4">离境城市</label>
		<div class="col-sm-6">
			<input type="text" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>离境日期</label>
		<div class="col-sm-6">
			<input type="text" class="form-control">
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
			<input type="text" name="reachDate1" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>离境日期</label>
		<div class="col-sm-6">
			<input type="text" name="exitDate1" class="form-control">
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
	<div class="form-group" style="display: none;">
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
		<label class="control-label col-sm-4"><span>* </span>入境城市</label>
		<div class="col-sm-6">
			<input type="text" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>入境日期</label>
		<div class="col-sm-6">
			<input type="text" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>出访天数</label>
		<div class="col-sm-6">
			<p id="visit_total_days" class="form-control-static"></p>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">是否参团</label>
		<div class="col-sm-6">
			<div>
				<label class="checkbox-inline"> <input type="radio"
					value="0" checked name="canTuan">是
				</label> <label class="checkbox-inline"> <input type="radio"
					value="1" name="canTuan">否
				</label>
			</div>
		</div>
	</div>
	<div>
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
	<!-- 经费信息 -->
	<div
		style="width:70%;margin-left:auto;margin-right:auto;margin-top: 40px;">
		<table class="table table-bordered">
			<tr>
				<td>邀请方负担情况</td>
				<td><label> <input type="radio" value="0" checked name="fudan">全部负担
				</label> &nbsp;&nbsp;&nbsp; <label> <input type="radio" value="1" name="fudan">部分负担
				</label> <label> <input type="radio" value="２" name="fudan">不负担
				</label></td>
			</tr>
			<tr>
				<td>部分负担费用</td>
				<td>
				<select>
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
	$('#start_time').datetimepicker({
		format : "yyyy-mm-dd",
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		language : 'zh-CN',
		minView : 'month'
	});
	function addDestination() {
		var newReach = '<div class="form-group"><label class="control-label col-sm-4"><span>*</span>抵达国家</label><div class="col-sm-6"><input type="text"name="reachCountry' + reachIndex +'" class="form-control"></div></div><div class="form-group"><label class="control-label col-sm-4"><span>*</span>抵达城市</label><div class="col-sm-6"><input type="text"name="reachCity' + reachIndex + '" class="form-control"></div></div><div class="form-group"><label class="control-label col-sm-4"><span>*</span>抵达日期</label><div class="col-sm-6"><input type="text"name="reachDate' + reachIndex + '" class="form-control"></div></div><div class="form-group"><label class="control-label col-sm-4"><span>*</span>离境日期</label><div class="col-sm-6"><input type="text"name="exitDate' + reachIndex + '" class="form-control"></div></div><div class="form-group"><label class="control-label col-sm-4">是否过境转机</label><div class="col-sm-6"><div><label class="checkbox-inline"><input type="radio"value="0"checked name="transfer'+reachIndex+'">是</label><label class="checkbox-inline"><input type="radio"value="1"name="transfer'+reachIndex+'">否</label></div></div></div><div class="form-group"><label class="control-label col-sm-4"><span>*</span>转机地点</label><div class="col-sm-6"><input type="text"name="transferAdress'+reachIndex+'"class="form-control"></div></div><div class="form-group"style="display: none;"><label class="control-label col-sm-4"><span>*</span>停留时间</label><div class="col-sm-6"><p id="stayTime1' + reachIndex +'" class="form-control-static"></p></div></div>';
		$("#div_add_destination").before(newReach);
		reachIndex = reachIndex + 1;
	}
</script>
</body>
</html>
