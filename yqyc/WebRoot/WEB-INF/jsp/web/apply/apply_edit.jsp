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
					
					<form action="apply/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="APPLY_ID" id="APPLY_ID" value="${pd.APPLY_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">姓名:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="50" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系电话:</td>
								<td><input type="text" name="TEL" id="TEL" value="${pd.TEL}" maxlength="32" placeholder="这里输入联系电话" title="联系电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">性别:</td>
								<td><input type="text" name="GENDER" id="GENDER" value="${pd.GENDER}" maxlength="32" placeholder="这里输入性别" title="性别" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学历:</td>
								<td><input type="text" name="EDUCATION" id="EDUCATION" value="${pd.EDUCATION}" maxlength="100" placeholder="这里输入学历" title="学历" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">出生年月:</td>
								<td><input class="span10 date-picker" name="BORN" id="BORN" value="${pd.BORN}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="出生年月" title="出生年月" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">应聘职位:</td>
								<td><input type="text" name="WORK_ID" id="WORK_ID" value="${pd.WORK_ID}" maxlength="34" placeholder="这里输入应聘职位" title="应聘职位" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">期望薪资:</td>
								<td><input type="text" name="SALARY" id="SALARY" value="${pd.SALARY}" maxlength="32" placeholder="这里输入期望薪资" title="期望薪资" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">特长:</td>
								<td><input type="text" name="SPECAILTY" id="SPECAILTY" value="${pd.SPECAILTY}" maxlength="100" placeholder="这里输入特长" title="特长" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">居住地址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="100" placeholder="这里输入居住地址" title="居住地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">附件:</td>
								<td>
									<a href="<%=basePath%>${pd.FILESURL}">简历下载</a>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input type="text" name="C_TIME" id="C_TIME" value="${pd.C_TIME}" maxlength="100" placeholder="这里输入创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">毕业院校:</td>
								<td><input type="text" name="INSTITUTION" id="INSTITUTION" value="${pd.INSTITUTION}" maxlength="100" placeholder="这里输入毕业院校" title="毕业院校" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
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
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#TEL").val()==""){
				$("#TEL").tips({
					side:3,
		            msg:'请输入联系电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEL").focus();
			return false;
			}
			if($("#GENDER").val()==""){
				$("#GENDER").tips({
					side:3,
		            msg:'请输入性别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GENDER").focus();
			return false;
			}
			if($("#EDUCATION").val()==""){
				$("#EDUCATION").tips({
					side:3,
		            msg:'请输入学历',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EDUCATION").focus();
			return false;
			}
			if($("#BORN").val()==""){
				$("#BORN").tips({
					side:3,
		            msg:'请输入出生年月',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BORN").focus();
			return false;
			}
			if($("#WORK_ID").val()==""){
				$("#WORK_ID").tips({
					side:3,
		            msg:'请输入应聘职位',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WORK_ID").focus();
			return false;
			}
			if($("#SALARY").val()==""){
				$("#SALARY").tips({
					side:3,
		            msg:'请输入期望薪资',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SALARY").focus();
			return false;
			}
			if($("#SPECAILTY").val()==""){
				$("#SPECAILTY").tips({
					side:3,
		            msg:'请输入特长',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SPECAILTY").focus();
			return false;
			}
			if($("#ADDRESS").val()==""){
				$("#ADDRESS").tips({
					side:3,
		            msg:'请输入居住地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDRESS").focus();
			return false;
			}
			if($("#FILESURL").val()==""){
				$("#FILESURL").tips({
					side:3,
		            msg:'请输入附件',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FILESURL").focus();
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
			if($("#INSTITUTION").val()==""){
				$("#INSTITUTION").tips({
					side:3,
		            msg:'请输入毕业院校',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INSTITUTION").focus();
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