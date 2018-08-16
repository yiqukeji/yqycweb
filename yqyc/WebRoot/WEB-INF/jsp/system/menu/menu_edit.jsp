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

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>

</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
				
					<div class="page-header">
							<h1>
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									编辑菜单
								</small>
							</h1>
					</div><!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">

						<form  action="menu/${MSG }.do" name="menuForm" id="menuForm" method="post" class="form-horizontal">
							<input type="hidden" name="MENU_ID" id="menuId" value="${pd.MENU_ID }"/>
							<input type="hidden" name="MENU_TYPE" id="MENU_TYPE" value="${pd.MENU_TYPE }"/>
							<input type="hidden" name="MENU_STATE" id="MENU_STATE" value="${pd.MENU_STATE }"/>
							<input type="hidden" name="NAV_STATE" id="NAV_STATE" value="${pd.NAV_STATE }"/>
							<input type="hidden" name="F_STATE" id="F_STATE" value="${pd.F_STATE }"/>
							<input type="hidden" name="POSITION_STATE" id="POSITION_STATE" value="${pd.POSITION_STATE }"/>
							<input type="hidden" name="PARENT_ID" id="PARENT_ID" value="${null == pd.PARENT_ID ? MENU_ID:pd.PARENT_ID}"/>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上级 :</label>
								<div class="col-sm-9">
									<div style="padding-top:5px;">
										<div class="col-xs-4 label label-lg label-light arrowed-in arrowed-right">
											<b>${null == pds.MENU_NAME ?'(无) 此项为顶级菜单':pds.MENU_NAME}</b>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 名称 :</label>
								<div class="col-sm-9">
									<input type="text" name="MENU_NAME" id="menuName" value="${pd.MENU_NAME }" placeholder="这里输入菜单名称" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 描述 :</label>
								<div class="col-sm-9">
									<input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION }" placeholder="这里输入栏目描述" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 链接  :</label>
								<div class="col-sm-9">
									<c:if test="${null != pds.MENU_NAME}">
									<input type="text" name="MENU_URL" id="menuUrl" value="${pd.MENU_URL }" placeholder="这里输入菜单链接" class="col-xs-10 col-sm-5" />
									</c:if>
									<c:if test="${null == pds.MENU_NAME}">
									<input type="text" name="MENU_URL" id="menuUrl" value="" readonly="readonly" placeholder="顶级菜单禁止输入" class="col-xs-10 col-sm-5" />
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 序号 : </label>
								<div class="col-sm-9">
									<input type="number" name="MENU_ORDER" id="menuOrder" value="${pd.MENU_ORDER}" placeholder="这里输入菜单序号" title="请输入正整数" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 菜单标识  :</label>
								<div class="col-sm-9">
									<input type="text" name="IDENTIFICATION" id="IDENTIFICATION" value="${pd.IDENTIFICATION }" placeholder="这里输入菜单标识（二级菜单中的链接类型相对应）" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<c:if test="${'0' == MENU_ID}">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 类型 : </label>
								<div class="col-sm-9">
									<label style="float:left;padding-left: 8px;padding-top:7px;">
										<input name="form-field-radio" type="radio" class="ace" id="form-field-radio1" <c:if test="${pd.MENU_TYPE == '1' }">checked="checked"</c:if> onclick="setType('1','1');"/>
										<span class="lbl"> 系统菜单</span>
									</label>
									<label style="float:left;padding-left: 5px;padding-top:7px;">
										<input name="form-field-radio" type="radio" class="ace" id="form-field-radio2" <c:if test="${pd.MENU_TYPE == '2' }">checked="checked"</c:if> onclick="setType('1','2');"/>
										<span class="lbl"> 业务菜单</span>
									</label>
								</div>
							</div>
							</c:if>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 状态 : </label>
								<div class="col-sm-9">
									<label style="float:left;padding-left: 8px;padding-top:7px;">
										<input name="form-field-radio2" type="radio" class="ace" id="form-field-radio3" <c:if test="${pd.MENU_STATE == 1 }">checked="checked"</c:if> onclick="setType('2',1);"/>
										<span class="lbl"> 显示</span>
									</label>
									<label style="float:left;padding-left: 5px;padding-top:7px;">
										<input name="form-field-radio2" type="radio" class="ace" id="form-field-radio4" <c:if test="${pd.MENU_STATE == 0 }">checked="checked"</c:if> onclick="setType('2',0);"/>
										<span class="lbl"> 隐藏</span>
									</label>
								</div>
							</div>
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="goback('${MENU_ID}');">取消</a>
								</div>
							</div>
							<div class="hr hr-18 dotted hr-double"></div>
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
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
		
		//返回
		function goback(MENU_ID){
			top.jzts();
			window.location.href="<%=basePath%>menu.do?MENU_ID="+MENU_ID;
		}
		
		//保存
		function save(){
			if($("#menuName").val()==""){
				$("#menuName").tips({
					side:3,
		            msg:'请输入菜单名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#menuName").focus();
				return false;
			}
			if($("#menuUrl").val()==""){
				$("#menuUrl").val('#');
			}
			//类型为空默认为业务类型
			if($("#MENU_TYPE").val()==""){
				$("#MENU_TYPE").val('1');
			}
			//状态值为空默认为隐藏
			if($("#MENU_STATE").val()==""){
				$("#MENU_STATE").val(0);
			}
			//导航显示状态下的默认为隐藏
			if($("#NAV_STATE").val()==""){
				$("#NAV_STATE").val(0);
			}
			//位置显示默认状态为0
			if($("#POSITION_STATE").val==""){
				$("#POSITION_STATE").val(0);
			}
			if($("#menuOrder").val()==""){
				$("#menuOrder").tips({
					side:1,
		            msg:'请输入菜单序号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#menuOrder").focus();
				return false;
			}
			if(isNaN(Number($("#menuOrder").val()))){
				$("#menuOrder").tips({
					side:1,
		            msg:'请输入菜单序号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#menuOrder").focus();
				$("#menuOrder").val(1);
				return false;
			}
			$("#menuForm").submit();
		}
		
		//设置菜单类型or状态
		function setType(type,value){
			if(type == '1'){
				$("#MENU_TYPE").val(value);
			}else if(type == '2'){
				$("#MENU_STATE").val(value);
			}else if(type == '3'){
				$("#NAV_STATE").val(value);
			}else if(type == '4'){
				$("#POSITION_STATE").val(value);
			}else if (type == '5'){
				$("#F_STATE").val(value);
			}
		}
		
		
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
	</script>


</body>
</html>