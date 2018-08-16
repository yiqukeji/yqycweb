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
					
					<form action="contents/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CONTENTS_ID" id="CONTENTS_ID" value="${pd.CONTENTS_ID}"/>
						<input type="hidden" name="PUB_STATE" id="PUB_STATE" value="${pd.PUB_STATE}"/>
						<input type="hidden" name="PUB_POSITION" id="PUB_POSITION" value="${pd.PUB_POSITION}"/>
						<input type="hidden" name="C_STATE" id="C_STATE" value="${pd.C_STATE}"/>
						<input type="hidden" name="PUB_TYPE" id="PUB_TYPE" value="${pd.PUB_TYPE}"/>
						<input type="hidden" name="NEWS_TYPE" id="NEWS_TYPE" value="${pd.NEWS_TYPE}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: left;padding-top: 13px;">标题</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="100" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: left;padding-top: 13px;">发布来源</td>
								<td><input type="text" name="PUB_SOURCE" id="PUB_SOURCE"  value="${pd.PUB_SOURCE}" maxlength="50" placeholder="这里输入发布来源" title="发布来源" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发布时间:</td>
								<td>
								 <div class="demo2">
					                <input placeholder="请输入日期" name="PUB_TIME"  value="${pd.PUB_TIME}" class="laydate-icon" onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
					            </div>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发布内容:</td>
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
		
			
			if($("#PUB_TIME").val()==""){
				$("#PUB_TIME").tips({
					side:3,
		            msg:'请输入发布时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PUB_TIME").focus();
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
			setTimeout("ueditor()",500);
			function ueditor(){
				UE.getEditor('editor');
			}
		</script>
		<script type="text/javascript" src="fh_static_1/laydate/js/test.js"></script>
</body>
</html>