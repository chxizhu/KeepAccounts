<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>注册用户账号</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css" media="all">
		<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
	</head>
	<style>
		#top{
			padding-bottom: 60px;
		}
		#input{
			    padding-top: 15px;
			}
			
		#forget-pass {
			    
			    color: #0DB3A6;
			    position: relative;
			   
			   
			}
	</style>
	<body style="background-color: #f2f2f2;">
		<!-- logo图片 -->
		<div class="layui-container ">
			<div class="layui-row ">
				<img src="imgs/logo.png" style="margin-top: 3.125rem;" />
			</div>
		</div>
		<!-- 中间内容 -->
		<div class="layui-container">
			<div id="input">
				<div class="layui-row">
					<div class="layui-col-md4 ">
						<p> &nbsp;</p>
					</div>
					
					<div class="layui-col-md4">
						<div class="layui-card">
							<div class="layui-card-header"><p style="font-size: 17px;">注册用户账号</p></div>
							
							<div class="layui-card-body">
								<form class="layui-form" action="">
									<div class="layui-form-item" style="margin-top:5px;margin-bottom:25px;">
										<input type="text" name="loginid" id="user_id" required lay-verify="required" placeholder="请输入登录账号" class="layui-input"
										 style=" height: 45px;">
									</div>
									<div class="layui-form-item" style="margin-top:10px;margin-bottom:25px;">
										<input type="text" name="loginname" id="user_name" required lay-verify="required" placeholder="请输入用户昵称" class="layui-input"
										 style=" height: 45px;">
									</div>
									<div class="layui-form-item" style="margin-top:10px;margin-bottom:25px;">
										<input type="password" id="user_password"  name="loginpwd" required lay-verify="required" placeholder="请输入6--12位的密码" class="layui-input"
										 style=" height: 45px;">
									</div>
									<div class="layui-form-item" style="margin-bottom:10px;">
										<input type="password" id="user_password2"  name="loginpwd2" required lay-verify="required" placeholder="请再次输入确认密码" class="layui-input"
										 style=" height: 45px;">
									</div>
									<button style="margin-top:15px;margin-bottom: 10px;" type="button" lay-submit id ="login-button" class="layui-btn layui-btn-fluid">注册</button>
									<p style="margin-bottom: 35px;">已有账号？<a href="login.html" id="forget-pass">直接登录</a></p>
								</form>
							</div>
						</div>
					</div>
					<div class="layui-col-md4 ">
						<p> &nbsp;</p>
					</div>
				</div>
			</div>
		</div>
		<!-- 页面底部 -->
		<p style="font-size: 15px;color: #c2c2c2;margin-top: 25px;text-align:center">© 2019 云南工商学院&nbsp;计算机科学与技术</p>
		
		<script src="layui/layui.js" charset="utf-8"></script>
		<script src="js/jquery-3.3.1.js" charset="utf-8"></script>
		<script>
				layui.use(['form','layer'], function(){
					var layer = layui.layer
					var form = layui.form;	  
					var $ = layui.jquery;					
					/* 点击登录 */
					$("#login-button").click(function(){
						
						var userid=$("#user_id").val().trim();
						var username=$("#user_name").val().trim();
						var password=$("#user_password").val().trim();
						var password2=$("#user_password2").val().trim();
				
						if(userid==null || userid=="" || userid==undefined){
							$("#user_id").focus();
							return;
						}
					 	if(username==null || username=="" || username==undefined){
							$("#user_name").focus();
							return;
						}
						if(password==null || password=="" || password==undefined){
							$("#user_password").focus();
							return;
						}
						if(password.length<6 || password.length>18){
							layer.alert('密码长度不符合规范!', {icon: 2});
							return;
						} 	
						if(password.length!= password2.length){
							layer.alert('两次密码不一致', {icon: 2});
							return;
						} 						
						/*
						var enpwd = hex_md5(fix(Encryption_key,password));
						$("#inppassword").val(enpwd);
						*/
						 var index = layer.load(0, {shade: 0.1});
						$.ajax({
		 					 url : 'Admin/add?userid='+userid+'&pwd='+password2+'&uname='+username, 
							datatype : 'json',
							success : function(data) {
								if (data.code == 0) {
									window.location.href = "login.jsp";
								} else {
									layer.alert(/* data.msg */'注册失败!', {icon: 2});
									layer.close(index);
									$("input").val("");
								}
							},
							error:function(e){
			    	        	 layer.alert(e.msg); 	
								 layer.alert('用户注册失败!', {icon: 2});							 
			    	        }
						}); 						
					});					
				});
			</script>
	</body>
</html>