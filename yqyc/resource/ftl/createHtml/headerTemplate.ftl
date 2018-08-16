<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit" /> 
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
		<script type="text/javascript" src="fh_static_1/js/jquery-1.8.3.min.js" ></script>
		<link rel="stylesheet" href="fh_static_1/css/animate.css" />
		<link rel="stylesheet" href="fh_static_1/css/nav-list.css" />
	</head>
	<body>
		<!--
        	作者：270068451@qq.com
        	时间：2018-06-22
        	描述：顶部
        -->
		<div class="Top">
			<div class="container">
				<a href="javaScript:;">在线咨询</a>
			</div>
		</div>

		<!--
        	作者：270068451@qq.com
        	时间：2018-06-22
        	描述：导航栏
        -->

		<div class="mask"></div>
		<!--
        	作者：270068451@qq.com
        	时间：2018-07-05
        	描述：导航栏
        -->
		<div class="btn_anniu">
			<img src="fh_static_1/img/YQ_logo.png" />
			<div class="menu_open">
				<i></i>
				<i></i>
				<i></i>
			</div>
		</div>
		<div class="container nav">
			<div class="abc">
			<img src="fh_static_1/img/YQ_logo.png" class="logo_img" />
			<ul class="nav_ul clearfix">
				<li class="nav_item active">
					<a href="index.html">首页</a>
				</li>
				<li class="nav_item">
					<a href="webintroduce.html">关于弈趣</a><i></i>
					<ul class="nav_item_open">
						<li class="subopen">
							<a href="javascript:;">关于弈趣</a>
						</li>
						<li class="nav_item2">
							<a href="webintroduce.html">弈趣介绍</a>
						</li>
						<li class="nav_item2">
							<a href="webcourse.html">发展历程</a>
						</li>
						<li class="nav_item2">
							<a href="webhonor.html">荣誉资质</a>
						</li>
					</ul>
				</li>
				<li class="nav_item ">
					<a href="webservice.html">业务方案</a>
					<!--<ul class="nav_item_open">
						<li class="subopen">
							<a href="javascript:;">业务方案</a>
						</li>
						<li class="nav_item2">
							<a href="#szxxch">数字形象策划</a>
						</li>
						<li class="nav_item2">
							<a href="#xtkffa">系统开发方案</a>
						</li>
						<li class="nav_item2">
							<a href="#vrzzfa">VR制作方案</a>
						</li>
					</ul>-->
				</li>
				<li class="nav_item">
					<a href="weboptimal.html">优选案例</a>
				</li>
				<li class="nav_item">
					<a href="javaScript:;" class="cp1">新闻资讯</a><i></i>
					<ul class="nav_item_open" id="cp">
						<li class="subopen">
							<a href="javascript:;" class="">新闻资讯</a>
						</li>
						<li class="nav_item2">
							<a href="javaScript:;" class="yq05">签约动态</a>
						</li>
						<li class="nav_item2">
							<a href="javaScript:;" class="yq06">通知公告</a>
						</li>
						<li class="nav_item2">
							<a href="javaScript:;" class="yq07">行业资讯</a>
						</li>
						</li>
					</ul>
				</li>
				<li class="nav_item">
					<a href="webidea.html">诚聘英才</a><i></i>
					<ul class="nav_item_open" >
						<li class="subopen">
							<a href="javascript:;">诚聘英才</a>
						</li>
						<li class="nav_item2">
							<a href="webidea.html">人才理念</a>
						</li>
						<li class="nav_item2">
							<a href="webteam.html">团队文化</a>
						</li>
						<li class="nav_item2">
							<a href="webzp.html">招贤纳士</a>
						</li>
						</li>
					</ul>
				</li>
				<li class="nav_item">
					<a href="webfuture.html">云创未来</a>
					<!--<ul class="nav_item_open">
						<li class="subopen">
							<a href="javascript:;">云创未来</a>
						</li>
						<li class="nav_item2">
							<a href="#zzpt">自主平台</a>
						</li>
						<li class="nav_item2">
							<a href="#gncp">概念产品</a>
						</li>
						<li class="nav_item2">
							<a href="#fzgh">发展规划</a>
						</li>
						</li>
					</ul>-->
				</li>
			</ul>
			</div>
		</div>
		<div class="hcover"></div>
		
		
		<!--
        	作者：270068451@qq.com
        	时间：2018-06-27
        	描述：返回顶部按钮
        -->
		<div class="Up">
			<div class="tell">
				<p><img src="fh_static_1/img/dh.png" />&nbsp;&nbsp;&nbsp;${C_TEL}</p>
			</div>
			<div class="QQ">
				<p><img src="fh_static_1/img/qq.png" />&nbsp;&nbsp;&nbsp;${C_EMAIL}</p>
			</div>
			<div class="weibo">
				<p><img src="fh_static_1/img/wb.png" /></p>
				<div class="weixin_code">
					<img src="${WB}"/>
				</div>
			</div>
			<div class="weixin">
				<p><img src="fh_static_1/img/wx.png" /></p>
				<div class="weixin_code">
					<img src="${WX}"/>
				</div>
			</div>
			<div class="Up_top" id="Up_top">
				<p>Top</p>
			</div>
		</div>
		
		
		<script type="text/javascript" src="fh_static_1/js/nav.js" ></script>
		<script type="text/javascript" src="fh_static_1/js/nav-list.js" ></script>
		<script type="text/javascript">
		$(function(){
		 $("#cp a").click(function(){
		var s =  $(this).parent().parent().children("li").length;
		 //var namaArr;
		 //var idArr
		// var myArray=new Array();
	    // var idA=new Array();
	    // for (var i=0;i<s;i++) {
		 //namaArr = $(this).parent().parent().children("li").eq(i).children("a").html();
		 //idArr = $(this).parent().parent().children("li").eq(i).children("a").attr("class");
		 //myArray[i]=namaArr;
		// idA[i]=idArr;
		// }
		//console.log(myArray+idA);
		var name = escape($(this).text());
		var clas =$(this).attr("class");
		var i =$(this).parent().parent().children("li").index();
		window.location.href="webnew.html?n="+name+"&c="+clas;
		})
		
		})
		$(".cp1").click(function(){
		var name = escape($(this).text());
		window.location.href="webnew.html?n="+name+"&c=yq05";
		})
		</script>
	</body>
</html>
