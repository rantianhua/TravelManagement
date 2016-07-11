<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="navigation.jsp"%>
<link
	href="${pageContext.request.contextPath }/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/apply.abroad.css"
	rel="stylesheet">
<c:set var="validate" scope="request" value="${empty requestScope.form}" />
<c:set var="none" scope="request" value="${empty requestScope.apply }" />
<br>
<br>
<br>
<form class="form-horizontal" role="form" method="post"
	onsubmit="return checkSubmit();" enctype="multipart/form-data"
	action="${pageContext.request.contextPath }/servlet/ApplyAbroadServlet">
	<input type="text" hidden="hidden" name="applicationNumber"
		value="${requestScope.apply.applicationNumber }"> <input
		type="text" hidden="hidden" name="planInfo"
		value="${requestScope.apply.plan }"> <input type="text"
		hidden="hidden" name="purposeInfo"
		value="${requestScope.apply.purpose }"> <input type="text"
		hidden="hidden" name="inviterInfo"
		value="${requestScope.apply.inviterInfo }">
	<!-- 用来区分下一步和临时保存 -->
	<input id="submit_name" name="submitName" style="display:none;"
		value="tempSave">
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
				name="startTime" data-date-format="yyyy-mm-dd"
				value="${requestScope.form.startTime }">
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
			<select class="form-control" name="category">
				<option value="教学"
					${(validate ? (none ? sessionScope.hr.category:requestScope.apply.category):requestScope.form.category)=='教学'?'selected':'' }>教学及科研人员</option>
				<option value="行政"
					${(validate ? (none ? sessionScope.hr.category:requestScope.apply.category):requestScope.form.category)=='行政'?'selected':'' }>行政人员</option>
				<option value="学生"
					${(validate ? (none ? sessionScope.hr.category:requestScope.apply.category):requestScope.form.category)=='学生'?'selected':'' }>学生</option>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">是否委托申请</label>
		<div class="col-sm-6">
			<div>
				<label class="checkbox-inline"> <input type="radio"
					name="help_apply" value="是"
					${(validate ? empty requestScope.apply.assigneeId:empty requestScope.form.assigneeId) ? '':'checked'}>是
				</label> <label class="checkbox-inline"> <input type="radio"
					value="否" name="help_apply"
					${(validate ? empty requestScope.apply.assigneeId:empty requestScope.form.assigneeId) ? 'checked':''}>否
				</label>
			</div>
		</div>
	</div>
	<div class="form-group" id="real_identity"
		style="display: ${(validate ? empty requestScope.apply.assigneeId:empty requestScope.form.assigneeId) ? 'none':'block'};">
		<label class="control-label col-sm-4"><span>* </span>申请人身份证号</label>
		<div class="col-sm-6">
			<input class="form-control" name="assigneeId" type="text"
				value="${none ? requestScope.form.assigneeId:requestScope.apply.assigneeId }">
		</div>
	</div>
	<div class="form-group" id="warn_real_identity">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">${requestScope.form.errors.assigneeId }</p>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">证照类型选择</label>
		<div class="col-sm-6">
			<div>
				<label class="checkbox-inline"> <input type="radio"
					value="因公证照" name="licenceType"
					${(validate ? requestScope.apply.licenceType:requestScope.form.licenceType)=='因公证照' ? 'checked':'' }>因公证照
				</label> <label class="checkbox-inline"> <input type="radio"
					value="因私证照" name="licenceType"
					${(validate ? requestScope.apply.licenceType:requestScope.form.licenceType)=='因私证照' ? 'checked':'' }>因私证照
				</label> <small class="checkbox-inline" style="vertical-align: bottom;"
					id="passport_desc">适用于工作和学习的出境目的</small>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">证照名称</label>
		<div class="col-sm-6">
			<input class="form-control passport_input" name="passportName"
				value="${validate ? (none ? requestScope.passport.passportName:requestScope.apply.passport.passportName):requestScope.form.passportName }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">姓名</label>
		<div class="col-sm-6">
			<input class="form-control passport_input" name="name"
				value="${validate ? (none ? requestScope.passport.name:requestScope.apply.passport.name):requestScope.form.name }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">性别</label>
		<div class="col-sm-6">
			<input class="form-control passport_input" name="sex"
				value="${validate ? (none ? requestScope.passport.sex:requestScope.apply.passport.sex):requestScope.form.sex }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">签发地</label>
		<div class="col-sm-6">
			<input class="form-control passport_input" name="issuingPlace"
				value="${validate ? (none ? requestScope.passport.issuingPlace:requestScope.apply.passport.issuingPlace):requestScope.form.issuingPlace }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">生日</label>
		<div class="col-sm-6">
			<input class="form-control passport_input choose_date"
				name="birthday"
				value="${validate ? (none ? requestScope.passport.birthday:requestScope.apply.passport.birthday):requestScope.form.birthday }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">有效日期</label>
		<div class="col-sm-6">
			<input class="form-control passport_input choose_date" name="expDate"
				value="${validate ? (none ? requestScope.passport.expDate:requestScope.apply.passport.expDate):requestScope.form.expDate }">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">${requestScope.form.errors.passport }</p>
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
					value="长期" name="type"
					${(validate ? requestScope.apply.type:requestScope.form.type)=='长期' ? 'checked':'' }>长期
				</label> <label class="checkbox-inline"> <input type="radio"
					value="短期" name="type"
					${(validate ? requestScope.apply.type:requestScope.form.type)=='短期' ? 'checked':'' }>短期
				</label>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">${requestScope.form.errors.type }</p>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">出访目的</label>
		<div class="col-sm-6">
			<select class="form-control" id="select_purpose" name="purpose">
				<option value="培训"
					${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='培训' ? 'selected':'' }>培训</option>
				<option value="进修"
					${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='进修' ? 'selected':'' }>进修</option>
				<option value="任教"
					${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='任教' ? 'selected':'' }>任教</option>
				<option value="科研合作"
					${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='科研合作' ? 'selected':'' }>科研合作</option>
				<c:choose>
					<c:when
						test="${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='参加国际会议' }">
						<option value="参加国际会议"
							${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='参加国际会议' ? 'selected':'' }>参加国际会议</option>
					</c:when>
					<c:otherwise>
						<option value="攻读学位"
							${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='攻读学位' ? 'selected':'' }>攻读学位</option>
					</c:otherwise>
				</c:choose>
			</select>
		</div>
	</div>
	<div class="form-group" id="div_class_name"
		style="display: ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='任教' ? 'blocked':'none' };">
		<label class="control-label col-sm-4"><span>* </span>授课名称</label>
		<div class="col-sm-6">
			<input class="form-control" type="text" name="className"
				value="${validate ? requestScope.apply.vpurpose.className:requestScope.form.className }">
		</div>
	</div>
	<div class="form-group"
		style="display: ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='任教' ? 'blocked':'none' };">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">${requestScope.form.errors.className }</p>
		</div>
	</div>
	<div class="form-group" id="div_cooperation_content"
		style="display: ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='科研合作' ? 'blocked':'none' };">
		<label class="control-label col-sm-4"><span>* </span>合作内容</label>
		<div class="col-sm-6">
			<input class="form-control" type="text" name="cooperationCotent"
				value="${validate ? requestScope.apply.vpurpose.cooperationCotent:requestScope.form.cooperationCotent }">
		</div>
	</div>
	<div class="form-group"
		style="display: ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='科研合作' ? 'blocked':'none' };">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">${requestScope.form.errors.cooperationCotent }</p>
		</div>
	</div>
	<div class="form-group" id="div_train_content"
		style="display: ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='培训' ? 'blocked':'none' };">
		<label class="control-label col-sm-4"><span>* </span>培训内容</label>
		<div class="col-sm-6">
			<input class="form-control" type="text" name="trainContent"
				value="${validate ? requestScope.apply.vpurpose.trainContent:requestScope.form.trainContent }">
		</div>
	</div>
	<div class="form-group"
		style="display: ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='培训' ? 'blocked':'none' };">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">${requestScope.form.errors.trainContent }</p>
		</div>
	</div>
	<div class="form-group" id="div_study_content"
		style="display: ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='进修' ? 'blocked':'none' };">
		<label class="control-label col-sm-4"><span>* </span>进修内容</label>
		<div class="col-sm-6">
			<input class="form-control" type="text" name="studyContent"
				value="${validate ? requestScope.apply.vpurpose.studyContent:requestScope.form.studyContent }">
		</div>
	</div>
	<div class="form-group"
		style="display: ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='进修' ? 'blocked':'none' };">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">${requestScope.form.errors.studyContent }</p>
		</div>
	</div>
	<div class="form-group" id="div_degree_content"
		style="display: ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='攻读学位' ? 'blocked':'none' };">
		<label class="control-label col-sm-4"><span>* </span>攻读学位类别</label>
		<div class="col-sm-6">
			<input class="form-control" type="text" name="degreeType"
				value="${validate ? requestScope.apply.vpurpose.degreeType:requestScope.form.degreeType }">
		</div>
	</div>
	<div class="form-group"
		style="display: ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='攻读学位' ? 'blocked':'none' };">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">${requestScope.form.errors.degreeType }</p>
		</div>
	</div>
	<div id="div_foreign_parter"
		style="display: ${((validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='科研合作' || (validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='任教') ? 'blocked':'none' };">
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>外方合作伙伴姓名</label>
			<div class="col-sm-6">
				<input class="form-control" type="text" name="partnerName"
					value="${validate ? requestScope.apply.vpurpose.partnerName:requestScope.form.partnerName }">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">${requestScope.form.errors.partnerName }</p>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>外方合作伙伴头衔</label>
			<div class="col-sm-6">
				<input class="form-control" type="text" name="partnerTitle"
					value="${validate ? requestScope.apply.vpurpose.partnerTitle:requestScope.form.partnerTitle }">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">${requestScope.form.errors.partnerTitle }</p>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>外方合作伙伴专长</label>
			<div class="col-sm-6">
				<input class="form-control" type="text" name="partnerExpertise"
					value="${validate ? requestScope.apply.vpurpose.partnerExpertise:requestScope.form.partnerExpertise }">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">${requestScope.form.errors.partnerExpertise }</p>
			</div>
		</div>
	</div>
	<div id="div_teacher_content"
		style="display: ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='进修' || (validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='攻读学位' ? 'blocked':'none' };">
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>指导教师姓名</label>
			<div class="col-sm-6">
				<input class="form-control" type="text" name="teacherName"
					value="${validate ? requestScope.apply.vpurpose.teacherName:requestScope.form.teacherName }">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">${requestScope.form.errors.teacherName }</p>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>指导教师头衔</label>
			<div class="col-sm-6">
				<input class="form-control" type="text" name="teacherTitle"
					value="${validate ? requestScope.apply.vpurpose.teacherTitle:requestScope.form.teacherTitle }">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">${requestScope.form.errors.teacherTitle }</p>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>指导教师专长</label>
			<div class="col-sm-6">
				<input class="form-control" type="text" name="teacherExpertise"
					value="${validate ? requestScope.apply.vpurpose.teacherExpertise:requestScope.form.teacherExpertise }">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">${requestScope.form.errors.teacherExpertise }</p>
			</div>
		</div>
	</div>
	<div id="div_meeting_content"
		style="display: ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='参加国际会议' ? 'blocked':'none' };">
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>国际会议中文名</label>
			<div class="col-sm-6">
				<input class="form-control" type="text" name="conferenceNameCh"
					value="${validate ? requestScope.apply.vpurpose.conferenceNameCh:requestScope.form.conferenceNameCh }">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">${requestScope.form.errors.conferenceNameCh }</p>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>国际会议英文名</label>
			<div class="col-sm-6">
				<input class="form-control" type="text" name="conferenceNameEn"
					value="${validate ? requestScope.apply.vpurpose.conferenceNameEn:requestScope.form.conferenceNameEn }">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">${requestScope.form.errors.conferenceNameEn }</p>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>会议情况简介</label>
			<div class="col-sm-6">
				<textarea class="form-control" name="conferenceDesc">${validate ? requestScope.apply.vpurpose.conferenceDesc:requestScope.form.conferenceDesc }</textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">${requestScope.form.errors.conferenceDesc }</p>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>是否受邀发言</label>
			<div class="col-sm-6">
				<div>
					<label class="checkbox-inline"> <input type="radio"
						value="0"
						${(validate ? requestScope.apply.vpurpose.speech:requestScope.form.speech)=='0' ? 'checked':'' }
						name="speech">是
					</label> <label class="checkbox-inline"> <input type="radio"
						${(validate ? requestScope.apply.vpurpose.speech:requestScope.form.speech)=='1' ? 'checked':'' }
						value="1" name="speech">否
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<!-- 该处填写表单校验的错误 -->
				<p class="text-danger small text-left">${requestScope.form.errors.speech }</p>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4">发言提纲</label>
			<div class="col-sm-6">
				<input type="file" value="上传文件" name="speechOutline">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4">论文提纲</label>
			<div class="col-sm-6">
				<textarea class="form-control" name="paperOutline">${validate ? requestScope.apply.vpurpose.paperOutline:requestScope.form.paperOutline }</textarea>
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
	<input type="text" hidden="hidden" id="reachCount"
		value="${validate ? (none ? '1':(fn:length(requestScope.apply.vplan.destinations))):(fn:length(requestScope.form.dests)) }">
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>离境城市</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" name="outCity"
				value="${validate ? requestScope.apply.vplan.outCity:requestScope.form.outCity }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>离境日期</label>
		<div class="col-sm-6">
			<input type="text" class="form-control choose_date"
				name="exitBorderDate" id="input_exit_date"
				value="${validate ? requestScope.apply.vplan.exitBorderDate:requestScope.form.exitBorderDate }">
		</div>
	</div>
	<div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>抵达国家</label>
			<div class="col-sm-6">
				<input type="text" name="reachCountry1" class="form-control"
					value="${validate ? requestScope.apply.vplan.destinations['0'].country:requestScope.form.dests['0'].country }">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>抵达城市</label>
			<div class="col-sm-6">
				<input type="text" name="reachCity1" id="reach_city"
					class="form-control"
					value="${validate ? requestScope.apply.vplan.destinations['0'].city:requestScope.form.dests['0'].city }">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>抵达日期</label>
			<div class="col-sm-6">
				<input type="text" name="reachDate1"
					class="form-control choose_date"
					value="${validate ? requestScope.apply.vplan.destinations['0'].arriveDate:requestScope.form.dests['0'].arriveDate }">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>离境日期</label>
			<div class="col-sm-6">
				<input type="text" name="exitDate1" class="form-control choose_date"
					value="${validate ? requestScope.apply.vplan.destinations['0'].exitCityDate:requestScope.form.dests['0'].exitCityDate }">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>是否过境转机</label>
			<div class="col-sm-6">
				<div>
					<label class="checkbox-inline"> <input type="radio"
						value="0" name="transfer1"
						${(validate ? (empty requestScope.apply.vplan.destinations['0'].transAddr):(empty requestScope.form.dests['0'].transAddr)) ? '':'checked' }>是
					</label> <label class="checkbox-inline"> <input type="radio"
						value="1" name="transfer1"
						${(validate ? (empty requestScope.apply.vplan.destinations['0'].transAddr):(empty requestScope.form.dests['0'].transAddr)) ? 'checked':'' }>否
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4">转机地点</label>
			<div class="col-sm-6">
				<input type="text" name="transferAdress1" class="form-control"
					value="${validate ? requestScope.apply.vplan.destinations['0'].transAddr:requestScope.form.dests['0'].transAddr }">
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
	<c:forEach var="d"
		items="${validate ? requestScope.apply.vplan.destinations:requestScope.form.dests }"
		begin="1" varStatus="vts">
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>抵达国家</label>
			<div class="col-sm-6">
				<input type="text" name="reachCountry${vts.count+1 }"
					class="form-control" value="${d.country }">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>抵达城市</label>
			<div class="col-sm-6">
				<input type="text" name="reachCity${vts.count+1 }" id="reach_city"
					class="form-control" value="${d.city }">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>抵达日期</label>
			<div class="col-sm-6">
				<input type="text" name="reachDate${vts.count+1 }"
					class="form-control choose_date" value="${d.arriveDate }">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>离境日期</label>
			<div class="col-sm-6">
				<input type="text" name="exitDate${vts.count+1 }"
					class="form-control choose_date" value="${d.exitCityDate }">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>是否过境转机</label>
			<div class="col-sm-6">
				<div>
					<label class="checkbox-inline"> <input type="radio"
						value="0" name="transfer${vts.count+1 }"
						${empty d.transAddr ? '':'checked' }>是
					</label> <label class="checkbox-inline"> <input type="radio"
						value="1" name="transfer${vts.count+1 }"
						${empty d.transAddr ? 'checked':'' }>否
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4">转机地点</label>
			<div class="col-sm-6">
				<input type="text" name="transferAdress${vts.count+1 }"
					class="form-control" value="${d.transAddr }">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-6">
				<p class="text-info text-right p_btn"
					id="deletDestination${vts.count+1 }"
					onclick="deletDestination(this.id)">删除该中途城市</p>
			</div>
		</div>
	</c:forEach>
	<div class="form-group" id="div_add_destination">
		<div class="col-sm-offset-4 col-sm-6">
			<button type="button" class="btn btn-default"
				onclick="addDestination()">添加抵达城市</button>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>回国入境城市</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" name="backCity"
				value="${validate ? requestScope.apply.vplan.backCity:requestScope.form.backCity }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>入境日期</label>
		<div class="col-sm-6">
			<input type="text" class="form-control choose_date"
				id="input_enter_date" name="enterBorderDate"
				value="${validate ? requestScope.apply.vplan.enterBorderDate:requestScope.form.enterBorderDate }">
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
			<p class="text-danger small text-left">${requestScope.form.errors.plan }</p>
		</div>
	</div>
	<input id="cityCount" type="text" name="cityCount" value="1"
		hidden="hidden">
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
					value="是" name="canTuan"
					${(validate ? requestScope.apply.canTuan:requestScope.form.canTuan)=='是' ? 'checked':'' }>是
				</label> <label class="checkbox-inline"> <input type="radio"
					value="否" name="canTuan"
					${(validate ? requestScope.apply.canTuan:requestScope.form.canTuan)=='否' ? 'checked':'' }>否
				</label>
			</div>
		</div>
	</div>
	<div id="div_can_tuan"
		style="display: ${(validate ? requestScope.apply.canTuan:requestScope.form.canTuan)=='是' ? 'block':'none' };">
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>组团单位</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="groupUnit"
					value="${validate ? requestScope.apply.groupUnit:requestScope.form.groupUnit }">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>出访审批单位</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="examineUnit"
					value="${validate ? requestScope.apply.examineUnit:requestScope.form.examineUnit }">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>团组职务</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="groupWork"
					value="${validate ? requestScope.apply.groupWork:requestScope.form.groupWork }">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4"><span>* </span>成员名单</label>
			<div class="col-sm-6">
				<input type="file" name="groupMembers">
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">${requestScope.form.errors.group }</p>
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
			<input type="text" class="form-control" name="iName"
				value="${validate ? requestScope.apply.inviter.name:requestScope.form.iName }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>中文头衔</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" name="iTitleCh"
				value="${validate ? requestScope.apply.inviter.titleCh:requestScope.form.iTitleCh }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>英文头衔</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" name="iTitleEn"
				value="${validate ? requestScope.apply.inviter.titleEn:requestScope.form.iTitleEn }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>单位名称</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" name="unitName"
				value="${validate ? requestScope.apply.inviter.unitName:requestScope.form.unitName }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>单位地址</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" name="address"
				value="${validate ? requestScope.apply.inviter.address:requestScope.form.address }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>联系电话</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" name="telephone"
				value="${validate ? requestScope.apply.inviter.telephone:requestScope.form.telephone }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>电子邮箱</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" name="email"
				value="${validate ? requestScope.apply.inviter.email:requestScope.form.email }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4"><span>* </span>单位网址</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" name="url"
				value="${validate ? requestScope.apply.inviter.url:requestScope.form.url }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">邀请函原件</label>
		<div class="col-sm-6">
			<input type="file" name="invitationRaw">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4">邀请函中文翻译件</label>
		<div class="col-sm-6">
			<input type="file" name="invitationZh">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<!-- 该处填写表单校验的错误 -->
			<p class="text-danger small text-left">${requestScope.form.errors.invite }</p>
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
						value="0" name="inviterPay"
						${(validate ? requestScope.apply.inviterPay:requestScope.form.inviterPay)=='0' ? 'checked':'' }>全部负担
				</label> &nbsp;&nbsp;&nbsp; <label class="checkbox-inline"> <input
						type="radio" value="1" name="inviterPay"
						${(validate ? requestScope.apply.inviterPay:requestScope.form.inviterPay)=='1' ? 'checked':'' }>部分负担
				</label> <label class="checkbox-inline"> <input type="radio"
						value="2" name="inviterPay"
						${(validate ? requestScope.apply.inviterPay:requestScope.form.inviterPay)=='2' ? 'checked':'' }>不负担
				</label></td>
			</tr>
			<tr id="tr_part_pay"
				style="display: ${(validate ? requestScope.apply.inviterPay:requestScope.form.inviterPay)=='1' ? 'block':'none' };">
				<td>部分负担费用</td>
				<td>
					<div class="col-sm-5">
						<select class="form-control" name="payItem1">
							<option value="住宿费，餐费"
								${(validate ? requestScope.apply.funds['0'].payItem:requestScope.form.fds['0'].payItem)=='住宿费，餐费' ? 'selected':'' }>住宿费，餐费</option>
							<option value="机票费"
								${(validate ? requestScope.apply.funds['0'].payItem:requestScope.form.fds['0'].payItem)=='机票费' ? 'selected':'' }>机票费</option>
							<option value="其他"
								${(validate ? requestScope.apply.funds['0'].payItem:requestScope.form.fds['0'].payItem)=='其他' ? 'selected':'' }>其他</option>
						</select>
					</div>
					<div class="col-sm-5">
						<input type="text" class="form-control" name="ps1"
							placeholder="选择其他时，请再次说明付费项目"
							value="${(validate ? requestScope.apply.funds['0'].ps:requestScope.form.fds['0'].ps)}">
					</div>
				</td>
			</tr>
			<tr id="tr_our_pay"
				style="display: ${((validate ? requestScope.apply.inviterPay:requestScope.form.inviterPay)=='1' || (validate ? requestScope.apply.inviterPay:requestScope.form.inviterPay)=='2')? 'block':'none' };">
				<td>我方负担情况</td>
				<td>
					<table class="table table-bordered">
						<tr>
							<th>负担费用</th>
							<th>经费账号</th>
							<th>经费项目</th>
							<th>备注</th>
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								name="payAmount2"
								value="${validate ? requestScope.apply.funds['1'].payAmount:requestScope.form.fds['1'].payAmount }"></td>
							<td><input type="text" class="form-control"
								name="accountName2"
								value="${validate ? requestScope.apply.funds['1'].accountName:requestScope.form.fds['1'].accountName }"></td>
							<td><select class="form-control" name="payItem2">
									<option value="住宿费，餐费"
										${(validate ? requestScope.apply.funds['1'].payItem:requestScope.form.fds['1'].payItem)=='住宿费，餐费' ? 'selected':'' }>住宿费，餐费</option>
									<option value="机票费"
										${(validate ? requestScope.apply.funds['1'].payItem:requestScope.form.fds['1'].payItem)=='机票费' ? 'selected':'' }>机票费</option>
									<option value="其他"
										${(validate ? requestScope.apply.funds['1'].payItem:requestScope.form.fds['1'].payItem)=='其他' ? 'selected':'' }>其他</option>
							</select></td>
							<td><input type="text" class="form-control" name="ps2"
								value="${validate ? requestScope.apply.funds['1'].ps:requestScope.form.fds['1'].ps }"></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								name="payAmount3"
								value="${validate ? requestScope.apply.funds['2'].payAmount:requestScope.form.fds['2'].payAmount }"></td>
							<td><input type="text" class="form-control"
								name="accountName3"
								value="${validate ? requestScope.apply.funds['2'].accountName:requestScope.form.fds['2'].accountName }"></td>
							<td><select class="form-control" name="payItem3">
									<option value="住宿费，餐费"
										${(validate ? requestScope.apply.funds['2'].payItem:requestScope.form.fds['2'].payItem)=='住宿费，餐费' ? 'selected':'' }>住宿费，餐费</option>
									<option value="机票费"
										${(validate ? requestScope.apply.funds['2'].payItem:requestScope.form.fds['2'].payItem)=='机票费' ? 'selected':'' }>机票费</option>
									<option value="其他"
										${(validate ? requestScope.apply.funds['2'].payItem:requestScope.form.fds['2'].payItem)=='其他' ? 'selected':'' }>其他</option>
							</select></td>
							<td><input type="text" class="form-control" name="ps3"
								value="${validate ? requestScope.apply.funds['2'].ps:requestScope.form.fds['2'].ps }"></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								name="payAmount4"
								value="${validate ? requestScope.apply.funds['3'].payAmount:requestScope.form.fds['3'].payAmount }"></td>
							<td><input type="text" class="form-control"
								name="accountName4"
								value="${validate ? requestScope.apply.funds['3'].accountName:requestScope.form.fds['3'].accountName }"></td>
							<td><select class="form-control" name="payItem4">
									<option value="住宿费，餐费"
										${(validate ? requestScope.apply.funds['3'].payItem:requestScope.form.fds['3'].payItem)=='住宿费，餐费' ? 'selected':'' }>住宿费，餐费</option>
									<option value="机票费"
										${(validate ? requestScope.apply.funds['3'].payItem:requestScope.form.fds['3'].payItem)=='机票费' ? 'selected':'' }>机票费</option>
									<option value="其他"
										${(validate ? requestScope.apply.funds['3'].payItem:requestScope.form.fds['3'].payItem)=='其他' ? 'selected':'' }>其他</option>
							</select></td>
							<td><input type="text" class="form-control" name="ps4"
								value="${validate ? requestScope.apply.funds['3'].ps:requestScope.form.fds['3'].ps }"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr id="tr_other_pay"
				style="display: ${((validate ? requestScope.apply.inviterPay:requestScope.form.inviterPay)=='1' ||(validate ? requestScope.apply.inviterPay:requestScope.form.inviterPay)=='2') ? 'block':'none' };">
				<td>其他出资方</td>
				<td>
					<table class="table table-bordered">
						<tr>
							<td>是否借贷</td>
							<td><select name="loan">
									<option value="1"
										${(validate ? requestScope.apply.loan:requestScope.form.loan)=='1' ? 'checked':'' }>是</option>
									<option value="0"
										${(validate ? requestScope.apply.loan:requestScope.form.loan)=='0' ? 'checked':'' }>否</option>
							</select></td>
						</tr>
						<tr>
							<td>资助范围</td>
							<td><textarea class="form-control" name="payDetail">${validate ? requestScope.apply.funds['4'].payDetail:requestScope.form.payDetail }</textarea></td>
						</tr>
						<tr>
							<td>证明文件</td>
							<td><input type="file" value="选择文件" name="proveFile"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div style="width:85%;margin-left:15%;">
		<!-- 该处填写表单校验的错误 -->
		<p class="text-danger small text-left">${requestScope.form.errors.inviterPay }</p>
	</div>
	<br>

	<div class="form-group">
		<div class="col-sm-6" style="text-align: right;">
			<button type="submit" class="btn btn-default"
				onclick="setName('tempSave')">保&#12288;存</button>
		</div>
		<div class="col-sm-6" style="text-align: left;">
			<button type="submit" class="btn btn-default"
				onclick="setName('next')">下一步</button>
		</div>
	</div>
	<br> <br>
</form>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/locales/bootstrap-datetimepicker.zh-CN.js"
	charset="UTF-8"></script>
<script>
	var reachIndex = parseInt($("#reachCount").val()) + 1;
	$("#cityCount").val(reachIndex);
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
						$("input[name=help_apply]")
								.bind(
										'click',
										function() {
											if ($(
													"input[name=help_apply]:checked")
													.val() == "是") {
												//委托申请
												$("#real_identity").show();
												$("#warn_real_identity").show();
												$(".passport_input")
														.removeAttr("disabled");
												$(".passport_input").val("");
											} else {
												location.href = '${pageContext.request.contextPath}/servlet/ApplyAbroadServlet';
											}
										});

						//选择证照类型
						$("input[name=licenceType]")
								.bind(
										'click',
										function() {
											if ($(
													"input[name=licenceType]:checked")
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
						$("input[name=type]")
								.bind(
										'click',
										function() {
											$("#select_purpose").empty();
											$("#select_purpose")
													.append(
															"<option value='培训' ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='培训' ? 'selected':'' }>培训</option>");
											$("#select_purpose")
													.append(
															"<option value='进修' ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='进修' ? 'selected':'' }>进修</option>");
											$("#select_purpose")
													.append(
															"<option value='科研合作' ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='科研合作' ? 'selected':'' }>科研合作</option>");
											$("#select_purpose")
													.append(
															"<option value='任教' ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='任教' ? 'selected':'' }>任教</option>");
											if ($("input[name=type]:checked")
													.val() == "长期") {
												$("#select_purpose")
														.append(
																"<option value='攻读学位' ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='攻读学位' ? 'selected':'' }>攻读学位</option>");
											} else {
												$("#select_purpose")
														.append(
																"<option value='参加国际会议' ${(validate ? requestScope.apply.vpurpose.purpose:requestScope.form.purpose)=='参加国际会议' ? 'selected':'' }>参加国际会议</option>");
											}
											checkPurpose("培训");
										});
						$("input[name=inviterPay]").bind(
								'click',
								function() {
									var value = $(
											"input[name=inviterPay]:checked")
											.val();
									if (value == "0") {
										$("#tr_our_pay").hide();
										$("#tr_other_pay").hide();
										$("#tr_part_pay").hide();
									} else if (value == "1") {
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
		$("#cityCount").val(reachIndex);
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
		} else {
			$("#warn_time_check").text("");
			$("#warn_time_check").hide();
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

	//用来区分临时保存还是下一步
	var name = "tempSave";
	function setName(n) {
		name = n;
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
		$("#submit_name").val(name);
		return true;
	}
</script>
</body>
</html>