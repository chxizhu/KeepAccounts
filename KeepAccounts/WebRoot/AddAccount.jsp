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
                   <select name="interest" lay-filter="aihao"  class="layui-input">
        <option value="">请选择资金类型</option>
        <option value="0">收入</option>
        <option value="1" >支出</option>       
      </select>
              </div>
              <label  class="layui-form-label">
                  <span class="x-red">*</span>金额
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="" name="" required="" 
                  autocomplete="off" class="layui-input">
              </div>
               <label  class="layui-form-label">
                  <span class="x-red">*</span>类型
              </label>
              <div class="layui-input-inline">
                   <select name="interest" lay-filter="aihao"  class="layui-input">
        <option value="">请选类型</option>
        <option value="0">收入</option>
        <option value="1" >支出</option>       
      </select>
              </div>
          </div>                   
          <div class="layui-form-item">
              <label  class="layui-form-label">
                 备注
              </label>
               <div class="layui-input-inline" style="width: 41.5%;">
     				 <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
   				 </div>
   				  <label class="layui-form-label">
                  <span class="x-red">*</span>添加时间
              </label>
              <div class="layui-input-inline">
                  <input type="text" placeholder="选择日期" id="time" name="time"
                  autocomplete="off" class="layui-input">
              </div>
               <button  class="layui-btn" lay-filter="add" style="margin-top: 5%;margin-left: -6.7%;">
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