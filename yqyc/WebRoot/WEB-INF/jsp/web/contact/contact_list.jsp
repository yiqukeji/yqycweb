<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
							
						<!-- 检索  -->
						<form action="contact/list.do" method="post" name="Form" id="Form"  >
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:15px;">	
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
										    <td style="width:75px;text-align: left;padding-top: 13px;">电话</td>
											<td>${var.TEL}</td>
										</tr>
										<tr>
										    <td>邮箱</td>
											<td>${var.EMAIL}</td>
										</tr>
										<tr>
										    <td>QQ</td>
											<td>
									        <input type="text" readonly="readonly" style="width:88%;" id="fl" value="${var.WB}" name="WB"/>
									        <input type="file" class="form-control hidden fl" name="image_file1" />
											</td>
										</tr>
										<tr>
										    <td>微信</td>
											<td>
											   <input type="text" readonly="readonly" style="width:88%;" id="fl1" value="${var.WX}" name="WX"/>
											   <input type="file" class="form-control hidden fl1" name="image_file2" />
											</td>
										</tr>
										<tr>
										    <td>地址</td>
											<td>${var.ADDRESS}</td>
										</tr>
										<tr>
										   <td>操作</td>
											<td>
												<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.CONTACT_ID}');">
													<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
												</a>
											</td>
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
								</td>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;"></div></td>
							</tr>
						</table>
						</div>
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

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>contact/goEdit.do?CONTACT_ID='+Id;
			 diag.Width = 860;
			 diag.Height = 680;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮 
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 tosearch();
				}
				diag.close();
			 };
			 diag.show();
		}
		
	</script>


</body>
</html>