<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="../static/newStatic/css/font.css" />
		<link rel="stylesheet" href="../static/newStatic/css/xadmin.css" />
		<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript" src="../static/newStatic/lib/layui/layui.js"></script>
		<link rel="stylesheet" href="../static/newStatic/lib/layui/css/layui.css" />
		<script type="text/javascript" src="../static/newStatic/js/xadmin.js"></script>
		<link rel="stylesheet" href="../static/newStatic/css/table.css" />

		<title></title>
	</head>

	<body>
		<blockquote class="layui-elem-quote shouye">
			<a>首页&emsp;<span>/&emsp;权限管理</span><span>&emsp;/&emsp;角色(基础权限)</span></a>
		</blockquote>
		<div class="juese">
			角色组：
			<button class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe770;</i>系统管理组</button>
			<button class="layui-btn layui-btn-primary"><i class="layui-icon">&#xe770;</i>职位组</button>

			<form class="layui-form" action="">
				<table class="layui-table">
					<colgroup>
						<col width="2%">
						<col width="20%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
					</colgroup>
					<thead>
						<tr>
							<th>序号</th>
							<th>按钮名称</th>
							<th>一级管理员</th>
							<th>二级管理员</th>
							<th>三级管理员</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>导出EXCEL</td>
							<td>
								<input type="checkbox" checked="" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
							</td>
							<td>
								<input type="checkbox" checked="" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
							</td>
							<td>
								<input type="checkbox" checked="" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>文章分享</td>
							<td>
								<input type="checkbox" checked="" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
							</td>
							<td>
								<input type="checkbox" checked="" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
							</td>
							<td>
								<input type="checkbox" checked="" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>发邮件</td>
							<td>
								<input type="checkbox" checked="" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
							</td>
							<td>
								<input type="checkbox" checked="" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
							</td>
							<td>
								<input type="checkbox" checked="" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>导入EXCEL</td>
							<td>
								<input type="checkbox" checked="" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
							</td>
							<td>
								<input type="checkbox" checked="" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
							</td>
							<td>
								<input type="checkbox" checked="" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>发短信</td>
							<td>
								<input type="checkbox" checked="" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
							</td>
							<td>
								<input type="checkbox" checked="" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
							</td>
							<td>
								<input type="checkbox" checked="" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="view_btn">
				<button class="layui-btn" onclick="window.location.href='<%=basePath%>buttonrights/list.do';">切换视图</button>
			</div>

			<script type="text/javascript" src="../static/newStatic/js/test.js"></script>
			<script>
				layui.use(['form'], function() {
					var form = layui.form,
						layer = layui.layer
					//监听指定开关
					form.on('switch(switchTest)', function(data) {
						if(this.checked) {
							layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
								offset: '6px'
							});
							layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅 仅是ON|OFF', data.othis)
						} else {
							layer.msg('开关： 关掉了', {
								offset: '6px'
							});
						}
						//do some ajax opeartiopns;
					});
				});
			</script>
		</div>
	</body>

</html>