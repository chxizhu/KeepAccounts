<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
	<head>
		<title>个人记账系统</title>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="./css/font.css">
		<link rel="stylesheet" href="./css/xadmin.css">
		<link rel="stylesheet" href="lib/layui/css/layui.css">
		<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script src="./lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="./js/xadmin.js"></script>
		<script src="https://echarts.baidu.com/dist/echarts.js"></script>
	</head>
	<body>
		<div class="">
			<ul class="layui-nav layui-bg-orange">
				<li class="layui-nav-item"><a href="GreetLogin.jsp">首页</a></li>
				<li style="margin-left: 80px;" class="layui-nav-item"><a href="Accounting.jsp">记账查询</a></li>
				<li style="margin-left: 80px;" class="layui-nav-item"><a href="AddAccount.jsp">添加记账</a></li>
				<li style="margin-left:650px" class="layui-nav-item">欢迎您：</li>
				<li class="layui-nav-item"><a href="">张遮天</a>
					<dl class="layui-nav-child">
						<dd><a href="javascript:;">修改信息</a></dd>
						<dd><a href="javascript:;">退出</a></dd>
					</dl>
				</li>
			</ul>
		</div>
		
		<div class="layui-container">
			
			<div style="padding: 20px; background-color: #F2F2F2;">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md4">
						<div class="layui-card">
							<div class="layui-card-header">收入</div>
			
							<div class="layui-card-body">
								<br>
								<font style="font-size: 20px;" color="lawngreen"> +500</font>
			
							</div>
						</div>
					</div>
					<div class="layui-col-md4">
						<div class="layui-card">
							<div class="layui-card-header">支出</div>
			
							<div class="layui-card-body">
								<br>
								<font style="font-size: 20px;" color="red"> -1000</font>
							</div>
						</div>
					</div>
					<div class="layui-col-md4">
						<div class="layui-card">
							<div class="layui-card-header">余额</div>
			
							<div class="layui-card-body">
								<br>
								<font style="font-size: 20px;" color="lawngreen"> +500</font>
							</div>
						</div>
					</div>
				</div>
			</div>
					
			<div class="layui-row">
			<div class="layui-col-md1">&nbsp;</div>
				<div class="layui-col-md5">
					<div id="main" style="width: 400px;height:400px;margin-top: 40px;"></div>

				</div>
				<div class="layui-col-md6">
					<div id="doughnut" style="width: 400px;height:400px;margin-top: 55px;margin-left: 30px;"></div>
				</div>
				
				<!-- 页面底部 -->
				<p style="font-size: 15px;color: #c2c2c2;margin-top: 25px;text-align:center;margin-bottom: 50px;">© 2019 云南工商学院&nbsp;计算机科学与技术</p>

				<script>
					layui.use('laydate', function() {
						var laydate = layui.laydate;

						//执行一个laydate实例
						laydate.render({
							elem: '#time' //指定元素
								,
							type: 'datetime'
						});

					})
				</script>
				<script>
					// 基于准备好的dom，初始化echarts实例
					var myChart = echarts.init(document.getElementById('main'), 'light');

					// 指定图表的配置项和数据
					var option = {
						title: {
							text: '个人总支出统计图表',
							subtext: '支出占比（单位：元）',
							x: 'center'
						},
						tooltip: {
							trigger: 'item',
							formatter: "{a} <br/>{b} : {c} ({d}%)"
						},
						legend: {
							orient: 'vertical',
							left: 'left',
							data: ['餐饮', '住宿', '交通', '学习', '通讯']
						},
						series: [{
							name: '支出占比（单位：元）',
							type: 'pie',
							radius: '55%',
							center: ['50%', '60%'],

							data: [{
									value: 335,
									name: '餐饮'
								},
								{
									value: 310,
									name: '住宿'
								},
								{
									value: 234,
									name: '交通'
								},
								{
									value: 135,
									name: '学习'
								},
								{
									value: 48,
									name: '通讯'
								}
							],
							itemStyle: {
								emphasis: {
									shadowBlur: 10,
									shadowOffsetX: 0,
									shadowColor: 'rgba(0, 0, 0, 0.5)'
								},

								/* normal: {
									color: function(params) {
										//自定义颜色
										var colorList = [
											'#00FFFF', '#00FF00', '#FFFF00', '#FF8C00', '#01AAED', '#FE8463',
										];
										return colorList[params.dataIndex]
									}
								} */
							}
						}]
					};

					// 使用刚指定的配置项和数据显示图表。
					myChart.setOption(option);
				</script>

				<script>
					// 基于准备好的dom，初始化echarts实例
					var myChart = echarts.init(document.getElementById('doughnut'), 'light');

					// 指定图表的配置项和数据
					var option = {
						title: {
							text: '个人总收入统计图表',
							subtext: '收入占比（单位：元）',
							x: 'center'
						},
						tooltip: {
							trigger: 'item',
							formatter: "{a} <br/>{b}: {c} ({d}%)"
						},
						legend: {
							orient: 'vertical',
							x: 'left',
							data: ['个人总收入']
						},
						series: [{
							name: '个人总收入',
							type: 'pie',
							radius: ['50%', '66%'],
							avoidLabelOverlap: true,
							label: {
								normal: {
									show: true,
									position: 'center'
								},
								emphasis: {
									show: true,
									textStyle: {
										fontSize: '30',
										fontWeight: 'bold'
									}
								}
							},
							labelLine: {
								normal: {
									show: false
								}
							},
							data: [{
									value: 3000,
									name: '个人总收入'
								},

							]
						}]
					};

					// 使用刚指定的配置项和数据显示图表。
					myChart.setOption(option);
				</script>
	</body>
</html>
