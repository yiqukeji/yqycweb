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
		<link rel="stylesheet" href="fh_static_1/css/child.css" />
		<title></title>
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
			<input value="" class="t1" hidden="hidden"/>
			<div class="child_nav">
				<div class="gyyq">
					<p>News Information | 新闻资讯</p>
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
				<a href="index.html">首页</a>>新闻资讯><span class="alis" style="cursor:pointer"></span>
			</p>
		</div>

		<!--
        	作者：270068451@qq.com
        	时间：2018-06-26
        	描述：内容详情
        -->
		<div class="container details">
			<div class="title t2">
				<p>新闻资讯</p>
			</div>
			<div class="fonts">
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
		<script type="text/javascript" src="fh_static_1/js/detail.js"></script>
	</body>

</html>