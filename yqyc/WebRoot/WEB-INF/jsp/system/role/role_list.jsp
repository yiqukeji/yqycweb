<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="static/newStatic/css/font.css" />
		<link rel="stylesheet" href="static/newStatic/css/xadmin.css" />
		<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript" src="static/newStatic/lib/layui/layui.js"></script>
		<link rel="stylesheet" href="static/newStatic/lib/layui/css/layui.css" />
		<script type="text/javascript" src="static/newStatic/js/xadmin.js"></script>
		<link rel="stylesheet" href="static/newStatic/css/table.css" />

		<title></title>

		<style>
			.layui-layer-title {
				text-align: center;
				padding: 0 20px 0 20px !important;
			}
		</style>

	</head>

	<body>
		<blockquote class="layui-elem-quote shouye">
			<a>首页&emsp;<span>/&emsp;</span>权限管理<span>&emsp;/&emsp;角色(基础权限)</span></a>
		</blockquote>
		<div class="juese">
			<button class="layui-btn layui-btn-normal">&emsp;新增组&emsp;</button>
			<button class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe770;</i>系统管理组</button>
			<button class="layui-btn layui-btn-primary"><i class="layui-icon">&#xe770;</i>职位组</button>
			<div>
				本组：
				<button class="layui-btn layui-btn-sm layui-btn-primary">修改组名称</button>
				<button class="layui-btn layui-btn-sm layui-btn-primary">组菜单权限</button>
			</div>
			<form class="layui-form" action="">
				<table class="layui-table">
					<colgroup>
						<col width="5%">
						<col width="30%">
						<col width="2%">
						<col width="2%">
						<col width="2%">
						<col width="2%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>序号</th>
							<th>角色</th>
							<th>增</th>
							<th>删</th>
							<th>改</th>
							<th>查</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>一级管理</td>
							<td>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6b9;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-normal layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe69a;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6aa;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-normal layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6ac;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-xs layui-btn-normal test test1" lay-event="del">
									&emsp;菜单权限&emsp;
								</a>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe83c;</i>
								</a>
								<a class="layui-btn layui-btn-xs layui-btn-danger test test1" lay-event="del">
									<i class="layui-icon">&#xe640;</i>
								</a>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>一级管理</td>
							<td>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6b9;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-normal layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe69a;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6aa;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-normal layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6ac;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-xs layui-btn-normal test test1" lay-event="del">
									&emsp;菜单权限&emsp;
								</a>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe83c;</i>
								</a>
								<a class="layui-btn layui-btn-xs layui-btn-danger test test1" lay-event="del">
									<i class="layui-icon">&#xe640;</i>
								</a>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>一级管理</td>
							<td>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6b9;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-normal layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe69a;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6aa;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-normal layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6ac;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-xs layui-btn-normal test test1" lay-event="del">
									&emsp;菜单权限&emsp;
								</a>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe83c;</i>
								</a>
								<a class="layui-btn layui-btn-xs layui-btn-danger test test1" lay-event="del">
									<i class="layui-icon">&#xe640;</i>
								</a>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>一级管理</td>
							<td>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6b9;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-normal layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe69a;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6aa;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-normal layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6ac;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-xs layui-btn-normal test test1" lay-event="del">
									&emsp;菜单权限&emsp;
								</a>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe83c;</i>
								</a>
								<a class="layui-btn layui-btn-xs layui-btn-danger test test1" lay-event="del">
									<i class="layui-icon">&#xe640;</i>
								</a>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>一级管理</td>
							<td>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6b9;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-normal layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe69a;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6aa;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-normal layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6ac;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-xs layui-btn-normal test test1" lay-event="del">
									&emsp;菜单权限&emsp;
								</a>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe83c;</i>
								</a>
								<a class="layui-btn layui-btn-xs layui-btn-danger test test1" lay-event="del">
									<i class="layui-icon">&#xe640;</i>
								</a>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>一级管理</td>
							<td>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6b9;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-normal layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe69a;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6aa;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-normal layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe6ac;</i>
								</a>
							</td>
							<td>
								<a class="layui-btn layui-btn-xs layui-btn-normal test test1" lay-event="del">
									&emsp;菜单权限&emsp;
								</a>
								<a class="layui-btn layui-btn-xs test test1" lay-event="del">
									<i class="icon iconfont">&#xe83c;</i>
								</a>
								<a class="layui-btn layui-btn-xs layui-btn-danger test test1" lay-event="del">
									<i class="layui-icon">&#xe640;</i>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="view_btn">
				<button class="layui-btn" id="new_btn">新增角色</button>
			</div>

			<script type="text/javascript" src="static/newStatic/js/test.js"></script>
			<script>
				$(function() {
					$("#new_btn").click(function() {
						layer.prompt({
							title: '新增组',
							btnAlign: 'c',
							closeBtn: 0
						}, function(value, index, elem) {
							//value得到输入的值
							layer.close(index); //关闭弹出层
							layer.msg(value);
						});
					})
				})
			</script>
		</div>
	</body>

</html>