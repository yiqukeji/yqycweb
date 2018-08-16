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
		<link rel="stylesheet" href="fh_static_1/css/child_ryzz.css" />
		<title>弈趣云创—荣誉资质</title>
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
					<p>ABOUT US | 关于弈趣</p>
				</div>
				<div class="nav_list">
					<a href="webintroduce.html" >弈趣介绍</a>
					<a href="webcourse.html">发展历程</a>
					<a href="webhonor.html" class="bg">荣誉资质</a>
				</div>
			</div>
		</div>
		<!--
        	作者：270068451@qq.com
        	时间：2018-06-26
        	描述：当前访问位置
        -->
		<div class="container address">
			<p>当前位置:<a href="index.html">首页</a>>关于弈趣>荣誉资质</p>
		</div>

		<!--
        	作者：270068451@qq.com
        	时间：2018-06-26
        	描述：内容详情
        -->
		<div class="container details">
				<div class="title">
					<p>荣誉资质</p>
				</div>
				<div class="fonts ry">
				    <#list fieldListHonor as var>
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
						<div class="font">
							<img src="${var[2]}"/>
							<p title="${var[1]}">${var[1]}</p>
						</div>
					</div>
					</#list>
					
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