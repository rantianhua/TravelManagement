<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp"%>
<c:set var="validate" scope="request" value="${!empty requestScope.form}" />
<form class="form-horizontal" role="form" method="post"
	action="${pageContext.request.contextPath }/servlet/PublicityAndRecord">
	<br> <br> <br> <br> <br>
	<input type="text" value="${requestScope.notify }" name="notify" style="display: none;">
	<input type="text" value="${requestScope.apply.applicationNumber}" name="applicationNumber" style="display: none;">
	<div
		style="width: 70%;margin-left:auto;margin-right:auto;display: ${requestScope.notify eq '1' ? 'block' : 'none'}">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">出访公示表</h3>
			</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td style="vertical-align: middle;">出访团</td>
							<td colspan="3">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>姓名</th>
											<th>单位（学院、国家实验室或其他部门）</th>
											<th>职务职称</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input class="form-control" type="text"
												name="memberName1" value="${requestScope.form.memberName1}"></td>
											<td><input class="form-control" type="text"
												name="memberUnit1" value="${requestScope.form.memberUnit1}"></td>
											<td><input class="form-control" type="text"
												name="memberTitle1"
												value="${requestScope.form.memberTitle1}"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"
												name="memberName2" value="${requestScope.form.memberName2}"></td>
											<td><input class="form-control" type="text"
												name="memberUnit2" value="${requestScope.form.memberUnit2}"></td>
											<td><input class="form-control" type="text"
												name="memberTitle2"
												value="${requestScope.form.memberTitle2}"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"
												name="memberName3" value="${requestScope.form.memberName3}"></td>
											<td><input class="form-control" type="text"
												name="memberUnit3" value="${requestScope.form.memberUnit3}"></td>
											<td><input class="form-control" type="text"
												name="memberTitle3"
												value="${requestScope.form.memberTitle3}"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"
												name="memberName4" value="${requestScope.form.memberName4}"></td>
											<td><input class="form-control" type="text"
												name="memberUnit4" value="${requestScope.form.memberUnit4}"></td>
											<td><input class="form-control" type="text"
												name="memberTitle4"
												value="${requestScope.form.memberTitle4}"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"
												name="memberName5" value="${requestScope.form.memberName5}"></td>
											<td><input class="form-control" type="text"
												name="memberUnit5" value="${requestScope.form.memberUnit5}"></td>
											<td><input class="form-control" type="text"
												name="memberTitle5"
												value="${requestScope.form.memberTitle5}"></td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<!-- 第二行 -->
						<tr>
							<td>出访国家或地区</td>
							<td><input class="form-control " type="text"
								name="visitPlaces"
								value="${validate ? requestScope.form.visitPlaces : '' }"></td>
							<td>顺访国家或地区</td>
							<td><input class="form-control " type="text"
								name="transferPlaces"
								value="${validate ? requestScope.form.transferPlaces : '' }"></td>
						</tr>
						<!-- 第三行 -->
						<tr>
							<td>出境日期</td>
							<td><input class="form-control text-center choose-date"
								type="text" name="exitDate"
								value="${validate ? requestScope.form.exitDate :  requestScope.apply.vplan.exitBorderDate }"></td>
							<td>入境日期</td>
							<td><input class="form-control text-center choose-date"
								type="text" name="enterDate"
								value="${validate ? requestScope.form.enterDate : requestScope.apply.vplan.enterBorderDate }"></td>
						</tr>
						<!-- 第四行 -->
						<tr>
							<td>详细日程（按日填写）</td>
							<td colspan="3"><input class="form-control " type="text"
								name="detailedSchedule"
								value="${validate ? requestScope.form.detailedSchedule : '' }"></td>
						</tr>
						<!-- 第五行 -->
						<tr>
							<td>出访任务及预期出访结果</td>
							<td colspan="3"><input class="form-control " type="text"
								name="taskSummary"
								value="${validate ? requestScope.form.taskSummary : ''}"></td>
						</tr>
						<!-- 第六行 -->
						<tr>
							<td>会见人员</td>
							<td colspan="3"><input class="form-control " type="text"
								name="visitPersons"
								value="${validate ? requestScope.form.visitPersons : '' }"></td>
						</tr>
						<!-- 第七行 -->
						<tr>
							<td>费用来源及预算（元）</td>
							<td colspan="3"><input class="form-control " type="text"
								name="budget"
								value="${validate ? requestScope.form.budget : '' }"></td>
						</tr>
						<!-- 第八行 -->
						<tr>
							<td>邀请方简介：</td>
							<td colspan="4"><textarea class="form-control "
									name="inviterDesc">${validate ? requestScope.form.inviterDesc : '' }</textarea></td>
						</tr>
					</tbody>
				</table>
				<p class="text-left text-danger">${requestScope.form.errors.publicity}</p>
			</div>
		</div>
	</div>

	<div style="width: 70%;margin-left:auto;margin-right:auto;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">出访备案表</h3>
			</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<tbody>
						<!-- 第一行 -->
						<tr>
							<td style="vertical-align: middle;">姓名</td>
							<td style="vertical-align: middle;"><input
								class="form-control" type="text" name="recordName"
								value="${validate ? requestScope.form.recordName : requestScope.apply.passport.name}"></td>
							<td style="vertical-align: middle;">性别</td>
							<td style="vertical-align: middle;"><input
								class="form-control" type="text" name="recordSex"
								value="${validate ? requestScope.form.recordSex : requestScope.apply.passport.sex}"></td>
							<td style="vertical-align: middle;">出生年月</td>
							<td style="vertical-align: middle;"><input
								class="form-control choose-date" type="text"
								name="recordBirthday"
								value="${validate ? requestScope.form.recordBirthday : requestScope.apply.passport.birthday}"></td>
							<td style="vertical-align: middle;">政治面貌</td>
							<td style="vertical-align: middle;"><input
								class="form-control" type="text" name="recordPoliticalStatus"
								value="${validate ? requestScope.form.recordPoliticalStatus : ''}"></td>
							<td style="vertical-align: middle;">健康状况</td>
							<td style="vertical-align: middle;"><input
								class="form-control" type="text" name="recordHealth"
								value="${validate ? requestScope.form.recordHealth : ''}"></td>
						</tr>
						<!-- 第二行 -->
						<tr>
							<td style="vertical-align: middle;">工作单位及职务、是否为涉密人员及涉密等级</td>
							<td colspan="9" style="vertical-align: middle;"><input
								class="form-control" type="text" placeholder="默认直接填无"
								name="recordSecretInfo"
								value="${validate ? requestScope.form.recordSecretInfo : '' }"></td>
						</tr>
						<!-- 第三行 -->
						<tr>
							<td style="vertical-align: middle;">家庭主要成员</td>
							<td colspan="9">
								<table class="table table-bordered">
									<thead>
										<tr>
											<td style="vertical-align: middle;">称谓</td>
											<td style="vertical-align: middle;">姓名</td>
											<td style="vertical-align: middle;">年龄</td>
											<td style="vertical-align: middle;">政治面貌</td>
											<td style="vertical-align: middle;">工作单位、职务及居住地（是否取得
												外国国籍、境外长期或永久居留权）</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input class="form-control" type="text"
												name="familyAppellation1"
												value="${validate ? requestScope.form.familyAppellation1 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyName1"
												value="${validate ? requestScope.form.familyName1 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyAge1"
												value="${validate ? requestScope.form.familyAge1 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyPoliticalStatus1"
												value="${validate ? requestScope.form.familyPoliticalStatus1 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyOtherInfo1"
												value="${validate ? requestScope.form.familyOtherInfo1 : '' }"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"
												name="familyAppellation2"
												value="${validate ? requestScope.form.familyAppellation2 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyName2"
												value="${validate ? requestScope.form.familyName2 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyAge2"
												value="${validate ? requestScope.form.familyAge2 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyPoliticalStatus2"
												value="${validate ? requestScope.form.familyPoliticalStatus2 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyOtherInfo2"
												value="${validate ? requestScope.form.familyOtherInfo2 : '' }"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"
												name="familyAppellation3"
												value="${validate ? requestScope.form.familyAppellation3 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyName3"
												value="${validate ? requestScope.form.familyName3 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyAge3"
												value="${validate ? requestScope.form.familyAge3 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyPoliticalStatus3"
												value="${validate ? requestScope.form.familyPoliticalStatus3 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyOtherInfo3"
												value="${validate ? requestScope.form.familyOtherInfo3 : '' }"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"
												name="familyAppellation4"
												value="${validate ? requestScope.form.familyAppellation4 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyName4"
												value="${validate ? requestScope.form.familyName4 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyAge4"
												value="${validate ? requestScope.form.familyAge4 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyPoliticalStatus4"
												value="${validate ? requestScope.form.familyPoliticalStatus4 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyOtherInfo4"
												value="${validate ? requestScope.form.familyOtherInfo4 : '' }"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"
												name="familyAppellation5"
												value="${validate ? requestScope.form.familyAppellation5 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyName5"
												value="${validate ? requestScope.form.familyName5 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyAge5"
												value="${validate ? requestScope.form.familyAge5 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyPoliticalStatus5"
												value="${validate ? requestScope.form.familyPoliticalStatus5 : '' }"></td>
											<td><input class="form-control" type="text"
												name="familyOtherInfo5"
												value="${validate ? requestScope.form.familyOtherInfo5 : '' }"></td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<!-- 第四行 -->
						<tr>
							<td style="vertical-align: middle;">组团单位</td>
							<td style="vertical-align: middle;" colspan="4"><input
								class="form-control" type="text" name="groupUnit"
								value="${validate ? requestScope.form.groupUnit : '' }"></td>
							<td style="vertical-align: middle;">在团中拟任职务</td>
							<td style="vertical-align: middle;" colspan="4"><input
								class="form-control" type="text" name="positionInGroup"
								value="${validate ? requestScope.form.positionInGroup : '' }"></td>
						</tr>
						<!-- 第五行 -->
						<tr>
							<td style="vertical-align: middle;">出国任务、所赴国家（地区）及停留时间</td>
							<td colspan="9" style="vertical-align: middle;"><input
								class="form-control" type="text" name="placesInfo"
								value="${validate ? requestScope.form.placesInfo : '' }"></td>
						</tr>
						<!-- 第六行 -->
						<tr>
							<td style="vertical-align: middle;">出国任务审批单位</td>
							<td style="vertical-align: middle;" colspan="9"><input
								class="form-control" type="text"
								placeholder="从30项自动获取信息选择是者，均为“山东大学”,选择否者，按照其填写内容抓取"
								name="authorityUnit"
								value="${validate ? requestScope.form.authorityUnit : '' }"></td>
						</tr>
						<!-- 第七行 -->
						<tr>
							<td style="vertical-align: middle;">最近一次因公出国时间、所赴国家（地区）及任务</td>
							<td style="vertical-align: middle;" colspan="9"><input
								class="form-control" type="text"
								placeholder="从30项自动获取信息选择是者，均为“山东大学”,选择否者，按照其填写内容抓取"
								name="latestPlaces"
								value="${validate ? requestScope.form.latestPlaces : '' }"></td>
						</tr>
					</tbody>
				</table>
				<p class="text-left text-danger">${requestScope.form.errors.record}</p>
			</div>
		</div>
	</div>
	<div class="container" style="text-align: center;">
		<button type="submit" class="btn btn-primary">确认提交</button>
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
	$('.choose-date').datetimepicker({
		format : "yyyy-mm-dd",
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		language : 'zh-CN',
		minView : 'month'
	});
</script>
</body>
</html>