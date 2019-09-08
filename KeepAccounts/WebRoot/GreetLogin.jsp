<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
	<head>
		<title>个人记账系统</title>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
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
				<li class="layui-nav-item"><a href=""><%=request.getSession().getAttribute("username") %></a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">修改信息</a>
						</dd>
						<dd>
							<a id="loginout" class="loginout" href="javascript:" >退出</a>
						</dd>
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
								<font style="font-size: 20px;" color="lawngreen">
									<%=request.getSession().getAttribute("num") %></font>

							</div>
						</div>
					</div>
					<div class="layui-col-md4">
						<div class="layui-card">
							<div class="layui-card-header">支出</div>

							<div class="layui-card-body">
								<br>
								<font style="font-size: 20px;" color="red">
									-1000</font>
							</div>
						</div>
					</div>
					<div class="layui-col-md4">
						<div class="layui-card">
							<div class="layui-card-header">余额</div>

							<div class="layui-card-body">
								<br>
								<font style="font-size: 20px;" color="lawngreen">
									+500</font>
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
					<div id="doughnut" style="width: 700px;height:400px;margin-top: 55px;margin-left: 30px;"></div>
				</div>

				<!-- 页面底部 -->
				<p style="font-size: 15px;color: #c2c2c2;margin-top: 25px;text-align:center;margin-bottom: 50px;">©
					2019 云南工商学院&nbsp;计算机科学与技术</p>

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
					var myChart1 = echarts.init(document.getElementById('main'),
						'light');
					$.ajax({
						url: 'controller/selectincome',
						type: 'post',
						async: true,
						dataType: 'json',
						success: function(result) {
							console.log(result);
							var data = result; //将传递过来的json字符串转化为对象
							/*  alert(data); */
							var servicedata = [];
							for (var i = 0; i < data.name.length; i++) {
								var obj = new Object();
								obj.name = data.name[i];
								obj.value = data.data[i];
								servicedata[i] = obj;
							}
							myChart1.hideLoading(); //隐藏加载动画
							myChart1.setOption({
								title: {
									text: '支出统计图表',
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
									data: data.name
								},
								series: [{
									name: '支出占比（单位：元）',
									type: 'pie',
									radius: '55%',
									center: ['50%', '60%'],
									data: servicedata,
									itemStyle: {
										emphasis: {
											shadowBlur: 10,
											shadowOffsetX: 0,
											shadowColor: 'rgba(0, 0, 0, 0.5)'
										},

									}
								}]
							});
						},

					});
				</script>
				<script>
					// 基于准备好的dom，初始化echarts实例
					var myChart = echarts.init(document.getElementById('doughnut'),
						'light');
					$.ajax({
						url: 'controller/selectexpend',
						type: 'post',
						async: true,
						dataType: 'json',
						success: function(result1) {

							console.log(result1);
							var data = result1; //将传递过来的json字符串转化为对象
							/*  alert(data); */
							var servicedata = [];
							for (var i = 0; i < data.name.length; i++) {
								var obj = new Object();
								obj.name = data.name[i];
								obj.value = data.data[i];
								servicedata[i] = obj;
							}
							myChart1.hideLoading(); //隐藏加载动画

							// 指定图表的配置项和数据
							myChart
								.setOption({
									title: {
										text: '收入统计图表',
										subtext: '支出占比（单位：元）',
										x: 'center'
									},
									tooltip: {
										trigger: 'item',
										formatter: "{a} <br/>{b}: {c} ({d}%)"
									},
									legend: {
										orient: 'vertical',
										x: 'left',
										data: data.name
									},
									series: [{
											name: '',
											type: 'pie',
											selectedMode: 'single',
											radius: [0, '30%'],

											label: {
												normal: {
													position: 'inner'
												}
											},
											labelLine: {
												normal: {
													show: false
												}
											},
										},
										{
											name: '收入',
											type: 'pie',
											radius: ['40%', '55%'],
											label: {
												normal: {
													formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
													backgroundColor: '#eee',
													borderColor: '#aaa',
													borderWidth: 1,
													borderRadius: 4,
													// shadowBlur:3,
													// shadowOffsetX: 2,
													// shadowOffsetY: 2,
													// shadowColor: '#999',
													// padding: [0, 7],
													rich: {
														a: {
															color: '#999',
															lineHeight: 22,
															align: 'center'
														},
														// abg: {
														//     backgroundColor: '#333',
														//     width: '100%',
														//     align: 'right',
														//     height: 22,
														//     borderRadius: [4, 4, 0, 0]
														// },
														hr: {
															borderColor: '#aaa',
															width: '100%',
															borderWidth: 0.5,
															height: 0
														},
														b: {
															fontSize: 16,
															lineHeight: 33
														},
														per: {
															color: '#eee',
															backgroundColor: '#334455',
															padding: [
																2,
																4
															],
															borderRadius: 2
														}
													}
												}
											},
											data: servicedata,
										}
									]
								});
						},
					});
					
					/*退出系统*/
	$("#loginout").click(function(){
	/* window.location.href = "../html/login.jsp" */
		$.ajax({
			type: 'get',
			url: 'sysadminusermanager/logoutsystem',
			datatype: 'json',
			success: function(data) {
				
					
					layer.msg('确定要退出嘛？', {
				        time: 20000, //20s后自动关闭
				        btn: ['确定', '取消'],
				       yes: function(index, layero){ // 默认的是 按钮一
				       
				          window.location.href = "login.jsp"
				         }
				      });
			},
			error: function() {}
		});
	});
				</script>
	</body>
</html>
