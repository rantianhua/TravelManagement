﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="navigation.jsp"%>

<html>
<link href="${pageContext.request.contextPath }/css/showapplication.css"
	rel="stylesheet">
<script type="text/javascript">
	function back() {
		window.history.back(-1);
	}
	function edit(appNo) {
		location.href = '${pageContext.request.contextPath}/servlet/ModifyApplicationServlet?appNo='
				+ appNo;
	}
</script>
<body>
	<div id="container">
		<table class="table table-bordered"
			style="display: ${requestScope.apply.state=='已保存' ? 'none':''}">
			<thead>
				<tr>
					<th colspan="6" class="head">审核信息</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="attributes">审核状态</td>
					<td class="answer" colspan="2">${requestScope.apply.state }</td>
					<td class="attributes">是否驳回</td>
					<td class="answer" colspan="2">${fn:contains(requestScope.apply.status,'2') ? '是':'否' }</td>
				</tr>
				<tr>
					<td class="attributes">驳回理由</td>
					<td class="answer" colspan="5">${requestScope.review.rejectReason }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.category=='研究生' ? '':'none'};">
					<td class="attributes">导师审核状态</td>
					<td class="answer">${empty requestScope.review.tutorState ? '未审核':requestScope.review.tutorState }</td>
					<td class="attributes">导师审核时间</td>
					<td class="answer">${empty requestScope.review.tutorTime ? '----':requestScope.review.tutorTime }</td>
					<td class="attributes">导师审核时长</td>
					<td class="answer">${empty requestScope.review.tutorLength ? '----':requestScope.review.tutorLength }</td>
				</tr>
				<tr>
					<td class="attributes">学院/单位领导审核状态</td>
					<td class="answer">${empty requestScope.review.departLeadState ? '未审核':requestScope.review.departLeadState }</td>
					<td class="attributes">学院/单位领导审核时间</td>
					<td class="answer">${empty requestScope.review.departLeadTime ? '----':requestScope.review.departLeadTime }</td>
					<td class="attributes">学院/单位领导审核时长</td>
					<td class="answer">${empty requestScope.review.departLeadLength ? '----':requestScope.review.departLeadLength }</td>
				</tr>
				<tr>
					<td class="attributes">财务部审核状态</td>
					<td class="answer">${empty requestScope.review.financeState ? '未审核':requestScope.review.financeState }</td>
					<td class="attributes">财务部审核时间</td>
					<td class="answer">${empty requestScope.review.financeTime ? '----':requestScope.review.financeTime }</td>
					<td class="attributes">财务部审核时长</td>
					<td class="answer">${empty requestScope.review.financeLength ? '----':requestScope.review.financeLength }</td>
				</tr>
				<tr
					style="display: ${(requestScope.apply.category=='教学' || requestScope.apply.category=='行政') ? '':'none'};">
					<td class="attributes">人事部审核状态</td>
					<td class="answer">${empty requestScope.review.hrState ? '未审核':requestScope.review.hrState }</td>
					<td class="attributes">人事部审核时间</td>
					<td class="answer">${empty requestScope.review.hrTime ? '----':requestScope.review.hrTime }</td>
					<td class="attributes">人事部审核时长</td>
					<td class="answer">${empty requestScope.review.hrLength ? '----':requestScope.review.hrLength }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.category=='本科' ? '':'none'};">
					<td class="attributes">本科生院审核状态</td>
					<td class="answer">${empty requestScope.review.bksState ? '未审核':requestScope.review.bksState }</td>
					<td class="attributes">本科生院审核时间</td>
					<td class="answer">${empty requestScope.review.bksTime ? '----':requestScope.review.bksTime }</td>
					<td class="attributes">本科生院审核时长</td>
					<td class="answer">${empty requestScope.review.bksLength ? '----':requestScope.review.bksLength }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.category=='研究生' ? '':'none'};">
					<td class="attributes">研究生院审核状态</td>
					<td class="answer">${empty requestScope.review.yjsState ? '未审核':requestScope.review.yjsState }</td>
					<td class="attributes">研究生院审核时间</td>
					<td class="answer">${empty requestScope.review.yjsTime ? '----':requestScope.review.yjsTime }</td>
					<td class="attributes">研究生院审核时长</td>
					<td class="answer">${empty requestScope.review.yjsLength ? '----':requestScope.review.yjsLength }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.category=='本科' ? '':'none'};">
					<td class="attributes">学工部审核状态</td>
					<td class="answer">${empty requestScope.review.xgbState ? '未审核':requestScope.review.xgbState }</td>
					<td class="attributes">学工部审核时间</td>
					<td class="answer">${empty requestScope.review.xgbTime ? '----':requestScope.review.xgbTime }</td>
					<td class="attributes">学工部审核时长</td>
					<td class="answer">${empty requestScope.review.xgbLength ? '----':requestScope.review.xgbLength }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.category=='研究生' ? '':'none'};">
					<td class="attributes">研工部审核状态</td>
					<td class="answer">${empty requestScope.review.ygbState ? '未审核':requestScope.review.ygbState }</td>
					<td class="attributes">研工部审核时间</td>
					<td class="answer">${empty requestScope.review.ygbTime ? '----':requestScope.review.ygbTime }</td>
					<td class="attributes">研工部审核时长</td>
					<td class="answer">${empty requestScope.review.ygbLength ? '----':requestScope.review.ygbLength }</td>
				</tr>
				<tr>
					<td class="attributes">国际部审核状态</td>
					<td class="answer">${empty requestScope.review.internationState ? '未审核':requestScope.review.internationState }</td>
					<td class="attributes">国际部审核时间</td>
					<td class="answer">${empty requestScope.review.internationTime ? '----':requestScope.review.internationTime }</td>
					<td class="attributes">国际部审核时长</td>
					<td class="answer">${empty requestScope.review.internationLength ? '----':requestScope.review.internationLength }</td>
				</tr>
				<tr
					style="display: ${(requestScope.apply.category=='教学' || requestScope.apply.category=='行政') ? '':'none'};">
					<td class="attributes">分管校领导审核状态</td>
					<td class="answer">${empty requestScope.review.schoolLeadState ? '未审核':requestScope.review.schoolLeadState }</td>
					<td class="attributes">分管校领导审核时间</td>
					<td class="answer">${empty requestScope.review.schoolLeadTime ? '----':requestScope.review.schoolLeadTime }</td>
					<td class="attributes">分管校领导审核时长</td>
					<td class="answer">${empty requestScope.review.schoolLeadLength ? '----':requestScope.review.schoolLeadLength }</td>
				</tr>
			</tbody>
		</table>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th colspan="6" class="head">基本信息</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="attributes">是否委托</td>
					<td class="answer">${requestScope.apply.assigneeId=="" ? '否':'是' }
					</td>
					<td class="attributes">${requestScope.apply.assigneeId=="" ? '':'委托人' }身份证号</td>
					<td colspan="3" class="answer">${requestScope.apply.applicantId }</td>
				</tr>
			</tbody>
			<thead>
				<tr>
					<th colspan="6" class="head">护照信息</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="attributes">申请人姓名</td>
					<td class="answer">${requestScope.apply.passport.name }</td>
					<td class="attributes">性别</td>
					<td class="answer">${requestScope.apply.passport.sex }</td>
					<td class="attributes">身份</td>
					<td class="answer">${requestScope.apply.category }</td>
				</tr>
				<tr>
					<td class="attributes">生日</td>
					<td class="answer">${requestScope.apply.passport.birthday }</td>
					<td class="attributes">证照名称</td>
					<td class="answer">${requestScope.apply.passport.passportName }</td>
					<td class="attributes">有效日期</td>
					<td class="answer">${requestScope.apply.passport.expDate }</td>
				</tr>
			</tbody>
			<thead>
				<tr>
					<th colspan="6" class="head">出访目的</th>
				</tr>
			</thead>
			<tbody>
				<!-- 培训 -->
				<tr
					style="display: ${requestScope.apply.purposeContent=='培训' ? '':'none' };">
					<td class="attributes">长期/短期</td>
					<td class="answer">${requestScope.apply.type }</td>
					<td class="attributes">出访目的</td>
					<td class="answer" colspan="3">${requestScope.apply.purposeContent }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.purposeContent=='培训' ? '':'none' };">
					<td class="attributes">培训内容</td>
					<td class="answer" colspan="5">
						${requestScope.apply.vpurpose.trainContent }</td>
				</tr>
				<!-- 进修 -->
				<tr
					style="display: ${requestScope.apply.purposeContent=='进修' ? '':'none' };">
					<td class="attributes">长期/短期</td>
					<td class="answer">${requestScope.apply.type }</td>
					<td class="attributes">出访目的</td>
					<td class="answer" colspan="3">${requestScope.apply.purposeContent }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.purposeContent=='进修' ? '':'none' };">
					<td class="attributes">进修内容</td>
					<td class="answer" colspan="5">
						${requestScope.apply.vpurpose.studyContent }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.purposeContent=='进修' ? '':'none' };">
					<td class="attributes">指导老师姓名</td>
					<td class="answer">${requestScope.apply.vpurpose.teacherName }</td>
					<td class="attributes">指导老师头衔</td>
					<td class="answer">${requestScope.apply.vpurpose.teacherTitle }</td>
					<td class="attributes">指导老师专长</td>
					<td class="answer">${requestScope.apply.vpurpose.teacherExpertise }</td>
				</tr>
				<!-- 攻读学位 -->
				<tr
					style="display: ${requestScope.apply.purposeContent=='攻读学位' ? '':'none' };">
					<td class="attributes">长期/短期</td>
					<td class="answer">${requestScope.apply.type }</td>
					<td class="attributes">出访目的</td>
					<td class="answer">${requestScope.apply.purposeContent }</td>
					<td class="attributes">学位类别</td>
					<td class="answer">${requestScope.apply.vpurpose.degreeType }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.purposeContent=='攻读学位' ? '':'none' };">
					<td class="attributes">指导老师姓名</td>
					<td class="answer">${requestScope.apply.vpurpose.teacherName }</td>
					<td class="attributes">指导老师头衔</td>
					<td class="answer">${requestScope.apply.vpurpose.teacherTitle }</td>
					<td class="attributes">指导老师专长</td>
					<td class="answer">${requestScope.apply.vpurpose.teacherExpertise }</td>
				</tr>
				<!-- 科研合作 -->
				<tr
					style="display: ${requestScope.apply.purposeContent=='科研合作' ? '':'none' };">
					<td class="attributes">长期/短期</td>
					<td class="answer">${requestScope.apply.type }</td>
					<td class="attributes">出访目的</td>
					<td class="answer" colspan="3">${requestScope.apply.purposeContent }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.purposeContent=='科研合作' ? '':'none' };">
					<td class="attributes">合作内容</td>
					<td class="answer" colspan="5">${requestScope.apply.vpurpose.cooperationContent }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.purposeContent=='科研合作' ? '':'none' };">
					<td class="attributes">外方合作伙伴姓名</td>
					<td class="answer">${requestScope.apply.vpurpose.partnerName }</td>
					<td class="attributes">外方合作伙伴头衔</td>
					<td class="answer">${requestScope.apply.vpurpose.partnerTitle }</td>
					<td class="attributes">外方合作伙伴专长</td>
					<td class="answer">${requestScope.apply.vpurpose.partnerExpertise }</td>
				</tr>
				<!-- 任教 -->
				<tr
					style="display: ${requestScope.apply.purposeContent=='任教' ? '':'none' };">
					<td class="attributes">长期/短期</td>
					<td class="answer">${requestScope.apply.type }</td>
					<td class="attributes">出访目的</td>
					<td class="answer">${requestScope.apply.purposeContent }</td>
					<td class="attributes">授课名称</td>
					<td class="answer">${requestScope.apply.vpurpose.className }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.purposeContent=='任教' ? '':'none' };">
					<td class="attributes">外方合作伙伴姓名</td>
					<td class="answer">${requestScope.apply.vpurpose.partnerName }</td>
					<td class="attributes">外方合作伙伴头衔</td>
					<td class="answer">${requestScope.apply.vpurpose.partnerTitle }</td>
					<td class="attributes">外方合作伙伴专长</td>
					<td class="answer">${requestScope.apply.vpurpose.partnerExpertise }</td>
				</tr>
				<!-- 参加国际会议 -->
				<tr
					style="display: ${requestScope.apply.purposeContent=='参加国际会议' ? '':'none' };">
					<td class="attributes">长期/短期</td>
					<td class="answer">${requestScope.apply.type }</td>
					<td class="attributes">出访目的</td>
					<td class="answer" colspan="3">${requestScope.apply.purposeContent }</td>
				<tr
					style="display: ${requestScope.apply.purposeContent=='参加国际会议' ? '':'none' };">
					<td class="attributes">${requestScope.apply.vpurpose.conferenceNameCh }</td>
					<td class="answer">出入境管理大会</td>
					<td class="attributes">会议英文名</td>
					<td class="answer">${requestScope.apply.vpurpose.conferenceNameEn }</td>
					<td class="attributes">是否受邀发言</td>
					<td class="attributes">${requestScope.apply.vpurpose.speech=='0' ? '是':'否' }</td>
				<tr
					style="display: ${requestScope.apply.purposeContent=='参加国际会议' ? '':'none' };">
					<td class="attributes">会议情况简介</td>
					<td class="answer" colspan="5">
						${requestScope.apply.vpurpose.conferenceDesc }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.purposeContent=='参加国际会议' ? '':'none' };">
					<td class="attributes">发言提纲</td>
					<td class="answer" colspan="5"><a
						href="${pageContext.request.contextPath }${requestScope.apply.vpurpose.speechOutline }">${requestScope.apply.vpurpose.speechOutline=="" ? '':'点击下载文件' }</a></td>
				</tr>
				<tr
					style="display: ${requestScope.apply.purposeContent=='参加国际会议' ? '':'none' };">
					<td class="attributes">论文提纲</td>
					<td class="answer" colspan="5">
						${requestScope.apply.vpurpose.paperOutline }</td>
				</tr>
			</tbody>
			<thead>
				<tr>
					<th colspan="6" class="head">出境路线</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="attributes">离境城市</td>
					<td class="answer" colspan="2">${requestScope.apply.vplan.outCity }</td>
					<td class="attributes">离境日期</td>
					<td class="answer" colspan="2">${requestScope.apply.vplan.exitBorderDate }</td>
				</tr>
				<tr>
					<td class="attributes">回国入境城市</td>
					<td class="answer" colspan="2">${requestScope.apply.vplan.backCity }</td>
					<td class="attributes">入境日期</td>
					<td class="answer" colspan="2">${requestScope.apply.vplan.enterBorderDate }</td>
				</tr>

				<!-- 此处循环控制 -->
				<c:forEach var="d" items="${requestScope.apply.vplan.destinations }"
					varStatus="st">
					<tr>
						<td class="attributes">抵达国家 ${st.count }</td>
						<td class="answer">${d.country }</td>
						<td class="attributes">抵达城市 ${st.count }</td>
						<td class="answer">${d.city }</td>
						<td class="attributes">是否转机</td>
						<td class="answer">${d.transAddr=='' ? '否':'是' }</td>
					</tr>
					<tr>
						<td class="attributes">抵达日期</td>
						<td class="answer">${d.arriveDate }</td>
						<td class="attributes">离开日期</td>
						<td class="answer">${d.exitCityDate }</td>
						<td class="attributes">转机地点</td>
						<td class="answer">${d.transAddr }</td>
					</tr>
				</c:forEach>
			</tbody>
			<thead>
				<tr>
					<th colspan="6" class="head">参团情况</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="attributes" colspan="2">是否参团</td>
					<td class="answer" colspan="4">${requestScope.apply.canTuan }</td>
				</tr>
				<tr style="display: ${requestScope.apply.canTuan=='是' ? '':'none'}">
					<td class="attributes" colspan="1">组团单位</td>
					<td class="answer" colspan="2">${requestScope.apply.groupUnit }</td>
					<td class="attributes" colspan="1">出访审批单位</td>
					<td class="answer" colspan="2">${requestScope.apply.examineUnit }</td>
				</tr>
				<tr style="display: ${requestScope.apply.canTuan=='是' ? '':'none'}">
					<td class="attributes" colspan="1">团组职务</td>
					<td class="answer" colspan="2">${requestScope.apply.groupWork }</td>
					<td class="attributes" colspan="1">成员名单</td>
					<td class="answer" colspan="2"><a
						href="${pageContext.request.contextPath }${requestScope.apply.groupMembers }">${requestScope.apply.groupMembers=="" ? '':'点击下载文件' }</a></td>
				</tr>
			</tbody>
			<thead>
				<tr>
					<th colspan="6" class="head">邀请方信息</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="attributes">姓名</td>
					<td class="answer">${requestScope.apply.inviter.name }</td>
					<td class="attributes">中文头衔</td>
					<td class="answer">${requestScope.apply.inviter.titleCh }</td>
					<td class="attributes">英文头衔</td>
					<td class="answer">${requestScope.apply.inviter.titleEn }</td>
				</tr>
				<tr>
					<td class="attributes">单位名称</td>
					<td class="answer" colspan="2">${requestScope.apply.inviter.unitName }</td>
					<td class="attributes">单位地址</td>
					<td class="answer" colspan="2">${requestScope.apply.inviter.address }</td>
				</tr>
				<tr>
					<td class="attributes">邀请函原件</td>
					<td class="answer" colspan="5"><a
						href="${pageContext.request.contextPath }${requestScope.apply.inviter.invitationRaw }">${requestScope.apply.inviter.invitationRaw=="" ? '':'点击下载文件' }</a></td>
				</tr>
				<tr>
					<td class="attributes">邀请函中文翻译件</td>
					<td class="answer" colspan="5"><a
						href="${pageContext.request.contextPath }${requestScope.apply.inviter.invitationZh }">${requestScope.apply.inviter.invitationZh=="" ? '':'点击下载文件' }</a></td>
				</tr>
			</tbody>
			<thead>
				<tr>
					<th colspan="6" class="head">费用负担情况</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="attributes" colspan="1">邀请方负担情况</td>
					<td class="answer" colspan="5">${requestScope.apply.inviterPay=='0' ? '全部负担':(requestScope.apply.inviterPay=='1' ? '部分负担':'不负担') }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.inviterPay=='1' ? '':'none'}">
					<td class="attributes" colspan="1">部分负担费用</td>
					<td class="answer" colspan="2">${requestScope.apply.funds['0'].payItem }</td>
					<td class="attributes" colspan="1">备注</td>
					<td class="answer" colspan="2">${requestScope.apply.funds['0'].ps }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.inviterPay=='0' ? 'none':''}">
					<td rowspan="4" colspan="1" class="attributes">我方负担情况</td>
					<td class="attributes">负担费用</td>
					<td class="attributes">经费账号</td>
					<td class="attributes">经费类型</td>
					<td class="attributes" colspan="2">备注</td>
				<tr
					style="display: ${requestScope.apply.inviterPay=='0' ? 'none':''}">
					<td class="answer">${requestScope.apply.funds['1'].payAmount!='' ? requestScope.apply.funds['1'].payAmount:'无' }</td>
					<td class="answer">${requestScope.apply.funds['1'].payAmount=='' ? '':requestScope.apply.funds['1'].accountName }</td>
					<td class="answer">${requestScope.apply.funds['1'].payAmount=='' ? '':requestScope.apply.funds['1'].payItem }</td>
					<td class="answer" colspan="2">${requestScope.apply.funds['1'].payAmount=='' ? '':requestScope.apply.funds['1'].ps }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.inviterPay=='0' ? 'none':''}">
					<td class="answer">${requestScope.apply.funds['2'].payAmount!='' ? requestScope.apply.funds['2'].payAmount:'无' }</td>
					<td class="answer">${requestScope.apply.funds['2'].payAmount=='' ? '':requestScope.apply.funds['2'].accountName }</td>
					<td class="answer">${requestScope.apply.funds['2'].payAmount=='' ? '':requestScope.apply.funds['2'].payItem }</td>
					<td class="answer" colspan="2">${requestScope.apply.funds['2'].payAmount=='' ? '':requestScope.apply.funds['2'].ps }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.inviterPay=='0' ? 'none':''}">
					<td class="answer">${requestScope.apply.funds['3'].payAmount!='' ? requestScope.apply.funds['3'].payAmount:'无' }</td>
					<td class="answer">${requestScope.apply.funds['3'].payAmount=='' ? '':requestScope.apply.funds['3'].accountName }</td>
					<td class="answer">${requestScope.apply.funds['3'].payAmount=='' ? '':requestScope.apply.funds['3'].payItem }</td>
					<td class="answer" colspan="2">${requestScope.apply.funds['3'].payAmount=='' ? '':requestScope.apply.funds['3'].ps }</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.inviterPay=='0' ? 'none':''}">
					<td rowspan="3" colspan="1" class="attributes">其他出资方</td>
					<td class="attributes">是否借贷</td>
					<td class="answer" colspan="4">${requestScope.apply.loan=='1' ? '是':'否'}</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.inviterPay=='0' ? 'none':''}">
					<td class="attributes">资助范围</td>
					<td class="answer" colspan="4">${requestScope.apply.funds['4'].payDetail}</td>
				</tr>
				<tr
					style="display: ${requestScope.apply.inviterPay=='0' ? 'none':''}">
					<td class="attributes">证明文件</td>
					<td class="answer" colspan="4"><a
						href="${pageContext.request.contextPath }${requestScope.apply.funds['4'].proveFile }">${requestScope.apply.funds['4'].proveFile=='' ? '':'点击下载文件' }</a></td>
				</tr>
			</tbody>
		</table>

		<div id="btn"
			style="display: ${(requestScope.apply.state=='已保存' || fn:contains(requestScope.apply.status,'2')) ? 'block':'none' }">
			<div id="btn1">
				<input type="button" class="btn btn-primary" value="修改"
					onclick="edit('${requestScope.apply.applicationNumber}')">
			</div>
			<div id="btn2">
				<input type="button" class="btn btn-primary" value="返回"
					onclick="back()">
			</div>
		</div>
		<div id="btn3"
			style="display: ${(requestScope.apply.state=='已保存' || fn:contains(requestScope.apply.status,'2')) ? 'none':'block' }">
			<input type="button" class="btn btn-primary" value="返回"
				onclick="back()">
		</div>
	</div>



</body>
</html>
