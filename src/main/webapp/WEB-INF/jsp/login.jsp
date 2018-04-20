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
  <style type="text/css">
  	#content{
  		background: transparent; /*背景透明*/
	    border: 2px solid rgba(255,255,255,0.3); /*边框半透明*/
	    box-shadow: inset 0 0 4px rgba(255,255,255,0.2),0 0 4px rgba(255,255,255,0.2);  /*内外渐变阴影*/
	    position:absolute; 
	    top:38%; 
	    left:43%;
	    margin:-50px 0 0 -100px;
	    height:280px;
	    width:340px;
  	}
  	input,textarea {
  		font-size: 16px;
  		color: white;
  	}
  	#input1 {
  		height:30px;
  		width: 280px;
  		background: transparent; /*背景透明*/
	    border: 2px solid rgba(255,255,255,0.3); /*边框半透明*/
	    box-shadow: inset 0 0 4px rgba(255,255,255,0.2),0 0 4px rgba(255,255,255,0.2);  /*内外渐变阴影*/
  	}
  	#button1 {
  	height:40px;
  	width: 284px;
  	border-radius:4px;
  	background-color:#4169E1;
  	color:#F0FFF0;
  	padding: 0px;
  	border: 0px;
  	margin-left: 28px;
  	margin-right: 28px;
  	margin-top: 15px;
  	}
  	a {
  		color: #F0F0F0;
  		font-size: 14px;
  		margin-left: 190px;
  	}
    input::-webkit-input-placeholder {
	    /* placeholder颜色  */
	    color: #F0FFF0;
	    /* placeholder字体大小  */
	    font-size: 14px;
	    /* placeholder位置  */
	    text-align: left;
  }
  </style>
</head>

<body leftmargin="0px" topmargin="0px"
	style="background:url(../image/11.jpg);height: auto;width: auto;">
	<img src="../image/head_.jpg" style="border-radius: 50%;position:absolute; top:20%; left:44.5%; height: 10%">
	<div id="content" align="center">
		<div id="form-div" style="margin: auto">
			<div style="color:red;">
				<strong>${message}</strong>
			</div>
			<form id="form1">
				<h2 class="form-signin-heading" align="center" style="color:#DAA520">用户登录</h2>
				<input type="text" name="name" placeholder="请输入用户名。。。" id="input1"/><br><br> 
				<input type="password" name="password" placeholder="请输入密码。。。" id="input1"><br>
				<br>
				<div class="checkbox">
					<label style="color:#F0F0F0;font-size: 14px;"><input type="checkbox" value="remember-me">记住我</label>
					<a href="<%=path%>/user/toRegist">注册</a>
				</div>
				<button type="button" value="login" onclick="login()" id="button1">登录</button>				
			</form>
		</div>
	</div>
</body>
</html>