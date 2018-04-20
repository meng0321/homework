<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<!-- 引入CSS -->  
   	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css"> 
	<!-- 引入bootstrap -->
 	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
    <title>管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	
  </head>
  
  <body>
  <div>
  	<div class="div-top">
    <nav class="navbar" role="navigation">
<!--  		<div class="container-fluid">  -->
		<div class="navbar-header">			
			<a class="navbar-brand" href="<%=basePath%>index.jsp">管理控制台</a>
		</div>
 		<div>
			<ul class="nav navbar-nav" id="nav">
				<li><a href="#">测试管理</a></li>
				<li><a href="#">需求管理</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						项目管理
						<b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">前端</a></li>
						<li><a href="#">后端</a></li>
						<li><a href="#">SQL</a></li>
					</ul>
				</li>
			</ul>
		</div>
<!-- 		</div> -->
	</nav>
	</div>
	
	<div class="div-content">
		<div class="div-main" style="float:left">
			<div class="sidebar-fold">
				<span class="glyphicon glyphicon-menu-hamburger"></span>
			</div>
			<div class="left-main left-full" id="left">						
				<li><a href="<%=basePath%>account/getAllAccount"><span class="glyphicon glyphicon-user"></span><span class="sub-title">账号管理</span></a></li>
				<li><a href="<%=basePath%>user/todo"><span class="glyphicon glyphicon-star"></span><span class="sub-title">待办事项</span></a></li>
				<li><a href="<%=basePath%>user/personal"><span class="glyphicon glyphicon-star"></span><span class="sub-title">个人中心</span></a></li>
				<li><a href="#"><span class="glyphicon glyphicon-list"></span><span class="sub-title">个人计划</span></a></li>
				<li><a href="www.baidu.com" target="test"><span class="glyphicon glyphicon-book"></span><span class="sub-title">我的笔记</span></a></li>
			</div>

		</div>
		<div class="right-main" style="float:left;margin-left:0px;background-color: #f5f5f5">
			<img alt="" src="./image/index.jpg" style="width: 100%;height: 100%;">
		</div>
		
	</div>

 </div>	
  </body>
