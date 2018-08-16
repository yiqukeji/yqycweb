<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="keywords" content="${KEYWORDS}" />
		<link href="fh_static_1/img/favicon.ico" type="image/x-icon" rel="Shortcut Icon" />
		<link rel="stylesheet" href="fh_static_1/css/bootstrap.min.css" />
		<script type="text/javascript" src="fh_static_1/js/boot.jquery.js"></script>
		<script type="text/javascript" src="fh_static_1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="fh_static_1/css/animate.css" />
		<link rel="stylesheet" href="fh_static_1/css/pucbli.css" />
		<link rel="stylesheet" href="fh_static_1/css/publicsss.css" />
		<link rel="stylesheet" href="fh_static_1/css/index.css" />
		<title>${TITLE1}</title>
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
        	时间：2018-06-22
        	描述：轮播图
        -->
		<!--
        	作者：270068451@qq.com
        	时间：2018-05-11
        	描述：轮播图部分
        -->
		<div class="slide_container">
			<ul class="rslides" id="slider">
			<#list fieldList1 as var>
				<li>
					<img src="${var[1]}" alt="">
				</li>
				 </#list>
			</ul>
		</div>


			<!--
        	作者：270068451@qq.com
        	时间：2018-06-22
        	描述：内容部分
        -->
			<div class="container link_list">
				<div class="col-xs-4 col-sm-2 col-md-2 col-lg-2">
					<a href="webintroduce.html">
						<div class="img_box">
							<img src="fh_static_1/img/11.png" />
							<img src="fh_static_1/img/1.png" />
						</div>
						<div class="font_box">
							弈趣介绍
						</div>
					</a>
				</div>
				<div class="col-xs-4 col-sm-2 col-md-2 col-lg-2">
					<a href="webcourse.html">
						<div class="img_box">
							<img src="fh_static_1/img/22.png" />
							<img src="fh_static_1/img/2.png" />
						</div>
						<div class="font_box">
							发展历程
						</div>
					</a>
				</div>
				<div class="col-xs-4 col-sm-2 col-md-2 col-lg-2">
					<a href="webfuture.html">
						<div class="img_box">
							<img src="fh_static_1/img/33.png" />
							<img src="fh_static_1/img/3.png" />
						</div>
						<div class="font_box">
							自主平台
						</div>
					</a>
				</div>
				<div class="col-xs-4 col-sm-2 col-md-2 col-lg-2">
					<a href="webfuture.html#gncp">
						<div class="img_box">
							<img src="fh_static_1/img/44.png" />
							<img src="fh_static_1/img/4.png" />
						</div>
						<div class="font_box">
							概念产品
						</div>
					</a>
				</div>
				<div class="col-xs-4 col-sm-2 col-md-2 col-lg-2">
					<a href="webteam.html">
						<div class="img_box">
							<img src="fh_static_1/img/55.png" />
							<img src="fh_static_1/img/5.png" />
						</div>
						<div class="font_box">
							<a href="webteam.html">团队介绍</a>
						</div>
					</a>
				</div>
				<div class="col-xs-4 col-sm-2 col-md-2 col-lg-2">
					<a href="webzp.html">
						<div class="img_box">
							<img src="fh_static_1/img/66.png" />
							<img src="fh_static_1/img/6.png" />
						</div>
						<div class="font_box">招纳贤士
						</div>
					</a>
				</div>
			</div>

			<div class="serves">
				<div class="container server_box">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="serve_font serve_font1">
							<p class="English">SERVE</p>
							<p class="Chinese">服务</p>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 fuwu_img">
						<div class="fuwuimg_box1">
							<span id="li_left" class="li_left" onclick="left()">&lang;</span>
						</div>
						<div class="fuwuimg_box2">
							<ul class="ul_box">
								<li class="li_img"><img src="fh_static_1/fw_img/1.png"/></li>
								<li class="li_img"><img src="fh_static_1/fw_img/2.png"/></li>
								<li class="li_img"><img src="fh_static_1/fw_img/3.png"/></li>
								<li class="li_img"><img src="fh_static_1/fw_img/4.png"/></li>
								<li class="li_img"><img src="fh_static_1/fw_img/5.png"/></li>
								<li class="li_img"><img src="fh_static_1/fw_img/6.png"/></li>
								<li class="li_img"><img src="fh_static_1/fw_img/7.png"/></li>
								<li class="li_img"><img src="fh_static_1/fw_img/8.png"/></li>
								<li class="li_img"><img src="fh_static_1/fw_img/9.png"/></li>
								<li class="li_img"><img src="fh_static_1/fw_img/10.png"/></li>
								<li class="li_img"><img src="fh_static_1/fw_img/11.png"/></li>
								<li class="li_img"><img src="fh_static_1/fw_img/12.png"/></li>
								<li class="li_img"><img src="fh_static_1/fw_img/13.png"/></li>
								<li class="li_img"><img src="fh_static_1/fw_img/14.png"/></li>
							</ul>
						</div>
						<div class="fuwuimg_box1">
							<span id="li_right" class="li_right" onclick="right()">&rang;</span>
						</div>
					</div>
				</div>
			</div>

			<!--
	        	作者：270068451@qq.com
	        	时间：2018-06-22
	        	描述：案列
	        -->
			<div class="Case_list">
				<div class="container">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<div class="serve_font serve_font2">
							<p class="English">CASE</p>
							<p class="Chinese">案列</p>
						</div>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 more_img  more_img1">
						<a href="weboptimal.html">View more ><s></s></a>
					</div>
					<div class="case_item">
					 <#list fieldListOptimal as var>
						<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 yxal" >
							<a href="javaScript:;" class="04" id="${var[0]}" ><img src="${var[5]}" /><s></s></a>
						</div>
					 </#list>	
					</div>
				</div>
			</div>		
			<!--
	        	作者：270068451@qq.com
	        	时间：2018-06-22
	        	描述：资讯
	        -->
			<div class="information">
				<div class="container">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<div class="serve_font serve_font2">
							<p class="English">INFORMATION</p>
							<p class="Chinese">资讯</p>
						</div>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 more_img  more_img2">
						<a href="javaScript:;" class="cp1">View more ><s></s></a>
					</div>
					<div class="information_box">
						<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 information_left">
						<#list fieldListyqzx as var>
							<div class="font_img">
								<img src="${var[3]}" />
								<div class="font_details">
									<h3 title="${var[1]}">${var[1]}</h3>
									<span>中国 | 贵阳&emsp;&emsp;${var[4][0..10]}</span>
									<p>${var[2]}</p>
									<a href="javaScript:;" class="${var[14]}" id="${var[0]}">详情</a>
								</div>
							</div>
						</#list>	
						</div>
						<div class="col-xs-12 col-sm-7 col-md-7 col-lg-7 information_right">
							<#list fieldListyq05 as var>
							<#if var_index==0>
							<div class="font_list">
								<h4><a href="javaScript:;" class="${var[14]}" id="${var[0]}" title="${var[1]}">${var[1]}</a></h4>
								<p>${var[2]}</p>
								<span>日期：<label>${var[4][0..10]}</label> </span><span>作者：<label>${var[8]}</label> </span><span>栏目：<label>${var[15]}</label></span>
							</div>
							</#if>
							</#list>
							<#list fieldListyq06 as var>
							<#if var_index==0>
							<div class="font_list">
								<h4><a href="javaScript:;" class="${var[14]}" id="${var[0]}" title="${var[1]}">${var[1]}</a></h4>
								<p>${var[2]}</p>
								<span>日期：<label>${var[4][0..10]}</label> </span><span>作者：<label>${var[8]}</label> </span><span>栏目：<label>${var[15]}</label></span>
							</div>
							</#if>
							</#list>
							<#list fieldListyq07 as var>
							<#if var_index==0>
							<div class="font_list">
								<h4><a href="javaScript:;" class="${var[14]}" id="${var[0]}" title="${var[1]}">${var[1]}</a></h4>
								<p>${var[2]}</p>
								<span>日期：<label>${var[4][0..10]}</label> </span><span>作者：<label>${var[8]}</label> </span><span>栏目：<label>${var[15]}</label></span>
							</div>
							</#if>
							</#list>
						</div>
					</div>
				</div>
			</div>
			
            <!--
	        	作者：270068451@qq.com
	        	时间：2018-05-11
	        	描述：头部公共页面
	        -->
			<div id="public_footer"><#include "footerTemplate.ftl"></div>
			
			<script type="text/javascript" src="fh_static_1/js/nav.js"></script>
			<script type="text/javascript" src="fh_static_1/js/public.js" ></script>
			<script type="text/javascript" src="fh_static_1/js/responsiveslides.min.js" ></script>
			<script type="text/javascript" src="fh_static_1/js/slide.js" ></script>
			
			<script type="text/javascript">
		$(".yxal a").click(function(){
		var id = $(this).attr("id");
		var type = $(this).attr("class");
		window.location.href="webdetail.html?i="+id+"&t="+type;
		})
		$(".font_details a,.font_list a").click(function(){
		var id = $(this).attr("id");
		var type = $(this).attr("class");
		window.location.href="webdetail.html?i="+id+"&t="+type;
		})
		$(".cp1").click(function(){
		var name = escape("新闻资讯");
		window.location.href="webnew.html?n="+name+"&c=yq05";
		})
		</script>
	</body>
</html>