<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
<link rel="stylesheet" href="layui/css/layui.css">

<title>用户基础信息修改</title>
<style>
			.mtop {
				margin-top: 30px;
			}
			
			.same {
				padding: 0;
				margin: 0;
				box-sizing: border-box;
				border: 1;
				height: 45px;
			}
			
			.text {
				width: 80%;
			}
			
			.btn {
				width: 20%;
			}
			
			.footer {
				margin-top: 300px;
				text-align: center;
			}
			
			
			.fontsize{
				font-size: large;
				
			}
		</style>
</head>
<body class="bcolor">
	<!--导航信息 -->

	<div class="">
    		<ul class="layui-nav layui-bg-orange">
  <li class="layui-nav-item"><a href="GreetLogin.jsp">首页</a></li>
  
  <li style="margin-left: 80px;"class="layui-nav-item"><a href="Accounting.jsp">记账查询</a></li>
  
  <li style="margin-left: 80px;" class="layui-nav-item"><a href="AddAccount.jsp">添加记账</a></li>
  <li style="margin-left:650px" class="layui-nav-item">欢迎您：</li>
  <li class="layui-nav-item"><a href="javascript:;"><%=request.getSession().getAttribute("username") %></a>
  	  <dl class="layui-nav-child">
      <dd><a href="UserInformationEdit.jsp">修改信息</a></dd>  
      <dd><a id="loginout" class="loginout" href="javascript:;" >退出</a></dd>
    </dl>
  </li>
</ul>	
    	</div>
    					
		
			<!--主要內容-->
		<div class="layui-container mtop">
			<div class="layui-row">
				<div class="layui-col-md10 layui-col-md-offset1 ">
					<div class="layui-card">
							<div  class="layui-card-header"><p class="fontsize" style="margin-top: 30px;margin-bottom: 10px;">用户基础信息修改</p></div>
							<hrclass="layui-bg-gray">
							 <div class="layui-card-body">
							<form class="layui-form" action="UserinformationEditAction.action" onsubmit= "return formCheck()">
								<div class="layui-form-item">
									<label class="layui-form-label">用户账号</label>
									<div class="layui-input-block">
										<input disabled="disabled" value="${user.uid} " id="userid" type="text" name="userid" lay-verify="title" autocomplete="off"  class="layui-input">
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label">用户名</label>
									<div class="layui-input-block">
										<input  type="text" id="username" name="username" lay-verify="required" autocomplete="off" placeholder="请输入修改的用户名" class="layui-input">
									</div>
								</div>
								
								<div class="layui-form-item">
									 <label class="layui-form-label">修改密码</label>
										    <div class="layui-input-inline">
										      <input id="pwdone" type="password" name="pwd" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
										    </div>
										    <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
								</div>
								<div class="layui-form-item">
									 <label class="layui-form-label">确定密码</label>
										    <div class="layui-input-inline">
										      <input id="pwdontwo" type="password" name="pwd2" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
										    </div>
										    <div class="layui-form-mid layui-word-aux">请再次输入密码</div>
								</div>
																																						
								<div class="layui-form-item">
									<div class="layui-input-block">
										<button class="layui-btn  layui-btn-normal" lay-submit="" lay-filter="demo1" id ="modification">确定修改</button>
										<button type="reset" class="layui-btn layui-btn-primary">重置</button>
									</div>
								</div>
							</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="layui-footer" style="margin-top: 20px;margin-bottom: 30px.;text-align: center;">
			<div class="layui-main">
				<p style="font-size: 15px;color: #c2c2c2;margin-top: 25px;text-align:center;margin-bottom: 50px;">©
					2019 云南工商学院&nbsp;计算机科学与技术</p>
			</div>
		</div>
		
 <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
  <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="layui/layui.js" charset="utf-8"></script>
    
    <script>
				layui.use(['form','layer'], function(){
					var layer = layui.layer
					var form = layui.form;	  
					var $ = layui.jquery;					
					/* 修改信息 */
					$("#modification").click(function(){
						
						var userid=$("#userid").val().trim();
						var username=$("#username").val().trim();
						var passwordone=$("#pwdone").val().trim();
						var passwordtwo=$("#pwdtwo").val().trim();
				
						if(userid==null || userid=="" || userid==undefined){
							$("#userid").focus();
							return;
						}
					 	if(username==null || username=="" || username==undefined){
							$("#username").focus();
							return;
						}
						if(passwordone==null || passwordone=="" || passwordone==undefined){
							$("#pwdone").focus();
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
						
						 var index = layer.load(0, {shade: 0.1});
						$.ajax({
		 					 url : 'userinfomodel/userinfo?userid='+userid+'&password='+passwordtwo+'&username='+username, 
							datatype : 'json',
							success : function(data) {
								if (data.code == 0) {
									window.location.href = "login.jsp";
								} else {
									layer.alert(/* data.msg */'修改失败!', {icon: 2});
									layer.close(index);
									$("input").val("");
								}
							},
							error:function(e){
			    	        	 layer.alert(e.msg); 	
								 layer.alert('用户信息修改失败!', {icon: 2});							 
			    	        }
						}); 						
					});					
				});
			</script>
    
    
<!-- <script>
layui.use(['form', 'layedit', 'laydate'], function(){
var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //自定义验证规则
  form.verify({
  password: [
      /^[\S]{6,12}$/
      ,'密码必须6到12位，且不能出现空格'
    ]
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  
	 //表单初始赋值
  form.val('example', {
    "username": "贤心" // "name": "value"
    ,"password": "123456"
    ,"interest": 1
    ,"like[write]": true //复选框选中状态
    ,"close": true //开关状态
    ,"sex": "女"
    ,"desc": "我爱 layui"
  })
  
	
});

   function formCheck(){
       var pwd1 = document.getElementById("pwd1").value;
       var pwd2 = document.getElementById("pwd2").value;
       if(pwd1!=pwd2){
       alert("两次输入的密码不一致！");
       return false;
       }
       return true;
    }
</script> -->

<script type="text/javascript">
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
