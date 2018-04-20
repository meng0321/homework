<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">    
    <title>账号管理</title>   
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
	<style type="text/css">
	.table-striped>tr>td{
	font-size: 20px;
	}
	</style>
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
	  if (!urlstatus) {$("#left li").eq(0).addClass('cur');}
</script>

<body>
<div class="right-main" style="float:left;margin-left:0px;margin-top:50px;">	
<div class="div-3" style="margin: 25px 60px 60px;background-color: white">
	<h1 style="padding-top: 20px;">账号管理</h1>
	<hr style="border:2px solid #eee;">
	<a role="button" class="btn" data-toggle="modal" onclick="show_modal();" style="background-color: #f5f5f5;color: #333333;position: absolute;right:80px;top:50px;">添加用户</a>
	<!-- account表单 -->		  
	<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<table class="table" align="center" >
				<thead>
					<tr>
					<th class="selectColumn" >选择</th>
		   			<th>序号</th>
		   			<th>账号</th>
		   			<th>名字</th>
		   			<th>年龄</th>
		   			<th>性别</th>
		   			<th>创建时间</th>
		   			<th>创建日期</th>
		   			<th>创建人</th>
		   			<th>金额</th>
		   			<th>更新时间</th>
		   			<th>状态</th>
		   			</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list }" var="account">
					<tr>
						<td class="selectColumn"><input type="radio" name="userSelect" value="${account.id}" /></td>
						<td align="center">${account.id }</td>
						<td align="center">${account.account }</td>
						<td align="center">${account.name }</td>
						<td align="center">${account.age }</td>
						<td align="center">${account.sex }</td>
						<td align="center">${account.creatime }</td>
						<td align="center">${account.createdate }</td>
						<td align="center">${account.createuser }</td>
						<td align="center">${account.amount }</td>
						<td align="center">${account.updatetime }</td>
						<td align="center">${account.status }</td>
					</tr>
				</c:forEach>						
				</tbody>
			</table>
		</div>
	</div>
	</div>
	<div>
	
	<!-- 分页 -->
	<p style="position: absolute;left: 9%;">共${page.totalRecord }条数据/共${page.totalPage}页</p>		  
	<p style="position: absolute;right: 9%;">跳转到：<input style="width: 30px;" id="turnPage"> 页&nbsp
		  <button class="btn btn-primary btn-mini" type="button" onclick="return startTurn()">跳转</button>
	</p>
	<ul class="pagination">
	<li><a href="account/getAllAccount?page.currentPage=0">首页</a></li>
    <li><a href="account/getAllAccount?currentPage=${page.currentPage-1}" onclick="return previousPage()">上一页</a></li>
<!--     <li><a href="#">${page.start }</a></li> -->
    <li><a>${page.currentPage }</a></li>
<!--     <li><a href="#">${page.end }</a></li> -->
    <li><a href="account/getAllAccount?currentPage=${page.currentPage+1}" onclick="return nextPage()">下一页</a></li>
    <li><a href="account/getAllAccount?currentPage=${page.totalPage}">尾页</a></li>
	</ul>
	</div>		  		   
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel"> 新增用户</h4>
            </div>
            <div class="modal-body">
				<table class="table table-striped" contenteditable="true">
						<tr class="active">
							<td style="width: 100px; font-size: 16px;text-align: center">账 号</td>
							<td>
								<input placeholder="请输入用户的手机号..." style="width:300px;height: 30px;position: relative;">
							</td>
						</tr>
						<tr class="success">
							<td>姓名</td>
							<td><input></td>
						</tr>
						<tr class="warning">
							<td>年龄</td>
							<td><input></td>
						</tr>
						<tr class="danger">
							<td>性别</td>
							<td>
								<form>
									<input name="sex" type="radio">男
									<input name="sex" type="radio">女
								</form>
							</td>
						</tr>
						<tr class="info">
							<td>金额</td>
							<td><input></td>
						</tr>
				</table>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="id_ad_search" onclick="submit()">
                 	   提交更改
                </button>
            	</div>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script>
	function previousPage(){
        if(${page.currentPage-1>=1}){
           return true;       
         } 
         alert("已到页首,无法加载更多");    
         return false;      
    }
    function nextPage(){
    	if(${page.currentPage+1}<=${page.totalPage}){
    		return true;
    	}
    	alert("已经是最后一页，无法加载更多");
    	return false;
    }
    
	//显示模态框
    function show_modal() {
         $('#myModal').modal('show');
    }
	//跳转按钮-跳转方法
    function startTurn(){
		var turnPage = document.getElementById("turnPage").value;
		if(turnPage > ${page.totalPage}){
		    alert("超过最大限制");
		    return false;
		}
        var shref="account/getAllAccount?currentPage="+turnPage;

        window.location.href=shref;
    }
    $(function () {
        $('#id_ad_search').click(function () {
           var name = $('#id_name').val();
            $.ajax({
                url:'/test',
                data:{name:name},
                complete:function () {
                    $('#myModal').modal('hide');
                }
            });
        });
    });
	function submit() {
        $.ajax({
		type:"POST",
		dataType:"json",
		url: "<%=basePath%>account/addAccount",
		data: $('#id_ad_search').serialize(),
		success: function (data) {
			console.log(data);//打印服务端返回的数据(调试用)
			if (data.operFlag == '1000') {
				alert("添加成功");
			}else if(data.operFlag == '1001'){
				alert("添加失败");
			};
		},
		error : function(request) {
			alert("异常！");
		}
	});
    }
</script>
</div>
</div>
</body>

</html>
