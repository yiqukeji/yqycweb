//window.onload = function(){
//	var name = document.getElementById("name");
//	var pwd = document.getElementById("pwd");
//	var icon = document.getElementById("icon");
//	var login = document.getElementById("login");
//	var Popup = document.querySelector(".Popup");
//	var btn = document.querySelector(".btn");
//	
//	changeCode1();
//	$("#codeImg").bind("click", changeCode1);
//	$("#zcodeImg").bind("click", changeCode2);
//	
//	
//	//判断用户名是否为空
//	name.onblur = function(){
//		if(name.value == ""){
//			name.focus();
//			name.placeholder = "用户名不能为空";
//			name.style.borderBottom = "2px solid red";
//		}else{
//			name.style.borderBottom = "2px solid green";
//		}
//		
//	}
//	//判断密码是否为空
//	pwd.onblur = function(){
//		if(pwd.value == ""){
//			pwd.focus();
//			pwd.placeholder = "密码不能为空";
//			pwd.style.borderBottom = "2px solid red";
//		}else{
//			pwd.style.borderBottom = "2px solid green";
//		}
//	}
//	
//	//判断验证码是否为空
//	icon.onblur = function(){
//		if(icon.value == ""){
//			icon.focus();
//			icon.placeholder = "验证码不能为空";
//			icon.style.borderBottom = "2px solid red";
//		}else{
//			icon.style.borderBottom = "2px solid green";
//		}
//	}
//	
//	btn.onclick = function(){
//		if(name.value == "" || pwd.value == "" || icon.value == ""){
//			alert("请填写登录信息！");
//		}else{
//			severCheck();
//		}
//	}
//	
//	$(".btn button").hover(function(){
//		$(".bg_color").css("left","0px");
//	},function(){
//		$(".bg_color").css("left","-170px");
//	})
//}
//
//
//function severCheck(){
//		var loginname = $("#name").val();
//		var password = $("#pwd").val();
//		var code = "qq313596790fh"+loginname+",fh,"+password+"QQ978336446fh"+",fh,"+$("#icon").val();
//		alert(code);
//		$.ajax({
//			type: "POST",
//			url: 'login_login',
//	    	data: {KEYDATA:code,tm:new Date().getTime()},
//			dataType:'json',
//			cache: false,
//			success: function(data){
//				alert(data.result);
//				window.location.href="<%=basePath%>main/index";
//			}
//		});
//}
//function changeCode1() {
//	$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
//}
//function changeCode2() {
//	$("#zcodeImg").attr("src", "code.do?t=" + genTimestamp());
//}
//function genTimestamp() {
//	var time = new Date();
//	return time.getTime();
//}