<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp"%>
<form class="form-horizontal" role="form" method="post">
<br>
<br> <br>
<br> <br>
	<div style="width: 70%;margin-left:auto;margin-right:auto;display: block">
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
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<!-- 第二行 -->
						<tr>
							<td>出访国家或地区</td>
							<td><input class="form-control " type="text"></td>
							<td>顺访国家或地区</td>
							<td><input class="form-control " type="text"></td>
						</tr>
						<!-- 第三行 -->
						<tr>
							<td>出境日期</td>
							<td><input class="form-control text-center" type="text"
								value="&#12288;年&#12288;月&#12288;日"></td>
							<td>入境日期</td>
							<td><input class="form-control text-center" type="text"
								value="&#12288;年&#12288;月&#12288;日"></td>
						</tr>
						<!-- 第四行 -->
						<tr>
							<td>详细日程（按日填写）</td>
							<td colspan="3"><input class="form-control " type="text"></td>
						</tr>
						<!-- 第五行 -->
						<tr>
							<td>出访任务及预期出访结果</td>
							<td colspan="3"><input class="form-control " type="text"></td>
						</tr>
						<!-- 第六行 -->
						<tr>
							<td>会见人员</td>
							<td colspan="3"><input class="form-control " type="text"></td>
						</tr>
						<!-- 第七行 -->
						<tr>
							<td>费用来源及预算（元）</td>
							<td colspan="3"><input class="form-control " type="text"></td>
						</tr>
						<!-- 第八行 -->
						<tr>
							<td>邀请方简介：</td>
							<td colspan="4"><textarea class="form-control "></textarea></td>
						</tr>
					</tbody>
				</table>
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
								class="form-control" type="text"></td>
							<td style="vertical-align: middle;">性别</td>
							<td style="vertical-align: middle;"><input
								class="form-control" type="text"></td>
							<td style="vertical-align: middle;">出生年月</td>
							<td style="vertical-align: middle;"><input
								class="form-control" type="text"></td>
							<td style="vertical-align: middle;">政治面貌</td>
							<td style="vertical-align: middle;"><input
								class="form-control" type="text"></td>
							<td style="vertical-align: middle;">健康状况</td>
							<td style="vertical-align: middle;"><input
								class="form-control" type="text"></td>
						</tr>
						<!-- 第二行 -->
						<tr>
							<td style="vertical-align: middle;">工作单位及职务、是否为涉密人员及涉密等级</td>
							<td colspan="9" style="vertical-align: middle;"><input
								class="form-control" type="text" placeholder="默认直接填无"></td>
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
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
											<td><input class="form-control" type="text"></td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<!-- 第四行 -->
						<tr>
							<td style="vertical-align: middle;">组团单位</td>
							<td style="vertical-align: middle;" colspan="4"><input
								class="form-control" type="text"></td>
							<td style="vertical-align: middle;">在团中拟任职务</td>
							<td style="vertical-align: middle;" colspan="4"><input
								class="form-control" type="text"></td>
						</tr>
						<!-- 第五行 -->
						<tr>
							<td style="vertical-align: middle;">出国任务、所赴国家（地区）及停留时间</td>
							<td colspan="9" style="vertical-align: middle;"><input
								class="form-control" type="text"></td>
						</tr>
						<!-- 第六行 -->
						<tr>
							<td style="vertical-align: middle;">出国任务审批单位</td>
							<td style="vertical-align: middle;" colspan="9"><input
								class="form-control" type="text"
								placeholder="从30项自动获取信息选择是者，均为“山东大学”,选择否者，按照其填写内容抓取"></td>
						</tr>
						<!-- 第七行 -->
						<tr>
							<td style="vertical-align: middle;">最近一次因公出国时间、所赴国家（地区）及任务</td>
							<td style="vertical-align: middle;" colspan="9"><input
								class="form-control" type="text"
								placeholder="从30项自动获取信息选择是者，均为“山东大学”,选择否者，按照其填写内容抓取"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="container" style="text-align: center;">
		<button type="submit" class="btn btn-primary">确认提交</button>
	</div>
	<br>
	<br>
</form>
</body>
</html>