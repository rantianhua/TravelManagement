<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp"%>
<link href="${pageContext.request.contextPath }/css/show.user.detail.css" rel="stylesheet"/>
<div class="out_wrapper">
	<div class="header">
		<h4 style="float:left;vertical_align:middle;">个人信息预览</h4>
		<button onclick="editInfo()" class="btn btn-info" style="float:right;"
			 type="button">编辑</button>
	</div>
	<div class="content">
		<div style="height: 40px;"></div>
		<h4 class="red">基本信息</h4>
		<ul>
			<li><span class="text-span">身份证号：</span>999999999999999999</li>
			<li><span class="text-span">中文姓名：</span>冉天华</li>
			<li><span class="text-span">英文姓名：</span>Vesper</li>
			<li><span class="text-span">名字拼音：</span>ran tian hua</li>
			<li><span class="text-span">曾用姓名：</span>你大爷</li>
			<li><span class="text-span">性&#12288;&#12288;别：</span>男</li>
			<li><span class="text-span">出生日期：</span>1998-10-09</li>
			<li><span class="text-span">护照号码：</span>242394992925y295y29ksksbsd</li>
			<li><span class="text-span">电子邮箱：</span>15953163807@163.com</li>
			<li><span class="text-span">移动电话：</span>15353163807</li>
			<li><span class="text-span">固定电话：</span>12388744321</li>
		</ul>
		<hr>
		<h4 class="red">身份信息</h4>
		<ul>
			<li><span class="text-span">职&#12288;&#12288;称：</span>教学</li>
			<li><span class="text-span">所在单位：</span>白宫</li>
			<li><span class="text-span">职&#12288;&#12288;务：</span>高级特工／正国家级</li>
			<li><span class="text-span">学&#12288;&#12288;位：</span>帅哥</li>
		</ul>
		<hr>
		<h4 class="red">紧急联系人</h4>
		<ul>
			<li><span class="text-span">姓&#12288;&#12288;名：</span>赵日天</li>
			<li><span class="text-span">电子邮箱：</span>15953163807@163.com</li>
			<li><span class="text-span">移动电话：</span>15353163807</li>
			<li><span class="text-span">固定电话：</span>12388744321</li>
		</ul>
	</div>
</div>
<script>
function editInfo() {
	window.location.href="/TravelManagement/servlet/NavigationServlet?action=5";
}
</script>
</body>
</html>
