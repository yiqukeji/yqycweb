

//返回顶部
window.onscroll = function() {
	var t = document.documentElement.scrollTop || document.body.scrollTop;
	var btns = document.getElementById("Up_top");
	btns.onclick = function() {
		$("body,html").animate({
			scrollTop: 0
		}, 500);
	}
	if(Math.round(t) >= 90){
		$(".link_list").addClass("animated fadeInUp");
	}
	if(Math.round(t) >= 160){
		$(".serve_font1").addClass("animated fadeIn");
	}
	if(Math.round(t) >= 280){
		$(".fuwu_img").addClass("animated slideInRight");
	}
	if(Math.round(t) >= 290){
		$(".serve_font2").addClass("animated fadeInLeft");
	}
	if(Math.round(t) >= 400){
		$(".quxian_icon").addClass("animated fadeInRight");
	}
	if(Math.round(t) >= 820){
		$(".quxian_icon").addClass("animated fadeInRight");
	}
	if(Math.round(t) >= 820){
		$(".more_img1").addClass("animated zoomIn");
	}
	if(Math.round(t) >= 940){
		$(".case_item").children("div").addClass("animated fadeInUp");
	}
	if(Math.round(t) >= 1390){
		$(".more_img2").addClass("animated zoomIn");
		$(".serve_font2").addClass("animated fadeInLeft");
	}
	if(Math.round(t) >= 1500){
		$(".information_left").addClass("animated fadeInLeft");
		$(".information_right").addClass("animated fadeInRight");
	}
}

//导航栏添加背景颜色
//window.onload = function(){
//	var navLi = $('.navbar-nav>li') //此处填写你的导航html对象
//	var windowUrl = window.location.href; //获取当前url链接
//	console.log(windowUrl);
//	navLi.each(function() {
//		var t = $(this).find('a').attr('href');
//		console.log(t);
//		if(t == windowUrl) {
//			$(this).children("a").addClass('actives'); //添加当前位置样式 
//		}
//	});
//}