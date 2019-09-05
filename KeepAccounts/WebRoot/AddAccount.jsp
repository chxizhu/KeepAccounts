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
  <li class="layui-nav-item"><a href="GreetLogin.html">PAS</a></li>
  
  <li style="margin-left: 80px;"class="layui-nav-item"><a href="Accounting.html">Index</a></li>
  
  <li style="margin-left: 80px;" class="layui-nav-item"><a href="AddAccount.html">AddAccount</a></li>
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
                  <input type="text" placeholder="选择日期" id="time" name="time"
                  autocomplete="off" class="layui-input">
              </div>
               <button  class="layui-btn" id="addcount-button" lay-filter="add" style="margin-top: 5%;margin-left: -6.7%;">
                  添加
              </button>
   				</div>
             
          </div>
         
          
         
      </form>
      </div>
    	
    	
    	<div class="layui-row">       
        <table class="layui-table" style="width: 70%;margin-left:15%;">
        <thead>
          <tr>          
            <th>id</th>
            <th>类别</th>
            <th>备注</th>
            <th>金额</th>
            <th>类型</th>
            <th>时间</th>          
            <th>操作</th>
        </thead>
        <tbody>
          <tr>          
            <td>1</td>
            <td>收入</td>
            <td>买大象</td>
            <td>250</td>
            <td>钱多</td>           
            <td>2017-01-01 11:11:42</td>          
            <td class="td-manage">             
              <a title="查看"  onclick="x_admin_show('查看','')" href="javascript:;">
                <i class="layui-icon">&#xe642;</i>
              </a>
               <a title="编辑"  onclick="x_admin_show('编辑','')" href="javascript:;">
                <i class="layui-icon">&#xe642;</i>
              </a>
            </td>
          </tr>
        </tbody>
      </table>
      <div class="page">
        <div>
          <a class="prev" href="">&lt;&lt;</a>
          <a class="num" href="">1</a>
          <span class="current">2</span>
          <a class="num" href="">3</a>
          <a class="num" href="">489</a>
          <a class="next" href="">&gt;&gt;</a>
        </div>
      </div>
      </div>
 	</body>
</html>
<script>
	 layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#time' //指定元素
          ,type: 'datetime'
        });
        
      })
</script>
<script>
				layui.use(['form','layer'], function(){
					var layer = layui.layer
					var form = layui.form;	  
					var $ = layui.jquery;
										
					/* 点击登录 */
					$("#addcount-button").click(function(){
						
						var operation=$("#operation").val().trim();
						var time=$("#time").val().trim();
						var money=$("#money").val().trim();
						var category=$("#category").val().trim();
						var remarks=$("#remarks").val().trim();
				
				
						 var index = layer.load(0, {shade: 0.1});
						$.ajax({
		 					 url : 'addaccountmodel/addaccount?operation='+operation+'&billtime='+time+'&money='+money+'&category='+category+'&remark='+remarks, 
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