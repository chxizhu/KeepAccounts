<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>  
	<title>个人记账系统</title>
	<meta charset="UTF-8">
	<!-- <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" /> -->

   <!--  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
	<link rel="stylesheet" href="./css/xadmin.css"> -->
	
	<link rel="stylesheet" href="layui/css/layui.css">
          
  </head>
    <body>
    
    	<div class="">
    		<ul class="layui-nav layui-bg-orange">
  <li class="layui-nav-item"><a href="GreetLogin.jsp">首页</a></li>
  
  <li style="margin-left: 80px;"class="layui-nav-item"><a href="Accounting.jsp">记账查询</a></li>
  
  <li style="margin-left: 80px;" class="layui-nav-item"><a href="AddAccount.jsp">添加记账</a></li>
  <li style="margin-left:650px" class="layui-nav-item">欢迎您：</li>
  <li class="layui-nav-item"><a href="javascript:;"><%=request.getSession().getAttribute("username") %></a>
  	 <dl class="layui-nav-child">
      <dd><a href="UserInformationEdit.jsp">修改信息</a></dd>  
      <dd><a id="loginout" class="loginout" href="javascript:" >退出</a></dd>
    </dl>
  </li>
</ul>	
    	</div>
    	
    	<div class="layui-row" style="margin-top: 20px;margin-left: 35%;">
    		 <div class="layui-input-inline" >
 		<div font style="font-size: 15px;">总收入：<font style="font-size: 20px;" color= "lawngreen"> +500</font></div>		
 		</div>
    	</div>
    	<div class="layui-row" style="margin-top: 20px;margin-left: 35%;">
  		<div font style="font-size: 15px;">总支出：<font style="font-size: 20px;" color= "red"> - 200</font></div>
    	</div>
    	
    	<div class="layui-container">  
    	<div class="layui-row">
    	 <div class="layui-col-md12">
    	
        
        <form class="layui-form" action="">

					<!-- <div class="layui-inline">
						<select name="type" id="moneyType" lay- filter="type">
							 <option value="">请选择操作</option>
		       				 <option value="收入">收入</option>
        					 <option value="支出" >支出</option>     
							
						</select>
					</div>
				
				     <div class="layui-input-inline">
				                   时间：
				      </div>
				      <div class="layui-input-inline">
				            
				        <input type="text" name="starttime" id="starttime" lay-verify="date" placeholder="开始时间" autocomplete="off" class="layui-input">
				       </div>
				       <div class="layui-input-inline">
				        <input type="text" name="endtime" id="endtime" lay-verify="date" placeholder="结束时间" autocomplete="off" class="layui-input">
				      </div>
					<div class="layui-inline">
						 <button id="queryBill" class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
					</div> -->
					
					<div class="layui-input-inline">
						<select name="type" id="moneyType" lay- filter="type">
							 <option value="">请选择操作</option>
		       				 <option value="收入">收入</option>
        					 <option value="支出" >支出</option>     							
						</select>
					</div>
				
				<div class="layui-inline"> 
				  	<input type="text" class="layui-input" name="starttime" id="starttime" placeholder="开始时间"  placeholder="yyyy-MM-dd">
				</div>
				 
				<div class="layui-inline"> 
				  	<input type="text" class="layui-input" name="endtime" id="endtime" placeholder="结束时间"  placeholder="yyyy-MM-dd">
				</div>
					
				<div class="layui-inline">
					<button class="layui-btn layui-bg-blue" id="queryBill" >查询</button>
				</div>
					
				</form>
        
        </div>
         </div>
         </div>
        
        
        	<div class="layui-container">  
		  <div class="layui-row">
		    <div class="layui-col-md12">
		        <!-- 表格开始 -->
			<table class="layui-hide" name="accounting" id="accounting" lay-filter="accounting"></table>
			<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		    </script>
		    
			<!-- 表格结束 -->
    </div>
  </div>
  <!-- 页面底部 -->
				<p style="font-size: 15px;color: #c2c2c2;margin-top: 25px;text-align:center;margin-bottom: 50px;">©
					2019 云南工商学院&nbsp;计算机科学与技术</p>
  <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
  <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="layui/layui.js" charset="utf-8"></script>
    
        
        <script>
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
	layui.use(
					['table', 'form', 'layer', 'laytpl', 'element','laydate'],
					function() {
						var table = layui.table,
							form = layui.form,
							layer = layui.layer,
							$ = layui.jquery,
							element = layui.element;
						var laydate = layui.laydate;
						
						    //日期选择
							  laydate.render({
							    elem: '#starttime'
							  });
							  
							  laydate.render({
							    elem: '#endtime'
							  });

						/*加载表格*/
						table.render({
							elem: '#accounting',
							id: 'accountingID',
							url: 'accountingmodel/accounting',
							title: '用户账单',
							skin: 'line',
							even: true,
							cols: [
								[{
									type: 'numbers',
									title: '序号',
									align: 'center',
									width: 80
								}, {
									field: 'uname',
									align: 'center',
									title: '用户名',
								}, {
									field: 'operation',
									align: 'center',
									title: '操作类型',
								}, {
									field: 'category',
									title: '种类',
									align: 'center'
								},{
									field: 'money',
									align: 'center',
									title: '金额(单位：元)'
								}, {
									field: 'billtime',
									align: 'center',
									title: '操作时间',
									templet:'<div>{{ layui.util.toDateString(d.billtime, "yyyy-MM-dd") }}</div>' 
								}, {
									field: 'remark',
									align: 'center',
									title: '备注'
								}, {
									title: '操作',
									toolbar: '#barDemo',
									align: 'center'
								}]
							],
							page: {
								layout: ['prev', 'page', 'next', 'skip',
									'count', 'limit'
								],
								groups: 5,
								limit: 10,
								limits: [10, 20, 30, 40, 50],
								theme: '#1E9FFF',
							},
						});

						/* 点击查询对网站用户进行筛选 */
						$("#queryBill").click(
							function() {

							var moneyType = $("#moneyType").val();
							var starttime = $("#starttime").val();
							var endtime = $("#endtime").val();						
								
								var parm = '?moneyType=' + moneyType +'&starttime=' + starttime+'&endtime=' + endtime;
								
								table.render({
										elem: '#accounting',
										id: 'accountingID',
										url: 'accountingmodel/accountingByCondition' + parm,
										title: '后台用户数据表',
										height: "full-160",
										skin: 'line',
										even: true,
										cols: [
								[{
									type: 'numbers',
									title: '序号',
									align: 'center',
									width: 80
								}, {
									field: 'uname',
									align: 'center',
									title: '用户名',
								}, {
									field: 'operation',
									align: 'center',
									title: '操作类型',
								}, {
									field: 'category',
									title: '种类',
									align: 'center'
								},{
									field: 'money',
									align: 'center',
									title: '金额'
								}, {
									field: 'billtime',
									align: 'center',
									title: '操作时间',
									templet:'<div>{{ layui.util.toDateString(d.billtime, "yyyy-MM-dd") }}</div>'
								}, {
									field: 'remark',
									align: 'center',
									title: '备注'
								}, {
									title: '操作',
									toolbar: '#barDemo',
									align: 'center'
								}]
										],
										page: {
											layout: ['prev',
												'page', 'next',
												'skip',
												'count',
												'limit'
											],
											groups: 5,
											limit: 10,
											limits: [10, 20, 30,
												40, 50
											],
											theme: '#1E9FFF',
										},
									});
							});
							
				//表格工具栏事件 
		    table.on('tool(accounting)', function(obj) {
			var data = obj.data;
			/* $("#txtclaid").text(data.roleid);
			$("#txtadminuserrealname").text(data.rolename);
			$("#txtadminuserusertype").text(data.authorityId); */
			
			
			switch (obj.event) {
				case 'seluser':
					layer.open({
				        type: 1, 
				        title: '管理员信息详情',
				        area: ['600px', '430px'],
				        shade: 0.8,
				        content: $('#adminuserdetail'),
				        btn: ['返回'], 
				        yes: function(){
				          layer.closeAll();
				          $(".adminuserdetail").css("display","none");
				        },
				        cancel: function(){ 
						  $(".adminuserdetail").css("display","none");
						}
				    });
				break;
				
				//删除按钮操作
				case 'del':
					layer.confirm('确定要删除么？', {
					  btn: ['确定','取消'],
					  icon:3
					}, function(){
						$.ajax({
			        		type: 'get',
			        		url: "accountingmodel/deleteBill?billid=" + data.billid,
			        		dataType: 'json',
			        		success:function(data){
			        			if(data.code == 0){
			        				layer.confirm(data.msg, {
									  btn: ['确定']
									}, function(){
										table.reload("accountingID", { //此处是上文提到的 初始化标识id
							                where: {
							                	keyword:data.code=='0'
							                }
							            });	
										layer.closeAll();
									});          				 
			        			}
			        			else{
			        				layer.confirm(data.msg, {
										  btn: ['确定']
									});
			        			}
			        		},
			        		error:function(){
			        			layer.confirm('出现错误，删除失败，请重试！', {
									  btn: ['确定']
								});
			        		},
			        	});   
					}, function(){ 
						layer.closeAll();
					});
				break;
				
			}
			;
		});
							

					});
		</script>
 	</body>
</html>
