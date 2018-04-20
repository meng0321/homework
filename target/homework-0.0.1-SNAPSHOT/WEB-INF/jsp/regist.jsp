<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="regist">
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
.but {
	background-color: #FFA500;
	font-size: 20px;
	border-radius: 2px;
	border: 0px;
	color: white;
	height: 40px;
	width: 300px;
}

.inp {
	height: 40px;
	width: 300px;
}

.body {
	background-position: 50% 50%;
	background-repeat: no-repeat;
	background: url(../image/regist1.jpg);
	background-size: 100%;
	leftmargin: 0px;
	topmargin: 0px;
}

.h1-1 {
	color: white;
	text-align: center;
	position: absolute;
	top: 20%;
	left: 38%;
	font-size: 40px;
}
.div-0 {
position: absolute;
right:20px;
top:20px;
width:150px;
height:23px;
}
.div-1 {
	position: absolute;
	top: 32%;
	left: 42%;
}
.a1{
color:#FFA500;
text-decoration: none;
}
</style>
<script type="text/javascript">
	function submit(){	
		var pwd = $("#pwd").val();
		var pwd1 = $("#pwd1").val();
		if(pwd != pwd1){
			alert("两次输入的密码不一致！");
			return false;
		}			
		$.ajax({
		type:"POST",
		dataType:"json",
		url: "<%=basePath%>/user/regist",
		data: $('#form-regist').serialize(),
		success: function (data) {
        console.log(data);//打印服务端返回的数据(调试用)
        if (data.operFlag == '1000') {   	
            window.location.href="<%=basePath%>/user/regist_success";
          }else if(data.operFlag == '1001'){
          	$(".abc").html(data.errorMessage);
          	$(".abc").show();
          };
        },
	        error : function(request) {
          alert("异常！");
        }
      });
    }
</script>
<title>用户注册</title>
</head>
<body class="body">
	<div class="div-0">
		<p style="color:red">已有账号，直接<a href="<%=basePath%>/user/toLogin" class="a1"> 登录</a></p>
	</div>
	
	<h1 class="h1-1">Hello，Welcome back！</h1>
	
	<div class="div-1">
		<form id="form-regist" style="color: white">
			<br />
			<br />
			<div align="center">
				<input class="inp" id="1" placeholder="&nbsp&nbsp请输入用户名" type="text" name="name"><br><br>
				<input class="inp" placeholder="&nbsp&nbsp请输入密码" type="password" name="password" id="pwd"><br><br>
				<input class="inp" placeholder="&nbsp&nbsp请确认密码" type="password" name="password0" id="pwd1"><br><br>
				<div style="margin-top:20px;margin-bottom: 20px; height: 40px;">
					<span class="abc" style="display:none;"></span>
				</div>
			</div>
		</form>
		<div>
			<div>
				<button class="but" type="button" onclick="submit()">立即注册</button>
			</div>
		</div>
	</div>
</body>
</html>