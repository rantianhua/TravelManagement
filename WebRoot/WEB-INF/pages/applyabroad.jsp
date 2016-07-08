<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp"%>
<link
	href="${pageContext.request.contextPath }/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/apply.abroad.css"
	rel="stylesheet">
<form class="form-horizontal" role="form" method="post"
	onsubmit="return checkSubmit()" action="/ht.html">
	<!-- 用来存放中转城市的个数 -->
	<input id="destination_index" style="display: none;"
		name="destinationIndex" type="text">
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
	<div class="form-group">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<p class="text-danger small text-left" id="warn_time_check"
				style="display: none;"></p>
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
	<div class="form-group" style="display: none;" id="warn_real_identity">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">表单校验信息</p>
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
			<input class="form-control passport_input" disabled value="证照名称">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">姓名</label>
		<div class="col-sm-6">
			<input class="form-control passport_input" disabled value="姓名">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">性别</label>
		<div class="col-sm-6">
			<input class="form-control passport_input" disabled value="性别">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">签发地</label>
		<div class="col-sm-6">
			<input class="form-control passport_input" disabled value="签发地">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">生日</label>
		<div class="col-sm-6">
			<input class="form-control passport_input choose_date" disabled value="生日">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">有效日期</label>
		<div class="col-sm-6">
			<input class="form-control passport_input choose_date" disabled value="有效日期">
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
	<div class="form-group" style="display: none;">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">授课名称校验</p>
		</div>
	</div>
	<div class="form-group" id="div_cooperation_content"
		style="display: none;">
		<label class="control-label col-sm-4"><span>* </span>合作内容</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group" style="display: none;">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">合作内容校验</p>
		</div>
	</div>
	<div class="form-group" id="div_train_content" style="display: block;">
		<label class="control-label col-sm-4"><span>* </span>培训内容</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">培训内容校验</p>
		</div>
	</div>
	<div class="form-group" id="div_study_content" style="display: none;">
		<label class="control-label col-sm-4"><span>* </span>进修内容</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group" style="display: none;">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">进修内容校验</p>
		</div>
	</div>
	<div class="form-group" id="div_degree_content" style="display: none;">
		<label class="control-label col-sm-4"><span>* </span>攻读学位类别</label>
		<div class="col-sm-6">
			<input class="form-control" type="text">
		</div>
	</div>
	<div class="form-group" style="display: none;">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">攻读学位类别校验</p>
		</div>
	</div>
	<div id="div_foreign_parter" style="display: none;">
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>外方合作伙伴姓名</label>
			<div class="col-sm-6">
				<input class="form-control" type="text">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">外方合作伙伴姓名校验</p>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>外方合作伙伴头衔</label>
			<div class="col-sm-6">
				<input class="form-control" type="text">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">外方合作伙伴头衔校验</p>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>外方合作伙伴专长</label>
			<div class="col-sm-6">
				<input class="form-control" type="text">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">外方合作伙伴专长校验</p>
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
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">指导教师姓名校验</p>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>指导教师头衔</label>
			<div class="col-sm-6">
				<input class="form-control" type="text">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">指导教师头衔校验</p>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>指导教师专长</label>
			<div class="col-sm-6">
				<input class="form-control" type="text">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">指导教师专长校验</p>
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
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">国际会议中文名校验</p>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>国际会议英文名</label>
			<div class="col-sm-6">
				<input class="form-control" type="text">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">国际会议英文名校验</p>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>会议情况简介</label>
			<div class="col-sm-6">
				<textarea class="form-control"></textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">会议情况简介校验</p>
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
			<input type="text" class="form-control choose_date" name="outDate"
				id="input_exit_date">
		</div>
	</div>
	<div>
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
				<input type="text" name="reachDate1"
					class="form-control choose_date">
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
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<p class="text-info text-right p_btn" id="deletDestination1"
					onclick="deletDestination(this.id)">删除该中途城市</p>
			</div>
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
			<input type="text" class="form-control choose_date" name="enterDate"
				id="input_enter_date">
		</div>
	</div>
	<div class="form-group" style="display: none">
		<label class="control-label col-sm-4">出访天数</label>
		<div class="col-sm-6">
			<p id="visit_total_days" class="form-control-static"></p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">出访路线及计划部分校验</p>
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
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">参团出访部分校验</p>
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
	<div class="form-group">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">邀请部分校验</p>
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
				<td><label class="checkbox-inline"> <input type="radio"
						value="全部负担" checked name="fudan">全部负担
				</label> &nbsp;&nbsp;&nbsp; <label class="checkbox-inline"> <input
						type="radio" value="部分负担" name="fudan">部分负担
				</label> <label class="checkbox-inline"> <input type="radio"
						value="不负担" name="fudan">不负担
				</label></td>
			</tr>
			<tr id="tr_part_pay">
				<td>部分负担费用</td>
				<td>
					<div class="col-sm-5">
						<select class="form-control">
							<option value="住宿费，餐费" selected>住宿费，餐费</option>
							<option value="机票费">机票费</option>
							<option value="其他">其他</option>
						</select>
					</div>
					<div class="col-sm-5">
						<input type="text" class="form-control"
							placeholder="选择其他时，请再次说明付费项目">
					</div>
				</td>
			</tr>
			<tr id="tr_our_pay">
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
							<td><input type="text" class="form-control"></td>
							<td><input type="text" class="form-control"></td>
							<td><select class="form-control">
									<option value="住宿费，餐费">住宿费，餐费</option>
									<option value="机票费">机票费</option>
									<option value="其他">其他</option>
							</select></td>
							<td><input type="text" class="form-control"></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control"></td>
							<td><input type="text" class="form-control"></td>
							<td><select class="form-control">
									<option value="住宿费，餐费">住宿费，餐费</option>
									<option value="机票费">机票费</option>
									<option value="其他">其他</option>
							</select></td>
							<td><input type="text" class="form-control"></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control"></td>
							<td><input type="text" class="form-control"></td>
							<td><select class="form-control">
									<option value="住宿费，餐费">住宿费，餐费</option>
									<option value="机票费">机票费</option>
									<option value="其他">其他</option>
							</select></td>
							<td><input type="text" class="form-control"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr id="tr_other_pay">
				<td>其他出资方</td>
				<td>
					<table class="table table-bordered">
						<tr>
							<td>资助范围</td>
							<td><textarea class="form-control"></textarea></td>
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
	<div style="width:85%;margin-left:15%;">
		<!-- 该处填写表单校验的错误 -->
		<p class="text-danger small text-left">经费信息部分校验</p>
	</div>

	<div class="form-group">
		<div class="col-sm-6" style="text-align: right;">
			<button type="submit" class="btn btn-default">保&#12288;存</button>
		</div>
		<div class="col-sm-6" style="text-align: left;">
			<button type="submit" class="btn btn-default">下一步</button>
		</div>
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
	$(document)
			.ready(
					function() {
						bindDateTimePicker();
						$("#start_time").change(function() {
							checkTime();
						});
						$("#input_exit_date").change(function() {
							calOutDays();
						});
						$("#input_enter_date").change(function() {
							calOutDays();
						});
						//是否选择委托申请
						$("input[name=help_apply]").bind(
								'click',
								function() {
									if ($("input[name=help_apply]:checked")
											.val() == "是") {
										//委托申请
										$("#real_identity").show();
										$("#warn_real_identity").show();
										$(".passport_input").removeAttr("disabled");
									} else {
										$("#real_identity").hide();
										$("#warn_real_identity").hide();
										$(".passport_input").attr("disabled","disabled");
									}
								});

						//选择证照类型
						$("input[name=passport_type]")
								.bind(
										'click',
										function() {
											if ($(
													"input[name=passport_type]:checked")
													.val() == "因公证照") {
												$("#passport_desc").html(
														"适用于工作和学习的出境目的");
											} else {
												$("#passport_desc")
														.html(
																"短期请假、停薪留职、辞职等因私申请适用，外籍人士不可适用因私证照");
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
						});

						//长期短期出访的选择
						$("input[name=visit_type]")
								.bind(
										'click',
										function() {
											$("#select_purpose").empty();
											$("#select_purpose")
													.append(
															"<option value='培训' selected>培训</option>");
											$("#select_purpose")
													.append(
															"<option value='进修'>进修</option>");
											$("#select_purpose")
													.append(
															"<option value='科研合作'>科研合作</option>");
											$("#select_purpose")
													.append(
															"<option value='任教'>任教</option>");
											if ($(
													"input[name=visit_type]:checked")
													.val() == "长期") {
												$("#select_purpose")
														.append(
																"<option value='攻读学位'>攻读学位</option>");
											} else {
												$("#select_purpose")
														.append(
																"<option value='参加国际会议'>参加国际会议</option>");
											}
											checkPurpose("培训");
										});
						$("input[name=fudan]").bind('click', function() {
							var value = $("input[name=fudan]:checked").val();
							if (value == "全部负担") {
								$("#tr_our_pay").hide();
								$("#tr_other_pay").hide();
								$("#tr_part_pay").hide();
							} else if (value == "部分负担") {
								$("#tr_our_pay").show();
								$("#tr_other_pay").show();
								$("#tr_part_pay").show();
							} else {
								$("#tr_our_pay").show();
								$("#tr_other_pay").show();
								$("#tr_part_pay").hide();
							}
						});

					});

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

	//添加一个新的中途到达城市
	function addDestination() {
		var newReach = '	<div><div class="form-group"><label class="control-label col-sm-4"><span>* </span>抵达国家</label><div class="col-sm-6"><input type="text"name="reachCountry' + reachIndex +'" class="form-control"></div></div><div class="form-group"><label class="control-label col-sm-4"><span>* </span>抵达城市</label><div class="col-sm-6"><input type="text"name="reachCity' + reachIndex + '" class="form-control"></div></div><div class="form-group"><label class="control-label col-sm-4"><span>* </span>抵达日期</label><div class="col-sm-6"><input type="text"name="reachDate' + reachIndex + '" class="form-control choose_date"></div></div><div class="form-group"><label class="control-label col-sm-4"><span>* </span>离境日期</label><div class="col-sm-6"><input type="text"name="exitDate' + reachIndex + '" class="form-control choose_date"></div></div><div class="form-group"><label class="control-label col-sm-4">是否过境转机</label><div class="col-sm-6"><div><label class="checkbox-inline"><input type="radio"value="0"checked name="transfer'+reachIndex+'">是</label><label class="checkbox-inline"><input type="radio"value="1"name="transfer'+reachIndex+'">否</label></div></div></div><div class="form-group"><label class="control-label col-sm-4"><span>* </span>转机地点</label><div class="col-sm-6"><input type="text"name="transferAdress'+reachIndex+'"class="form-control"></div></div><div class="form-group"style="display: none;"><label class="control-label col-sm-4"><span>* </span>停留时间</label><div class="col-sm-6"><p id="stayTime' + reachIndex +'" class="form-control-static"></p></div></div><div class="form-group"><div class="col-sm-4"></div><div class="col-sm-6"><p class="text-info text-right p_btn" id="deletDestination"'
				+ reachIndex
				+ ' onclick="deletDestination(this.id)">删除该中途城市</p></div></div></div>';
		$("#div_add_destination").before(newReach);
		reachIndex = reachIndex + 1;
		bindDateTimePicker();
	}

	//计算出访天数
	function calOutDays() {
		var outDate = $("#input_exit_date").val();
		var backDate = $("#input_enter_date").val();
		if (checkDateFormat(outDate) && checkDateFormat(backDate)) {
			var days = indicateDays(backDate, outDate);
			$("#visit_total_days").parent().parent().show();
			$("#visit_total_days").text(days + "天");
		}
	}

	//检查时间格式是否正确
	function checkDateFormat(date) {
		var result = date.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
		if (result == null)
			return false;
		var d = new Date(result[1], result[3] - 1, result[4]);
		return (d.getFullYear() == result[1] && (d.getMonth() + 1) == result[3] && d
				.getDate() == result[4]);
	}

	//根据时间做计算和检查
	function checkTime() {
		var startTime = $('#start_time').val();
		if (!checkDateFormat(startTime))
			return;
		var toDay = new Date();
		var toDayS = toDay.getFullYear() + "-" + (toDay.getMonth() + 1) + "-"
				+ toDay.getDate();
		var days = indicateDays(startTime, toDayS);
		if (days < 5) {
			$("#warn_time_check").show();
			$("#warn_time_check").text("时间不够，不足５天无法办理");
		}
	}

	function checkPurpose(purpose) {
		switch (purpose) {
		case "进修":
			$("#div_study_content").show();
			$("#div_study_content").next().show();
			$("#div_teacher_content").show();
			$("#div_class_name").hide();
			$("#div_class_name").next().hide();
			$("#div_cooperation_content").hide();
			$("#div_cooperation_content").next().hide();
			$("#div_train_content").hide();
			$("#div_train_content").next().hide();
			$("#div_degree_content").hide();
			$("#div_degree_content").next().hide();
			$("#div_foreign_parter").hide();
			$("#div_meeting_content").hide();
			break;
		case "任教":
			$("#div_study_content").hide();
			$("#div_study_content").next().hide();
			$("#div_teacher_content").hide();
			$("#div_class_name").show();
			$("#div_class_name").next().show();
			$("#div_cooperation_content").hide();
			$("#div_cooperation_content").next().hide();
			$("#div_train_content").hide();
			$("#div_train_content").next().hide();
			$("#div_degree_content").hide();
			$("#div_degree_content").next().hide();
			$("#div_foreign_parter").show();
			$("#div_meeting_content").hide();
			break;
		case "培训":
			$("#div_study_content").hide();
			$("#div_study_content").next().hide();
			$("#div_teacher_content").hide();
			$("#div_class_name").hide();
			$("#div_class_name").next().hide();
			$("#div_cooperation_content").hide();
			$("#div_cooperation_content").next().hide();
			$("#div_train_content").show();
			$("#div_train_content").next().show();
			$("#div_degree_content").hide();
			$("#div_degree_content").next().hide();
			$("#div_foreign_parter").hide();
			$("#div_meeting_content").hide();
			break;
		case "科研合作":
			$("#div_study_content").hide();
			$("#div_study_content").next().hide();
			$("#div_teacher_content").hide();
			$("#div_class_name").hide();
			$("#div_class_name").next().hide();
			$("#div_cooperation_content").show();
			$("#div_cooperation_content").next().show();
			$("#div_train_content").hide();
			$("#div_train_content").next().hide();
			$("#div_degree_content").hide();
			$("#div_degree_content").next().hide();
			$("#div_foreign_parter").show();
			$("#div_meeting_content").hide();
			break;
		case "攻读学位":
			$("#div_study_content").hide();
			$("#div_study_content").next().hide();
			$("#div_teacher_content").show();
			$("#div_class_name").hide();
			$("#div_class_name").next().hide();
			$("#div_cooperation_content").hide();
			$("#div_cooperation_content").next().hide();
			$("#div_train_content").hide();
			$("#div_train_content").next().hide();
			$("#div_degree_content").show();
			$("#div_degree_content").next().show();
			$("#div_foreign_parter").hide();
			$("#div_meeting_content").hide();
			break;
		case "参加国际会议":
			$("#div_study_content").hide();
			$("#div_study_content").next().hide();
			$("#div_teacher_content").hide();
			$("#div_class_name").hide();
			$("#div_class_name").next().hide();
			$("#div_cooperation_content").hide();
			$("#div_cooperation_content").next().hide();
			$("#div_train_content").hide();
			$("#div_train_content").next().hide();
			$("#div_degree_content").hide();
			$("#div_train_content").next().hide();
			$("#div_foreign_parter").hide();
			$("#div_meeting_content").show();
			break;
		}
	}

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

	function deletDestination(id) {
		$("#" + id).parent().parent().parent().remove();
	}

	function checkSubmit() {
		if (!checkDateFormat($("#start_time").val())) {
			alert("必须完成时限检验！");
			return false;
		}
		if ($("#warn_time_check").text().length > 0) {
			alert("时限检验不通过，无法继续操作！");
			return false;
		}
		$("#destination_index").val(reachIndex);
		return true;
	}
</script>
</body>
</html>