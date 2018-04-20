<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:include page="FileList.jsp"/>
  </head>
  
  <body>  
		<div class="div-content">
		<div class="div-main" style="float:left">
			<div class="sidebar-fold">
				<span class="glyphicon glyphicon-menu-hamburger"></span>
			</div>
			<div class="left-main left-full" id="left">						
				<li id="1"><a href="<%=basePath%>account/getAllAccount"><span class="glyphicon glyphicon-user"></span><span class="sub-title">账号管理</span></a></li>
				<li id="2"><a href="<%=basePath%>user/todo"><span class="glyphicon glyphicon-star"></span><span class="sub-title">待办事项</span></a></li>
				<li id="3"><a href="<%=basePath%>user/personal"><span class="glyphicon glyphicon-star"></span><span class="sub-title">个人中心</span></a></li>
				<li><a href="#"><span class="glyphicon glyphicon-list"></span><span class="sub-title">个人计划</span></a></li>
				<li><a href="www.baidu.com" target="test"><span class="glyphicon glyphicon-book"></span><span class="sub-title">我的笔记</span></a></li>
			</div>
		</div>
		<div class="right-main" style="float:left;margin-left:0px;">
		
		</div>
	</div>
  </body>
</html>