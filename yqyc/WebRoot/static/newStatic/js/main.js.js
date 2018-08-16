$(function() {
	//echarts表格数据
	//基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('main'));

	// 指定图表的配置项和数据
	option = {
		backgroundColor: 'white',

		title: {
			text: '内容管理(%)',
			left: 'center',
			top: 20,
			textStyle: {
				color: '#000'
			}
		},

		tooltip: {
			trigger: 'item',
			formatter: "{a} <br/>{b} : {c} ({d}%)"
		},

		visualMap: {
			show: false,
			min: 80,
			max: 600,
			inRange: {
				colorLightness: [0, 1]
			}
		},
		series: [{
			name: '访问来源',
			type: 'pie',
			radius: '55%',
			center: ['50%', '50%'],
			data: [{
					value: 335,
					name: '直接访问'
				},
				{
					value: 310,
					name: '邮件营销'
				},
				{
					value: 274,
					name: '联盟广告'
				},
				{
					value: 235,
					name: '视频广告'
				},
				{
					value: 400,
					name: '搜索引擎'
				}
			].sort(function(a, b) {
				return a.value - b.value
			}),
			roseType: 'angle',
			label: {
				normal: {
					textStyle: {
						color: 'rgba(0, 0, 0, 1)'
					}
				}
			},
			labelLine: {
				normal: {
					lineStyle: {
						color: 'rgba(0, 0, 0, 1)'
					},
					smooth: 0.2,
					length: 10,
					length2: 20
				}
			},
			itemStyle: {
				normal: {
					color: '#054294',
					shadowBlur: 200,
					shadowColor: 'rgba(0, 0, 0, 0.5)'
				}
			}
		}]
	};

	//使用刚指定的配置项和数据显示图表。
	myChart.setOption(option);

	//-----------------------------------------------//
	
	//js交互部分
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();

	//注意进度条依赖 element 模块，否则无法进行正常渲染和功能性操作
	layui.use('element', function() {
		var element = layui.element;
	});

	$(function() {
		for(var i = 0; i < $(".ip_box .layui-elem-quote").length; i++) {
			var r = Math.round(Math.random() * 255) + 1;
			var g = Math.round(Math.random() * 255) + 1;
			var b = Math.round(Math.random() * 255) + 1;
			$(".ip_box").children(".layui-elem-quote").eq(i).css('border-left', '5px solid rgb(' + r + ',' + g + ',' + b + ')');
		}
	})

	layui.use(['form', 'element'],
		function() {
			layer = layui.layer;
			element = layui.element;
		});
	var tips = ''
	$(".test").click(function() {
		var _id = $(this).attr('id');
		if(_id == "test") {
			tips = '确认修改？';
		}
		if(_id == "test1") {
			tips = '确认删除？';
		}
		layer.confirm(tips, {
			btn: ['确定']
		})
	});

})