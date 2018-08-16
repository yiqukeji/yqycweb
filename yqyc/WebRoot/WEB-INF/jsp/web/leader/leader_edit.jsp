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
.demo{width:420px; margin:40px auto 0 auto; min-height:250px;}
.demo p{line-height:42px; font-size:16px}
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
					
					<form action="leader/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="LEADER_ID" id="LEADER_ID" value="${pd.LEADER_ID}"/>
						<input type="hidden" name="TYPE" id="TYPE" value="${pd.TYPE}"/>
						<input type="hidden" name="GENDER" id="g" value="${pd.GENDER}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">头像:</td>
								<td>
								 <input onmouseover="showTU('PHOTO','yulantu1');" onmouseout="hideTU('yulantu1');" type="text" name="PHOTO" id="PHOTO" value="${pd.PHOTO}" maxlength="100"  style="width:88%;"/>
									<div class="yulantu" id="yulantu1"></div>
									<a class="btn btn-xs btn-info" style="margin-top: -5px;" title="选择" onclick="xuanTp('PHOTO');">选择 </a>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">姓名:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="50" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
							</tr>
							<tr style="display:none">
								<td style="width:75px;text-align: right;padding-top: 13px;">职称:</td>
								<td>
								<select class="chosen-select form-control" name="JOB" id="JOB" data-placeholder="请选择职位" style="vertical-align:top;" style="width:94%;" >
								<option value=""></option>
								<c:forEach items="${subList}" var="var">
									<option value="${var.NAME}" <c:if test="${var.NAME == pd.JOB }">selected</c:if>>${var.NAME }</option>
								</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">描述:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="100" placeholder="这里输入描述" title="描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">性别:</td>
								<input type="hidden" name="GENDER" id="gender" value=""/>
								<td>
							    <label style="float:left;padding-left: 8px;padding-top:7px;">
					                <input name="form-field1" type="radio"  class="ace" <c:if test="${pd.GENDER==0 and pd.GENDER!='' }">checked="checked"</c:if> value="男" id="form-field-radio1" onclick="setType('0','0');">	<span class="lbl">男</span>
					            </label>
					            <label style="float:left;padding-left: 5px;padding-top:7px;">
					                <input name="form-field"   type="radio" class="ace" <c:if test="${pd.GENDER==1 and pd.GENDER!='' }">checked="checked"</c:if>  value="女" id="form-field-radio2" onclick="setType('1','1');">	<span class="lbl">女</span>
					            </label>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">出生于:</td>
								<td>
								<select id="sel_year" name="y" rel="${y}"></select>年
						        <select id="sel_month" name="m" rel="${m}"></select>月
						        <select id="sel_day" name="d" rel="${d}"></select>日
								</td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发布人:</td>
								<td><input type="text" name="PUB_USER" id="PUB_USER" value="${pds.NAME}" readonly="readonly" maxlength="20" placeholder="这里输入发布人" title="发布人" style="width:98%;"/></td>
							</tr>
							<tr style="display:none">
								<td style="width:75px;text-align: right;padding-top: 13px;">电话:</td>
								<td><input type="text" name="TEL" id="TEL" value="${pd.TEL}"  maxlength="20" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>
							</tr>
							<tr style="display:none">
								<td style="width:75px;text-align: right;padding-top: 13px;">邮箱:</td>
								<td><input type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL}"  maxlength="20" placeholder="这里输入邮箱" title="邮箱" style="width:98%;"/></td>
							</tr>
							<tr style="display:none">
								<td style="width:75px;text-align: right;padding-top: 13px;">传真:</td>
								<td><input type="text" name="FAX" id="FAX" value="${pd.FAX}"  maxlength="20" placeholder="这里输入传真" title="传真" style="width:98%;"/></td>
							</tr>
							<tr style="display:none">
								<td style="width:75px;text-align: right;padding-top: 13px;">地址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}"  maxlength="20" placeholder="这里输入地址" title="地址" style="width:98%;"/></td>
							</tr>
							<tr style="display:none">
								<td style="width:75px;text-align: right;padding-top: 13px;">主要教育经历:</td>
								<td>
								<textarea rows="3" cols="46" name="EXP" id="EXP" placeholder="这里输入主要教育经历,字数0-500字" title="主要教育经历"  style="width:98%;">${pd.EXP}</textarea>
								</td>
							</tr>
							<tr style="display:none">
								<td style="width:75px;text-align: right;padding-top: 13px;">主要工作经历:</td>
								<td>
								<textarea rows="3" cols="46" name="WORKEXP" id="WORKEXP" placeholder="这里输入主要工作经历,字数0-500字" title="主要工作经历"  style="width:98%;">${pd.WORKEXP}</textarea>
								</td>
							</tr>
							<tr style="display:none">
								<td style="width:75px;text-align: right;padding-top: 13px;">研究方向:</td>
								<td><input type="text" name="RD" id="RD" value="${pd.RD}"  maxlength="150" placeholder="这里输入研究方向" title="研究方向" style="width:98%;"/></td>
							</tr>
							<tr style="display:none">
								<td style="width:75px;text-align: right;padding-top: 13px;">讲授课程:</td>
								<td><input type="text" name="COURSE" id="COURSE" value="${pd.COURSE}"  maxlength="150" placeholder="这里输入讲授课程" title="讲授课程" style="width:98%;"/></td>
							</tr>
							<tr style="display:none">
								<td style="width:75px;text-align: right;padding-top: 13px;">研究成果:</td>
								<td>
								<textarea rows="3" cols="46" name="ACHIEVEMENT" id="ACHIEVEMENT" placeholder="这里输入研究成果,字数0-300字" title="研究成果"  maxlength="300" style="width:98%;">${pd.WORKEXP}</textarea>
								</td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发布来源:</td>
								<td><input type="text" name="PUB_SOURCE" id="PUB_SOURCE" value="${pd.PUB_SOURCE}" maxlength="50" placeholder="这里输入发布来源" title="发布来源" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发布时间:</td>
								<td>
								 <div class="demo2">
					                <input  name="PUB_TIME"  value="${pd.PUB_TIME}" class="laydate-icon" onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
					            </div>
								</td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">内容:</td>
								<td>
								 <textarea id="editor_id" name="CONTENTS" style="width:700px;height:300px;">
                                 ${pd.CONTENTS}
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
	
		<!-- 上传控件 -->
	<script src="static/ace/js/ace/elements.fileinput.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>
		<script type="text/javascript">
		
		$(function () {
			$.ms_DatePicker({
		            YearSelector: ".sel_year",
		            MonthSelector: ".sel_month",
		            DaySelector: ".sel_day"
		    });
			$.ms_DatePicker();
		}); 
		
		
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
			/* if($("#JOB").val()==""){
				$("#JOB").tips({
					side:3,
		            msg:'请输入职位',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#JOB").focus();
			return false;
			} */
			if($("#DESCRIPTION").val()==""){
				$("#DESCRIPTION").tips({
					side:3,
		            msg:'请输入描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DESCRIPTION").focus();
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
			
			
			if($("#CONTENTS").val()==""){
				$("#CONTENTS").tips({
					side:3,
		            msg:'请输入内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTENTS").focus();
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
			if($("#PUB_SOURCE").val()==""){
				$("#PUB_SOURCE").tips({
					side:3,
		            msg:'请输入发布来源',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PUB_SOURCE").focus();
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
		
		//上传
	/* 	$('#tp').ace_file_input({
			no_file:'请选择文件 ...',
			btn_choose:'选择',
			btn_change:'更改',
			droppable:false,
			onchange:null,
			thumbnail:false, //| true | large
			whitelist:'*',
			//whitelist:'gif|png|jpg|jpeg',
			//blacklist:'gif|png|jpg|jpeg'
			//onchange:''
			//
		//});
	}); */
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
         function setType(type,data){
        	 $("#gender").val(data);
         }
		</script>
		<script type="text/javascript" src="fh_static_1/js/birthday.js"></script></p>
</body>
</html>