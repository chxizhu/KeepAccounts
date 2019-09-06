<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
  </head>
    <body>
    	<div class="">
    		<ul class="layui-nav layui-bg-orange">
  <li class="layui-nav-item"><a href="GreetLogin.jsp">首页</a></li>
  
  <li style="margin-left: 80px;"class="layui-nav-item"><a href="Accounting.jsp">记账查询</a></li>
  
  <li style="margin-left: 80px;" class="layui-nav-item"><a href="AddAccount.jsp">添加记账</a></li>
  <li style="margin-left:650px" class="layui-nav-item">Nice to meet you：</li>
  <li class="layui-nav-item"><a href="">张遮天</a>
  	 <dl class="layui-nav-child">
      <dd><a href="javascript:;">修改信息</a></dd>  
      <dd><a href="javascript:;">退出</a></dd>
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
    	<div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
        	
   		 <div class="layui-input-inline" >
      <select id="moneyType" name="interest" lay-filter="aihao"  class="layui-input">
        <option value="">请选择资金类型</option>
        <option value="0">收入</option>
        <option value="1" >支出</option>       
      </select></div>
   		
         <input type="text" name="starttime" id="starttime" lay-verify="date" placeholder="开始时间" autocomplete="off" class="layui-input">
	     <input type="text" name="endtime" id="endtime" lay-verify="date" placeholder="结束时间" autocomplete="off" class="layui-input">
          
          <button id="queryBill" class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
        
        <!-- 表格开始 -->
			<table class="layui-hide" name="accounting" id="accounting" lay-filter="accounting"></table>
			<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		    </script>
			<!-- 表格结束 -->
        
 	</body>
</html>
<script>
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
							id: 'accounting',
							url: '../accountingmodel/accounting',
							title: '用户账单',
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
								
								var parm = '?moneyType=' + selectid +'&starttime=' + method+'&endtime=' + realname;
								
								table.render({
										elem: '#adminUser',
										id: 'adminUser',
										url: '../accountingmodel/accountingByCondition' + parm,
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
		    table.on('tool(adminUser)', function(obj) {
			var data = obj.data;
			$("#txtclaid").text(data.roleid);
			$("#txtadminuserrealname").text(data.rolename);
			$("#txtadminuserusertype").text(data.authorityId);
			
			
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
			        		url: "../systemmodel/deleteFile?billid=" + data.billid,
			        		dataType: 'json',
			        		success:function(data){
			        			if(data.code == 0){
			        				layer.confirm(data.msg, {
									  btn: ['确定']
									}, function(){
										table.reload("accounting", { //此处是上文提到的 初始化标识id
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