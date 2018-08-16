<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script type="text/javascript" src="fh_static_1/js/jquery-3.3.1.min.js" ></script>
		<link rel="stylesheet" href="fh_static_1/css/public_header.css" />
		<link rel="stylesheet" href="fh_static_1/css/child_details.css" />
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
						<h3>联系我们</h3>
					</div>
				</div>
				<div class="section_details">
				<input class="c" type="hidden" value=""/>
				<input class="n" type="hidden" value=""/>
				<input class="i" type="hidden" value=""/>
					<div class="address"><p></p></div>
					
					<div class="section_content">
						<div class="details_box">
							<div class="details_title">
								<h3></h3>
							</div>
							<div class="details_time">
								<span class="fabushijian">发布时间:<span class="time0"></span> 文章来源:<span class="source0"></span> 浏览次数:<span class="number0"></span></span>
							</div>
							<div class="details_content">
								<p>
								</p>
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
		
		<script type="text/javascript" src="fh_static_1/js/public.js" ></script>
		<script type="text/javascript" src="fh_static_1/js/nav.js"></script>
		<script type="text/javascript" src="fh_static_1/js/contactDetail.js"></script>
	</body>
</html>
