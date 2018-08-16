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
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
					
					<form action="view/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="VIEW_ID" id="VIEW_ID" value="${pd.VIEW_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="VIDEO_NAME" id="VIDEO_NAME" value="${pd.VIDEO_NAME}" maxlength="50" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input type="text" name="C_TIME" id="C_TIME" value="${pd.C_TIME}" maxlength="20" placeholder="这里输入创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发布时间:</td>
								<td><input type="text" name="PUB_TIME" id="PUB_TIME" value="${pd.PUB_TIME}" maxlength="20" placeholder="这里输入发布时间" title="发布时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发布人:</td>
								<td><input type="text" name="PUB_USER" id="PUB_USER" value="${pd.PUB_USER}" maxlength="20" placeholder="这里输入发布人" title="发布人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否置顶:</td>
								<td><input type="text" name="TOP" id="TOP" value="${pd.TOP}" maxlength="20" placeholder="这里输入是否置顶" title="是否置顶" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">文件来源:</td>
								<td><input type="text" name="FILE_SOURCE" id="FILE_SOURCE" value="${pd.FILE_SOURCE}" maxlength="100" placeholder="这里输入文件来源" title="文件来源" style="width:98%;"/></td>
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
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#VIDEO_NAME").val()==""){
				$("#VIDEO_NAME").tips({
					side:3,
		            msg:'请输入标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VIDEO_NAME").focus();
			return false;
			}
			if($("#C_TIME").val()==""){
				$("#C_TIME").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#C_TIME").focus();
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
			if($("#PUB_USER").val()==""){
				$("#PUB_USER").tips({
					side:3,
		            msg:'请输入发布人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PUB_USER").focus();
			return false;
			}
			if($("#TOP").val()==""){
				$("#TOP").tips({
					side:3,
		            msg:'请输入是否置顶',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TOP").focus();
			return false;
			}
			if($("#FILE_SOURCE").val()==""){
				$("#FILE_SOURCE").tips({
					side:3,
		            msg:'请输入文件来源',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FILE_SOURCE").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>