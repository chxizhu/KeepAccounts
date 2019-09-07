<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
  
  <!-- <li style="margin-left: 80px;" class="layui-nav-item"><a href="AddAccount.jsp">添加记账</a></li> -->
  <li style="margin-left:650px" class="layui-nav-item">Nice to meet you：</li>
  <li class="layui-nav-item"><a href="">张遮天</a>
  	 <dl class="layui-nav-child">
      <dd><a href="javascript:;">修改信息</a></dd>  
      <dd><a href="javascript:;">退出</a></dd>
    </dl>
  </li>
</ul>	
    	</div>
    	<div class="layui-row" style="margin-top: 20px;margin-left: 12%;">
    	<form class="layui-form">
          <div class="layui-form-item">
              <label class="layui-form-label">
                  <span class="x-red">*</span>类别
              </label>
              <div class="layui-input-inline">
                   <select name="interest" lay-filter="aihao"  class="layui-input" id="operation">
        <option value="">请选择资金类型</option>
        <option value="收入">收入</option>
        <option value="支出" >支出</option>       
      </select>
              </div>
              <label  class="layui-form-label">
                  <span class="x-red">*</span>金额
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="money" name="" required="" 
                  autocomplete="off" class="layui-input">
              </div>
               <label  class="layui-form-label">
                  <span class="x-red">*</span>类型
              </label>
              <div class="layui-input-inline">
                   <select name="interest" lay-filter="aihao"  class="layui-input" id="category">
        <option value="">请选类型</option>
        <option value="餐饮">餐饮</option>
        <option value="购物" >购物</option>       
        <option value="交通">交通</option>
        <option value="住宿" >住宿</option>
        <option value="医疗">医疗</option>
        <option value="旅行" >旅行</option>
        <option value="学习">学习</option>
        <option value="通讯" >通讯</option>
        <option value="其他" >其他</option>
      </select>
              </div>
          </div>                   
          <div class="layui-form-item">
              <label  class="layui-form-label">
                 备注
              </label>
               <div class="layui-input-inline" style="width: 41.5%;">
     				 <textarea placeholder="请输入内容" class="layui-textarea" name="remarks" id="remarks"></textarea>
   				 </div>
   				  <label class="layui-form-label">
                  <span class="x-red">*</span>添加时间
              </label>
              <div class="layui-input-inline">
                 <input type="text" placeholder="选择日期" id="time" name="time" autocomplete="off" class="layui-input">                                  
              </div> 
                                     
               <button  class="layui-btn" id="addcount-button" lay-filter="add" style="margin-top: 5%;margin-left: -6.7%;">
                  添加
              </button>
   				</div>
             
          </div>
                       
      </form>
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
    	   	
 	</body>
 	
 	<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
  <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="layui/layui.js" charset="utf-8"></script>
    
        
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
							id: 'accountingID',
							url: 'addaccountmodel/accounting',
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
						/* $("#queryBill").click(
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
							}); */
							
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
			        		url: "addaccountmodel/deleteBill?billid=" + data.billid,
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
 	
</html>
