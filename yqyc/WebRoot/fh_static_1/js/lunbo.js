window.onload = function() {
	var setInt, index = 0;
	var _span = "";
	//根据图片的长度来添加圆点
	for(var i = 1; i <= $(".img_boxs img").length; i++) {
		_span = document.createElement("span");
		$(".yuandian").append(_span);
	}

	setInt = setInterval(function() {
		$(".img_boxs img").eq(index).fadeIn(500).siblings().fadeOut(500);
		index++;
		if(index >= $(".img_boxs img").length) {
			index = 0;
		}
		$(".yuandian span").eq(index).css("background", "#007EAD").siblings().css("background", "white");
	}, 5000);

	$(".img_boxs").hover(function() {
		clearInterval(setInt);
	}, function() {
		setInt = setInterval(function() {
			$(".img_boxs img").eq(index).fadeIn(500).siblings().fadeOut(500);
			index++;
			if(index >= $(".img_boxs img").length) {
				index = 0;
			}
			$(".yuandian span").eq(index).css("background", "#007EAD").siblings().css("background", "white");
		}, 5000);
	});

	$(".next").click(function() {
		$(".img_boxs img").eq(index).stop().fadeIn(500).siblings().stop().fadeOut(500);
		index++;
		if(index >= $(".img_boxs img").length) {
			index = 0;
		}
		$(".yuandian span").eq(index).css("background", "#007EAD").siblings().css("background", "white");
	})
	$(".prve").click(function() {
		$(".img_boxs img").eq(index).stop().fadeIn(500).siblings().stop().fadeOut(500);
		index--;
		if(index < 0) {
			index = $(".img_boxs img").length-1;
		}
		$(".yuandian span").eq(index).css("background", "#007EAD").siblings().css("background", "white");
	})
}