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

		<link rel="stylesheet" href="fh_static_1/css/cpyc.css" />
		<title>弈趣云创—团队文化</title>
	</head>

	<body>
		<!--
        	作者：270068451@qq.com
        	时间：2018-05-11
        	描述：头部公共页面
        -->
		<div id="public_header"><#include "headerTemplate.ftl"></div>

		<div class="banner">
			<img src="fh_static_1/img/child_banner5.jpg" />
			<div class="child_nav">
				<div class="gyyq">
					<p>JOIN US | 诚聘英才</p>
				</div>
				<div class="nav_list">
					<a href="webidea.html">人才理念</a>
					<a href="webteam.html" class="bg">团队文化</a>
					<a href="webzp.html">招贤纳士</a>
				</div>
			</div>
		</div>
		<!--
        	作者：270068451@qq.com
        	时间：2018-06-26
        	描述：当前访问位置
        -->
		<!--<div class="container address">
			<p>当前位置：
				<a href="index.html">首页</a> > 诚聘英才 > 人才理念
			</p>
		</div>-->

		<!--
        	作者：270068451@qq.com
        	时间：2018-06-26
        	描述：内容详情
        -->
		<div class="container details">
			<!--<div class="title">
				<p>团队文化</p>
			</div>-->
			<div class="fonts">
				<div class="gongsi_logo">
					<img src="${SIMG105}" />
				</div>
				<div class="gonsi_xiangqing">
					<h2>${STITLE05}</h2>
					<p>
					${SCONTENTS05?replace("<.*?>","","r")}
					</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 wenhua_box">
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 wenhua">
					<h2>${STITLE06}</h2>
					<p>${SCONTENTS06?replace("<.*?>","","r")}</p>
					<img src="${SIMG106}" />
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 wenhua">
					<h2>${STITLE07}</h2>
					<p>${SCONTENTS07?replace("<.*?>","","r")}</p>
					<img src="${SIMG107}" />
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 rw_jianjie">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 tuandui">
					<h3>团队风采</h3>
				</div>
				<#list fieldListTeam as var>
				<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
					<div class="jianjie_box">
						<div class="rw_img">
							<img src="${var[3]}" />
							<span>${var[1]}</span>
						</div>
						<div class="rw_details">
							<p>
							${var[2]?replace("<.*?>","","r")}
							</p>
						</div>
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