<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<script type="text/javascript" src="fh_static_1/laydate/js/laydate.js"></script>
	<style>
	#fpath{
	background:#187db2;
	display:block;
	width:50px;
	height:30px;
	float:right;
	margin-right:20px;
	text-align:center;
	line-height:30px;
	color:white;
	border-radius:5px;
	cursor:pointer;
	}
	#fpath1{
	background:#187db2;
	display:block;
	width:50px;
	height:30px;
	float:right;
	margin-right:20px;
	text-align:center;
	line-height:30px;
	color:white;
	border-radius:5px;
	cursor:pointer;
	}
	
	</style>
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="contact/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="CONTACT_ID" id="CONTACT_ID" value="${pd.CONTACT_ID}" />
						<input type="hidden" name="state1" id="state1" value="${pd.WB}" />
						<input type="hidden" name="state2" id="state2" value="${pd.WX}" />
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">电话</td>
								<td><input type="text" name="TEL" id="TEL" value="${pd.TEL}" maxlength="100" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">QQ</td>
								<td><input type="text" name="EMAIL" id="EMAIL"  value="${pd.EMAIL}" maxlength="50" placeholder="这里输入邮箱" title="邮箱" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;" >微博:</td>
								<td>
								 <input type="text" readonly="readonly" style="width:88%;" id="fl" value="${pd.WB}" name="WB"/>
								   <input type="file" class="form-control hidden fl" name="image_file1"/>
									<span id="fpath">上传</span>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;" >微信:</td>
								<td>
								 <input type="text" readonly="readonly" style="width:88%;" id="fl1" value="${pd.WX}" name="WX"/>
								   <input type="file" class="form-control hidden fl1" name="image_file2"/>
									<span id="fpath1">上传</span>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">地址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS"  value="${pd.ADDRESS}" maxlength="50" placeholder="这里输入地址" title="地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 富文本编辑框-->
	<script charset="utf-8" src="plugins/kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>
	 <script type="text/javascript" src="plugins/tupian/js/up.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#TEL").val()==""){
				$("#TEL").tips({
					side:3,
		            msg:'请输入电话号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEL").focus();
			return false;
			}
		
			
			if($("#EMAIL").val()==""){
				$("#EMAIL").tips({
					side:3,
		            msg:'请输入邮箱',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EMAIL").focus();
			return false;
			}
			if($("#ADDRESS").val()==""){
				$("#ADDRESS").tips({
					side:3,
		            msg:'请输入地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDRESS").focus();
			return false;
			}
			if($("#fl").val()==""){
				$("#fl").tips({
					side:3,
		            msg:'请输入地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#fl").focus();
			return false;
			}
			if($("#fl1").val()==""){
				$("#fl1").tips({
					side:3,
		            msg:'请输入地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#fl1").focus();
			return false;
			}
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		//富文本编辑器
	        KindEditor.ready(function(K) {
	    	   K.create('textarea[name="CONTENTS"]', {
	    		   uploadJson : './plugins/kindeditor-4.1.10/jsp/upload_json.jsp',
	    		                   fileManagerJson : './plugins/kindeditor-4.1.10/jsp/file_manager_json.jsp',
	    		                   allowFileManager : true,
	    		                   allowImageUpload : true, 
	    		   autoHeightMode : true,
	    		   afterCreate : function() {this.loadPlugin('autoheight');},
	    		   afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息
	       });
	    	   });
		 
		//百度富文本
			/* setTimeout("ueditor()",500);
			function ueditor(){
				UE.getEditor('editor');
			} */
	     //选择图片
			function xuanTp(ID){
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="选择图片";
				 diag.URL = '<%=basePath%>pictures/listfortc.do';
				 diag.Width = 860;
				 diag.Height = 680;
				 diag.CancelEvent = function(){ //关闭事件
					 $("#"+ID).val('<%=basePath%>'+diag.innerFrame.contentWindow.document.getElementById('xzvalue').value);
					 diag.close();
				 };
				 diag.show();
			}
			
			//显示图片
			function showTU(ID,TPID){
				 $("#"+TPID).html('<img width="200" src="'+$("#"+ID).val()+'">');
				 $("#"+TPID).show();
			}
			//隐藏图片
			function hideTU(TPID){
				 $("#"+TPID).hide();
			}
			$(function(){
			    
			});
			//设置菜单类型or状态
			function setType(type,value){
				if(type == '1'){
					$("#PUB_STATE").val(value);
				}else if(type == '2'){
					$("#PUB_POSITION").val(value);
				}else if(type == '4'){
					$("#form-field-radio8").prop("checked","");
					$("#THUMNAIL").val("");
					$(".active").removeAttr("hidden");
				}else if(type == '3'){
					$("#form-field-radio9").prop("checked","");
					$("#THUMNAIL").val("");
					$(".active").prop("hidden",true);
				}else if(type == '5'){
					$("#NEWS_TYPE").val(value);
				}else if(type == '6'){
					$("#NEWS_TYPE").val(value);
				}
				
			}
			//百度富文本
			/* setTimeout("ueditor()",500);
			function ueditor(){
				UE.getEditor('editor');
			} */
			 $(function() {
		    	   $('#fpath').click(function() {
		    	        $('.fl').click(); // 模拟文件上传按钮点击操作
		    	    });
		    	   //选择文件后将文件名显示
		    	   $('.fl').change(function () {
		    		   var text = $(this).val();
		    	        $('#fl').val($(this).val().substring(text.indexOf ("\\")));
		    	    }); 
		    	   
		    	   $('#fpath1').click(function() {
		    	        $('.fl1').click(); // 模拟文件上传按钮点击操作
		    	    });
		    	   //选择文件后将文件名显示
		    	   $('.fl1').change(function () {
		    		   var text = $(this).val();
		    	        $('#fl1').val($(this).val().substring(text.indexOf("\\")));
		    	    }); 
		    	   
		    		
		    	});
		</script>
		<script type="text/javascript" src="fh_static_1/laydate/js/test.js"></script>
</body>
</html>