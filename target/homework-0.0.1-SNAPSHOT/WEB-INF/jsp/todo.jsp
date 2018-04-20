<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
   	<title>待办事项</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 引入公共jsp -->
	<%@include file="FileList.jsp"%>
	<!-- 引入顶端导航栏 -->
	<%@include file="topNav.jsp"%>	
	<!-- 引入左侧导航栏 -->
	<%@include file="LeftList.jsp"%>

  </head>
  <script type="text/javascript">
	  var urlstr = location.href; 
	  console.log(urlstr); 
	  //alert((urlstr + '/').indexOf($(this).attr('href')));
	  var urlstatus=false;
	  $("#left li").each(function () {
	    if ((urlstr).indexOf($(this).attr('href')) > -1 && $(this).attr('href')!='') {
	      $(this).addClass('cur'); 
	      urlstatus = true;
	    } else {
	      $(this).removeClass('cur');
	    }
	  });
	  if (!urlstatus) {$("#left li").eq(1).addClass('cur');}
</script>
  
  <body>
    <div class="right-main" style="float:left;margin-left:0px;margin-top:50px;">
		<h1>待办事项</h1>
	</div>
  </body>
</html>
