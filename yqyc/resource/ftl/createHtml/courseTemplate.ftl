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
		<link rel="stylesheet" href="fh_static_1/css/child_fzlc.css" />
		<link rel="stylesheet" href="fh_static_1/css/cntl.css" />
		<title>弈趣云创—发展历程</title>
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
					<a href="webcourse.html" class="bg">发展历程</a>
					<a href="webhonor.html">荣誉资质</a>
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
				<a href="index.html">首页</a>>关于弈趣>发展历程
			</p>
		</div>

		<!--
        	作者：270068451@qq.com
        	时间：2018-06-26
        	描述：内容详情
        -->
		<div class="container details">
			<div class="title">
				<p>发展历程</p>
			</div>
			<div class="fonts">
				<!--
			        	作者：270068451@qq.com
			        	时间：2018-05-24
			        	描述：发展历程
			      -->
				<div class="jq22-container">
					<div class="cntl">
						<span class="cntl-bar cntl-center">
							<span class="cntl-bar-fill"></span>
						</span>

						<div class="cntl-states">
                           <#list fieldListCource as var>
							<div class="cntl-state">
								<div class="cntl-content">
									<h4>${var[1]}</h4>
									<p>${var[3]}</p>
								</div>
								<div class="cntl-image"><img src="${var[2]}"></div>
								<div class="cntl-icon cntl-center">${var[4][0..10]}</div>
							</div>
                           </#list>
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
		<script type="text/javascript" src="fh_static_1/js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="fh_static_1/js/jquery.min.js"></script>
		<script type="text/javascript" src="fh_static_1/js/jquery.cntl.js"></script>
		<script type="text/javascript">
			$(document).ready(function(e) {
				$('.cntl').cntl({
					revealbefore: 300,
					anim_class: 'cntl-animate',
					onreveal: function(e) {
						console.log(e);
					}
				});
			});
		</script>
	</body>
</html>