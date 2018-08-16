<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<link href="fh_static_1/img/favicon.ico" type="image/x-icon" rel="Shortcut Icon" />
		<link rel="stylesheet" href="fh_static_1/css/bootstrap.min.css" />
		<script type="text/javascript" src="fh_static_1/js/boot.jquery.js"></script>
		<script type="text/javascript" src="fh_static_1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="fh_static_1/css/animate.css" />
		<link rel="stylesheet" href="fh_static_1/css/pucbli.css" />
		<link rel="stylesheet" href="fh_static_1/css/ywfa.css" />
		<title>弈趣云创—业务方案</title>
	</head>

	<body>
		<!--
        	作者：270068451@qq.com
        	时间：2018-05-11
        	描述：头部公共页面
        -->
		<div id="public_header"><#include "headerTemplate.ftl"></div>

		<div class="banner">
			<img src="fh_static_1/img/child_banner1.jpg" />
			<div class="child_nav">
				<div class="gyyq">
					<p>BUSINESS SCHEME | 业务方案</p>
				</div>
				<div class="nav_list">
					<a href="#szxxch">数字形象策划</a>
					<a href="#xtkffa">系统开发方案</a>
					<a href="#vrzzfa">VR方案制作</a>
				</div>
			</div>
		</div>
		<!--
        	作者：270068451@qq.com
        	时间：2018-06-26
        	描述：当前访问位置
        -->
		<div class="container address">
			<p>当前位置：
				<a href="index.html">首页</a>>业务方案
			</p>
		</div>

		<!--
        	作者：270068451@qq.com
        	时间：2018-06-26
        	描述：内容详情
        -->
		<div class="container details">
			<div class="title">
				<p>业务方案</p>
			</div>
			<div class="fonts">
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
					<div class="mask_font">
						<img src="${SIMG101}" />
						<div>
							<h3>数字形象策划</h3>
							<span>
								${SCONTENTS01?replace("<.*?>","","r")}
							</span>
						</div>
					</div>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
					<div class="mask_font">
						<img src="${SIMG102}" />
						<div>
							<h3>系统开发方案</h3>
							<span>
								${SCONTENTS02?replace("<.*?>","","r")}
							</span>
						</div>
					</div>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
					<div class="mask_font">
						<img src="${SIMG103}" />
						<div>
							<h3>VR制作方案</h3>
							<span>
								${SCONTENTS03?replace("<.*?>","","r")}
							</span>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<a id="szxxch">
					<h3><img src="fh_static_1/img/yw1.png" /></h3>
				</a>
				<div class="szxxch_box">
					<img src="fh_static_1/img/footer_bg.gif" />
					<div class="szxxch_font">
						<div class="szxxch_img">
							<img src="${SIMG201}" />
						</div>
						<div class="szxxch_details">
							<h3>${STITLE01}</h3>
							<div class="wenzi_box">
							<div class="wenzi_details">
							    <p>
								${SCONTENTS01}
								</p>
								</div>
							</div>							
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<a id="xtkffa">
					<h3><img src="fh_static_1/img/yw2.png" /></h3>
				</a>
				<div class="szxxch_box1">
					<img src="fh_static_1/img/footer_bg.gif" />
					<div class="szxxch_font1">
						<div class="szxxch_img1">
							<img src="${SIMG202}" />
						</div>
						<div class="szxxch_details1">
							<h3>${STITLE02}</h3>
							<div class="wenzi_box1">
								<div class="wenzi_details1">
							    <p>
								${SCONTENTS02}
								</p>
								</div>
							</div>							
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<a id="vrzzfa">
					<h3><img src="fh_static_1/img/yw3.png" /></h3>
				</a>
				<div class="szxxch_box szxxch_box2">
					<img src="fh_static_1/img/footer_bg.gif" />
					<div class="szxxch_font">
						<div class="szxxch_img">
							<img src="${SIMG203}" />
						</div>
						<div class="szxxch_details">
							<h3>${STITLE03}</h3>
							<div class="wenzi_box">
							<div class="wenzi_details">
							    <p>
								${SCONTENTS03}
								</p>
								</div>
							</div>							
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--
        	作者：270068451@qq.com
        	时间：2018-05-11
        	描述：底部公共页面
        -->
		<div id="public_footer"><#include "footerTemplate.ftl"></div>

		<script type="text/javascript" src="fh_static_1/js/public.js"></script>
		<script type="text/javascript" src="fh_static_1/js/child.js"></script>
	</body>

</html>