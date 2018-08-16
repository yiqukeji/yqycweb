<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<meta charset="utf-8" />
		<title>后台管理系统</title>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="static/newStatic/css/yq_admin.css" />
		<link rel="stylesheet" href="static/newStatic/css/font.css" />
		<link rel="stylesheet" href="static/newStatic/css/xadmin.css" />
		<script type="text/javascript" src="static/newStatic/js/jquery.js"></script>
		<script type="text/javascript" src="static/newStatic/lib/layui/layui.js"></script>
		<link rel="stylesheet" href="static/newStatic/lib/layui/css/layui.css" />
		<script type="text/javascript" src="static/newStatic/js/xcity.js"></script>
		<script type="text/javascript" src="static/newStatic/js/xadmin.js"></script>
  </head>
  
  <body>
    <div class="container" style="height: 60px;">
			<div class="logo">
				<a href="./index.html" style="line-height: 60px;">
					<img src="static/newStatic/img/yq_admin.png" />
				</a>
			</div>
			<div class="left_open">
				<i title="展开左侧栏" class="iconfont" style="margin-top: 15px;">&#xe699;</i>
			</div>
			<ul class="layui-nav right" lay-filter="">
				<li class="layui-nav-item">
					<a href="javascript:;">super_admin</a>
					<dl class="layui-nav-child" style="top: 60px;">
						<!-- 二级菜单 -->
						<dd>
							<a onclick="x_admin_show('个人信息','main.html')">个人信息</a>
						</dd>
						<dd>
							<a onclick="x_admin_show('切换帐号','main.html')">切换帐号</a>
						</dd>
						<dd>
							<a href="./users.html">退出</a>
						</dd>
					</dl>
				</li>
				<li class="layui-nav-item to-index">
					<a onclick="x_admin_show('个人信息','main.html')" href="JavaScript:;">前台首页</a>
				</li>
			</ul>

		</div>

		<div class="left-nav" style="top: 60px;">
			<div id="side-nav">
				<ul id="nav">
					<li>
						<a href="main/index">
							<i class="layui-icon">&#xe68e;</i>
							<cite>后台首页</cite>
						</a>
					</li>
					<c:forEach items="${menuList}" var="menu1">
				<c:if test="${menu1.hasMenu && '1' == menu1.MENU_STATE}">
					<li class=""  id="lm${menu1.MENU_ID }">
						<a href="javascript:;">
							<i class="iconfont">&#xe82b;</i>
							<cite>
								${menu1.MENU_NAME }
							</cite>
							<i class="iconfont nav_right">&#xe697;</i>
							<c:if test="${'[]' != menu1.subMenu}"><b class="arrow fa fa-angle-down"></b></c:if>
						</a>
						<!-- <b class="arrow"></b>  -->
						<c:if test="${'[]' != menu1.subMenu}">
						<ul class="sub-menu">
						<c:forEach items="${menu1.subMenu}" var="menu2">
							<c:if test="${menu2.hasMenu && '1' == menu2.MENU_STATE}">
							<li class="" id="z${menu2.MENU_ID }">
								<a _href="javascript:;" <c:if test="${not empty menu2.MENU_URL && '#' != menu2.MENU_URL}">target="mainFrame" onclick="siMenu('z${menu2.MENU_ID }','lm${menu1.MENU_ID }','${menu2.MENU_NAME }','${menu2.MENU_URL }')"</c:if><c:if test="${'[]' != menu2.subMenu}"> class="dropdown-toggle"</c:if>>
									<i class="iconfont">&#xe6a7;</i>
										<cite> ${menu2.MENU_NAME } </cite>
									<i class="iconfont nav_right">&#xe697;</i>
									<c:if test="${'[]' != menu2.subMenu}"><b class="arrow fa fa-angle-down"></b></c:if>
								</a>
								<c:if test="${'[]' != menu2.subMenu}">
								<ul class="sub-menu">
									<c:forEach items="${menu2.subMenu}" var="menu3">
									<c:if test="${menu3.hasMenu && '1' == menu3.MENU_STATE}">
										<li class="" id="m${menu3.MENU_ID }">
											<a _href="javascript:;" <c:if test="${not empty menu3.MENU_URL && '#' != menu3.MENU_URL}">target="mainFrame" onclick="siMenu('m${menu3.MENU_ID }','z${menu2.MENU_ID }','${menu3.MENU_NAME }','${menu3.MENU_URL }')"</c:if><c:if test="${'[]' != menu3.subMenu}"> class="dropdown-toggle"</c:if>>
												<i class="iconfont">&#xe6a7;</i>
												<cite>${menu3.MENU_NAME }</cite>
												<c:if test="${'[]' != menu3.subMenu}"><b class="arrow fa fa-angle-down"></b></c:if>
											</a>
											<c:if test="${'[]' != menu3.subMenu}">
												<ul class="sub-menu">
													<c:forEach items="${menu3.subMenu}" var="menu4">
													<c:if test="${menu4.hasMenu && '1' == menu4.MENU_STATE}">
														<li class="" id="m${menu4.MENU_ID }">
															<a _href="javascript:;" <c:if test="${not empty menu4.MENU_URL && '#' != menu4.MENU_URL}">target="mainFrame" onclick="siMenu('m${menu4.MENU_ID }','z${menu3.MENU_ID }','${menu4.MENU_NAME }','${menu4.MENU_URL }')"</c:if><c:if test="${'[]' != menu4.subMenu}"> class="dropdown-toggle"</c:if>>
																<i class="iconfont">&#xe6a7;</i>
																<cite>${menu4.MENU_NAME }</cite>
																<c:if test="${'[]' != menu4.subMenu}"><b class="arrow fa fa-angle-down"></b></c:if>
															</a>
															<c:if test="${'[]' != menu4.subMenu}">
																<ul class="sub-menu">
																	<c:forEach items="${menu4.subMenu}" var="menu5">
																	<c:if test="${menu5.hasMenu && '1' == menu5.MENU_STATE}">
																	<li class="" id="n${menu5.MENU_ID }">
																		<a _href="javascript:;" <c:if test="${not empty menu5.MENU_URL && '#' != menu5.MENU_URL}">target="mainFrame" onclick="siMenu('n${menu5.MENU_ID }','m${menu4.MENU_ID }','${menu5.MENU_NAME }','${menu5.MENU_URL }')"</c:if><c:if test="${'[]' != menu5.subMenu}"> class="dropdown-toggle"</c:if>>
																			<i class="iconfont">&#xe6a7;</i>
																			<cite>${menu5.MENU_NAME }</cite>
																			<c:if test="${'[]' != menu4.subMenu}"><b class="arrow fa fa-angle-down"></b></c:if>
																		</a>
																	</li>
																	</c:if>
																	</c:forEach>
																</ul>
															</c:if>
														</li>
														</c:if>
													</c:forEach>
												</ul>
											</c:if>
										</li>
										</c:if>
									</c:forEach>
								</ul>
								</c:if>
							</li>
							</c:if>
						</c:forEach>
						</ul>
						</c:if>
					</li>
				</c:if>
				</c:forEach>
				</ul>
			</div>
		</div>

		<!-- 内容主体区域 -->
		<div class="page-content" style="top: 60px;">
			<div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
				<!-- <ul class="layui-tab-title">
					<li class="home"><i class="layui-icon">&#xe68e;</i>主页</li>
				</ul> -->
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<!-- <iframe src='default.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe> -->
						<iframe name="mainFrame" id="mainFrame" frameborder="0" src="tab.do"  scrolling="yes" class="x-iframe"></iframe>
					</div>
				</div>
			</div>
		</div>

		<!-- 底部固定区域 -->
		<div class="footer">
			<div class="copyright">Copyright (c) 2018 弈趣云创. All Rights Reserved.</div>
		</div>

		<!--引入属于此页面的js -->
		<script type="text/javascript" src="static/js/myjs/head.js"></script>
		
		<script>
			//加载模块
			//			layui.use(['layer'], function() {
			//				var layer = layui.layer;
			//				layer.msg("111");
			//			});
		</script>
  </body>
</html>
