<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<link href="fh_static_1/img/favicon.ico" type="image/x-icon" rel="Shortcut Icon" />
		<link rel="stylesheet" href="fh_static_1/css/bootstrap.min.css" />
		<script type="text/javascript" src="fh_static_1/js/boot.jquery.js"></script>
		<script type="text/javascript" src="fh_static_1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="fh_static_1/css/jquery-ui.css" />
		<link rel="stylesheet" href="fh_static_1/css/custom.css" />
		<link rel="stylesheet" href="fh_static_1/css/animate.css" />
		<link rel="stylesheet" href="fh_static_1/css/pucbli.css" />
		<link rel="stylesheet" href="fh_static_1/css/cpyc.css" />
		<title>弈趣云创—招贤纳士</title>
	</head>

	<body>

		<!--
        	作者：270068451@qq.com
        	时间：2018-05-11
        	描述：头部公共页面
        -->
		<div id="public_header"><#include "headerTemplate.ftl"></div>

		<div class="banner">
			<img src="fh_static_1/img/child_banner5.jpg" />
			<div class="child_nav">
				<div class="gyyq">
					<p>JOIN US | 诚聘英才</p>
				</div>
				<div class="nav_list">
					<a href="webidea.html" >人才理念</a>
					<a href="webteam.html">团队文化</a>
					<a href="webzp.html" class="bg">招贤纳士</a>
				</div>
			</div>
		</div>
		<!--
        	作者：270068451@qq.com
        	时间：2018-06-26
        	描述：当前访问位置
        -->
		<div class="container address">
			<p>当前位置：
				<a href="index.html">首页</a>>诚聘英才>招贤纳士
			</p>
		</div>

		<div class="container cpyc">
			<div class="one">
				<div class="panel-group" id="accordion">
				<#list fieldListWork as var>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								
								<a class="icons" data-toggle="collapse" data-parent="#accordion" href="#collapse${var_index}">
									<span>招聘岗位：${var[1]}&emsp;薪资待遇：${var[2]}&emsp;招聘人数：${var[3]}人</span>
								</a>
							</h4>
						</div>
						<div id="collapse${var_index}" class="panel-collapse collapse <#if var_index==0>in<#else></#if>">
							<div class="panel-body">
								${var[6]}
								<div class="yingpin">
									<button id="${var[0]}">应聘该职位</button>
								</div>
							</div>
						</div>
					</div>
				</#list>
					
				</div>
			</div>
		</div>

		<!--<div class="tanchuang">-->
			<div class="shuju " id="dialog"  title="博弈未来 趣味横生 弈趣云创欢迎您的加入">
				<form role="form" id="tf" enctype="multipart/form-data">
					<input value="" name="WORK_ID" hidden="hidden" id="typeId"/>
					<div class="input-group bbb">
						<span class="input-group-btn">
	                        <button  class="btn btn-default"  type="button">姓&emsp;&emsp;名</button>
	                    </span>
						<input type="text" class="form-control userName" name="NAME">
						
						<span class="input-group-btn">
	                        <button class="btn btn-default"  type="button">联系电话</button>
	                    </span>
						<input type="text" class="form-control userPhone" name="TEL">
						
						<span class="input-group-btn">
	                        <button class="btn btn-default"  type="button">邮箱</button>
	                    </span>
						<input type="text" class="form-control userEmail" name="EMAIL">
					</div>
					<div class="input-group aaa">
						<span class="input-group-btn">
	                        <button class="btn btn-default"  type="button">姓&emsp;&emsp;名</button>
	                    </span>
						<input type="text" class="form-control" >
					</div>
					
					<div class="input-group aaa">
						<span class="input-group-btn">
	                        <button class="btn btn-default"  type="button">联系电话</button>
	                    </span>
						<input type="text" class="form-control" name="TEL">
					</div>
					
					
					<div class="input-group">
						<span class="input-group-btn">
	                        <button class="btn btn-default"  type="button">性&emsp;&emsp;别</button>
	                    </span>
						<label class="radio-inline">
							<input type="radio" name="GENDER" id="optionsRadios3" value="0" checked> 男
						</label>
						<label class="radio-inline">
							<input type="radio" name="GENDER" id="optionsRadios4"  value="1"> 女
						</label>
					</div>
					
					<div class="input-group bbb">
						<span class="input-group-btn">
		                    <button type="button" class="btn btn-default">学&emsp;&emsp;历</button>
		                </span>
						<select class="form-control" name="EDUCATION">
							<option class="form-control">高中</option>
							<option class="form-control">中专</option>
							<option class="form-control">大专</option>
							<option class="form-control">本科</option>
							<option class="form-control">硕士</option>
							<option class="form-control">博士</option>
						</select>
						<span class="input-group-btn">
		                    <button class="btn btn-default" type="button">毕业院校</button>
		                </span>
						<input type="text" class="form-control biyeSchool">
					</div>
					
					<div class="input-group aaa">
						<span class="input-group-btn">
		                    <button type="button" class="btn btn-default">学&emsp;&emsp;历</button>
		                </span>
						<select class="form-control" name="INSTITUTION">
							<option class="form-control">高中</option>
							<option class="form-control">中专</option>
							<option class="form-control">大专</option>
							<option class="form-control">本科</option>
							<option class="form-control">硕士</option>
							<option class="form-control">博士</option>
						</select>
					</div>
					
					<div class="input-group aaa">
						<span class="input-group-btn">
		                    <button class="btn btn-default" type="button">毕业院校</button>
		                </span>
						<input type="text" class="form-control" >
					</div>
					
					<div class="input-group">
						<span class="input-group-btn">
	                        <button class="btn btn-default" type="button">出生年月</button>
	                    </span>
						<input type="text" class="time bothDate" id="datepicker" name="BORN">
					</div>
					<div class="input-group">
						<span class="input-group-btn">
	                        <button class="btn btn-default" type="button">应聘职位</button>
	                    </span>
						<input type="text" class="form-control ypJob" name="WORK_NAME">
					</div>
					<div class="input-group">
						<span class="input-group-btn">
	                        <button class="btn btn-default" type="button">期望薪资</button>
	                    </span>
						<input type="text" class="form-control hopeMoney" name="SALARY">
					</div>
					<div class="input-group">
						<span class="input-group-btn">
	                        <button class="btn btn-default" type="button">专业特长</button>
	                    </span>
						<input type="text" class="form-control hobby" name="SPECAILTY">
					</div>
					<div class="input-group">
						<span class="input-group-btn">
	                        <button class="btn btn-default" type="button">现居住地</button>
	                    </span>
						<input type="text" class="form-control nowAddress" name="ADDRESS">
					</div>
					<div class="input-group btn_group btn_group_c">
						<span class="input-group-btn">
	                        <button class="btn btn-default" type="button">上传简历</button>
	                    </span>
						<input type="file" class="form-control hidden file" name="image_file1" />
						<div class="tab-File">
							<span id="fpath">上传简历</span>
							<img class="fileimg" src="fh_static_1/img/gd.png" />
						</div>
					</div>
					<div class="input-group btn_group">
						<a class="btn btn-primary tijiao" type="button" style="color: white;">提交</a>
					</div>
				</form>
			</div>
			
		<!--</div>-->
		<div class="mask"></div>
        <div class="tan">
			<div class="tipinfo"><p>提 示</p></div>
			<p>提交成功！</p>
			<button>关闭<tton>
		</div>
        
		<!--
        	作者：270068451@qq.com
        	时间：2018-05-11
        	描述：底部公共页面
        -->
		<div id="public_footer"><#include "footerTemplate.ftl"></div>

		<script type="text/javascript" src="fh_static_1/js/public.js"></script>
		<script type="text/javascript" src="fh_static_1/js/child.js"></script>
		<script src="fh_static_1/js/jquery.js"></script>
		<script src="fh_static_1/js/jquery-ui.js"></script>
		<script src="fh_static_1/js/pdtj.js"></script>

		<script>
			$(function(){
				$("#dialog").dialog({
					autoOpen: false,
					show: {
						effect: "blind",
						duration: 500
					},
					hide: {
						effect: "blind",
						duration: 500
					}
				});
				$("#dialog0").dialog();
				//时间选择器
				$("#datepicker").datepicker({
					showOtherMonths: true,
					selectOtherMonths: true,
					showButtonPanel: true,
					changeMonth: true,
					changeYear: true,
					dateFormat: 'yy-mm-dd',
					showAnim: 'slideDown',
					defautlYear: "1975"
				});
				$(".yingpin button").click(function() {
				    var typeId = $(this).attr("id");
				    $("#typeId").val(typeId);
					$("#dialog").dialog("open");
				});
				
				$(".tab-File").click(function() {
					$(".file").click();
				})
				$(".tan button").click(function(){
				$(".tan").css("display","none");
				})
				//数据提交
		    	$(".tijiao1").click(function(){
		    	var form = new FormData($("#tf")[0]);
		    	$.ajax({
                url:"web/apply.do",
                type:"post",
                data:form,
                processData:false,
                contentType:false,
                success:function(data){
                $("#dialog").dialog("close");
                $(".tan").css("display","block");
                },
                error:function(e){
                }
            });        
		    	
		    	
		    	})	
				
			})
			
			
			
			
		</script>
	</body>

</html>