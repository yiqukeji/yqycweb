$(function(){
	var url =unescape(((window.location+"").split('n='))[1]);
	var name = unescape(url.split("&c=")[0]);
	var type = url.split("c=")[1];
	$(".alis").html(name);
	$("title").html("弈趣云创—"+name);
	$(".t1").val(type);
	ys(type);
	setData(1,type);
})

//请求数据列表
function setData(val,type){
	$.ajax({
		type: "POST",
		url: 'web/pageHtml.do',
    	data: {PUB_TYPE:type,currentPage:val},
		dataType:'json',
		cache: false,
		success: function(data){
			rending(data,type);
		}
	});
}
//样式切换
function ys(type){
	if(type=="yq05"){
		$("#yq05").attr("class","bg");
	}else if(type=="yq06"){
		$("#yq06").attr("class","bg");
	} else if(type=="yq07"){
		$("#yq07").attr("class","bg");
	} 
}
//内部样式切换
$(".nav_list>a").click(function(){
	$(this).addClass("bg").siblings().removeClass();
	var type = $(this).attr("id");
	$(".t1").val(type);
	setData(1,type);
	
})
function rending(data,type){
	var size = data.list.length;
	$(".xwzx").empty();
	for(var i=0;i<size;i++){
	 var str="<div class='col-xs-12 col-sm-5 col-md-5 col-lg-5'>"	
		 
		 str+="<div class='col-xs-3 col-sm-3 col-md-3 col-lg-4 xwzx_img'>"
	     str+="<img src='"+data.list[i].THUMNAIL+"' />"
		 str+="</div>"
			 
		 str+="<div class='col-xs-9 col-sm-9 col-md-9 col-lg-8 xwzx_font'>"	
			 
		 str+="<div class='col-xs-12 col-sm-12 col-md-12 col-lg-12 xwzx_title'>"
		 str+="<h3"+" title="+"'"+data.list[i].TITLE+"'"+">"+data.list[i].TITLE+"</h3>"	 
		 str+="</div>"
		 str+="<div class='col-xs-12 col-sm-12 col-md-12 col-lg-12 xwzx_neirong'>"
		 str+="<p>"
		 str+=data.list[i].CONTENT.replace(/<[^>]+>/g,"")
		 str+="</p>" 
		 str+="</div>"
			 
		 str+="<div class='col-xs-12 col-sm-12 col-md-12 col-lg-12 xwzx_chakan'>"
		 str+="<a href='javaScript:;' id='"+data.list[i].CONTENTS_ID+"'>READ MORE</a>"
		 str+="<span>"+data.list[i].PUB_TIME.substring(0,10)+"</span>"
		 str+="</div>"	
		 $(".xwzx").append(str);	 
				 
			 
		 str+="</div>"	 
		 
		 str+="</div>"
	}
	$(".more_img2").empty();
	var str;
	if(data.page.currentPage+1>data.page.totalPage){
	str = "<a href='javaScript:;'>No more ><s></s></a>"
	}else{
	str= "<a href='javaScript:;' onclick=page("+"'"+data.page.currentPage+1+"'"+","+"'"+type+"'"+")"+">View more ><s></s></a>"	
	}
	$(".more_img2").append(str);
	$(".xwzx_chakan a").click(function(){
		var id = $(this).attr("id");
		var type = $(".t1").val();
		window.location.href="webdetail.html?i="+id+"&t="+type;
	})
	
	
}
//分页点击
function page(val,type){
	rending1(data,type);
}
//分页渲染
function rending1(data,type){
	var size = data.list.length;
//	$(".xwzx").empty();
	for(var i=0;i<size;i++){
	 var str="<div class='col-xs-12 col-sm-5 col-md-5 col-lg-5'>"	
		 
		 str+="<div class='col-xs-3 col-sm-3 col-md-3 col-lg-4 xwzx_img'>"
	     str+="<img src='"+data.list[i].THUMNAIL+"' />"
		 str+="</div>"
			 
		 str+="<div class='col-xs-9 col-sm-9 col-md-9 col-lg-8 xwzx_font'>"	
			 
		 str+="<div class='col-xs-12 col-sm-12 col-md-12 col-lg-12 xwzx_title'>"
		 str+="<h3"+" title="+"'"+data.list[i].TITLE+"'"+">"+data.list[i].TITLE+"</h3>"	 
		 str+="</div>"
		 str+="<div class='col-xs-12 col-sm-12 col-md-12 col-lg-12 xwzx_neirong'>"
		 str+="<p>"
		 str+=data.list[i].CONTENT.replace(/<[^>]+>/g,"")
		 str+="</p>" 
		 str+="</div>"
			 
		 str+="<div class='col-xs-12 col-sm-12 col-md-12 col-lg-12 xwzx_chakan'>"
		 str+="<a href='javaScript:;' id='"+data.list[i].CONTENTS_ID+"'>READ MORE</a>"
		 str+="<span>"+data.list[i].PUB_TIME.substring(0,10)+"</span>"
		 str+="</div>"	
		 $(".xwzx").append(str);	 
				 
			 
		 str+="</div>"	 
		 
		 str+="</div>"
	}
	$(".more_img2").empty();
	var str;
	if(data.page.currentPage+1>data.page.totalPage){
	str = "<a href='javaScript:;'>No more ><s></s></a>"
	}else{
	str= "<a href='javaScript:;' onclick=page("+"'"+data.page.currentPage+1+"'"+","+"'"+type+"'"+")"+">View more ><s></s></a>"	
	}
	$(".more_img2").append(str);
	$(".xwzx_chakan a").click(function(){
		var id = $(this).attr("id");
		var type = $(".t1").val();
		window.location.href="webdetail.html?i="+id+"&t="+type;
	})
	
	
}