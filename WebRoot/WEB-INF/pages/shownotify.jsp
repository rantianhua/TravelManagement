<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp"%>

<html>
<link href="${pageContext.request.contextPath }/css/shownotify.css"
	rel="stylesheet">

<body>
	<div id="container">
		<table class="table table-bordered" style="table-layout:fixed">
			<thead>
				<tr>
					<th colspan="6" class="head">出访公示表</th>
				</tr>
			</thead>
			<tbody id="body1">
				<tr>
					<td class="attributes" rowspan="6" colspan="1"
						style="vertical-align: middle;">出访团</td>
					<td class="attributes" colspan="2">姓名</td>
					<td class="attributes" colspan="2">单位</td>
					<td class="attributes">职务职称</td>
				</tr>

				<tr>
					<td class="answer" colspan="2">${requestScope.publicity.visitMembers.size() >= 0 ? requestScope.publicity.visitMembers[0].name : '' }</td>
					<td class="answer" colspan="2">${requestScope.publicity.visitMembers.size() >= 0 ? requestScope.publicity.visitMembers[0].unit : '' }</td>
					<td class="answer">${requestScope.publicity.visitMembers.size() >= 0 ? requestScope.publicity.visitMembers[0].title : '' }</td>
				</tr>

				<tr>
					<td class="answer" colspan="2">${requestScope.publicity.visitMembers.size() >= 1 ? requestScope.publicity.visitMembers[1].name : '' }</td>
					<td class="answer" colspan="2">${requestScope.publicity.visitMembers.size() >= 1 ? requestScope.publicity.visitMembers[1].unit : '' }</td>
					<td class="answer">${requestScope.publicity.visitMembers.size() >= 1 ? requestScope.publicity.visitMembers[1].title : '' }</td>
				</tr>

				<tr>
					<td class="answer" colspan="2">${requestScope.publicity.visitMembers.size() >= 2 ? requestScope.publicity.visitMembers[2].name : '' }</td>
					<td class="answer" colspan="2">${requestScope.publicity.visitMembers.size() >= 2 ? requestScope.publicity.visitMembers[2].unit : '' }</td>
					<td class="answer">${requestScope.publicity.visitMembers.size() >= 2 ? requestScope.publicity.visitMembers[2].title : '' }</td>
				</tr>

				<tr>
					<td class="answer" colspan="2">${requestScope.publicity.visitMembers.size() >= 3 ? requestScope.publicity.visitMembers[3].name : '' }</td>
					<td class="answer" colspan="2">${requestScope.publicity.visitMembers.size() >= 3 ? requestScope.publicity.visitMembers[3].unit : '' }</td>
					<td class="answer">${requestScope.publicity.visitMembers.size() >= 3 ? requestScope.publicity.visitMembers[3].title : '' }</td>
				</tr>

				<tr>
					<td class="answer" colspan="2">${requestScope.publicity.visitMembers.size() >= 4 ? requestScope.publicity.visitMembers[4].name : '' }</td>
					<td class="answer" colspan="2">${requestScope.publicity.visitMembers.size() >= 4 ? requestScope.publicity.visitMembers[4].unit : '' }</td>
					<td class="answer">${requestScope.publicity.visitMembers.size() >= 4 ? requestScope.publicity.visitMembers[4].title : '' }</td>
				</tr>

				<tr>
					<td class="attributes" colspan="2">出访国家或地区</td>
					<td class="answer">${requestScope.publicity.visitPlaces }</td>
					<td class="attributes" colspan="2">顺访国家或地区</td>
					<td class="answer">${requestScope.publicity.transferPlaces }</td>
				</tr>
				<tr>
					<td class="attributes" colspan="2">出境日期</td>
					<td class="answer">${requestScope.publicity.exitDate }</td>
					<td class="attributes" colspan="2">入境日期</td>
					<td class="answer">${requestScope.publicity.enterDate }</td>
				</tr>

			</tbody>
			<tbody id="body2">
				<tr>
					<td class="attributes" colspan="1">详细日程（按日填写）</td>
					<td class="answer" colspan="5">
						${requestScope.publicity.detailedSchedule }
					</td>
				</tr>
				<tr>
					<td class="attributes" colspan="1">出访任务及预期出访结果</td>
					<td class="answer" colspan="5">
						${requestScope.publicity.taskSummary }
					</td>
				</tr>
				<tr>
					<td class="attributes" colspan="1">会见人员</td>
					<td class="answer" colspan="5">${requestScope.publicity.visitPersons }</td>
				</tr>
				<tr>
					<td class="attributes" colspan="1">会议经费及来源</td>
					<td class="answer" colspan="5">
						${requestScope.publicity.budget }
					</td>
				</tr>

				<tr>
					<td class="attributes" colspan="1">邀请方简介</td>
					<td class="answer" colspan="5">${requestScope.publicity.inviterDesc }</td>
				</tr>
			</tbody>
		</table>
		<div id="btn">
			<input type="button" class="btn-primary" value="返回"  onclick="history.go(-1)">
		</div>

	</div>






</body>
</html>