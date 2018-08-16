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
		<link rel="stylesheet" href="static/newStatic/css/font.css" />
		<link rel="stylesheet" href="static/newStatic/css/yq_admin.css" />
		<link rel="stylesheet" href="static/newStatic/css/xadmin.css" />
		<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript" src="static/newStatic/lib/layui/layui.js"></script>
		<link rel="stylesheet" href="static/newStatic/lib/layui/css/layui.css" />
		<script type="text/javascript" src="static/newStatic/js/xcity.js"></script>
		<script type="text/javascript" src="static/newStatic/js/xadmin.js"></script>

		<title>主页内容</title>

		<style>
			body {
				background: #f7f7f7 !important;
			}
			
			.open {
				position: relative;
			}
			
			.span_file {
				position: absolute;
				right: 0px;
				top: 0px;
				cursor: pointer;
			}
			
			.hidden {
				position: absolute;
				width: 64px;
				top: 0px;
				right: 0px;
				opacity: 0;
				z-index: 1;
				filter: alpha(opacity=0);
				cursor: pointer;
			}
			
			.shouye {
				width: 100%;
				height: 30px;
				background: gainsboro;
				line-height: 30px;
				padding: 0px 20px;
			}
			
			.shouye a {
				font-size: 10px;
				color: #0092DC;
				font-family: "方正仿宋";
			}
			
			.shouye span {
				color: black;
			}
			
			.view_box {
				margin: 20px 40px;
				background: #FFFFFF;
				box-shadow: 1px 1px 2px 3px rgba(0, 0, 0, 0.2);
			}
			
			.view_box h3 {
				width: 100%;
				height: 46px;
				background: #F7F7F7;
				line-height: 46px;
				padding-left: 15px;
				box-sizing: border-box;
			}
			
			table,
			th {
				text-align: center !important;
			}
			
			table p {
				width: 300px;
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
			}
			
			.view_table {
				width: 100%;
			}
			
			.ip_box {
				width: 100%;
				height: 300px;
				overflow: hidden;
			}
			
			.ip_jilu {
				width: 90%;
				height: 100px;
				background: #F7F7F7;
				margin: 20px auto;
			}
			
			.ip_jilu p {
				display: block;
				width: 50%;
				height: 30px;
				margin-bottom: 5px;
				line-height: 30px;
				padding-left: 15px;
				box-sizing: border-box;
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
				float: left;
			}
			
			.ip_jilu .jindutiao1 {
				width: 75%;
				height: 30px;
				line-height: 26px;
				float: left;
				background: none;
				margin-left: 15px;
			}
			
			.layui-progress-bar {
				margin-top: 12px;
			}
			
			.ip_jilu .jindutiao2 {
				width: 20%;
				float: left;
				text-align: center;
				line-height: 30px;
			}
			
			.layui-elem-quote {
				padding: 10px 15px;
				max-height: 86px;
				overflow: hidden;
			}
		</style>

	</head>

	<body>
		<blockquote class="layui-elem-quote shouye">
			<a>首页&emsp;<span>/&emsp;更新网站前台页面</span></a>
		</blockquote>

		<div class="view_table">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md8">
				<div class="view_box">
					<h3>访问记录</h3>
					<div class="ip_box jin">
						<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
							<div class="ip_jilu">
								<p title="127.0.0.1">IP:<span>127.0.0.1</span></p>
								<p title="IP内网">运营商:<span>IP内网</span></p>
								<p title="弈趣云创内网" class="address">地区:<span>弈趣云创内网</p>
								<p title="2018-08-06">日期:<span>2018-08-06</span></p>
								<div class="layui-progress jindutiao1">
									<div class="layui-progress-bar" lay-percent="100%"></div>
								</div>
								<div class="jindutiao2">
									<span><span>34</span>访问</span>
								</div>
							</div>
						</div>
						<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
							<div class="ip_jilu">
								<p title="127.0.0.1">IP:<span>127.0.0.1</span></p>
								<p title="IP内网">运营商:<span>IP内网</span></p>
								<p title="弈趣云创内网" class="address">地区:<span>弈趣云创内网</p>
								<p title="2018-08-06">日期:<span>2018-08-06</span></p>
								<div class="layui-progress jindutiao1">
									<div class="layui-progress-bar layui-bg-cyan" lay-percent="100%"></div>
								</div>
								<div class="jindutiao2">
									<span><span>34</span>访问</span>
								</div>
							</div>
						</div>
						<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
							<div class="ip_jilu">
								<p title="127.0.0.1">IP:<span>127.0.0.1</span></p>
								<p title="IP内网">运营商:<span>IP内网</span></p>
								<p title="弈趣云创内网" class="address">地区:<span>弈趣云创内网</p>
								<p title="2018-08-06">日期:<span>2018-08-06</span></p>
								<div class="layui-progress jindutiao1">
									<div class="layui-progress-bar layui-bg-blue" lay-percent="50%"></div>
								</div>
								<div class="jindutiao2">
									<span><span>34</span>访问</span>
								</div>
							</div>
						</div>
						<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
							<div class="ip_jilu">
								<p title="127.0.0.1">IP:<span>127.0.0.1</span></p>
								<p title="IP内网">运营商:<span>IP内网</span></p>
								<p title="弈趣云创内网" class="address">地区:<span>弈趣云创内网</p>
								<p title="2018-08-06">日期:<span>2018-08-06</span></p>
								<div class="layui-progress jindutiao1">
									<div class="layui-progress-bar layui-bg-orange" lay-percent="100%"></div>
								</div>
								<div class="jindutiao2">
									<span><span>34</span>访问</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md4">
				<div class="view_box">
					<h3>性能监测</h3>
					<div class="ip_box">
						<blockquote class="layui-elem-quote">
							<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
								<p>Java 环境</p>
								<p>Jdk 版本</p>
								<p>Tomcat 版本</p>
							</div>
							<div class="layui-col-xs6 layui-col-sm6 layui-col-md6" style="text-align: right;">
								<p>1xxxx xxxx</p>
								<p>1xxxx xxxx</p>
								<p>1xxxx xxxx</p>
							</div>
						</blockquote>
						<blockquote class="layui-elem-quote">
							<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
								<p>本机 IP</p>
								<p>数据库版本</p>
								<p>系统硬盘容量 (E:)</p>
							</div>
							<div class="layui-col-xs6 layui-col-sm6 layui-col-md6" style="text-align: right;">
								<p>2xxxx xxxx</p>
								<p>2xxxx xxxx</p>
								<p>2xxxx xxxx</p>
							</div>
						</blockquote>
						<blockquote class="layui-elem-quote">
							<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
								<p>版本更新</p>
								<p>版本介绍</p>
								<p>使用指南</p>
							</div>
							<div class="layui-col-xs6 layui-col-sm6 layui-col-md6" style="text-align: right;">
								<p>3xxxx xxxx</p>
								<p>3xxxx xxxx</p>
								<p>3xxxx xxxx</p>
							</div>
						</blockquote>
					</div>
				</div>
			</div>
		</div>

		<div class="view_table">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md4">
				<div class="view_box">
					<h3>访问量</h3>
					<div id="main" style="width: 100%;height:400px;"></div>
				</div>
			</div>
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md8">
				<div class="view_box">
					<h3>近期更新内容</h3>
					<table class="layui-table" lay-skin="line">
						<colgroup>
							<col width="15%">
							<col width="40%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>更新栏目</th>
								<th>内容</th>
								<th>时间</th>
								<th>发布状态</th>
								<th>责任人</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>内容管理</td>
								<td>
									<p>弈趣云创科技有限公司弈趣云创科技有限公司弈趣云创科技有限公司弈趣云创科技有限公司弈趣云创科技有限公司弈趣云创科技有限公司弈趣云创科技有限公司</p>
								</td>
								<td>2016-11-28</td>
								<td><button class="layui-btn layui-btn-radius layui-btn-xs layui-btn-normal">未发布</button></td>
								<td>谢红伦</td>
							</tr>
							<tr>
								<td>内容管理</td>
								<td>
									<p>弈趣云创科技有限公司</p>
								</td>
								<td>2016-11-28</td>
								<td><button class="layui-btn layui-btn-radius layui-btn-xs">已发布</button></td>
								<td>谢红伦</td>
							</tr>
							<tr>
								<td>内容管理</td>
								<td>
									<p>弈趣云创科技有限公司</p>
								</td>
								<td>2016-11-28</td>
								<td><button class="layui-btn layui-btn-radius layui-btn-xs">已发布</button></td>
								<td>谢红伦</td>
							</tr>
							<tr>
								<td>内容管理</td>
								<td>
									<p>弈趣云创科技有限公司</p>
								</td>
								<td>2016-11-28</td>
								<td><button class="layui-btn layui-btn-radius layui-btn-xs layui-btn-normal">未发布</button></td>
								<td>谢红伦</td>
							</tr>
							<tr>
								<td>内容管理</td>
								<td>
									<p>弈趣云创科技有限公司</p>
								</td>
								<td>2016-11-28</td>
								<td><button class="layui-btn layui-btn-radius layui-btn-xs">已发布</button></td>
								<td>谢红伦</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<script src="//cdn.bootcss.com/echarts/3.3.2/echarts.min.js" charset="utf-8"></script>
		<script src="//cdn.bootcss.com/echarts/3.3.2/extension/bmap.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="static/newStatic/js/main.js.js" ></script>
	</body>
</html>