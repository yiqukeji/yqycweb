$(".nav_list a").hover(function() {
	$(this).css({
		"border": "1px solid #187BE7",
		"background": "#0892DB"
	});
}, function() {
	$(this).css({
		"border": "1px solid white",
		"background": ""
	});
})

$(".ry>div").hover(function() {
	$(this).children("div").css({
		"transform": "translateY(-5px)",
		"box-shadow": "0px 0px 5px 3px rgba(0,0,0,0.5)"
	});
}, function() {
	$(this).children("div").css({
		"transform": "translateY(0px)",
		"box-shadow": "none"
	});
});

$(".yxal>div a").hover(function() {
	$(this).children("s").css("transform", "scale3d(1.9, 1.4, 1) rotate3d(0, 0, 1, 45deg) translate3d(0, 140%, 0)");
}, function() {
	$(this).children("s").css("transform", "scale3d(1.9, 1.4, 1) rotate3d(0, 0, 1, 45deg) translate3d(0, -140%, 0)");
});

$(".xwzx>div").hover(function(){
	$(this).children().children(".xwzx_title").addClass("animated headShake");
},function(){
	$(this).children().children(".xwzx_title").removeClass("animated headShake");
});

$(".mask_font").hover(function(){
	$(this).children("img").css("transform","scale(1.2)");
	$(this).css({
		"transform":"translateY(-10px)",
		"box-shadow":"2px 2px 6px 2px rgba(0,0,0,0.5)"
	});
},function(){
	$(this).children("img").css("transform","scale(1)");
	$(this).css({
		"transform":"translateY(0px)",
		"box-shadow":"none"
	});
});


$(function() {
	/*得到上传文件名*/
	$(".file").change(function() {
		if(this.value) insertTitle(this.value);
	})

	function insertTitle(path) {
		var test1 = path.lastIndexOf("/"); //对路径进行截取
		var test2 = path.lastIndexOf("\\"); //对路径进行截取
		var fpath = Math.max(test1, test2)
		if(fpath < 0) {
			$("#fpath").text(path);
		} else {
			$("#fpath").text(path.substring(fpath + 1)); //显示上传文件名
		}
	}
});

window.onscroll = function() {
	var t = document.documentElement.scrollTop || document.body.scrollTop;
	var btns = document.getElementById("Up_top");
	btns.onclick = function() {
		$("body,html").animate({
			scrollTop: 0
		}, 500);
	}
	if(Math.round(t) >= 460){
		$(".two").addClass("animated fadeInRight");
	}if(Math.round(t) >= 1050){
		$(".three").addClass("animated fadeInLeft");
	}if(Math.round(t) >= 350){
	    $(".tuandui h3").addClass("animated zoomIn");
	}if(Math.round(t) >= 320){
	    $("#szxxch img").addClass("animated zoomIn");
	    $(".szxxch_box").addClass("animated fadeInUp");
	}if(Math.round(t) >=910){
	    $("#xtkffa img").addClass("animated zoomIn");
	    $(".szxxch_box1").addClass("animated bounceInUp");
	}if(Math.round(t) >= 1500){
	    $("#vrzzfa img").addClass("animated zoomIn");
	    $(".szxxch_box2").addClass("animated jackInTheBox");
	}
}

$(function(){
	var flag = false;
	setInterval(function(){
		if(flag == false){
			$(".yuan .yqyc").css("transform","rotateZ(360deg)");
			$(".yuan1 .yqyc").css("transform","rotateZ(-360deg)");
		}
	},1000);
})
