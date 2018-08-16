//var flag = false;
//$(".navbar-toggle").click(function(e) {
//	if(flag == false) {
//		$("#myspan").css("left", "0px");
//		$(".mask").css("display", "block");
//		flag = true;
//		$('body').css({
//			"overflow": 'hidden',
//			"position": "fixed"
//		});
//	} else {
//		$("#myspan").css("left", "-150px");
//		$(".mask").css("display", "none");
//		flag = false;
//		$('body').css({
//			"overflow": 'visible',
//			"position": ""
//		});
//	}
//});

$(".img_box").hover(function(){
	$(this).children("img").eq(0).css("transform","scale(1)");
	$(this).children("img").eq(1).css("transform","scale(0)");
},function(){
	$(this).children("img").eq(0).css("transform","scale(0)");
	$(this).children("img").eq(1).css("transform","scale(1)");
});

$(".navbar-nav>li").hover(function(){
	$(this).children(".items").stop().slideDown();
},function(){
	$(this).children(".items").stop().slideUp();
});

$(".case_item>div a").hover(function(){
	$(this).children("s").css("transform","scale3d(1.9, 1.4, 1) rotate3d(0, 0, 1, 45deg) translate3d(0, 130%, 0)");
},function(){
	$(this).children("s").css("transform","scale3d(1.9, 1.4, 1) rotate3d(0, 0, 1, 45deg) translate3d(0, -130%, 0)");
});

$(".font_details a").hover(function(){
	$(this).css("background-position","60px 13px");
},function(){
	$(this).css("background-position","50px 13px");
});

$(".font_img").hover(function(){
	$(this).css({
		"box-shadow":"3px 3px 6px 3px rgba(0,0,0,0.5)",
		"transform":"translateY(-5px)"
	});
},function(){
	$(this).css({
		"box-shadow":"none",
		"transform":"translateY(0px)"
	})
});

$(".more_img a").hover(function(){
	$(this).css({"color":"white","border":"none"});
	$(this).children("s").css("left","0px");
},function(){
	$(this).css({"color":"","border":"1px solid #424242"});
	$(this).children("s").css("left","-190px");
});

$(".font_list h4").hover(function(){
	$(this).css("transform","translateX(10px)");
},function(){
	$(this).css("transform","translateX(0px)");
});

$(".Top span img").hover(function(){
	$(this).css({
		"box-shadow":"0px 0px 4px 2px rgba(0,0,0,0.5)",
		"transform":"translateY(-3px)"
	});
},function(){
	$(this).css({
		"box-shadow":"none",
		"transform":"translateY(0px)"
	});
});


$(".tell").hover(function(){
	$(this).css("transform","translateX(-150px)");
},function(){
	$(this).css("transform","translateX(0)");
});
$(".QQ").hover(function(){
	$(this).css("transform","translateX(-150px)");
},function(){
	$(this).css("transform","translateX(0)");
});

$(".weibo,.weixin,.Up_top").hover(function(){
	$(this).children(".weixin_code").css("transform","scale(1)");
},function(){
	$(this).children(".weixin_code").css("transform","scale(0)");
});


$(".footernav_list p").hover(function(){
	$(this).addClass("animated headShake").css("color","#0069D9");
	$(this).children().css("color","#0069D9");
},function(){
	$(this).removeClass("animated headShake").css("color","");
	$(this).children().css("color","");
});


$(function(){
	var li_length = $(".li_img").length;
	var li_img = $(".li_img").width();
	var s = 0;
	for (var i=0;i<li_length;i++) {
		s+=li_img;
	}
	$(".ul_box").width(s);
});

var a = 0;
var ul_box = document.querySelector(".ul_box");
function right(){
	if(a==10){
		a = 10;
	}else{
		a+=1;
		ul_box.style.left = "-" + ($(".li_img").width() * a) + "px";
	}
}
function left(){
	if(a==0){
		a = 0;
	}else{
		a-=1;
		ul_box.style.left = "-" + ($(".li_img").width() * a) + "px";
	}
}

//logo动画效果
$(function(){
	var flag = false;
	setInterval(function(){
		if(flag == false){
			$(".logo_img").addClass("animated flipInY");
			flag = true;
		}else{
			$(".logo_img").removeClass("animated flipInY");
			flag = false;
		}
	},2000);
	
	var img_box = $(".imgss img").height();
	$(".imgss").height(img_box);
})
