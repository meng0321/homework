<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
	#btn-group {
		margin-bottom: 20px;
		position: relative;
		margin-left: 70.2%;
		float: left;
	}
	button {
		width: 70px;
		padding: 0px;
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
	<div class="input-group" style="float: left">  
       <input type="text" class="form-control"placeholder="搜索" style="width: 180px;margin-left: 20px;"/>  
           <button class="btn-info" id="search" style="height: 34px;width: 45px;border: 0px;"><span class="glyphicon glyphicon-search"></span></button>   
	 </div> 
	<div class="btn-group" id="btn-group">
	    <button type="button" class="btn btn-success" onclick="show_modal();"><span class="glyphicon glyphicon-plus" style="margin-right: 4px;"></span><span>新增</span></button>
	    <button type="button" class="btn btn-warning" onclick="update();"><span class="glyphicon glyphicon-pencil" style="margin-right: 4px;"></span><span>修改</span></button>
	    <button type="button" class="btn btn-danger" onclick="del();" ><span class="glyphicon glyphicon-minus" style="margin-right: 4px;"></span><span>删除</span></button>
	</div>
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
						<td class="selectColumn"><input type="radio" id="userSelect" name="userSelect" value="${account.id}" /></td>
						<td align="center">${account.id }</td>
						<td align="center">${account.account }</td>
						<td align="center">${account.name }</td>
						<td align="center">${account.age }</td>
						<td align="center">
						<c:if test="${account.sex == '1' }">男</c:if>
						<c:if test="${account.sex == '2' }">女</c:if>
						</td>						
						<td><fmt:formatDate value="${account.creatime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
            <div>
            <form id="form-addAccount">
				<table class="table table-striped" contenteditable="true">
						<tr class="active">
							<td style="width: 100px; font-size: 16px;text-align: center">账 号</td>
							<td>
								<input placeholder="请输入用户的手机号..." style="width:300px;height: 30px;position: relative;"  id="account">
							</td>
						</tr>
						<tr class="success">
							<td>姓名</td>
							<td><input id="name"></td>
						</tr>
						<tr class="warning">
							<td>年龄</td>
							<td><input id="age"></td>
						</tr>
						<tr class="danger">
							<td>性别</td>
							<td>
								<form>
									<input name="sex" type="radio" value="1" id="sex">男

									<input name="sex" type="radio" value="2" id="sex">女
								</form>
							</td>
						</tr>
						<tr class="info">
							<td>金额</td>
							<td><label><input id="amount"></label></td>
						</tr>
					
				</table>
				</form>
				</div>
				<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="id_ad_search" onclick="submit()">
                 	   提交更改
                </button>
            	</div>
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
    //删除方法
	function del(){
		var id = $("#userSelect").val();
		$.post("<%=basePath%>account/deleteAccount",{
		'id':id
		}
		)
	}
    //添加用户模态框中的提交按钮方法
    function submit(){
    	var account = $("#account").val();
		var name = $("#name").val();
		var age = $("#age").val();
		var sex = $("#sex").val();
		var amount = $("#amount").val();
		//判断不能为空
		if(account==""){
			alert("账号不能为空");
			return false;
		}
		if(name==""){
			alert("姓名不能为空");
			return false;
		}
		if(age==""){
			alert("年龄不能为空");
			return false;
		}
		$.post("<%=basePath%>account/addAccount",{
		'account':account,
		'name':name,
		'age':age,
		'sex':sex,
		'amount':amount
		}
		)
    }
</script>

</div>
</body>

</html>
