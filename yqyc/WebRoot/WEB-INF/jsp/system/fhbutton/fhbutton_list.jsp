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
		<title>系统管理-按钮管理</title>

		<style>
			.sreach_box {
				width: 100%;
				padding-left: 20px;
				box-sizing: border-box;
			}
			
			tr input {
				cursor: pointer;
			}
		</style>
	</head>

	<body>
		<blockquote class="layui-elem-quote shouye">
			<a>首页&emsp;<span>/&emsp;系统管理</span><span>&emsp;/&emsp;按钮管理</span></a>
		</blockquote>
		<div class="sreach_box">
			<input style="width: 200px;float: left;margin-right: 15px;" type="text" name="title" required lay-verify="required" placeholder="请输入搜索关键字" autocomplete="off" class="layui-input">
			<button class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe615;</i></button>
		</div>
		<div class="juese">
			<form action="" method="post">

				<table class="layui-table">
					<colgroup>
						<col width="5%">
						<col width="5%">
						<col width="10%">
						<col width="10%">
						<col width="20%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" class="che_one" /></th>
							<th>序号</th>
							<th>名称</th>
							<th>权限标识</th>
							<th>备注</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="tabs">
						<tr>
							<td><input type="checkbox" class="che" /></td>
							<td>1</td>
							<td>导出EXCEL</td>
							<td>toExcel</td>
							<td>导出EXCEL</td>
							<td>
								<a class="layui-btn layui-btn-xs test" lay-event="edit" id="test">
									<i class="layui-icon">&#xe642;</i>
								</a>
								<a class="layui-btn layui-btn-danger layui-btn-xs test" lay-event="del" id="test1">
									<i class="layui-icon">&#xe640;</i>
								</a>
							</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="che" /></td>
							<td>1</td>
							<td>导出EXCEL</td>
							<td>toExcel</td>
							<td>导出EXCEL</td>
							<td>
								<a class="layui-btn layui-btn-xs test" lay-event="edit" id="test">
									<i class="layui-icon">&#xe642;</i>
								</a>
								<a class="layui-btn layui-btn-danger layui-btn-xs test" lay-event="del" id="test1">
									<i class="layui-icon">&#xe640;</i>
								</a>
							</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="che" /></td>
							<td>1</td>
							<td>导出EXCEL</td>
							<td>toExcel</td>
							<td>导出EXCEL</td>
							<td>
								<a class="layui-btn layui-btn-xs test" lay-event="edit" id="test">
									<i class="layui-icon">&#xe642;</i>
								</a>
								<a class="layui-btn layui-btn-danger layui-btn-xs test" lay-event="del" id="test1">
									<i class="layui-icon">&#xe640;</i>
								</a>
							</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="che" /></td>
							<td>1</td>
							<td>导出EXCEL</td>
							<td>toExcel</td>
							<td>导出EXCEL</td>
							<td>
								<a class="layui-btn layui-btn-xs test" lay-event="edit" id="test">
									<i class="layui-icon">&#xe642;</i>
								</a>
								<a class="layui-btn layui-btn-danger layui-btn-xs test" lay-event="del" id="test1">
									<i class="layui-icon">&#xe640;</i>
								</a>
							</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="che" /></td>
							<td>1</td>
							<td>导出EXCEL</td>
							<td>toExcel</td>
							<td>导出EXCEL</td>
							<td>
								<a class="layui-btn layui-btn-xs test" lay-event="edit" id="test">
									<i class="layui-icon">&#xe642;</i>
								</a>
								<a class="layui-btn layui-btn-danger layui-btn-xs test" lay-event="del" id="test1">
									<i class="layui-icon">&#xe640;</i>
								</a>
							</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="che" /></td>
							<td>1</td>
							<td>导出EXCEL</td>
							<td>toExcel</td>
							<td>导出EXCEL</td>
							<td>
								<a class="layui-btn layui-btn-xs test" lay-event="edit" id="test">
									<i class="layui-icon">&#xe642;</i>
								</a>
								<a class="layui-btn layui-btn-danger layui-btn-xs test" lay-event="del" id="test1">
									<i class="layui-icon">&#xe640;</i>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
					<button class="layui-btn layui-btn-sm">&emsp;新增&emsp;</button>
					<button class="layui-btn layui-btn-sm layui-btn-danger">&emsp;删除&emsp;</button>
				</div>
				<div class="layui-col-xs8 layui-col-sm8 layui-col-md8">
					<div id="page" style="float: right;"></div>
				</div>
			</div>
		</div>

		<script>
			$(function() {
				layui.use('laypage', function() {
					var laypage = layui.laypage;

					//执行一个laypage实例
					laypage.render({
						elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
							,
						count: 50 //数据总数，从服务端得到
					});
				});

				var flag = false;
				$(".che_one").click(function() {
					if(flag == false) {
						$(".che").attr("checked", "checked");
						flag = true;
					} else {
						$(".che").removeAttr("checked","");
						flag = false;
					}
				})
				
								
				var _index = 0;
				$(document).on('click', '.test', function() {
					_index = $(this).parent().parent().index();
					layer.confirm('确认删除？', {
						btn: ['确定'],
						skin:'myclass'//layui自定义弹窗类名，用于添加点击事件
					})
					console.log(_index);
				});

				//删除当前列表数据
				$(document).on('click', '.myclass', function() {
					$("#tabs tr").eq(_index).remove();
				})
				
			})
		</script>
	</body>

</html>