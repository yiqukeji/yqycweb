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
		<link rel="stylesheet" href="fh_static_1/css/ycwl.css" />
		<title>弈趣云创—云创未来</title>
	</head>

	<body>
		<!--
        	作者：270068451@qq.com
        	时间：2018-05-11
        	描述：头部公共页面
        -->
		<div id="public_header"><#include "headerTemplate.ftl"></div>

		<div class="banner">
			<img src="fh_static_1/img/child_banner6.jpg" />
			<div class="child_nav">
				<div class="gyyq">
					<p>CLOUD CREATION | 云创未来</p>
				</div>
				<div class="nav_list">
					<a href="#zzpt" class="bg">自主平台</a>
					<a href="#gncp">概念产品</a>
					<a href="#fzgh">发展规划</a>
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
				<a href="index.html">首页</a>>云创未来
			</p>
		</div>

		<!--
        	作者：270068451@qq.com
        	时间：2018-06-26
        	描述：内容详情
        -->
		<div class="container details">
			<div class="title">
				<p>云创未来</p>
			</div>
			<div class="fonts">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 animated fadeInLeft">
					<div class="yc_title">
						<h3 id="zzpt"><img src="fh_static_1/img/yc1.png" /></h3>
					</div>
					<div class="yc_left">
						<div class="yuan">
							<img src="${SIMG108}" />
							<img src="fh_static_1/img/YQ_logoicon.png" class="yqyc"/>
						</div>
					</div>
					<div class="yc_right">
						<div class="yc_top">
							<h3>${STITLE08}</h3>
							<p>${DESCRIPT08}</p>
						</div>
						<div class="yc_bottom">
						<div class="yc_bottom_box">
						</p>
						${SCONTENTS08}
						</p>
						</div>
						</div>
					</div>
				</div>
				
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 two">
					<div class="yc_title1">
						<h3 id="gncp"><img src="fh_static_1/img/yc2.png" /></h3>
					</div>
					<div class="yc_left1">
						<div class="yuan1">
							<img src="${SIMG109}" />
							<img src="fh_static_1/img/YQ_logoicon.png" class="yqyc"/>
						</div>
					</div>
					<div class="yc_right1">
						<div class="yc_top1">
							<h3>${STITLE09}</h3>
							<p>${DESCRIPT09}</p>
						</div>
						<div class="yc_bottom1">
						<div class="yc_bottom_box">
						<p>
							${SCONTENTS09}
							</p>
						</div>
						</div>
					</div>
				</div>
				
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 three">
					<div class="yc_title">
						<h3 id="fzgh"><img src="fh_static_1/img/yc3.png" /></h3>
					</div>
					<div class="yc_left">
						<div class="yuan">
							<img src="${SIMG110}" />
							<img src="fh_static_1/img/YQ_logoicon.png" class="yqyc"/>
						</div>
					</div>
					<div class="yc_right">
						<div class="yc_top">
							<h3>${STITLE10}</h3>
							<p>${DESCRIPT10}</p>
						</div>
						<div class="yc_bottom">
						<div class="yc_bottom_box">
						<p>
							${SCONTENTS10}
							</p>
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