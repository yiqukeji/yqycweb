$(function(){

$(".i-text").focus(function(){
$(this).addClass('h-light');
});

$(".i-text").focusout(function(){
$(this).removeClass('h-light');
});

$("#loginname").focus(function(){
 var username = $(this).val();
 if(username=='请输入用户名'){
 $(this).val('');
 }
});

$("#loginname").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('请输入用户名');
 }
});


$("#password").focus(function(){
 var username = $(this).val();
 if(username=='请输入密码'){
 $(this).val('');
 }
});


$("#yzm").focus(function(){
 var username = $(this).val();
 if(username=='请输入密码'){
 $(this).val('');
 }
});

$("#yzm").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('请输入验证码！');
 }
});


});