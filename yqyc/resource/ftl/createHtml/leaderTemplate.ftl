<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<script type="text/javascript" src="fh_static_1/js/jquery-3.3.1.min.js"></script>
		<link rel="stylesheet" href="fh_static_1/css/paging.css" />
		<link rel="stylesheet" href="fh_static_1/css/public_header.css" />
		<link rel="stylesheet" href="fh_static_1/css/xrld.css" />
		<title></title>
	</head>

	<body>
		<!--
        	作者：270068451@qq.com
        	时间：2018-06-20
        	描述：公共头部
        -->
        <#assign type = 0 />
		<div id="public_header"><#include "headerTemplate.ftl"></div>

		<!--
        	作者：270068451@qq.com
        	时间：2018-06-20
        	描述：内容部分
        -->
		<section>
			<div class="section_box">
				<div class="section_nav">
					<div class="section_title">
						<h3>学院概况</h3>
					</div>
					<div class="section_title_list">
						<a href="webintro.html" >学院简介</a>
						<a href="webleader.html" class="bg_color">现任领导</a>
						<a href="weborg.html">组织机构</a>
					</div>
				</div>
				<div class="section_details">
					<div class="address">
						<p>您的位置：
							<a href="index.html">首页</a> > 学院概况 > 现任领导</p>
					</div>
					<div class="section_content">
						<div class="la_listbox">
						</div>
						<div class="fenye">
							<div class="mypage">
								<div class="page_box">
									<div class="box" id="box"></div>
									<script type="text/javascript" src="fh_static_1/js/jquery-1.8.3.min.js"></script>
									<script type="text/javascript" src="fh_static_1/js/paging.js"></script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!--
        	作者：270068451@qq.com
        	时间：2018-06-20
        	描述：公共底部
        -->
		<div id="public_footer"><#include "footerTemplate.ftl"></div>

		<script type="text/javascript" src="fh_static_1/js/public.js"></script>
		<script type="text/javascript" src="fh_static_1/js/leader.js"></script>
		<script type="text/javascript" src="fh_static_1/js/nav.js"></script>
	</body>
</html>