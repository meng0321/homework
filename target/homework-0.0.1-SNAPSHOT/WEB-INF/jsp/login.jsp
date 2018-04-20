<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="ajax方式">
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
    function login() {
      $.ajax({
        type: "POST",//方法类型
        dataType: "json",//服务端接收的数据类型
        url: "<%=basePath%>/user/login",//url
        data: $('#form1').serialize(),
        //async:false,
        success: function (data) {//这个参数不要用request这种的已经存在含义的名字ok
          console.log(data);//打印服务端返回的数据(调试用)
          if (data.operFlag == '1000') {
            alert("SUCCESS");
            window.location.href="<%=basePath%>/index.jsp";
          }else if(data.operFlag == '1001'){
          	alert(data.errorMessage);
          };
        },
        error : function(request) {
          alert("异常！");
        }
      });
    }
  </script>
</head>

<body leftmargin="0px" topmargin="0px"
	style="background-position:50% 50%;background-repeat:no-repeat;background:url(../image/background.jpg);background-size:100%">
	<div id="content"
		style="position:absolute; top:35%; left:43%;  margin:-50px 0 0 -100px;background-color:#EBEBEB;height:240px;width:400px;border:1px solid lightgrey; border-radius:25px;"
		align="center">
		<div id="form-div">
			<div style="color:red;">
				<strong>${message}</strong>
			</div>
			<form id="form1">
				<h2 class="form-signin-heading" align="center" style="color:#DAA520">用户登录</h2>
				用户名&nbsp&nbsp&nbsp<input type="text" name="name" /><br><br> 
				密  &nbsp 码&nbsp&nbsp&nbsp<input type="password" name="password"><br>
				<br>
				<div class="checkbox">
					<label style="color:grey;font-size: 9px;"> <input type="checkbox" value="remember-me">记住我</label>
				</div>
				<br>
				<button type="button" value="login" onclick="login()" style="border-radius:4px;background-color:#4169E1;color:#F0FFF0;width:65px;height:30px">登陆</button>
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<a href="<%=path%>/user/toRegist"><button type="button" style="border-radius:4px;background-color:#4169E1;color:#F0FFF0;width:65px;height:30px">注册</button>
				</a>
			</form>
		</div>
	</div>
</body>
</html>