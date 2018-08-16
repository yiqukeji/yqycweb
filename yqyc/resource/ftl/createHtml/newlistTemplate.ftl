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
		<link rel="stylesheet" href="fh_static_1/css/xwzx.css" />
		<title></title>
	</head>
	<body>
		<!--
        	作者：270068451@qq.com
        	时间：2018-05-11
        	描述：头部公共页面
        -->
		<div id="public_header"><#include "headerTemplate.ftl"></div>
		
		<!--
        	作者：270068451@qq.com
        	时间：2018-06-28
        	描述：内容部分
        -->
        <div class="banner_img">
        	<img src="fh_static_1/img/child_banner4.jpg" />
        	<div class="child_nav">
				<div class="gyyq">
					<p>NEWS AND INFORMATION | 新闻资讯</p>
				</div>
				<div class="nav_list">
					<a href="javaScript:;" id="yq05">签约动态</a>
					<a href="javaScript:;" id="yq06">通知公告</a>
					<a href="javaScript:;" id="yq07">行业资讯</a>
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
				<a href="index.html">首页</a>>新闻资讯><span class="alis"></span> 
			</p>
		</div>
		<input value="" hidden="hiddden" class="t1"/>
        <div class="container xwzx">
        
        </div>
        
        <!--
        	作者：270068451@qq.com
        	时间：2018-06-28
        	描述：加载
        -->
        <div class="container">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-21 more_img  more_img2">
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
		<script type="text/javascript" src="fh_static_1/js/newList.js"></script>
	</body>
</html>
