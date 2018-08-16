<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
        <title>${pd.SYSNAME}</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="fh_static_1/img/YQ_logo/favicon.ico" type="image/x-icon" rel="Shortcut Icon" />
		<link rel="stylesheet" href="static/login/css/animate.css" />
		<link rel="stylesheet" href="static/login/css/bootstrap.min.css" />
		<link rel="stylesheet" href="static/login/css/index.css" />
		<script type="text/javascript" src="static/login/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="static/login/js/boot.jquery.js" ></script>
		<script type="text/javascript" src="static/login/js/bootstrap.min.js" ></script>
	</head>
	<body>
		<div class="container logo_img">
			<img src="static/login/img/login_logo.png" />
		</div>
		<form action="" method="post" name="loginForm" id="loginForm">
		<div class="container">
			<div class="box">
			    <div class="error-box" id="error-box" style="text-align:center;font-weight:540px;font-weight: 700;color:red"></div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 name">
					<input type="text" name="loginname" id="loginname"   value="" placeholder="请输入用户名"  />
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pwd">
					<input type="password"   name="password" id="password"  placeholder="请输入密码"  />
				</div>
				
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 code">
					<div class="code_box">
						<div class="left">
							<input type="text" placeholder="请输入验证码" name="code" id="code" />
						</div>
						<div class="right">
							<img  title="点击更换" src="" id="codeImg" />
						</div>
					</div>
				</div>
			</div>
			<div class="btns">
				<a class="btn" onclick="severCheck();" id="to-recover">登 录<span class="bg_color"></span></a>
			</div>
		</div>
		</form>
		<div class="container banquan">
			<p>(c) Copyright 2018 贵州益学弈趣教育科技有限公司. All Rights Reserved. </p>
		</div>
		
		<script type="text/javascript" src="static/login/js/login.js" ></script>
<script type="text/javascript" >



		function severCheck(){
			if(check()){
			var loginname = $("#loginname").val();
			var password = $("#password").val();
			var code = "qq313596790fh"+loginname+",fh,"+password+"QQ978336446fh"+",fh,"+$("#code").val();
			$.ajax({
				type: "POST",
				url: 'login_login',
		    	data: {KEYDATA:code,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					if("success" == data.result){
					window.location.href="<%=basePath%>main/index";
					}else if("usererror" == data.result){
						$("#error-box").text("用户名或密码有误");
						changeCode1();
						$("#codeImg").bind("click", changeCode1);
					}else if("codeerror" == data.result){
						$("#error-box").text("验证码输入有误");
						changeCode1();
						$("#codeImg").bind("click", changeCode1);
					}else{
						$("#error-box").text("缺少参数！");
						changeCode1();
						$("#codeImg").bind("click", changeCode1);
					}
				}
			});	
			}
			
		};
		
		
		
		window.onload = function() {
			changeCode1();
			$("#codeImg").bind("click", changeCode1);
		};
		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		};
		function changeCode1() {
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		};
		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});
		
		
		function check(){
			var name = document.getElementById("loginname");
			var pwd = document.getElementById("password");
			var icon = document.getElementById("code");
			var btn = document.querySelector(".btn");
			//判断用户名是否为空
				if(name.value == ""){
					name.focus();
					name.placeholder = "用户名不能为空";
					name.style.borderBottom = "2px solid red";
					return false;
				}else{
					name.style.borderBottom = "2px solid green";
				}
			//判断密码是否为空
				if(pwd.value == ""){
					pwd.focus();
					pwd.placeholder = "密码不能为空";
					pwd.style.borderBottom = "2px solid red";
					return false;
				}else{
					pwd.style.borderBottom = "2px solid green";
				}
			
			//判断验证码是否为空
				if(icon.value == ""){
					icon.focus();
					icon.placeholder = "验证码不能为空";
					icon.style.borderBottom = "2px solid red";
					return false;
				}else{
					icon.style.borderBottom = "2px solid green";
				}
			
				if(name.value == "" || pwd.value == "" || icon.value == ""){
					alert("请填写登录信息！");
					return false;
				}else{
					return true;
				}
			
			$(".btns .btn").hover(function(){
				$(".bg_color").css("left","0px");
			},function(){
				$(".bg_color").css("left","-170px");
			})
			
		}
		
</script>	
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>
	<c:if test="${'1' == pd.msg}">
		<script type="text/javascript">
		$(tsMsg());
		function tsMsg(){
			alert('此用户在其它终端已经早于您登录,您暂时无法登录');
		}
		</script>
	</c:if>
	<c:if test="${'2' == pd.msg}">
		<script type="text/javascript">
			$(tsMsg());
			function tsMsg(){
				alert('您被系统管理员强制下线');
			}
		</script>
	</c:if>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
	</body>
</html>
