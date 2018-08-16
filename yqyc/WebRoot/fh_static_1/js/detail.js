$(function(){
	var url =unescape(((window.location+"").split('i='))[1]);
	var id = url.split("&t=")[0];
	var type = url.split("&t=")[1];
	$(".t1").val(type);
	detail(id,type);
	xr(type);
	
})
function detail(id,type){
	var url;
	var data;
	if(type=="04"){
	url="web/optimal.do";
	data={PROGRAM_ID:id};
	}else{
	url="web/getNewDetail.do"	
	data={CONTENTS_ID:id};
	}
	$.ajax({
		type: "POST",
		url: url,
    	data:data,
		dataType:'json',
		cache: false,
		success: function(data){
			$(".t2").html(data.data.TITLE);
			$("title").html("弈趣云创—"+data.data.TITLE);
			$(".source0").html(data.data.PUB_SOURCE);
			$(".number0").html(data.data.NUMBER);
			$(".time0").html(data.data.PUB_TIME);
			(type==04)?$(".fonts").html(data.data.CONTENTS):$(".fonts").html(data.data.CONTENT)
		}
	});
}
//
function xr(type){
	if(type=="yq05"){
		var str = "	<p>当前位置：<a href='index.html'>首页</a>>新闻资讯><span class='alis' style='cursor:pointer'>签约动态</span></p>";
		$(".address").append(str);
		//var str0 = "<p>新闻资讯</p>";
		//$(".t2").append(str0);
		var str1 = "<p>News Information | 新闻资讯</p>"
		$(".gyyq").append(str1);	
		$(".imgurl").attr("src","fh_static_1/img/child_banner4.jpg")
	}else if(type=="yq06"){
		var str = "	<p>当前位置：<a href='index.html'>首页</a>>新闻资讯><span class='alis' style='cursor:pointer'>通知公告</span></p>";
		$(".address").append(str);
//		var str0 = "<p>新闻资讯</p>";
//		$(".t2").append(str0);
		var str1 = "<p>News Information | 新闻资讯</p>"
		$(".gyyq").append(str1);	
		$(".imgurl").attr("src","fh_static_1/img/child_banner4.jpg")
	} else if(type=="yq07"){
		var str = "	<p>当前位置：<a href='index.html'>首页</a>>新闻资讯><span class='alis' style='cursor:pointer'>行业资讯</span></p>";
		$(".address").append(str);
//		var str0 = "<p>新闻资讯</p>";
//		$(".t2").append(str0);
		var str1 = "<p>News Information | 新闻资讯</p>"
		$(".gyyq").append(str1);	
		$(".imgurl").attr("src","fh_static_1/img/child_banner4.jpg")
	}else if(type=="04"){
		var str ="<p>当前位置：<a href='index.html'>首页</a>><a href=''>优选案列</a> </p>";
		$(".address").append(str);
//		var str0 = "<p>优选案列</p>";
//		$(".t2").append(str0);
		var str1 = "<p>PREFERRED CASE | 优选案例</p>"
		$(".gyyq").append(str1);	
		$(".imgurl").attr("src","fh_static_1/img/child_banner3.jpg")
	} 
	//切换回来
	$(".alis").click(function(){
		var type = $(".t1").val();
		var name = escape($(this).text());
		window.location.href="webnew.html?n="+name+"&c="+type;
		
	})
	
}
