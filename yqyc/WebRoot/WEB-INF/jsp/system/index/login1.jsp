<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<title>${pd.SYSNAME}</title>
<link href="static/login/css/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<link href="static/login/css/demo.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="static/login/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="static/login/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="static/login/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="static/login/js/custom.js"></script>
</head>
<body>
<div class="header">
  <h1 class="headerLogo">${pd.SYSNAME}</h1>
</div>
<div class="banner">

<div class="login-aside">
  <div id="o-box-up"></div>
  <div id="o-box-down"  style="table-layout:fixed;">
   <div class="error-box" id="error-box"></div>
   
   <form class="registerform" action="" method="post" name="loginForm" id="loginForm">
   <div class="fm-item">
	   <label for="logonId" class="form-label">系统登陆：</label>
	   <input type="text"  name="loginname" maxlength="100" id="loginname" placeholder="请输入用户名" class="i-text"   datatype="s6-18" errormsg="用户名至少6个字符,最多18个字符！"  >    
       <div class="ui-form-explain"></div>
  </div>
  
  <div class="fm-item">
	   <label for="logonId" class="form-label">登陆密码：</label>
	   <input type="password" value="" maxlength="100" name="password" id="password" placeholder="请输入密码" class="i-text" datatype="*6-16" nullmsg="请设置密码！" errormsg="密码范围在6~16位之间！">    
       <div class="ui-form-explain"></div>
  </div>
  <div class="fm-item pos-r">
	   <label for="logonId" class="form-label">验证码</label>
	   <input type="text" value="" maxlength="100" name="code" id="code" class="i-text yzm" placeholder="请输入验证码" >    
       <div class="ui-form-explain"><img src="" class="yzm-img" id="codeImg" alt="点击更换" title="点击更换" /></div>
  </div>
  <div class="fm-item">
	   <label for="logonId" class="form-label"></label>
	   <input type="button" value="" tabindex="4" id="send-btn" onclick="severCheck();"  class="btn-login"> 
       <div class="ui-form-explain"></div>
  </div>
  
  </form>
  
  </div>

</div>
	<div class="bd">
		<ul>
			<li style="background:url(${BACK_IMGS}) #CCE1F3 center 0 no-repeat;"></li>
			<li style="background:url(${BACK_IMGS}) #BCE0FF center 0 no-repeat;"></li>
		</ul>
	</div>

	<div class="hd"><ul></ul></div>
</div>
<script type="text/javascript">jQuery(".banner").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",  autoPlay:true, autoPage:true, trigger:"click" });</script>


<div class="banner-shadow"></div>

<div class="footer">
   <p>技术支持：${TECHNOLOGY}</p>
</div>
<script type="text/javascript">
		//服务器校验
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
						}else if("codeerror" == data.result){
							$("#error-box").text("验证码输入有误");
						}else{
							$("#error-box").text("缺少参数！");
						}
					}
				});
			}
		}
		//客户端校验
		function check() {
			if ($("#loginname").val() == "") {
				return false;
			}
			if ($("#password").val() == "") {
				return false;
			}
			if ($("#code").val() == "") {
				return false;
			}
			return true;
		}
		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}
		$(document).ready(function() {
			changeCode1();
			$("#codeImg").bind("click", changeCode1);
		});
		function changeCode1() {
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		}
		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#send-btn").trigger("click");
			}
		});
		</script >
</body>

</html>