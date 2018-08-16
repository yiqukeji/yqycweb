$(function() {
	layui.use(['form','element'],
    function() {
        layer = layui.layer;
        element = layui.element;
    });

	$("#test").click(function() {
		layer.confirm('登陆成功！',{
			btn:['确定']
		})
	});
})