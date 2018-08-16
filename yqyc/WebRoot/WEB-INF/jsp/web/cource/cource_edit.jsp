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
	<style type="text/css">
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
					
					<form action="cource/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="COURCE_ID" id="COURCE_ID" value="${pd.COURCE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="50" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">焦点图:</td>
								<td>
								  <input type="text" readonly="readonly" style="width:88%;" id="fl" value="${pd.IMG}" name="IMG"/>
								   <input type="file" class="form-control hidden fl" name="image_file1" />
									<span id="fpath">上传</span>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发布时间:</td>
								<td>
								 <div class="demo2">
					                <input placeholder="请输入日期" name="TIME"  value="${pd.TIME}" class="laydate-icon" onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
					            </div>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">内容:</td>
								<td>
								 <textarea id="editor_id" name="CONTENT" style="width:700px;height:300px;">
                                 ${pd.CONTENT}
                                  </textarea>
								</td>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 富文本编辑框-->
	<script charset="utf-8" src="plugins/kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#TITLE").val()==""){
				$("#TITLE").tips({
					side:3,
		            msg:'请输入标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
			return false;
			}
			if($("#IMG").val()==""){
				$("#IMG").tips({
					side:3,
		            msg:'请输入焦点图',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IMG").focus();
			return false;
			}
			if($("#TIME").val()==""){
				$("#TIME").tips({
					side:3,
		            msg:'请输入发布时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TIME").focus();
			return false;
			}
			if($("#CONTENT").val()==""){
				$("#CONTENT").tips({
					side:3,
		            msg:'请输入内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTENT").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		//富文本编辑器
	       KindEditor.ready(function(K) {
	    	   K.create('textarea[name="CONTENT"]', {
	    		   uploadJson : './plugins/kindeditor-4.1.10/jsp/upload_json.jsp',
	    		                   fileManagerJson : './plugins/kindeditor-4.1.10/jsp/file_manager_json.jsp',
	    		                   allowFileManager : true,
	    		                   allowImageUpload : true, 
	    		   autoHeightMode : true,
	    		   afterCreate : function() {this.loadPlugin('autoheight');},
	    		   afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息
	       });
	    	   });
		/* $(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		}); */
		 $(function() {
	    	   $('#fpath').click(function() {
	    	        $('.fl').click(); // 模拟文件上传按钮点击操作
	    	    });
	    	   //选择文件后将文件名显示
	    	   $('.fl').change(function () {
	    		   var text = $(this).val();
	    	        $('#fl').val($(this).val().substring(text.indexOf ("\\")));
	    	    }); 
	    	   })
		</script>
</body>
</html>