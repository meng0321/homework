<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>My JSP 'topNav.jsp' starting page</title>  
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:include page="FileList.jsp"/>
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
			<ul class="nav navbar-nav">
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
		<span style="position: absolute;right:80px;top:15px;;">
			<a href="${pageContext.request.contextPath}/user/toLogin" style="color: white;">退出</a>
		</span>
	</nav>
	</div>
  </body>
</html>
