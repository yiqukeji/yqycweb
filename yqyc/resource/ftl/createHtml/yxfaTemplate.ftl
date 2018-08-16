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
		<link rel="stylesheet" href="fh_static_1/css/yxal.css" />
		<title>弈趣云创—优选案例</title>
	</head>
	<body>
		<!--
        	作者：270068451@qq.com
        	时间：2018-05-11
        	描述：头部公共页面
        -->
		<div id="public_header"><#include "headerTemplate.ftl"></div>
		
		<div class="banner">
			<img src="fh_static_1/img/child_banner3.jpg" />
			<div class="child_nav">
				<div class="gyyq">
					<p>PREFERRED CASE | 优选案列</p>
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
				<a href="index.html">首页</a>>优选案列 
			</p>
		</div>
		<!--
        	作者：270068451@qq.com
        	时间：2018-06-28
        	描述：内容部分
        -->
		<div class="container yxal yx0">
		    <#list fieldListOptimal as var>
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 yxal">
					<a href="javaScript:;" class="04" id="${var[0]}"><span style="display:none">优选案例</span><img src="${var[5]}" /><s></s></a>
				</div>
			</div>
			</#list>
		</div>
		<!--
        	作者：270068451@qq.com
        	时间：2018-06-28
        	描述：加载
        -->
        <div class="container">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-21 more_img  more_img2">
        	<#assign cp =currentPage />
        	<#assign tp =totalPage />
        	<#if cp+1 gt tp>
				<a href="javaScript:;">No more ><s></s></a>
			<#else>
			    <a href="javaScript:;" onclick="toPage('${cp+1}')">View more ><s></s></a>
			</#if>	
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
		<script type="text/javascript">
		$(".yxal a").click(function(){
		var id = $(this).attr("id");
		var type = $(this).attr("class");
		window.location.href="webdetail.html?i="+id+"&t="+type;
		})
		function toPage(currentPage){
			$.ajax({
			type: "POST",
			url: 'web/getOptimal.do',
	    	data: {TYPE:"04",currentPage:currentPage},
			dataType:'json',
			cache: false,
			success: function(data){
			    $(".more_img2").empty();
			    rending(data);
			    if(data.currentPage+1>data.totalPage){
			    var str = "<a href='javaScript:;'>No more ><s></s></a>";
			    $(".more_img2").append(str);
			    }else{
			     var str = "<a href='javaScript:;'>View more ><s></s></a>";
			      $(".more_img2").append(str);
			    }
			}
	});
		}
		//数据渲染
		function rending(data){
		   var size = data.list.length;
		   for(var i=0;i<size;i++){
		    var str="<div class='col-xs-3 col-sm-3 col-md-3 col-lg-3'>"
		        str+="<div class='col-xs-12 col-sm-12 col-md-12 col-lg-12 yxal'>"
		        str+="<a href='javaScript:;' class='04' id='"+data.list[i].PROGRAM_ID+"'><span style='display:none'>优选案例</span><img src='"+data.list[i].IMG1+"' /><s></s></a>"
		        str+="</div>"
		        str+="</div>";
		       $(".yx0").append(str);
		   }
		}
		</script>
	</body>
</html>
