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
					
					<form action="view/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="VIEW_ID" id="VIEW_ID" value="${pd.VIEW_ID}"/>
						<input type="hidden" name="TOP" id="TOP" value="${pd.TOP}" />
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="VIDEO_NAME" id="VIDEO_NAME" value="${pd.VIDEO_NAME}" maxlength="50" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
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
								<td style="width:75px;text-align: right;padding-top: 13px;">发布人:</td>
								<td><input type="text" name="PUB_USER" id="PUB_USER" value="${pds.NAME}"  readonly="readonly" maxlength="20" placeholder="这里输入发布人" title="发布人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否置顶:</td>
								<td>
								<label style="float:left;padding-left: 8px;padding-top:7px;">
										<input name="form-field-radio4" type="radio" class="ace" id="form-field-radio6" value="${pd.TOP}" <c:if test="${pd.TOP == 0 }">checked="checked"</c:if> onclick="setType('1',0);"/>
										<span class="lbl"> 默认</span>
									</label>
								<label style="float:left;padding-left: 5px;padding-top:7px;">
									<input name="form-field-radio4" type="radio" class="ace" id="form-field-radio7" value="${pd.TOP}" <c:if test="${pd.TOP == 1 }">checked="checked"</c:if> onclick="setType('1',1);"/>
									<span class="lbl"> 置顶</span>
								</label>
								
								</td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">添缩略图:</td>
								<td>
								<input  type="text" name="THUMNAIL" id="THUMNAIL"  value="${pd.THUMNAIL}" maxlength="100" placeholder="这里输入图片" title="缩略图片" style="width:88%;"/>
									<a class="btn btn-xs btn-info" style="margin-top: -5px;" title="选择" onclick="xuanTp('THUMNAIL');">选择 </a>
								</div>
								</td>
                            </tr>							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">文件来源:</td>
								<td>${pd.FILE_SOURCE}
								<c:if test="${pd == null || pd.FILE_SOURCE == '' || pd.FILE_SOURCE == null }">
										<input type="file" id="tp" name="tp" value="" onchange="fileType(this)"/>
								</c:if>
								<c:if test="${pd != null && pd.FILE_SOURCE != '' && pd.FILE_SOURCE != null }">
											<a href="<%=basePath%>uploadFiles/file/${pd.FILE_SOURCE}" target="_blank"><span>点击播放</span></a>
											<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delP('${pd.FILE_SOURCE}','${pd.VIEW_ID }');" />
											<input type="hidden" name="tpz" id="tpz" value="${pd.FILE_SOURCE }"/>
								</c:if>
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
									<a class="btn btn-mini btn-primary" id="st" onclick="save()" >保存</a>
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
	<!-- ace scripts -->
   <script src="static/ace/js/ace/ace.js"></script>
   <!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 上传控件 -->
    <script src="static/ace/js/ace/elements.fileinput.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		
		$(function() {
			//上传
			$('#tp').ace_file_input({
				no_file:'请选择视频 ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'mp4|mov',
				//blacklist:'gif|png|jpg|jpeg'
				//onchange:''
				//
			});
		});
		//过滤类型
		function fileType(obj){
			var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
		    if(fileType != '.mp4'){
		    	$("#tp").tips({
					side:3,
		            msg:'请上传视频格式的文件',
		            bg:'#AE81FF',
		            time:3
		        });
		    	$("#tp").val('');
		    	document.getElementById("tp").files[0] = '请选择视频';
		    }
		}
		
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
			if(typeof($("#tpz").val()) == "undefined"){
				if($("#tp").val()=="" || document.getElementById("tp").files[0] =='请选择图片'){
					$("#tp").tips({
						side:3,
			            msg:'请上传视频',
			            bg:'#AE81FF',
			            time:3
			        });
					return false;
				}
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
		  $("#Form").submit();	
		  $("#zhongxin").hide();  
       	  $("#zhongxin2").show();  
		 } 
		//setTimeout("ueditor()",500);
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
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		//删除视频
		function delP(FILE_SOURCE,VIEW_ID){
			 if(confirm("确定要删除视频？")){
				var url = "view/deltp.do?FILE_SOURCE="+FILE_SOURCE+"&VIEW_ID="+VIEW_ID+"&guid="+new Date().getTime();
				$.get(url,function(data){
					if(data=="success"){
						alert("删除成功!");
						document.location.reload();
					}
				});
			} 
		}
		function setType(type,value){
				$("#TOP").val(value);
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