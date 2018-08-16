$(".tijiao").click(function(){
	var userName = $(".userName").val().trim();
	var userPhone = $(".userPhone").val().trim();
	var userEmail = $(".userEmail").val().trim();
	var biyeSchool = $(".biyeSchool").val().trim();
	var bothDate = $(".bothDate").val().trim();
	var ypJob = $(".ypJob").val().trim();
	var hopeMoney = $(".hopeMoney").val().trim();
	var hobby = $(".hobby").val().trim();
	var nowAddress = $(".nowAddress").val().trim();
	
	var yzemail = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
	
	var yzphone=/^[1][3,4,5,7,8][0-9]{9}$/
	
	if(userName==null || userName==""){
		alert("请填写您的名字");
		return;
	}
	if(userPhone==null || userPhone==""){
		alert("请填写您的电话");
		return;
	}
	var phone = yzphone.test(userPhone);
	if(!phone){
		alert("电话错误格式");
		return;
	}
	if(userEmail==null || userEmail=="") {
		alert("请填写您的邮箱");
		return;
	}
	var str = yzemail.test(userEmail);
	if(!str){
		alert("邮箱错误格式");
		return;
	}
	if(ypJob==null || ypJob==""){
		alert("请填写您的应聘职位");
		return;
	}
	if(hopeMoney==null || hopeMoney==""){
		alert("请填写您的期望工资");
		return;
	}
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

