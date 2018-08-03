<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <title>更新用户信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/adminia.css" rel="stylesheet" /> 
    <link href="${pageContext.request.contextPath}/css/adminia-responsive.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/pages/plans.css" rel="stylesheet" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>
	
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 				
			</a>
			<a class="brand" href="./">更改用户信息</a>
			<div class="nav-collapse">
				<ul class="nav pull-right">
					<li class="divider-vertical"></li>
					<li class="dropdown">
						<a data-toggle="dropdown" class="dropdown-toggle " href="#">
							${admins.adminname} <b class="caret"></b>							
						</a>
						
						<ul class="dropdown-menu">
							
							<li>
								<a href="${pageContext.request.contextPath}/admin/changepassword.jsp"><i class="icon-lock"></i> 修改密码</a>
							</li>
							
							<li class="divider"></li>
							
							<li>
								<a href="${pageContext.request.contextPath}/logout"><i class="icon-off"></i> 注销</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div id="content">
	<div class="container">
		<div class="row">
			<div class="span3">
				<div class="account-container">
					<div class="account-avatar">
						<img src="${pageContext.request.contextPath}/resource/images/headshot.png" alt="" class="thumbnail" />
					</div>
					<div class="account-details">
						<span class="account-name">${admins.adminname}</span>
						
						<span class="account-role"><c:choose><c:when test="${admins.adminflag == 1}">普通管理员</c:when><c:otherwise>超级管理员</c:otherwise></c:choose></span>
						
						<span class="account-actions">
						</span>
					</div>
				</div>
				<hr />
				<ul id="main-nav" class="nav nav-tabs nav-stacked">
					<li class="active"><a
							href="${pageContext.request.contextPath}/selectUserByExample"> <i
								class="icon-home"></i> 用户管理
						</a></li>

						<li><a
							href="${pageContext.request.contextPath}/selectQuestion?toid=1">
								<i class="icon-th-list"></i> 试题库管理
						</a></li>

						<li><a href="${pageContext.request.contextPath}/admin/questionType.jsp">
								<i class="icon-th-large"></i> 目录管理
						</a></li>

						<li><a
							href="${pageContext.request.contextPath}/logout">
								<i class="icon-signal"></i> 注销
						</a></li>
				</ul>
			</div>

			<div class="span9">
				<div class="row">
					<div class="span9">
						<div class="widget">
							<div class="widget-header">
								<h3>用户基本信息</h3>
							</div>
							<div class="widget-content">
								<div class="tabbable">
							<div class="tab-content">
								<div class="tab-pane active" id="1">
								
								<!-- 下面是表单提交 -->
								
								<form id="edit-profile" class="form-horizontal" action="${pageContext.request.contextPath}/updateUserSecond?pn=${pn}" method="post" />
									<fieldset>
										
										<input type="hidden" name="userno" value="${user.userno}" />
									
										<div class="control-group">											
											<label class="control-label">用户名称：</label>
											<div class="controls">
												<input type="text" class="input-medium " id="username" name="username" value="${user.username}" onkeyup="this.value=this.value.replace(/\s+/g,'')" required="required"/>
											</div>
										</div>
										<div class="control-group">											
											<label class="control-label">用户密码：</label>
											<div class="controls">
												<input type="password" class="input-medium" id="password" name="password" value="${user.password}" required="required" onkeyup="this.value=this.value.replace(/\s+/g,'')"/>
											</div>
										</div>										
										<div class="control-group">											
											<label class="control-label">用户邮箱：</label>
											<div class="controls">
												<input type="email" class="input-medium" id="email" name="email" value="${user.email}" required="required"/>
												<span style="color:red;" id="validMessage"></span>
											</div>
										</div>
										<div class="control-group">											
											<label class="control-label">邮箱验证状态：</label>
											<div class="controls">
												<select id="status"
														class="input-small " name="status" required="required">
														<option <c:if test="${user.status==NULL}">selected</c:if>></option>
												        <option value="1" <c:if test="${user.status == 1}">selected</c:if>>已验证</option>
												        <option value="0" <c:if test="${user.status == 0}">selected</c:if>>未验证</option>
												</select>
													
											</div>
										</div>
										
										<div class="control-group">											
											<label class="control-label">性别：</label>
											<div class="controls">
												<select
														id="sex" class="input-mini disabled"
														name="sex" required="required">
														<option <c:if test="${user.sex==null}">selected</c:if>></option>
												    
												        <option value="男" <c:if test="${user.sex == '男'}">selected</c:if>>男</option>
												        <option value="女" <c:if test="${user.sex == '女'}">selected</c:if>>女</option>
												    
												</select> 
											</div>
										</div>		
										</div>									
										<div class="form-actions">
											<input id="input_submit" type="submit" class="btn btn-primary" value="提交修改" />
											<input type="button" class="btn btn-primary" onclick="javascript:history.back(-1);" value="返回">
										</div>
									</fieldset>
								</form>
								</div>
							</div>
						</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<div id="footer">
	<div class="container">				
		<hr />
		<p>&copy; 2018 答题系统.</p>
	</div>
</div>
<!-- javascript================================================== -->
<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/WebCalendar.js" type="text/javascript"></script>
<script type="text/javascript">

$("#email").change(function(){
	$.ajax({
		url:"${pageContext.request.contextPath}/validEmail?email="+$("#email").val(),
		type:"POST",
		success:function(data){
			if(data){
				$("#validMessage").text("此邮箱可用");
				$("#validMessage").attr("style","color:green");
				$("#input_submit").removeAttr("disabled");
			}
			else{
				$("#validMessage").text("此邮箱不可用");
				$("#validMessage").attr("style","color:red");
				$("#input_submit").attr("disabled","disabled");
			}
		}
	});
});

function validEmpty(){
	//  获取输入框的值
	var name = document.getElementById('username').value;
	if(name == null || name == '' ){
		alert("用户名称不能为空！");
		return false;
	}
	var tel = document.getElementById('email').value;
	if(tel == null || tel == '' ){
		alert("邮箱不能为空！");
		return false;
	}
	var fax = document.getElementById('password').value;
	if(fax == null || fax == '' ){
		alert("密码不能为空！");
		return false;
	}
	
	return true;
}
</script>


  </body>
</html>
